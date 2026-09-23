//
//  SparkUICheckboxGroup.swift
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

/// A Spark group control that checkboxs between selected and unselected states.
///
/// Inherits:
/// - This component inherits from **UIControl**.
/// - The ID is a ``SelectionControlsGroupID`` which inherits from **Equatable**, **Hashable** and **CustomStringConvertible**.
///
/// Initialization :
/// ```swift
/// let theme: SparkTheming.Theme = MyTheme()
///
/// let myCheckboxGroup = SparkUICheckboxGroup(theme: theme)
/// ```
///
/// Example of rendering:
/// ![Checkbox group rendering.](checkboxGroup.png)
///
/// Example of usage:
/// ```swift
/// let theme: SparkTheming.Theme = MyTheme()
///
/// let myCheckboxGroup = SparkUICheckboxGroup(
///     theme: self.theme,
///     items: [
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
/// Another example:
/// ```swift
/// let myCheckboxGroup = SparkUICheckboxGroup<Int>(theme: theme)
/// myCheckboxGroup.intent = .error
/// myCheckboxGroup.items = [
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
/// myCheckboxGroup.selectedIDs = [1]
/// ```
public final class SparkUICheckboxGroup<ID>: SelectionControlsGroup<ID> where ID: SelectionControlsGroupID {

    // MARK: - Components

    ///  The checkboxes are items of ``SparkUICheckbox``.
    public var checkboxes: [SparkUICheckbox] {
        self.contentStackView.arrangedSubviews.compactMap { $0 as? SparkUICheckbox }
    }

    // MARK: - Public Properties

    private let selectedIDsChangedSubject = PassthroughSubject<[ID], Never>()
    /// The publisher used to notify when selectedIDs value changed on checkbox group.
    public private(set) lazy var selectedIDsChangedPublisher: AnyPublisher<[ID], Never> = self.selectedIDsChangedSubject.eraseToAnyPublisher()

    /// The spark theme of the checkbox group.
    public override var theme: any Theme {
        didSet {
            self.checkboxes.forEach { $0.theme = self.theme }
        }
    }

    /// The intent of the checkbox group.
    public override var intent: CheckboxIntent {
        didSet {
            self.checkboxes.forEach { $0.intent = self.intent }
        }
    }

    /// The items of the checkbox group.
    public var items: [CheckboxGroupUIItem<ID>] = [] {
        didSet {
            self.updateItems()
        }
    }

    /// The selected IDs of the checkbox group.
    public var selectedIDs: [ID] {
        get {
            self._selectedIDs
        }
        set {
            self._selectedIDs = newValue
            self.checkboxes.forEach {
                $0.setIsSelected(from: newValue)
            }
        }
    }

    /// The state of the checkbox: enabled or not.
    /// ![Checkbox group rendering with when it's disabled.](checkboxGroup_disabled.png)
    public override var isEnabled: Bool {
        didSet {
            self.checkboxes.forEach { $0.isEnabled = self.isEnabled }
        }
    }

    // MARK: - Private Properties

    private var _selectedIDs: [ID] = []

    // MARK: - Initialization

    /// Creates a Spark checkbox group with items.
    ///
    /// - Parameters:
    ///   - theme: The current theme.
    ///   - items: The ``CheckboxGroupUIItem`` items of the checkbox group.
    ///
    /// Implementation example :
    /// ```swift
    /// let theme: SparkTheming.Theme = MyTheme()
    ///
    /// let myCheckboxGroup = SparkUICheckboxGroup(
    ///     theme: self.theme,
    ///     items: [
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
    /// ![Checkbox group rendering.](checkboxGroup.png)
    public init(
        theme: any Theme,
        items: [CheckboxGroupUIItem<ID>]
    ) {
        self.items = items

        super.init(theme: theme)

        // Setup
        self.setupView()
    }

    /// Creates a Spark checkbox group.
    ///
    /// - Parameters:
    ///   - theme: The current theme.
    ///
    /// Implementation example :
    /// ```swift
    /// let theme: SparkTheming.Theme = MyTheme()
    ///
    /// let myCheckboxGroup = SparkUICheckboxGroup(
    ///     theme: self.theme
    /// )
    /// ```
    ///
    /// ![Checkbox group rendering.](checkboxGroup.png)
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
        self.accessibilityIdentifier = CheckboxAccessibilityIdentifier.group

        // Items
        self.updateItems()
    }

    // MARK: - Setter

    /// Set the selectedIDs of the checkbox group and optionally animating the transition.
    public func setSelectedIDs(_ selectedIDs: [ID], animated: Bool) {
        self._selectedIDs = selectedIDs
        self.checkboxes.forEach {
            $0.setIsSelected(from: selectedIDs, animated: animated)
        }
    }

    // MARK: - Update UI

    private func updateItems() {
        self.contentStackView.removeArrangedSubviews()
        for item in self.items {

            let checkbox = SparkUICheckbox(theme: self.theme)
            checkbox.id = item.id.description
            checkbox.intent = self.intent
            checkbox.setText(from: item)
            checkbox.isSelected = self.selectedIDs.contains(item.id)
            checkbox.isEnabled = item.isEnabled
            checkbox.accessibilityIdentifier = CheckboxAccessibilityIdentifier.checkboxItem(id: item.id)

            checkbox.addAction(.init(handler: { [weak self] _ in
                guard let self = self else {
                    return
                }

                var isChanged: Bool = false
                if !checkbox.isSelected {
                    self._selectedIDs.removeAll(where: { $0 == item.id })
                    isChanged = true
                } else if !self._selectedIDs.contains(item.id) {
                    self._selectedIDs.append(item.id)
                    isChanged = true
                }

                if isChanged {
                    self.sendActions(for: .valueChanged)
                    self.selectedIDsChangedSubject.send(self.selectedIDs)
                }

            }), for: .valueChanged)

            self.contentStackView.addArrangedSubview(checkbox)
        }
    }
}

// MARK: - Extension

private extension SparkUICheckbox {

    func setText<ID>(from item: CheckboxGroupUIItem<ID>) where ID: SelectionControlsGroupID {
        if let text = item.text {
            self.text = text
        } else if let attributedText = item.attributedText {
            self.attributedText = attributedText
        }
    }

    func setIsSelected<ID>(from selectedIDs: [ID], animated: Bool = false) where ID: SelectionControlsGroupID {
        let isSelected = selectedIDs.map(\.description).contains(self.id)
        self.setIsSelected(isSelected, animated: animated)
    }
}
