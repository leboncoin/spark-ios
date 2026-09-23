//
//  SparkUIBadge.swift
//  SparkComponentBadge
//
//  Created by robin.lemaire on 23/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import UIKit
import Combine
@_spi(SI_SPI) import SparkCommon
import SparkTheming

/// A badge is a visual indicator for numeric values such as tallies and scores.
///
/// ## Example of usage
///
/// ```swift
/// let theme: SparkTheming.Theme = MyTheme()
///
/// let badge = SparkUISwitch(
///     theme: theme
/// )
/// badge.value = 49
/// badge.unit = "k"
/// badge.intent = .support
/// badge.size = .medium
/// badge.isBorder = false 
/// ```
///
/// ## Accessibility
///
/// You must manage by yourself the accessibilityLabel : add a context, a value, ...
///
/// ## Attach
///
/// It is possible to attach the view with a ``BadgePosition`` to a view.
///
/// ```swift
/// let theme: SparkTheming.Theme = MyTheme()
///
/// let badge = SparkUISwitch(
///     theme: theme
/// )
/// badge.value = 49
/// badge.unit = "k"
/// badge.intent = .support
/// badge.size = .medium
/// badge.isBorder = false
///
/// let rectangleView = UIView(frame: .init(x: 0, y: 0, width: 40, height: 40))
/// rectangleView.background = .blue
/// badge.attach(to: rectangleView, position: attachPosition)
///
/// backgroundView.addSubview(rectangleView)
/// backgroundView.addSubview(badge)
/// ```
///
/// Attached (trailing and top right corner):
///
/// ![Component rendering.](badge_with_value_attach_trailing.png)
///
/// ![Component rendering.](badge_with_value_attach_topTrailingCorner.png)
///
/// ## Rendering
///
/// With a value (medium and small sizes):
///
/// ![Component rendering.](badge_with_value_medium.png)
///
/// ![Component rendering.](badge_with_value_small.png)
///
/// With a value and an unit:
///
/// ![Component rendering.](badge_with_unit.png)
///
/// Without a value (medium and small sizes):
/// 
/// ![Component rendering.](badge_without_value_medium.png)
///
/// ![Component rendering.](badge_without_value_small.png)
///
public final class SparkUIBadge: UIView {

    // MARK: - Components

