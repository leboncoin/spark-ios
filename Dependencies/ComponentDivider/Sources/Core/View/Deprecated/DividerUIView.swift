//
//  DividerUIView.swift
//  SparkComponentDivider
//
//  Created by louis.borlee on 17/07/2024.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import UIKit
import Combine
import SparkTheming
@_spi(SI_SPI) import SparkCommon

/// The UIKit version of the divider.
@available(*, deprecated, message: "Replaced by SparkUIDivider")
public final class DividerUIView: UIView {

    // MARK: - Public vars
    /// The spark theme of the divider.
    public var theme: any Theme {
        get {
            return self.viewModel.theme
        }
        set {
            self.viewModel.theme = newValue
        }
    }

    /// The intent of the divider.
    public var intent: DividerIntent {
        get {
            return self.viewModel.intent
        }
        set {
            self.viewModel.intent = newValue
        }
    }

    /// The axis of the divider.
    public var axis: DividerAxis = .horizontal {
        didSet {
            guard self.axis != oldValue else { return }
            self.setSeparators()
        }
    }

    /// The alignment of the divider.
    public var alignment: DividerAlignment = .center {
        didSet {
            guard self.alignment != oldValue else { return }
            self.setSeparators()
        }
    }

    /// A boolean value indicating if the label is shown. Default value is **false**.
    public var showLabel: Bool = false {
        didSet {
            guard self.showLabel != oldValue else { return }
            self.setSeparators()
            if self.showLabel {
                self.accessibilityTraits.insert(.staticText)
                self.isAccessibilityElement = true
                self.label.isHidden = false
                self.secondSeparatorContainer.isHidden = false
            } else {
                self.accessibilityTraits.remove(.staticText)
                self.isAccessibilityElement = false
                self.label.isHidden = true
                self.secondSeparatorContainer.isHidden = true
            }
        }
    }

    public override var accessibilityLabel: String? {
        get {
            return self.label.accessibilityLabel
        } set {
            self.label.accessibilityLabel = newValue
        }
    }

    public let label = UILabel()

    // MARK: - Private vars
    @ScaledUIMetric private var scaleFactor: CGFloat = 1.0
    private var scaledHeight: CGFloat {
        return DividerConstants.thickness * self.scaleFactor
    }
    private var cancellables = Set<AnyCancellable>()

    private lazy var stackView: UIStackView = UIStackView(
        arrangedSubviews: [
            self.firstSeparatorContainer,
            self.label,
            self.secondSeparatorContainer
        ]
    )
    private let firstSeparatorContainer = UIView()
    private let secondSeparatorContainer = UIView()

    private let viewModel: DividerViewModelDeprecated

