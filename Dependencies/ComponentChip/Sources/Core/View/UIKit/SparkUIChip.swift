//
//  SparkUIChip.swift
//  SparkComponentChip
//
//  Created by robin.lemaire on 01/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import UIKit
import Combine
@_spi(SI_SPI) import SparkCommon
import SparkTheming

/// A Spark Chip help users quickly recognize an important
/// information that has been entered by them, trigger actions,
/// make selections, or filter content.
///
/// This component inherits from **UIControl**.
///
/// Example of usage :
/// ```swift
/// let theme: SparkTheming.Theme = MyTheme()
///
/// let extraContent = let extraContent = UILabel()
/// extraContent.text = "99"
/// extraContent.adjustsFontForContentSizeCategory = true
///
/// let chip = SparkUISwitch(
///     theme: theme
/// )
/// chip.text = "Moon"
/// chip.icon = UIImage(systemName: "moon")
/// chip.extraContent = extraContent
/// chip.intent = .support
/// chip.variant = .filled
/// chip.alignment = .trailingIcon
/// chip.isSelected = false
/// ```
///
/// To add a text, you must provide a **text** or a **attributedText**:
/// ```swift
/// let theme: SparkTheming.Theme = MyTheme()
///
/// let chip = SparkUISwitch(
///     theme: theme
/// )
/// chip.text = "My chip"
/// ```
/// *Note*: Please **do not set a text/attributedText** on the ``textLabel`` but use the ``text`` and
/// ``attributedText`` directly on the ``SparkUIChip``.
///
/// ## Rendering
///
/// ### By Content Type
///
/// | Icon Only | Text Only | Text & Icon |
/// |:---:|:---:|:---:|
/// | ![Chip with icon.](chip_with_icon.png) | ![Chip with text.](chip_with_text.png) | ![Chip with text and icon.](chip_with_text_and_icon.png) |
///
/// | Text & Icon & Extra | Icon & Extra |
/// |:---:|:---:|
/// | ![Chip with text, icon and extra content.](chip_with_text_and_icon_and_extra_content.png) | ![Chip with icon and extra content.](chip_with_icon_and_extra_content.png) |
///
/// ### By Size
///
/// | Medium | Large |
/// |:---:|:---:|
/// | ![Chip medium size.](chip_with_size_medium.png) | ![Chip large size.](chip_with_size_large.png) |
///
/// ### By State
///
/// | Not Selected | Selected | Disabled |
/// |:---:|:---:|:---:|
/// | ![Chip not selected.](chip_with_text.png) | ![Chip selected.](chip_selected.png) | ![Chip disabled.](chip_disabled.png) |
///
public final class SparkUIChip: UIControl {

    // MARK: - Type alias

    private typealias AccessibilityIdentifier = ChipAccessibilityIdentifier

