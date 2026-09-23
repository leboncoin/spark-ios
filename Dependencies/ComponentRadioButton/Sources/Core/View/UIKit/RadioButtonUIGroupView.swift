//
//  RadioButtonUIGroupView.swift
//  SparkRadioButton
//
//  Created by michael.zimmermann on 24.04.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Combine
import UIKit
import SwiftUI
@_spi(SI_SPI) import SparkCommon
import SparkTheming

/// RadioButtonGroupView embodies a radio button group and handles
@available(*, deprecated, message: "Use SparkUIRadioGroup instead !")
public final class RadioButtonUIGroupView<ID: Equatable & Hashable & CustomStringConvertible>: UIControl {

    // MARK: - Private Properties
    private let valueSubject: PassthroughSubject<ID, Never>
    private let viewModel: RadioButtonGroupViewModel

    private var subscriptions = Set<AnyCancellable>()

    private lazy var backingSelectedID: Binding<ID?> = Binding(
        get: {
            return self.selectedID
        },
        set: { newValue in
            guard let newValue = newValue else { return }
            self.selectedID = newValue
            self.updateRadioButtonStates()
            self.valueSubject.send(newValue)
            self.delegate?.radioButtonGroup(self, didChangeSelection: newValue)
            self.sendActions(for: .valueChanged)
        }
    )

    public private(set) var radioButtonViews: [RadioButtonUIView<ID>] = []

    // MARK: - Public Properties
    /// All the items `RadioButtonUIItem` of the radio button group
    public var items: [RadioButtonUIItem<ID>] {
        set {
            self.updateLayout(items: newValue)
        }
        get {
            self.radioButtonViews.map{
                if let attributedText = $0.attributedText {
                    return .init(id: $0.id, label: attributedText)
                } else {
                    return .init(id: $0.id, label: $0.text ?? "")
                }
            }
        }
    }

    private let stackView = UIStackView()
    private var trailingAnchorConstraint = NSLayoutConstraint()
    private var bottomAnchorConstraint = NSLayoutConstraint()

    public override var isEnabled: Bool {
        didSet {
            self.radioButtonViews.forEach{ $0.isEnabled = self.isEnabled }
        }
    }

    /// The number of radio button items in the radio button group
    public var numberOfItems: Int {
        return self.radioButtonViews.count
    }

    /// The current selected ID.
    public var selectedID: ID? {
        didSet {
            self.updateRadioButtonStates()
        }
    }

    /// The current theme
    public var theme: any Theme {
        get {
            return self.viewModel.theme
        }
        set {
            for radioButtonView in radioButtonViews {
                radioButtonView.theme = newValue
            }
            self.viewModel.theme = newValue
        }
    }

    /// The label position `RadioButtonLabelAlignment` according to the toggle, either `leading` or `trailing`. The default value is `.leading`
    public var labelAlignment: RadioButtonLabelAlignment {
        didSet {
            guard self.labelAlignment != oldValue else { return }

            for radioButtonView in radioButtonViews {
                radioButtonView.labelAlignment = labelAlignment
            }
        }
    }

    /// The group layout `RadioButtonGroupLayout` of the radio buttons, either `horizontal` or `vertical`. The default is `vertical`.
    public var groupLayout: RadioButtonGroupLayout {
        didSet {
            guard self.groupLayout != oldValue else { return }

            self.updateLayout(items: self.items)
        }
    }

    /// The intent `RadioButtonIntent` defining the colors of the radio button.
    public var intent: RadioButtonIntent {
        get {
            return self.viewModel.intent
        }
        set {
            self.viewModel.intent = newValue
            for radioButtonView in radioButtonViews {
                radioButtonView.intent = newValue
            }
        }
    }

    /// A delegate which can be set, to be notified of the changed selected item of the radio button. An alternative is to subscribe to the `publisher`.
    public weak var delegate: (any RadioButtonUIGroupViewDelegate)?

    /// A change of the selected item will be published. This is an alternative method to the `delegate` of being notified of changes to the selected item.
    public var publisher: some Publisher<ID, Never> {
        return self.valueSubject
    }

    /// Set the accessibilityIdentifier. This identifier will be used as the accessibility identifier prefix of each radio button item, the suffix of that accessibility identifier being the index of the item within it's array.
    public override var accessibilityIdentifier: String? {
        didSet {
            guard let identifier = accessibilityIdentifier else { return }
            for (index, radioButtonView) in radioButtonViews.enumerated() {
                radioButtonView.accessibilityIdentifier = "\(identifier)-\(index)"
            }
        }
    }

