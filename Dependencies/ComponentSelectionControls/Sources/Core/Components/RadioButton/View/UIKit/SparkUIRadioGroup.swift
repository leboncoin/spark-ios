//
//  SparkUIRadioGroup.swift
//  SparkComponentSelectionControls
//
//  Created by robin.lemaire on 10/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import UIKit
import Combine
import SwiftUI
@_spi(SI_SPI) import SparkCommon
import SparkTheming

/// A Spark group control that radio buttons between selected and unselected states.
///
/// Inherits:
/// - This component inherits from **UIControl**.
/// - The ID is a ``SelectionControlsGroupID`` which inherits from **Equatable**, **Hashable** and **CustomStringConvertible**.
///
/// Initialization :
/// ```swift
/// let theme: SparkTheming.Theme = MyTheme()
///
/// let myRadioGroup = SparkUIRadioGroup(
///     theme: theme
/// )
/// ```
///
/// Example of rendering:
/// ![Radio group rendering.](radioGroup.png)
///
/// Example of usage:
/// ```swift
/// let myRadioGroup = SparkUIRadioGroup<Int>(
///     theme: theme
/// )
/// myRadioGroup.intent = .error
/// myRadioGroup.items = [
///     .init(
///         id: 1,
///         text: "First",
///         isEnabled: true
///     ),
///     .init(
///         id: 2,
///         text: "Last",
///         isEnabled: true
///     )
/// ]
/// myRadioGroup.selectedID = 1
/// ```
public final class SparkUIRadioGroup<ID>: SelectionControlsGroup<ID> where ID: SelectionControlsGroupID {

    // MARK: - Components

    ///  The radio buttons are items of ``SparkUIRadioButton``.
    public var radioButtons: [SparkUIRadioButton] {
        self.contentStackView.arrangedSubviews.compactMap { $0 as? SparkUIRadioButton }
    }

    // MARK: - Public Properties

    private let selectedIDChangedSubject = PassthroughSubject<ID?, Never>()
    /// The publisher used to notify when selectedID value changed on radio group.
    public private(set) lazy var selectedIDChangedPublisher: AnyPublisher<ID?, Never> = self.selectedIDChangedSubject.eraseToAnyPublisher()

    /// The spark theme of the radio group.
    public override var theme: any Theme {
        didSet {
            self.radioButtons.forEach { $0.theme = self.theme }
        }
    }

    /// The intent of the radio group.
    public override var intent: RadioButtonIntent {
        didSet {
            self.radioButtons.forEach { $0.intent = self.intent }
        }
    }

    /// The items of the radio group.
    public var items: [RadioGroupUIItem<ID>] = [] {
        didSet {
            self.updateItems()
        }
    }

    /// The selected ID of the radio group.
    public var selectedID: ID? {
        get {
            self._selectedID
        }
        set {
            self._selectedID = newValue
            self.radioButtons.forEach {
                $0.setIsSelected(from: newValue)
            }
        }
    }

    /// The state of the radio button: enabled or not.
    /// ![Radio group rendering with when it's disabled.](radioGroup_disabled.png)
    public override var isEnabled: Bool {
        didSet {
            self.radioButtons.forEach { $0.isEnabled = self.isEnabled }
        }
    }

    // MARK: - Private Properties

    private var _selectedID: ID?

    // MARK: - Initialization

    /// Creates a Spark radio group with items.
    ///
    /// - Parameters:
    ///   - theme: The current theme.
    ///   - items: The ``SparkUIRadioGroup`` items of the radio group.
    ///
    /// Implementation example :
    /// ```swift
    /// let theme: SparkTheming.Theme = MyTheme()
    ///
    /// let myRadioGroup = SparkUIRadioGroup(
    ///     theme: theme,
    ///         items = [
    ///         .init(
    ///             id: 1,
    ///             text: "First",
    ///             isEnabled: true
    ///         ),
    ///         .init(
    ///             id: 2,
    ///             text: "Last",
    ///             isEnabled: true
    ///         )
    ///     ]
    /// )
    /// ```
    ///
    /// ![Radio group rendering.](radioGroup.png)
    public init(
        theme: any Theme,
        items: [RadioGroupUIItem<ID>]
    ) {
        self.items = items

        super.init(theme: theme)

        // Setup
        self.setupView()
    }

    /// Creates a Spark radio group.
    ///
    /// - Parameters:
    ///   - theme: The current theme.
    ///
    /// Implementation example :
    /// ```swift
    /// let theme: SparkTheming.Theme = MyTheme()
    ///
    /// let myRadioGroup = SparkUIRadioGroup(
    ///     theme: theme
    /// )
    /// ```
    ///
    /// ![Radio group rendering.](radioGroup.png)
    public override init(
        theme: any Theme
    ) {
        super.init(theme: theme)

        // Setup
        self.setupView()
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    // MARK: - View setup

    private func setupView() {
        // Accessibility
        self.accessibilityIdentifier = RadioButtonAccessibilityIdentifier.group

        // Items
        self.updateItems()
    }

    // MARK: - Setter

    /// Set the selectedID of the radio group and optionally animating the transition.
    public func setSelectedID(_ selectedID: ID?, animated: Bool) {
        self._selectedID = selectedID
        self.radioButtons.forEach {
            $0.setIsSelected(from: selectedID, animated: animated)
        }
    }

    // MARK: - Update UI

    private func updateItems() {
        self.contentStackView.removeArrangedSubviews()
        for item in self.items {

            let radioButton = SparkUIRadioButton(
                theme: self.theme
            )
            radioButton.id = item.id.description
            radioButton.intent = self.intent
            radioButton.setText(from: item)
            radioButton.isSelected = self.selectedID == item.id
            radioButton.isEnabled = item.isEnabled
            radioButton.accessibilityIdentifier = RadioButtonAccessibilityIdentifier.radioButtonItem(id: item.id)

            radioButton.addAction(.init(handler: { [weak self] _ in
                guard let self = self else {
                    return
                }

                // Select/deselect
                var isChanged: Bool = false
                if radioButton.isSelected && self.selectedID != item.id {
                    self._selectedID = item.id
                    isChanged = true
                } else if !radioButton.isSelected && self.selectedID == item.id {
                    self._selectedID = nil
                    isChanged = true
                }

                // Deselect others
                let otherRadioButtons = self.radioButtons.filter { $0 != radioButton }
                for otherRadioButton in otherRadioButtons {
                    otherRadioButton.setIsSelected(from: self.selectedID, animated: true)
                }

                if isChanged {
                    self.sendActions(for: .valueChanged)
                    self.selectedIDChangedSubject.send(self.selectedID)
                }

            }), for: .valueChanged)

            self.contentStackView.addArrangedSubview(radioButton)
        }
    }
}

// MARK: - Extension

private extension SparkUIRadioButton {

    func setText<ID>(from item: RadioGroupUIItem<ID>) where ID: SelectionControlsGroupID {
        if let text = item.text {
            self.text = text
        } else if let attributedText = item.attributedText {
            self.attributedText = attributedText
        }
    }

    func setIsSelected<ID>(from selectedID: ID?, animated: Bool = false) where ID: SelectionControlsGroupID {
        let isSelected = selectedID?.description == self.id
        self.setIsSelected(isSelected, animated: animated)
    }
}
