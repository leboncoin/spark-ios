//
//  SparkUITag.swift
//  SparkComponentTag
//
//  Created by robin.lemaire on 04/08/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import UIKit
import Combine
@_spi(SI_SPI) import SparkCommon
import SparkTheming

/// A Spark Tag is used to label content and help users quickly recognize info
/// about them: Categories, Status...
/// Can be applied with different colors and designs that are associated
/// with a content due to its characteristics: new content, unvisited content,
/// featured content...
///
/// Users can’t interact with Tag except for accessibility.
///
/// Example of usage :
/// ```swift
/// let theme: SparkTheming.Theme = MyTheme()
///
/// let tag = SparkUITag(theme: self.theme)
/// tag.text = "My Tag"
/// tag.icon = .init(systemName: "checkmark")
/// tag.intent = .danger
/// tag.size = .large
/// tag.variant = .outlined
/// tag.isHighlighted = true
///
/// ```
/// ![Tag rendering with a text and icon.](tag_with_text_and_icon.png)
public final class SparkUITag: UIView {

    // MARK: - Components

    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView(
            arrangedSubviews: [
                self.iconImageView,
                self.textLabel
            ])
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.isAccessibilityElement = false
        return stackView
    }()

    /// The UIImageView used to display the tag icon.
    ///
    /// Please **do not set an image** in this imageView but use
    /// the ``icon`` directly on the ``SparkUITag``.
    public var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.tintAdjustmentMode = .normal
        imageView.accessibilityIdentifier = TagAccessibilityIdentifier.iconImage
        imageView.setContentCompressionResistancePriority(
            .required,
            for: .vertical
        )
        imageView.setContentCompressionResistancePriority(
            .required,
            for: .horizontal
        )
        imageView.isHidden = true
        return imageView
    }()

    /// The UILabel used to display the tag text.
    ///
    /// Please **do not set a text/attributedText** in this label but use
    /// the ``text`` and ``attributedText`` directly on the ``SparkUITag``.
    public var textLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.lineBreakMode = .byTruncatingTail
        label.adjustsFontForContentSizeCategory = true
        label.accessibilityIdentifier = TagAccessibilityIdentifier.text
        label.setContentCompressionResistancePriority(
            .required,
            for: .vertical
        )
        label.setContentCompressionResistancePriority(
            .required,
            for: .horizontal
        )
        label.isHidden = true
        return label
    }()

    // MARK: - Public Properties

    /// The spark theme of the tag.
    public var theme: any Theme {
        didSet {
            self.viewModel.theme = self.theme
        }
    }

    /// Set the **intent** on the ``SparkUITag``.
    ///
    /// Check the ``TagIntent`` to see the **default** value.
    public var intent: TagIntent = .default {
        didSet {
            self.viewModel.intent = self.intent
        }
    }

    /// Set the **size** on the ``SparkUITag``.
    ///
    /// Check the ``TagSize`` to see the **default** value.
    public var size: TagSize = .default {
        didSet {
            self.viewModel.size = self.size
        }
    }

    /// Set the **variant** on the ``SparkUITag``.
    ///
    /// Check the ``TagVariant`` to see the **default** value.
    public var variant: TagVariant = .default {
        didSet {
            self.viewModel.variant = self.variant
        }
    }

    /// Set the **isHighlighted** on the ``SparkUITag``.
    ///
    /// The default value for this property is *false*.
    ///
    /// If the value is *true*, a custom corner radius will be applied.
    /// 
    /// ![Tag rendering with when us highlighted is true.](tag_with_is_highlighted.png)
    public var isHighlighted: Bool = false {
        didSet {
            self.updateBorder()
        }
    }

    /// The icon of the tag.
    /// Image can be nil, in this case, no image is displayed.
    /// If image is nil, **you must add a text or an attributedText**.
    public var icon: UIImage? {
        get {
            self.iconImageView.image
        }
        set {
            self.iconImageView.image = newValue
            self.iconImageView.isHidden = (newValue == nil)
            self.invalidateIntrinsicContentSize()

            self.largeContentImage = newValue
        }
    }

    /// The text of the tag.
    /// Text can be nil, in this case, no text is displayed.
    /// If text is nil, **you must add a iconImage or an attributedText**.
    public var text: String? {
        get {
            self.textLabel.text
        }
        set {
            self.textLabel.isHidden = newValue == nil
            self.textLabel.attributedText = nil
            self.textLabel.text = newValue
            self.invalidateIntrinsicContentSize()

            self.accessibilityLabel = newValue
            self.largeContentTitle = newValue
        }
    }

    /// The attributedText of the tag.
    /// Text can be nil, in this case, no text is displayed.
    /// If attributedText is nil, **you must add a iconImage or a text**.
    public var attributedText: NSAttributedString? {
        get {
            self.textLabel.attributedText
        }
        set {
            self.textLabel.isHidden = newValue == nil
            self.textLabel.text = nil
            self.textLabel.attributedText = newValue
            self.invalidateIntrinsicContentSize()

            self.accessibilityLabel = newValue?.string
            self.largeContentTitle = newValue?.string
        }
    }

    // MARK: - Private Properties

    private let viewModel = TagViewModel()

    private var heightConstraint = NSLayoutConstraint()

    private var contentStackViewLeadingConstraint = NSLayoutConstraint()
    private var contentStackViewTrailingConstraint = NSLayoutConstraint()

    private var iconImageViewWidthConstraint = NSLayoutConstraint()

    @ScaledUIMetric private var height: CGFloat
    @ScaledUIMetric private var iconSize: CGFloat

    @LimitedScaledUIMetric private var horizontalPadding: CGFloat = 0
    @LimitedScaledUIMetric private var horizontalSpacing: CGFloat = 0

    @ScaledUIBorderWidth private var borderWidth: CGFloat = 0
    @ScaledUIBorderRadius private var borderRadius: CGFloat = 0

    private var subscriptions = Set<AnyCancellable>()

    // MARK: - Initialization

    /// Creates a Spark tag.
    ///
    /// Note : You must set a ``text``,  or an``attributedText`` or an``icon``.
    ///
    /// - Parameters:
    ///   - theme: The current theme.
    ///
    /// Implementation example :
    /// ```swift
    /// let theme: SparkTheming.Theme = MyTheme()
    ///
    /// let tag = SparkUITag(theme: self.theme)
    /// tag.text = "My Tag"
    /// tag.icon = .init(systemName: "checkmark")
    /// ```
    ///
    /// ![Tag rendering with a text and icon.](tag_with_text_and_icon.png)
    public init(
        theme: any Theme
    ) {
        self.theme = theme

        self._height = .init(
            wrappedValue: 0,
            relativeTo: .body
        )
        self._iconSize = .init(
            wrappedValue: TagConstants.iconSize,
            relativeTo: .title3
        )

        super.init(frame: .zero)

        // Setup
        self.setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - View setup

    private func setupView() {
        // Accessibility
        self.isAccessibilityElement = true
        self.scalesLargeContentImage = true
        self.showsLargeContentViewer = true
        self.addInteraction(UILargeContentViewerInteraction())
        self.minimumContentSizeCategory = .large
        self.maximumContentSizeCategory = .accessibilityExtraLarge

        // Add subview
        self.addSubview(self.contentStackView)

        // Setup constraints
        self.setupConstraints()

        // Setup publisher subcriptions
        self.setupSubscriptions()

        // Load view model
        self.viewModel.setup(
            theme: self.theme,
            intent: self.intent,
            size: self.size,
            variant: self.variant
        )
    }

    // MARK: - Layout

    public override func layoutSubviews() {
        super.layoutSubviews()

        self.updateBorder()
    }

    // MARK: - Constraints

    private func setupConstraints() {
        self.setupViewConstraints()
        self.setupContentStackViewConstraints()
        self.setupIconSizeViewsContraints()
    }

    private func setupViewConstraints() {
        self.translatesAutoresizingMaskIntoConstraints = false

        self.heightConstraint = self.heightAnchor.constraint(equalToConstant: self.height)
        self.heightConstraint.isActive = true
    }

    private func setupContentStackViewConstraints() {
        self.contentStackView.translatesAutoresizingMaskIntoConstraints = false

        self.contentStackViewLeadingConstraint = self.contentStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        self.contentStackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        self.contentStackViewTrailingConstraint = self.contentStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        self.contentStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true

        self.contentStackViewLeadingConstraint.isActive = true
        self.contentStackViewTrailingConstraint.isActive = true
    }

    private func setupIconSizeViewsContraints() {
        self.iconImageView.translatesAutoresizingMaskIntoConstraints = false

        self.iconImageViewWidthConstraint = self.iconImageView.widthAnchor.constraint(
            equalToConstant: self.iconSize
        )
        self.iconImageViewWidthConstraint.isActive = true

        self.iconImageView.heightAnchor.constraint(equalTo: self.iconImageView.widthAnchor).isActive = true
    }

    // MARK: - Update UI

    private func updateAll() {
        self.updateBorder()
        self.updateHeight()
        self.updateIconSizeHeight()
        self.updateHorizontalPadding()
        self.updateContentHorizontalSpacing()
    }

    private func updateBorder() {
        self.sparkBorderRadius(
            width: self.borderWidth,
            radius: self.borderRadius,
            isHighlighted: self.isHighlighted,
            colorToken: self.viewModel.colors.borderColor
        )
    }

    private func updateHeight() {
        if self.heightConstraint.constant != self.height {
            self.heightConstraint.constant = self.height
            self.updateConstraintsIfNeeded()
        }
    }

    private func updateIconSizeHeight() {
        if self.iconImageViewWidthConstraint.constant != self.iconSize {
            self.iconImageViewWidthConstraint.constant = self.iconSize
            self.iconImageView.updateConstraintsIfNeeded()
        }
    }

    private func updateHorizontalPadding() {
        // Reload spacing only if value changed
        if self.contentStackViewLeadingConstraint.constant != self.horizontalPadding {
            self.contentStackViewLeadingConstraint.constant = self.horizontalPadding
            self.contentStackViewTrailingConstraint.constant = -self.horizontalPadding
            self.contentStackView.updateConstraintsIfNeeded()
        }
    }

    private func updateContentHorizontalSpacing() {
        self.contentStackView.spacing = self.horizontalSpacing
    }

    // MARK: - Subscribe

    private func setupSubscriptions() {
        // **
        // Border
        self.viewModel.$border.subscribe(in: &self.subscriptions) { [weak self] border in
            guard let self else { return }

            self._borderWidth = .init(wrappedValue: border.width)
            self._borderWidth.update(traitCollection: self.traitCollection)

            self._borderRadius = .init(wrappedValue: border.radius)
            self._borderRadius.update(traitCollection: self.traitCollection)

            self.updateBorder()
        }
        // **

        // **
        // Colors
        self.viewModel.$colors.subscribe(in: &self.subscriptions) { [weak self] colors in
            guard let self else { return }

            self.backgroundColor = colors.backgroundColor.uiColor
            self.textLabel.textColor = colors.textColor.uiColor
            self.iconImageView.tintColor = colors.iconColor.uiColor

            self.updateBorder()
        }
        // **

        // **
        // Spacings
        self.viewModel.$spacings.subscribe(in: &self.subscriptions) { [weak self] spacings in
            guard let self else { return }

            self._horizontalPadding = .init(wrappedValue: spacings.horizontalPadding)
            self._horizontalPadding.update(traitCollection: self.traitCollection)
            self.updateHorizontalPadding()

            self._horizontalSpacing = .init(wrappedValue: spacings.horizontalSpacing)
            self._horizontalSpacing.update(traitCollection: self.traitCollection)
            self.updateContentHorizontalSpacing()
        }
        // **

        // **
        // Height
        self.viewModel.$height.subscribe(in: &self.subscriptions) { [weak self] height in
            guard let self else { return }

            self.height = height
            self._height.update(traitCollection: self.traitCollection)
            self.updateHeight()
        }
        // **

        // **
        // Text Font
        self.viewModel.$textFont.subscribe(in: &self.subscriptions) { [weak self] textFont in
            guard let self else { return }

            self.textLabel.font(textFont)
        }
        // **
    }

    // MARK: - Trait Collection

    public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)

        // **
        // Update content size
        self._height.update(traitCollection: self.traitCollection)
        self._iconSize.update(traitCollection: self.traitCollection)
        self._horizontalPadding.update(traitCollection: self.traitCollection)
        self._horizontalSpacing.update(traitCollection: self.traitCollection)
        self._borderWidth.update(traitCollection: self.traitCollection)
        self._borderRadius.update(traitCollection: self.traitCollection)

        self.updateAll()
        // **
    }
}