    /// The UILabel used to display the badge text.
    ///
    /// Please **do not set a text/attributedText** in this label but use
    /// the ``value`` and ``unit`` directly on the ``SparkUIBadge``.
    public private(set) var textLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textAlignment = .center
        label.adjustsFontForContentSizeCategory = true
        label.accessibilityIdentifier = BadgeAccessibilityIdentifier.text
        label.isHidden = true
        label.setContentCompressionResistancePriority(.required, for: .horizontal)
        return label
    }()

    // MARK: - Public Properties

    /// The spark theme of the badge.
    public var theme: any Theme {
        didSet {
            self.viewModel.theme = self.theme
        }
    }

    /// Display a border arround the badge.
    public var isBorder: Bool = true {
        didSet {
            self.viewModel.isBorder = self.isBorder
        }
    }

    /// The intent of the badge.
    public var intent: BadgeIntent = .default {
        didSet {
            self.viewModel.intent = self.intent
        }
    }

    /// The size of the badge.
    public var size: BadgeSize = .default {
        didSet {
            self.viewModel.size = self.size
        }
    }

    /// The value of the badge.
    public var value: Int? {
        didSet {
            self.viewModel.value = self.value
        }
    }

    /// The unit of the badge.
    ///
    /// Only displayed if the value is set.
    public var unit: String? {
        didSet {
            self.viewModel.unit = unit
        }
    }

    // MARK: - Private Properties

    private let viewModel = BadgeViewModel()

    private var heightConstraint: NSLayoutConstraint?
    private var widthConstraint: NSLayoutConstraint?
    private var minWidthConstraint: NSLayoutConstraint?

    private var labelLeadingConstraint: NSLayoutConstraint?
    private var labelCenterXConstraint: NSLayoutConstraint?
    private var labelCenterYConstraint: NSLayoutConstraint?

    @LimitedScaledUIMetric private var horizontalSpacing: CGFloat = 0

    @LimitedScaledUIMetric private var borderWidth: CGFloat = 0
    @LimitedScaledUIMetric private var cornerRadius: CGFloat = 0

    @ScaledUIFrame private var height: CGFloat = 0
    @ScaledUIFrame private var width: CGFloat = 0

    private var subscriptions = Set<AnyCancellable>()

    // MARK: - Attach Properties

    private var attachLeadingAnchorConstraint: NSLayoutConstraint?
    private var attachCenterXAnchorConstraint: NSLayoutConstraint?
    private var attachCenterYAnchorConstraint: NSLayoutConstraint?
    private var attachConstraints: [NSLayoutConstraint?] {
        [
            self.attachLeadingAnchorConstraint,
            self.attachCenterXAnchorConstraint,
            self.attachCenterYAnchorConstraint
        ]
    }

    @LimitedScaledUIMetric private var attachHorizontalSpacing: CGFloat = 0

    // MARK: - Initialization

    /// Creates a Spark badge.
    ///
    /// - Parameters:
    ///   - theme: The current theme.
    ///
    /// Implementation example :
    /// ```swift
    /// let theme: SparkTheming.Theme = MyTheme()
    ///
    /// let badge = SparkUISwitch(
    ///     theme: theme
    /// )
    /// badge.value = 49
    /// badge.unit = "k"
    /// badge.intent = .support
    /// badge.size = .medium
    /// badge.isBorder = false
    /// ```
    ///
    /// ![Badge rendering.](badge_without_value_medium.png)
    public init(theme: any Theme) {
        self.theme = theme

        super.init(frame: .zero)

        // Setup
        self.setupView()
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    // MARK: - View setup

    private func setupView() {
        // Add subview
        self.addSubview(self.textLabel)

        // Setup constraints
        self.setupConstraints()

        // Setup publisher subcriptions
        self.setupSubscriptions()

        // Setup Accessibility
        self.setupAccessibility()

        // Load view model
        self.viewModel.setup(
            theme: self.theme,
            intent: self.intent,
            isBorder: self.isBorder,
            size: self.size,
            value: self.value,
            unit: self.unit
        )
    }

    // MARK: - Layout

    public override func layoutSubviews() {
        super.layoutSubviews()

        self.updateBorderRadius()
    }

    // MARK: - Constraints

    private func setupConstraints() {
        // Global
        self.translatesAutoresizingMaskIntoConstraints = false

        // Size
        self.heightConstraint = self.heightAnchor.constraint(equalToConstant: self.height)
        self.heightConstraint?.isActive = false

        self.widthConstraint = self.widthAnchor.constraint(equalToConstant: self.width)
        self.widthConstraint?.isActive = false

        self.minWidthConstraint = self.widthAnchor.constraint(greaterThanOrEqualToConstant: self.width)
        self.minWidthConstraint?.isActive = false

        // Text Label
        self.setupTextLabelConstraints()
    }

    private func setupTextLabelConstraints() {
        self.textLabel.translatesAutoresizingMaskIntoConstraints = false

        // Horizontal
        self.labelLeadingConstraint = self.textLabel.leadingAnchor.constraint(
            equalTo: self.leadingAnchor,
            constant: self.horizontalSpacing
        )
        self.labelLeadingConstraint?.isActive = false

        // Center
        self.labelCenterXConstraint = self.textLabel.centerXAnchor.constraint(
            equalTo: self.centerXAnchor
        )
        self.labelCenterXConstraint?.isActive = false

        self.labelCenterYConstraint = self.textLabel.centerYAnchor.constraint(
            equalTo: self.centerYAnchor
        )
        self.labelCenterYConstraint?.isActive = false
    }

    // MARK: - Accessibility

    private func setupAccessibility() {
        self.isAccessibilityElement = true
        self.maximumContentSizeCategory = .accessibilityExtraLarge
    }

    // MARK: - Update UI

    private func updateBorderRadius(
        _ colors: BadgeColors? = nil
    ) {
        let colors = colors ?? self.viewModel.colors

        self.layoutIfNeeded()

        self.sparkBorderRadius(
            width: self.borderWidth,
            radius: self.cornerRadius,
            colorToken: colors.border
        )
    }

    private func updateLayout() {
        let isText = !self.textLabel.isHidden

        if self.horizontalSpacing != self.labelLeadingConstraint?.constant {
            self.labelLeadingConstraint?.constant = self.horizontalSpacing
            self.labelLeadingConstraint?.isActive = true
            self.updateConstraintsIfNeeded()
        }

        self.labelCenterXConstraint?.isActive = isText
        self.labelCenterYConstraint?.isActive = isText
    }

    private func updateAttachLayout() {
        if self.attachHorizontalSpacing != self.attachLeadingAnchorConstraint?.constant {
            self.attachLeadingAnchorConstraint?.constant = self.attachHorizontalSpacing
            self.updateConstraintsIfNeeded()
        }
    }

    private func updateContentSize() {
        let isText = !self.textLabel.isHidden

        if self.height != self.heightConstraint?.constant {
            self.heightConstraint?.constant = self.height
            self.heightConstraint?.isActive = true
            self.updateConstraintsIfNeeded()
        }

        if isText {
            if self.width != self.minWidthConstraint?.constant || self.minWidthConstraint?.isActive == false {
                self.minWidthConstraint?.constant = self.width
                self.minWidthConstraint?.isActive = true
                self.widthConstraint?.isActive = false
                self.updateConstraintsIfNeeded()
            }
        } else {
            if self.width != self.widthConstraint?.constant || self.widthConstraint?.isActive == false {
                self.widthConstraint?.constant = self.width
                self.widthConstraint?.isActive = true
                self.minWidthConstraint?.isActive = false
                self.updateConstraintsIfNeeded()
            }
        }
    }

    // MARK: - Subscribe

    private func setupSubscriptions() {
        // Colors
        self.viewModel.$colors.subscribe(in: &self.subscriptions) { [weak self] colors in
            guard let self else { return }

            self.backgroundColor(colors.background)
            self.textLabel.textColor(colors.foreground)

            self.updateBorderRadius(colors)
        }

        // Sizes
        self.viewModel.$sizes.subscribe(in: &self.subscriptions) { [weak self] sizes in
            guard let self else { return }

            let size = sizes.content

            self._height = .init(
                wrappedValue: size,
                traitCollection: self.traitCollection
            )

            self._width = .init(
                wrappedValue: size,
                traitCollection: self.traitCollection
            )

            self._borderWidth = .init(
                wrappedValue: sizes.border,
                traitCollection: self.traitCollection
            )

            self._horizontalSpacing = .init(
                wrappedValue: sizes.horizontalSpacing,
                traitCollection: self.traitCollection
            )

            self._attachHorizontalSpacing = .init(
                wrappedValue: sizes.attachHorizontalSpacing,
                traitCollection: self.traitCollection
            )

            self.updateContentSize()
            self.updateBorderRadius()
            self.updateLayout()
        }

        // Corner Radius
        self.viewModel.$cornerRadius.subscribe(in: &self.subscriptions) { [weak self] cornerRadius in
            guard let self else { return }

            self._cornerRadius = .init(
                wrappedValue: cornerRadius,
                traitCollection: self.traitCollection
            )

            self.updateBorderRadius()
        }

        // Text Font
        self.viewModel.$textFont.subscribe(in: &self.subscriptions) { [weak self] textFont in
            guard let self else { return }

            self.textLabel.font(textFont)
        }

        // Text
        self.viewModel.$text.subscribe(in: &self.subscriptions) { [weak self] text in
            guard let self else { return }

            self.textLabel.text = text
            self.textLabel.isHidden = text == nil

            self.updateContentSize()
            self.updateLayout()
        }
    }

    // MARK: - Attach / Detach

    /// Remove constraints from the view the badge was attached onto.
    public func detach() {
        self.attachConstraints.compactMap { $0 }.forEach {
            self.removeConstraint($0)
        }
    }

    /// Attach badge to another view by using constraints.
    /// Triggers detach() if it was already attached to a view
    /// - Parameters:
    ///   - view: the targeted view to attach the badge onto
    ///   - position: position where the ``SparkUIBadge`` can be attached
    public func attach(to view: UIView, position: BadgePosition) {
        self.detach()

        switch position {
        case .topTrailingCorner:
            self.attachCenterXAnchorConstraint = self.centerXAnchor.constraint(
                equalTo: view.trailingAnchor
            )
            self.attachCenterYAnchorConstraint = self.centerYAnchor.constraint(
                equalTo: view.topAnchor
            )

        case .trailing:
            self.attachLeadingAnchorConstraint = self.leadingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: self.attachHorizontalSpacing
            )
            self.attachCenterYAnchorConstraint = self.centerYAnchor.constraint(
                equalTo: view.centerYAnchor
            )
        }

        NSLayoutConstraint.activate(self.attachConstraints.compactMap { $0 })
    }

    // MARK: - Trait Collection

    public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)

        // **
        // Update sizes
        self._height.update(traitCollection: self.traitCollection)
        self._width.update(traitCollection: self.traitCollection)
        self.updateContentSize()

        self._borderWidth.update(traitCollection: self.traitCollection)
        self._cornerRadius.update(traitCollection: self.traitCollection)
        self.updateBorderRadius()

        self._horizontalSpacing.update(traitCollection: self.traitCollection)
        self.updateLayout()

        self._attachHorizontalSpacing.update(traitCollection: self.traitCollection)
        self.updateAttachLayout()
        // **
    }
}