    // MARK: - Components

    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView(
            arrangedSubviews: [
                self.labelContentStackView,
                self.iconImageView
            ]
        )
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.isUserInteractionEnabled = false
        return stackView
    }()

    private lazy var labelContentStackView: UIStackView = {
        let stackView = UIStackView(
            arrangedSubviews: [
                self.textLabel,
                self.extraContentStackView
            ]
        )
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.isHidden = true
        return stackView
    }()

    /// The UILabel used to display the chip text.
    ///
    /// Please **do not set a text/attributedText** in this label but use
    /// the ``text`` and ``attributedText`` directly on the ``SparkUIChip``.
    public private(set) var textLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.lineBreakMode = .byWordWrapping
        label.adjustsFontForContentSizeCategory = true
        label.accessibilityIdentifier = AccessibilityIdentifier.text
        label.setContentCompressionResistancePriority(
            .required,
            for: .vertical
        )
        label.isHidden = true
        return label
    }()

    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.isUserInteractionEnabled = false
        imageView.contentMode = .scaleAspectFit
        imageView.tintAdjustmentMode = .normal
        imageView.accessibilityIdentifier = ChipAccessibilityIdentifier.icon
        imageView.setContentCompressionResistancePriority(.required,
                                                          for: .horizontal)
        imageView.setContentCompressionResistancePriority(.required,
                                                          for: .vertical)
        imageView.isHidden = true
        return imageView
    }()

    private lazy var extraContentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.isHidden = true
        return stackView
    }()

    /// The extra content which will be rendered to the right of the label. *Optional*.
    /// Note: the client must be responsible, that it fits within the chip which has a height of 32pts.
    public var extraContent: UIView? {
        willSet {
            self.extraContentStackView.removeArrangedSubviews()
        }
        didSet {
            self.extraContentStackView.isHidden = self.extraContent == nil
            if let extraContent = self.extraContent {
                self.extraContentStackView.addArrangedSubview(extraContent)
            }
            self.updateLabelContentStackViewVisibility()
        }
    }

    // MARK: - Public Properties

    /// The spark theme of the chip.
    public var theme: any Theme {
        didSet {
            self.viewModel.theme = self.theme
        }
    }

    /// The intent of the chip.
    public var intent: ChipIntent = .default {
        didSet {
            self.viewModel.intent = self.intent
        }
    }

    /// The variant of the chip.
    public var variant: ChipVariant = .default {
        didSet {
            self.viewModel.variant = self.variant
        }
    }

    /// The size of the chip.
    public var size: ChipSize = .default {
        didSet {
            self.viewModel.size = self.size
        }
    }

    /// The content alignment of the chip. (leading or trailing icon)
    public var alignment: ChipAlignment = .default {
        didSet {
            self.viewModel.alignment = self.alignment
        }
    }

    /// An optional icon on the Chip.
    public var icon: UIImage? {
        get {
            return self.iconImageView.image
        }
        set {
            self.iconImageView.image = newValue
            self.iconImageView.isHidden = newValue == nil
            self.largeContentImage = newValue
        }
    }

    /// The text of the chip.
    public var text: String? {
        get {
            return self.textLabel.text
        }
        set {
            self.textLabel.text(newValue)
            self.updateAccessibilityLabel(newValue)
            self.updateLabelContentStackViewVisibility()
        }
    }

    /// The attributed text of the chip.
    public var attributedText: NSAttributedString? {
        get {
            return self.textLabel.attributedText
        }
        set {
            self.textLabel.attributedText(newValue)
            self.updateAccessibilityLabel(newValue?.string)
            self.updateLabelContentStackViewVisibility()
        }
    }

    /// The chip is selected or not.
    /// ![Chip rendering with when it's selected.](chip_selected.png)
    public override var isSelected: Bool {
        didSet {
            self.viewModel.isSelected = self.isSelected
            self.accessibilityTraits(.selected, condition: self.isSelected)
        }
    }

    /// The chip is highlighted or not.
    public override var isHighlighted: Bool {
        get {
            return self.viewModel.isPressed
        }
        set {
            self.viewModel.isPressed = self.hasAction ? newValue : false
        }
    }

    /// The state of the chip: enabled or not.
    /// ![Chip rendering with when it's disabled.](chip_disabled.png)
    public override var isEnabled: Bool {
        didSet {
            self.viewModel.isEnabled = self.isEnabled
            self.accessibilityTraits(.notEnabled, condition: !self.isEnabled)
        }
    }

    // MARK: - Private Properties

    private let viewModel = ChipViewModel()

    private var heightConstraint: NSLayoutConstraint?
    private var iconWidthConstraint: NSLayoutConstraint?

    @LimitedScaledUIMetric private var padding: CGFloat = 0
    @LimitedScaledUIMetric private var extraContentSpacing: CGFloat = 0
    @LimitedScaledUIMetric private var spacing: CGFloat = 0

    @LimitedScaledUIMetric private var borderDash: CGFloat = 0
    @LimitedScaledUIMetric private var borderWidth: CGFloat = 0
    @LimitedScaledUIMetric private var cornerRadius: CGFloat = 0

    @ScaledUIFrame private var height: CGFloat = 0
    @LimitedScaledUIMetric private var iconSize: CGFloat = 0

    private var hasAction: Bool {
        self.allControlEvents == .touchUpInside
    }

    private var subscriptions = Set<AnyCancellable>()

    // MARK: - Initialization

    /// Creates a Spark chip.
    ///
    /// - Parameters:
    ///   - theme: The current theme.
    ///
    /// Implementation example :
    /// ```swift
    /// let theme: SparkTheming.Theme = MyTheme()
    ///
    /// let extraContent = let extraContent = UILabel()
    /// extraContent.text = "99"
    /// extraContent.adjustsFontForContentSizeCategory = true
    ///
    /// let chip = SparkUISwitch(
    ///     theme: theme
    /// )
    /// chip.text = "Moon"
    /// chip.icon = UIImage(systemName: "moon")
    /// chip.extraContent = extraContent
    /// chip.intent = .support
    /// chip.variant = .filled
    /// chip.alignment = .trailingIcon
    /// chip.isSelected = false
    /// ```
    ///
    /// ![Chip rendering.](chip_with_text_and_icon_and_extra_content.png)
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
        self.addSubview(self.contentStackView)

        // Setup constraints
        self.setupConstraints()

        // Setup publisher subcriptions
        self.setupSubscriptions()

        // Setup Accessibility
        self.setupAccessibility()

        // Updates
        self.updateSizes()
        self.updateLayout()
        self.updateReversibleArrangedSubviews()

        // Load view model
        self.viewModel.setup(
            theme: self.theme,
            alignment: self.alignment,
            intent: self.intent,
            variant: self.variant,
            size: self.size,
            isSelected: self.isSelected,
            isEnabled: self.isEnabled
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
        self.heightConstraint = self.heightAnchor.constraint(equalToConstant: .zero)

        self.setupContentStackViewConstraints()

        // Icon
        self.setupIconImageViewConstraints()
    }

    private func setupContentStackViewConstraints() {
        self.contentStackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.stickEdges(from: self.contentStackView, to: self)
    }

    private func setupIconImageViewConstraints() {
        self.iconImageView.translatesAutoresizingMaskIntoConstraints = false

        self.iconWidthConstraint = self.iconImageView.widthAnchor.constraint(equalToConstant: .zero)

        self.iconImageView.heightAnchor.constraint(equalTo: self.iconImageView.widthAnchor).isActive = true
    }

    // MARK: - Update UI

    private func updateLabelContentStackViewVisibility() {
        self.labelContentStackView.isHidden = !self.labelContentStackView.arrangedSubviews.contains { !$0.isHidden }
    }

    private func updateBorderRadius(
        _ colors: ChipColors? = nil
    ) {
        let colors = colors ?? self.viewModel.colors

        self.layoutIfNeeded()

        self.sparkBorderRadius(
            width: self.borderWidth,
            radius: self.cornerRadius,
            dash: self.borderDash,
            colorToken: colors.border,
            masksToBounds: false
        )
    }

    private func updateLayout() {
        self.contentStackView.spacing = self.spacing
        self.labelContentStackView.spacing = self.extraContentSpacing

        self.contentStackView.layoutMargins = UIEdgeInsets(
            vertical: 0,
            horizontal: self.padding
        )
    }

    private func updateReversibleArrangedSubviews(_ isReversed: Bool? = nil) {
        let isReversed = isReversed ?? self.viewModel.isReversed

        self.contentStackView.removeArrangedSubviews()

        var subviews = [self.labelContentStackView, self.iconImageView]
        if isReversed {
            subviews.reverse()
        }

        self.contentStackView.addArrangedSubviews(subviews)
    }

    private func updateSizes() {
        // Height
        self.heightConstraint?.constant = self.height
        self.heightConstraint?.isActive = true

        // Icon Width
        self.iconWidthConstraint?.constant = self.iconSize
        self.iconWidthConstraint?.isActive = true
        self.iconImageView.updateConstraintsIfNeeded()

        self.updateConstraintsIfNeeded()
        self.setNeedsUpdateConstraints()
    }

    // MARK: - Accessibility

    private func setupAccessibility() {
        self.updateAccessibilityButtonTrait()
        self.isAccessibilityElement = true
        self.scalesLargeContentImage = true
        self.showsLargeContentViewer = true
        self.addInteraction(UILargeContentViewerInteraction())
        self.maximumContentSizeCategory = .accessibilityExtraLarge
        self.extraContentStackView.maximumContentSizeCategory = .accessibilityMedium
    }

    private func updateAccessibilityLabel(_ newValue: String?) {
        self.largeContentTitle = newValue
        self.accessibilityLabel = newValue
    }

    private func updateAccessibilityButtonTrait() {
        self.accessibilityTraits(.button, condition: self.hasAction)
        self.accessibilityTraits(.staticText, condition: !self.hasAction)
    }

    // MARK: - Actions

    public override func addAction(
        _ action: UIAction,
        for controlEvents: UIControl.Event
    ) {
        super.addAction(action, for: controlEvents)
        self.updateAccessibilityButtonTrait()
    }

    public override func removeAction(
        _ action: UIAction,
        for controlEvents: UIControl.Event
    ) {
        super.removeAction(action, for: controlEvents)
        self.updateAccessibilityButtonTrait()
    }

    public override func addTarget(
        _ target: Any?,
        action: Selector,
        for controlEvents: UIControl.Event
    ) {
        super.addTarget(target, action: action, for: controlEvents)
        self.updateAccessibilityButtonTrait()
    }

    public override func removeTarget(
        _ target: Any?,
        action: Selector?,
        for controlEvents: UIControl.Event
    ) {
        super.removeTarget(target, action: action, for: controlEvents)
        self.updateAccessibilityButtonTrait()
    }

    // MARK: - Subscribe

    private func setupSubscriptions() {
        // **
        // Colors
        self.viewModel.$colors.subscribe(in: &self.subscriptions) { [weak self] colors in
            guard let self else { return }

            self.backgroundColor(colors.background)
            self.textLabel.textColor(colors.content)
            self.iconImageView.tintColor(colors.content)

            self.updateBorderRadius(colors)
        }
        // **

        // **
        // Border
        self.viewModel.$border.subscribe(in: &self.subscriptions) { [weak self] border in
            guard let self else { return }

            self._borderWidth = .init(
                wrappedValue: border.width,
                traitCollection: self.traitCollection
            )
            self._cornerRadius = .init(
                wrappedValue: border.radius,
                traitCollection: self.traitCollection
            )
            self._borderDash = .init(
                wrappedValue: border.dash,
                traitCollection: self.traitCollection
            )

            self.updateBorderRadius()
        }
        // **

        // **
        // Dim
        self.viewModel.$dim.subscribe(in: &self.subscriptions) { [weak self] dim in
            guard let self else { return }

            self.alpha = dim
        }
        // **

        // **
        // Is Reversed
        self.viewModel.$isReversed.subscribe(in: &self.subscriptions) { [weak self] isReversed in
            guard let self else { return }

            self.updateReversibleArrangedSubviews(isReversed)
        }
        // **

        // **
        // Layout
        self.viewModel.$layout.subscribe(in: &self.subscriptions) { [weak self] layout in
            guard let self else { return }

            self._padding = .init(
                wrappedValue: layout.padding,
                traitCollection: self.traitCollection
            )
            self._extraContentSpacing = .init(
                wrappedValue: layout.extraContentSpacing,
                traitCollection: self.traitCollection
            )
            self._spacing = .init(
                wrappedValue: layout.spacing,
                traitCollection: self.traitCollection
            )

            self.updateLayout()
        }
        // **

        // **
        // Sizes
        self.viewModel.$sizes.subscribe(in: &self.subscriptions) { [weak self] sizes in
            guard let self else { return }

            self._height = .init(
                wrappedValue: sizes.height,
                traitCollection: self.traitCollection
            )

            self._iconSize = .init(
                wrappedValue: sizes.iconSize,
                relativeTo: .title2,
                traitCollection: self.traitCollection
            )

            self.updateSizes()
        }
        // **

        // **
        // Title style
        self.viewModel.$titleFont.subscribe(in: &self.subscriptions) { [weak self] titleFont in
            guard let self else { return }

            self.textLabel.font(titleFont)
        }
        // **
    }

    // MARK: - Touches

    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)

        if self.hasAction,
           let touch = touches.first,
           touch.view == self,
           self.bounds.contains(touch.location(in: self)) {
            // Haptic
            let generator = UIImpactFeedbackGenerator(style: .light)
            generator.impactOccurred()
        }
    }

    // MARK: - Trait Collection

    public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)

        // **
        // Update sizes
        self._padding.update(traitCollection: self.traitCollection)
        self._extraContentSpacing.update(traitCollection: self.traitCollection)
        self._spacing.update(traitCollection: self.traitCollection)
        self.updateLayout()

        self._borderWidth.update(traitCollection: self.traitCollection)
        self._cornerRadius.update(traitCollection: self.traitCollection)
        self._borderDash.update(traitCollection: self.traitCollection)
        self.updateBorderRadius()

        self._height.update(traitCollection: self.traitCollection)
        self._iconSize.update(traitCollection: self.traitCollection)
        self.updateSizes()
    }
}