    /// Initializer of the radio button ui group component.
    /// Parameters:
    /// - theme: The current theme.
    /// - intent: The default intent is `support`
    /// - selectedID: The current selected value of the radio button group.
    /// - items: A list of `RadioButtonUIItem` which represent each item in the radio button group.
    /// - radioButtonLabelPosition: The position of the label in each radio button item according to the toggle. The default value is, that the label is to the `right` of the toggle.
    /// - groupLayout: The layout of the items within the group. These can be `horizontal` or `vertical`. The defalt is `vertical`.
    public convenience init(
        theme: any Theme,
        intent: RadioButtonIntent,
        selectedID: ID?,
        items: [RadioButtonUIItem<ID>],
        labelAlignment: RadioButtonLabelAlignment = .trailing,
        groupLayout: RadioButtonGroupLayout = .vertical) {

        let viewModel = RadioButtonGroupViewModel(
            theme: theme,
            intent: intent
        )

        self.init(
            viewModel: viewModel,
            selectedID: selectedID,
            items: items,
            labelAlignment: labelAlignment,
            groupLayout: groupLayout)
    }

    init(viewModel: RadioButtonGroupViewModel,
         selectedID: ID?,
         items: [RadioButtonUIItem<ID>],
         labelAlignment: RadioButtonLabelAlignment = .trailing,
         groupLayout: RadioButtonGroupLayout = .vertical) {
        self.viewModel = viewModel
        self.selectedID = selectedID
        self.labelAlignment = labelAlignment
        self.groupLayout = groupLayout
        self.valueSubject = PassthroughSubject()

        super.init(frame: .zero)
        self.setupView()
        self.enableTouch()
        self.setupSubscriptions()

        self.items = items
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Item Control
    public func setTitle(_ title: String, forItemAt index: Int) {
        guard index < self.radioButtonViews.count else { return }

        self.radioButtonViews[safe: index]?.text = title
    }

    public func setTitle(_ title: NSAttributedString, forItemAt index: Int) {
        guard index < self.radioButtonViews.count else { return }

        self.radioButtonViews[safe: index]?.attributedText = title
    }

    public func addRadioButton(_ item: RadioButtonUIItem<ID>, atIndex index: Int = Int.max) {

        var items = self.items
        if index < items.count {
            items[index] = item
        } else {
            items.append(item)
        }

        self.items = items
    }

    public func removeRadioButton(at index: Int, animated: Bool = false) {
        guard index < self.radioButtonViews.count else { return }
        var items = self.items
        items.remove(at: index)

        self.items = items
    }

    // MARK: Private Methods

    private func setupView() {
        self.addSubview(self.stackView)
        self.stackView.spacing = self.viewModel.spacing
        self.stackView.distribution = .equalSpacing
        self.stackView.translatesAutoresizingMaskIntoConstraints = false
        for radioButtonView in self.radioButtonViews {
            self.stackView.addArrangedSubview(radioButtonView)
        }
    }

    private func updateLayout(items: [RadioButtonUIItem<ID>]) {
        for view in self.radioButtonViews {
            if view.isDescendant(of: self.stackView) {
                self.stackView.removeArrangedSubview(view)
                view.removeFromSuperview()
            }
        }

        self.radioButtonViews = self.createRadioButtonViews(items: items)

        for radioButtonView in radioButtonViews {
            self.stackView.addArrangedSubview(radioButtonView)
        }

        self.setupConstraints()
    }

    private func createRadioButtonViews(
        items: [RadioButtonUIItem<ID>]
    ) -> [RadioButtonUIView<ID>] {
        return items.map {
            let radioButtonView = RadioButtonUIView(
                theme: self.theme,
                intent: self.viewModel.intent,
                id: $0.id,
                label: $0.label,
                selectedID: self.backingSelectedID,
                labelAlignment: self.labelAlignment
            )
            radioButtonView.accessibilityIdentifier = RadioButtonAccessibilityIdentifier.radioButtonIdentifier(id: $0.id)

            radioButtonView.translatesAutoresizingMaskIntoConstraints = false

            let action = UIAction { [weak self] _ in
                self?.sendActions(for: .touchUpInside)
            }
            radioButtonView.addAction(action, for: .touchUpInside)

            return radioButtonView
        }
    }

    private func setupConstraints() {
        NSLayoutConstraint.deactivate(self.constraints)
        switch self.groupLayout {
        case .horizontal:
            self.stackView.axis = .horizontal
            self.bottomAnchorConstraint = self.stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            self.trailingAnchorConstraint = self.stackView.trailingAnchor.constraint(lessThanOrEqualTo: self.trailingAnchor)
            self.trailingAnchorConstraint.priority = .defaultHigh
        case .vertical:
            self.stackView.axis = .vertical
            self.bottomAnchorConstraint = self.stackView.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor)
            self.trailingAnchorConstraint = self.stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
            self.bottomAnchorConstraint.priority = .defaultHigh
        }
        NSLayoutConstraint.activate([
            self.stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.stackView.topAnchor.constraint(equalTo: self.topAnchor),
            self.bottomAnchorConstraint,
            self.trailingAnchorConstraint
        ])
    }

    private func setupSubscriptions() {
        self.viewModel.$spacing.subscribe(in: &self.subscriptions) { [weak self] spacing in
            guard let self = self else { return }
            self.stackView.spacing = spacing
        }
    }

    private func updateRadioButtonStates() {
        for radioButtonView in self.radioButtonViews {
            radioButtonView.toggleNeedsRedisplay()
        }
    }
}