    /// Initialize a new divider view.
    /// - Parameters:
    ///   - theme: The spark theme of the divider.
    ///   - intent: The intent of the divider.
    public init(
        theme: any Theme,
        intent: DividerIntent
    ) {
        self.viewModel = .init(theme: theme, intent: intent)

        super.init(frame: .zero)

        self.setupView()
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    // MARK: - Layout
    private func setupView() {
        self.accessibilityIdentifier = DividerAccessibilityIdentifier.view
        self.stackView.alignment = .center
        self.stackView.spacing = self.viewModel.spacing
        self.addSubview(self.stackView)

        self.label.textColor = self.viewModel.textColor.uiColor
        self.label.font = self.viewModel.textFont.uiFont
        self.label.adjustsFontForContentSizeCategory = true
        self.label.textAlignment = .center

        self.label.isHidden = true
        self.secondSeparatorContainer.isHidden = true

        self.setSeparators()
        self.setupConstraints()
        self.setupSubscriptions()
    }

    private func setupConstraints() {
        self.setupStackViewConstraints()
    }

    private func setupStackViewConstraints() {
        self.stackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            self.stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.stackView.topAnchor.constraint(equalTo: self.topAnchor),
            self.stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }

    // MARK: - Subscriptions
    private func setupSubscriptions() {
        self.viewModel.$spacing.removeDuplicates().subscribe(in: &self.cancellables) { [weak self] spacing in
            guard let self else { return }
            self.stackView.spacing = spacing
        }

        self.viewModel.$textFont.subscribe(in: &self.cancellables) { [weak self] textFont in
            guard let self else { return }
            self.label.font = textFont.uiFont
        }

        self.viewModel.$textColor.removeDuplicates(by: { lhs, rhs in
            lhs.equals(rhs)
        })
        .subscribe(in: &self.cancellables) { [weak self] textColor in
            guard let self else { return }
            self.label.textColor = textColor.uiColor
        }

        self.viewModel.$separatorColor.removeDuplicates(by: { lhs, rhs in
            lhs.equals(rhs)
        })
        .subscribe(in: &self.cancellables) { [weak self] separatorColor in
            guard let self else { return }
            _ = [self.firstSeparatorContainer, self.secondSeparatorContainer].map {
                $0.subviews.first?.backgroundColor = separatorColor.uiColor
            }
        }
    }

    // MARK: - Separator
    private func setSeparators() {
        // Reset separators
        self.firstSeparatorContainer.subviews.forEach { $0.removeFromSuperview() }
        self.secondSeparatorContainer.subviews.forEach { $0.removeFromSuperview() }

        switch self.axis {
        case .horizontal:
            self.stackView.axis = .horizontal
            self.setHorizontalSeparators()
        case .vertical:
            self.stackView.axis = .vertical
            self.setVerticalSeparators()
        }
    }

    private func setHorizontalSeparators() {
        let firstSeparator = self.addHorizontalSeparator(in: self.firstSeparatorContainer)
        let secondSeparator = self.addHorizontalSeparator(in: self.secondSeparatorContainer)

        if self.showLabel,
           [DividerAlignment.leading, DividerAlignment.trailing].contains(self.alignment) == false  {
            let equalWidthConstraint = firstSeparator.widthAnchor.constraint(equalTo: secondSeparator.widthAnchor)
            equalWidthConstraint.priority = .defaultLow
            equalWidthConstraint.isActive = true
        }
    }

    private func setVerticalSeparators() {
        let firstSeparator = self.addVerticalSeparator(in: self.firstSeparatorContainer)
        let secondSeparator = self.addVerticalSeparator(in: self.secondSeparatorContainer)

        if self.showLabel,
           [DividerAlignment.top, DividerAlignment.bottom].contains(self.alignment) == false  {
            let equalHeightConstraint = firstSeparator.heightAnchor.constraint(equalTo: secondSeparator.heightAnchor)
            equalHeightConstraint.priority = .defaultLow
            equalHeightConstraint.isActive = true
        }
    }

    private func createSeparator() -> UIView {
        let separator = UIView()
        separator.translatesAutoresizingMaskIntoConstraints = false
        separator.backgroundColor = self.viewModel.separatorColor.uiColor
        return separator
    }

    private func addHorizontalSeparator(in containerView: UIView) -> UIView {
        let separator = self.createSeparator()
        containerView.addSubview(separator)

        let widthConstraint: NSLayoutConstraint
        switch self.alignment  {
        case .leading where containerView === self.firstSeparatorContainer && self.showLabel,
                .trailing where containerView === self.secondSeparatorContainer:
            widthConstraint = separator.widthAnchor.constraint(equalToConstant: DividerConstants.minimumWidth)
        default:
            widthConstraint = separator.widthAnchor.constraint(greaterThanOrEqualToConstant: DividerConstants.minimumWidth)
        }

        NSLayoutConstraint.activate([
            separator.heightAnchor.constraint(equalToConstant: self.scaledHeight),
            separator.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            separator.topAnchor.constraint(equalTo: containerView.topAnchor),
            separator.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            separator.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            widthConstraint
        ])
        return separator
    }

    private func addVerticalSeparator(in containerView: UIView) -> UIView {
        let separator = self.createSeparator()
        containerView.addSubview(separator)

        let heightConstraint: NSLayoutConstraint
        switch self.alignment  {
        case .top where containerView === self.firstSeparatorContainer && self.showLabel,
                .bottom where containerView === self.secondSeparatorContainer:
            heightConstraint = separator.heightAnchor.constraint(equalToConstant: DividerConstants.minimumWidth)
        default:
            heightConstraint = separator.heightAnchor.constraint(greaterThanOrEqualToConstant: DividerConstants.minimumWidth)
        }

        NSLayoutConstraint.activate([
            separator.widthAnchor.constraint(equalToConstant: self.scaledHeight),
            separator.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            separator.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            separator.topAnchor.constraint(equalTo: containerView.topAnchor),
            separator.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            heightConstraint
        ])
        return separator
    }

    public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        guard self.traitCollection.hasDifferentSizeCategory(comparedTo: previousTraitCollection) else { return }
        self.setSeparators()
    }
}
