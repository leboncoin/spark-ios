//
//  SparkUIButton.swift
//  SparkComponentButton
//
//  Created by robin.lemaire on 18/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import UIKit
@_spi(SI_SPI) import SparkCommon
import SparkTheming
import SparkComponentSpinner
import Combine

/// Spark Buttons are clickable elements used to trigger actions.
///
/// Buttons communicate calls to action to the user and allow users
/// to interact with pages in a variety of ways.
/// Button labels express what action will occur when the user interacts with it.
///
/// ## Example of usage
///
/// ### Text Only Button
///
/// ```swift
/// let button = SparkUIButton(theme: theme)
/// button.setTitle("Click Me", for: .normal)
/// button.intent = .main
/// button.variant = .filled
/// button.size = .medium
/// button.addAction(UIAction { _ in
///     // Your action
/// }, for: .touchUpInside)
/// ```
///
/// ### Button with Icon
///
/// ```swift
/// let button = SparkUIButton(theme: theme)
/// button.setTitle("Save", for: .normal)
/// button.setImage(UIImage(systemName: "checkmark"), for: .normal)
/// button.intent = .support
/// button.variant = .outlined
/// button.size = .medium
/// button.alignment = .leadingImage
/// ```
///
/// ### Icon Button
///
/// ```swift
/// let button = SparkUIButton(theme: theme)
/// button.setImage(UIImage(systemName: "heart.fill"), for: .normal)
/// button.intent = .support
/// button.variant = .ghost
/// button.size = .small
/// ```
///
/// ### Loading State
///
/// ```swift
/// let button = SparkUIButton(theme: theme)
/// button.setTitle("Submit", for: .normal)
/// button.isLoading = true
/// ```
///
/// ### Content Visibility With Animation
///
/// ```swift
/// let button = SparkUIButton(theme: theme)
/// button.setImage(UIImage(systemName: "heart.fill"), for: .normal)
/// button.setTitle("Submit", for: .normal)
/// button.setContentVisibility(.hideLabel, animated: true)
/// ```
///
/// ## Accessibility
///
/// SparkUIButton automatically supports:
/// - VoiceOver with proper button traits
/// - Dynamic Type
/// - Large Content Viewer for accessibility
///
/// If you only provide an image, you must set the **accessibilityLabel**.
///
/// ## Rendering
///
/// ### Title
///
/// ![Button rendering.](button_title.png)
///
/// ### Icon only
///
/// ![Button rendering.](button_icon.png)
///
/// ### All content (image + title)
///
/// ![Button rendering.](button_all.png)
/// 
public final class SparkUIButton: UIControl {

    // MARK: - Components

    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            self.spaceView1,
            self.subContentStackView,
            self.spaceView2
        ])
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.isUserInteractionEnabled = false
        return stackView
    }()

    private lazy var subContentStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            self.spinner,
            self.titleLabel,
            self._imageView
        ])
        stackView.axis = .horizontal
        stackView.alignment = .center
        return stackView
    }()

    private let spaceView1 = UIView()
    private let spaceView2 = UIView()

    private lazy var spinner: ButtonUISpinner = {
        let spinner = ButtonUISpinner(theme: self.theme)
        spinner.isHidden = true
        return spinner
    }()

    private var _imageView: ButtonUIImageView = {
        let imageView = ButtonUIImageView()
        imageView.isHidden = true
        return imageView
    }()

    /// The UIImageView used to display the button image.
    public var imageView: UIImageView {
        self._imageView.imageView
    }

    /// The UILabel used to display the button title.
    ///
    /// Please **do not set a text/attributedText** in this label but use
    /// the ``setTitle(_:for:)`` and ``setAttributedTitle(_:for:)`` directly on the ``SparkUIButton``.
    public private(set) var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.adjustsFontForContentSizeCategory = true
        label.lineBreakMode = .byTruncatingMiddle
        label.isHidden = true
        return label
    }()

    // MARK: - Public Properties

    /// The spark theme of the button.
    public var theme: any Theme {
        didSet {
            self.viewModel.theme = self.theme
            self.spinner.theme = self.theme
        }
    }

    /// The appearance of the button.
    /// Replace the ``ButtonIntent`` and the ``ButtonVariant``.
    /// Check the ``ButtonAppearance`` to see the **default** value.
    public var appearance: ButtonAppearance? {
        didSet {
            self.viewModel.appearance = self.appearance
        }
    }

    /// The intent of the button.
    /// Check the ``ButtonIntent`` to see the **default** value.
    public var intent: ButtonIntent = .default {
        didSet {
            self.viewModel.intent = self.intent
        }
    }

    /// The variant of the button.
    /// Check the ``ButtonVariant`` to see the **default** value.
    public var variant: ButtonVariant = .default {
        didSet {
            self.viewModel.variant = self.variant
        }
    }

    /// The shape of the button.
    /// Check the ``ButtonShape`` to see the **default** value.
    public var shape: ButtonShape = .default {
        didSet {
            self.viewModel.shape = self.shape
        }
    }

    /// The size of the button.
    /// Check the ``ButtonSize`` to see the **default** value.
    public var size: ButtonSize = .default {
        didSet {
            self.viewModel.size = self.size
        }
    }

    /// The alignment of the button (image position relative to text).
    /// Check the ``ButtonAlignment`` to see the **default** value.
    public var alignment: ButtonAlignment = .default {
        didSet {
            self.updateAlignment()
        }
    }

    /// The content visibility of the button.
    /// Check the ``ButtonContentVisibility`` to see the **default** value.
    public var contentVisibility: ButtonContentVisibility = .default {
        didSet {
            self.viewModel.contentVisibility = self.contentVisibility
        }
    }

    /// Remove the styles (*border*, *radius*, *height*, ...) on the Button if the value is **true**.
    /// The **default** value is **false**.
    public var removeStyles: Bool = false {
        didSet {
            self.viewModel.removeStyles = self.removeStyles
        }
    }

    /// A Boolean value that determines whether the button action play a feedback.
    /// The **default** value is **false**.
    public var hasFeedback: Bool = false

    /// A Boolean value that determines whether the button is in a loading state.
    /// The **default** value is **false**. 
    public var isLoading: Bool = false {
        didSet {
            self.viewModel.isLoading = self.isLoading
            self.updateLoadingState()
            self.updateContentForCurrentState()
        }
    }

    /// A Boolean value indicating whether the control is in the enabled state.
    public override var isEnabled: Bool {
        didSet {
            self.viewModel.isEnabled = self.isEnabled
            self.updateContentForCurrentState()
            self.accessibilityTraits(.notEnabled, condition: !self.isEnabled)
        }
    }

    /// A Boolean value indicating whether the control is in the selected state.
    public override var isSelected: Bool {
        didSet {
            self.updateContentForCurrentState()
            self.accessibilityTraits(.selected, condition: self.isSelected)
        }
    }

    /// A Boolean value indicating whether the control is in the highlighted state.
    public override var isHighlighted: Bool {
        didSet {
            self.viewModel.isPressed = self.isHighlighted
            self.updateContentForCurrentState()
        }
    }

    public override var accessibilityLabel: String? {
        get {
            if let customAccessibilityLabel {
                return customAccessibilityLabel
            } else {
                return self.titleLabel.accessibilityLabel
            }
        }
        set {
            self.customAccessibilityLabel = newValue
        }
    }

    private let touchUpInsideSubject = PassthroughSubject<Void, Never>()
    /// The publisher used to notify when user tap on button.
    public private(set) lazy var touchUpInsidePublisher: AnyPublisher<Void, Never> = self.touchUpInsideSubject.eraseToAnyPublisher()

    // MARK: - Private Properties

    private let viewModel = ButtonViewModel()
    private var subscriptions = Set<AnyCancellable>()

    private var type: ButtonType = .button {
        didSet {
            self.viewModel.type = self.type
        }
    }

    private var heightConstraint: NSLayoutConstraint?
    private var widthConstraint: NSLayoutConstraint?
    private var minWidthConstraint: NSLayoutConstraint?

    @ScaledUIFrame private var height: CGFloat = 0
    @ScaledUIFrame private var width: CGFloat = 0

    @ScaledUIBorderRadius private var cornerRadius: CGFloat = 0
    @ScaledUIBorderWidth private var borderWidth: CGFloat = 0

    private var contentStackViewLeadingConstraint: NSLayoutConstraint?

    private var titles: [UInt: String] = [:]
    private var attributedTitles: [UInt: NSAttributedString] = [:]
    private var images: [UInt: UIImage] = [:]

    private var customAccessibilityLabel: String?

    private let visualIdentification = UUID().uuidString

    // MARK: - Initialization

    /// Creates a button with a theme and an optional custom style.
    ///
    /// - Parameter theme: The theme to apply to the button.
    /// - Parameter style: A defined ``SparkUIButtonStyle`` (like uploadButton). Optional. Default is *nil*
    ///
    /// Implementation example :
    ///
    /// ### Text Only Button
    ///
    /// ```swift
    /// let button = SparkUIButton(theme: theme)
    /// button.setTitle("Click Me", for: .normal)
    /// button.intent = .main
    /// button.variant = .filled
    /// button.size = .medium
    /// button.addAction(UIAction { _ in
    ///     // Your action
    /// }, for: .touchUpInside)
    /// ```
    ///
    /// ### Button with Icon
    ///
    /// ```swift
    /// let button = SparkUIButton(theme: theme)
    /// button.setTitle("Save", for: .normal)
    /// button.setImage(UIImage(systemName: "checkmark"), for: .normal)
    /// button.intent = .support
    /// button.variant = .outlined
    /// button.size = .medium
    /// button.alignment = .leadingImage
    /// ```
    ///
    /// ### Icon Button
    ///
    /// ```swift
    /// let button = SparkUIButton(theme: theme)
    /// button.setImage(UIImage(systemName: "heart.fill"), for: .normal)
    /// button.intent = .support
    /// button.variant = .ghost
    /// button.size = .small
    /// ```
    ///
    /// ## Rendering
    ///
    /// ### Title
    ///
    /// ![Button rendering.](button_title.png)
    ///
    /// ### Icon only
    ///
    /// ![Button rendering.](button_icon.png)
    ///
    /// ### All content (image + title)
    ///
    /// ![Button rendering.](button_all.png)
    public init(
        theme: any Theme,
        style: (any SparkUIButtonStyle)? = nil
    ) {
        self.theme = theme

        super.init(frame: .zero)

        style?.apply(on: self)

        self.setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - View Setup

    private func setupView() {
        // Add subviews
        self.addSubview(self.contentStackView)

        // Update UI
        self.updateAlignment()
        self.updateLoadingState()

        // Setup gesture
        self.enableTouch()

        // Setup constraints
        self.setupConstraints()

        // Setup accessibility
        self.setupAccessibility()

        // Setup action
        self.setupAction()

        // Setup subscriptions
        self.setupSubscriptions()

        // Setup view model
        self.viewModel.setup(
            theme: self.theme,
            appearance: self.appearance,
            intent: self.intent,
            variant: self.variant,
            shape: self.shape,
            size: self.size,
            type: self.type,
            contentVisibility: self.contentVisibility,
            removeStyles: self.removeStyles,
            isEnabled: self.isEnabled,
            isLoading: self.isLoading
        )
    }

    // MARK: - Layout

    public override func layoutSubviews() {
        super.layoutSubviews()

        self.updateBorder()
        self.sparkVisualIdentification(id: self.visualIdentification)
    }

    // MARK: - Constraints

    private func setupConstraints() {
        self.translatesAutoresizingMaskIntoConstraints = false

        // Self constraints
        self.heightConstraint = self.heightAnchor.constraint(equalToConstant: .zero)
        self.widthConstraint = self.widthAnchor.constraint(equalTo: self.heightAnchor)
        self.minWidthConstraint = self.widthAnchor.constraint(greaterThanOrEqualToConstant: .zero)

        self.setupSpaceViewsConstraints()
        self.setupContentStackViewConstraints()
    }

    private func setupSpaceViewsConstraints() {
        self.spaceView1.translatesAutoresizingMaskIntoConstraints = false
        self.spaceView2.translatesAutoresizingMaskIntoConstraints = false

        self.spaceView1.widthAnchor.constraint(equalTo: self.spaceView2.widthAnchor).isActive = true
    }

    private func setupContentStackViewConstraints() {
        self.contentStackView.translatesAutoresizingMaskIntoConstraints = false

        self.contentStackViewLeadingConstraint = self.contentStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        let contentStackViewTopConstraint = self.contentStackView.topAnchor.constraint(equalTo: self.topAnchor)
        let contentStackViewCenterYAnchor = self.contentStackView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        let contentStackViewCenterXAnchor = self.contentStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor)

        NSLayoutConstraint.activate([
            self.contentStackViewLeadingConstraint,
            contentStackViewTopConstraint,
            contentStackViewCenterYAnchor,
            contentStackViewCenterXAnchor,
        ].compactMap { $0 })
    }

    // MARK: - Accessibility

    private func setupAccessibility() {
        self.accessibilityIdentifier = ButtonAccessibilityIdentifier.button
        self.accessibilityTraits = .button
        self.isAccessibilityElement = true
        self.scalesLargeContentImage = true
        self.showsLargeContentViewer = true
        self.addInteraction(UILargeContentViewerInteraction())
        self.maximumContentSizeCategory = .extraExtraExtraLarge
    }

    // MARK: - Action

    private func setupAction() {
        self.addAction(.init(handler: { [weak self] _ in
            guard let self else { return }

            // Action
            self.touchUpInsideSubject.send()

            // Haptic
            if self.hasFeedback {
                let generator = UIImpactFeedbackGenerator(style: .light)
                generator.impactOccurred()
            }

        }), for: .touchUpInside)
    }

    // MARK: - Update UI

    private func updateAlignment() {
        // Remove some arranged subviews first
        self.subContentStackView.removeArrangedSubviews([
            self.titleLabel,
            self._imageView
        ])

        // Insert new subviews after the spinner
        self.subContentStackView.addArrangedSubview(
            self.alignment.isTrailingImage ? self.titleLabel : self._imageView
        )

        self.subContentStackView.addArrangedSubview(
            self.alignment.isTrailingImage ? self._imageView : self.titleLabel
        )
    }

    private func updateBorder(colors: ButtonColors? = nil) {
        let colors = colors ?? self.viewModel.colors

        self.sparkBorderRadius(
            width: self.borderWidth,
            radius: self.cornerRadius,
            colorToken: colors.borderColor
        )
    }

    private func updateColors(_ colors: ButtonColors? = nil) {
        let colors = colors ?? self.viewModel.colors

        self.backgroundColor = colors.backgroundColor.uiColor
        self.titleLabel.textColor = colors.tintColor.uiColor
        self._imageView.tintColor = colors.iconColor.uiColor
        self.spinner.intent = .custom(colors.tintColor)
    }

    private func updateSize(_ sizes: ButtonSizes? = nil) {
        let sizes = sizes ?? self.viewModel.sizes

        // Height
        self.heightConstraint?.constant = self.height
        self.heightConstraint?.isActive = sizes.isFixedHeight

        // Width
        self.widthConstraint?.isActive = sizes.isFixedWidth
        self.minWidthConstraint?.constant = self.width
        self.minWidthConstraint?.isActive = true

        self.setNeedsUpdateConstraints()
    }

    private func updateLayout(_ layout: ButtonLayout? = nil) {
        let layout = layout ?? self.viewModel.layout

        // Update stack view spacing
        self.subContentStackView.spacing = layout.horizontalSpacing

        // Update content insets
        self.contentStackViewLeadingConstraint?.constant = layout.horizontalPadding
    }

    private func updateTitleFontToken(_ fontToken: (any TypographyFontToken)? = nil) {
        let fontToken = fontToken ?? self.viewModel.titleFontToken

        self.titleLabel.font = fontToken.uiFont
    }

    private func updateLoadingState() {
        self.spinner.isHidden = !self.isLoading
    }

    private func updateContentForCurrentState(showContent: Bool? = nil) {
        let showContent = showContent ?? self.viewModel.showContent

        // Get the appropriate content for the current state
        let currentTitle = self.titles.valueForCurrentState(on: self)
        let currentAttributedTitle = self.attributedTitles.valueForCurrentState(on: self)
        let currentImage = self.images.valueForCurrentState(on: self)

        // Update the title label
        if let currentAttributedTitle {
            self.titleLabel.attributedText(currentAttributedTitle)
        } else {
            self.titleLabel.text(currentTitle)
        }

        // Update the image view
        self._imageView.image = currentImage

        // Update type based on new content
        self.type = .init(
            isTitle: self.currentTitle?.isEmpty == false,
            isImage: self.currentImage != nil
        )

        // Accessibility
        self.largeContentTitle = self.currentTitle
        self.largeContentImage = self.currentImage

        // Update the visibility
        if showContent {
            switch self.contentVisibility {
            case .hideLabel: self.titleLabel.isHidden = true
            case .hideImage: self._imageView.isHidden = true
            default: break
            }

        } else {
            self.titleLabel.isHidden = true
            self._imageView.isHidden = true
        }

        self.invalidateIntrinsicContentSize()
    }

    // MARK: - Subscribe

    private func setupSubscriptions() {
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
            self.updateBorder()
        }

        // Colors
        self.viewModel.$colors.subscribe(in: &self.subscriptions) { [weak self] colors in
            guard let self else { return }

            self.updateBorder(colors: colors)
            self.updateColors(colors)
        }

        // Dim
        self.viewModel.$dim.subscribe(in: &self.subscriptions) { [weak self] dim in
            self?.alpha = dim
        }

        // Layout
        self.viewModel.$layout.subscribe(in: &self.subscriptions) { [weak self] layout in
            self?.updateLayout(layout)
        }

        // Title font token
        self.viewModel.$titleFontToken.subscribe(in: &self.subscriptions) { [weak self] titleFontToken in
            self?.updateTitleFontToken(titleFontToken)
        }

        // Sizes
        self.viewModel.$sizes.subscribe(in: &self.subscriptions) { [weak self] sizes in
            guard let self else { return }

            self._height = .init(
                wrappedValue: sizes.height,
                traitCollection: self.traitCollection
            )
            self._width = .init(
                wrappedValue: sizes.width,
                traitCollection: self.traitCollection
            )
            self.updateSize(sizes)

            self._imageView.updateImageSize(sizes.imageSize)
        }

        // Show content
        self.viewModel.$showContent.subscribe(in: &self.subscriptions) { [weak self] showContent in
            self?.updateContentForCurrentState(showContent: showContent)
        }
    }

    // MARK: - Public Methods

    /// Sets the content visibility of the button with optional animation.
    ///
    /// This method allows you to control which parts of the button content are visible.
    ///
    /// When animated, the visibility changes are smoothly transitioned with a fade effect.
    ///
    /// - Parameters:
    ///   - contentVisibility: The desired content visibility state. See ``ButtonContentVisibility`` for available options.
    ///   - animated: Whether to animate the visibility change. When `true`, content fades in/out smoothly.
    ///
    /// - Note: If the new content visibility is the same as the current one, this method does nothing.
    public func setContentVisibility(_ contentVisibility: ButtonContentVisibility, animated: Bool) {
        guard contentVisibility != self.contentVisibility else {
            return
        }

        if animated {
            self._imageView.updateAlpha(
                currentContentVisibility: self.contentVisibility,
                newContentVisibility: contentVisibility,
                onAnimation: false
            )

            self.titleLabel.updateAlpha(
                currentContentVisibility: self.contentVisibility,
                newContentVisibility: contentVisibility,
                onAnimation: false
            )

            UIView.optionalAnimate(withDuration: ButtonConstants.Animation.slowDuration) {

                self._imageView.updateAlpha(
                    currentContentVisibility: self.contentVisibility,
                    newContentVisibility: contentVisibility,
                    onAnimation: true
                )

                self.titleLabel.updateAlpha(
                    currentContentVisibility: self.contentVisibility,
                    newContentVisibility: contentVisibility,
                    onAnimation: true
                )

                self.contentVisibility = contentVisibility
            }

        } else {
            self.contentVisibility = contentVisibility
        }
    }

    /// Sets the title for the button for the specified state.
    ///
    /// - Parameters:
    ///   - title: The title to set.
    ///   - state: The control state (.normal, .selected, .disabled, .highlighted).
    public func setTitle(_ title: String?, for state: UIControl.State) {
        if self.titles.setValue(title, for: state) {
            // Remove the attributed title if the value was setted.
            self.attributedTitles.removeValue(for: state)
        }
        self.updateContentForCurrentState()
    }

    /// Sets the attributed title for the button for the specified state.
    ///
    /// - Parameters:
    ///   - attributedTitle: The attributed title to set.
    ///   - state: The control state (.normal, .selected, .disabled, .highlighted).
    public func setAttributedTitle(_ attributedTitle: NSAttributedString?, for state: UIControl.State) {
        if self.attributedTitles.setValue(attributedTitle, for: state) {
            // Remove the title if the value was setted.
            self.titles.removeValue(for: state)
        }

        self.updateContentForCurrentState()
    }

    /// Sets the image for the button for the specified state.
    ///
    /// - Parameters:
    ///   - image: The image to set.
    ///   - state: The control state (.normal, .selected, .disabled, .highlighted).
    public func setImage(_ image: UIImage?, for state: UIControl.State) {
        self.images.setValue(image, for: state)

        self.updateContentForCurrentState()
    }

    /// Returns the title for the specified state.
    ///
    /// - Parameter state: The control state (.normal, .selected, .disabled, .highlighted).
    /// - Returns: The title string, or nil if no title is set for that state.
    public func title(for state: UIControl.State) -> String? {
        return self.titles.value(for: state)
    }

    /// Returns the attributed title for the specified state.
    ///
    /// - Parameter state: The control state (.normal, .selected, .disabled, .highlighted).
    /// - Returns: The attributed title, or nil if no attributed title is set for that state.
    public func attributedTitle(for state: UIControl.State) -> NSAttributedString? {
        return self.attributedTitles.value(for: state)
    }

    /// Returns the image for the specified state.
    ///
    /// - Parameter state: The control state (.normal, .selected, .disabled, .highlighted).
    /// - Returns: The image, or nil if no image is set for that state.
    public func image(for state: UIControl.State) -> UIImage? {
        return self.images.value(for: state)
    }

    /// Returns the current title being displayed.
    public var currentTitle: String? {
        return self.titleLabel.text
    }

    /// Returns the current attributed title being displayed.
    public var currentAttributedTitle: NSAttributedString? {
        return self.titleLabel.attributedText
    }

    /// Returns the current image being displayed.
    public var currentImage: UIImage? {
        return self._imageView.image
    }

    // MARK: - Instrinsic Content Size

    public override var intrinsicContentSize: CGSize {
        var width: CGFloat = .zero

        if self.widthConstraint?.isActive == true {
            width = self.width

        } else {
            self.subContentStackView.layoutIfNeeded()
            width = self.subContentStackView.frame.width
        }

        return CGSize(
            width: width,
            height: self.height
        )
    }

    // MARK: - Trait Collection

    public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)

        // Sizes
        self._height.update(traitCollection: self.traitCollection)
        self._width.update(traitCollection: self.traitCollection)
        self.updateSize()

        // Corner
        self._cornerRadius.update(traitCollection: self.traitCollection)
        self._borderWidth.update(traitCollection: self.traitCollection)
        self.updateBorder()
    }
}

// MARK: - Extension

private extension UIView {

    func updateAlpha(
        currentContentVisibility: ButtonContentVisibility,
        newContentVisibility: ButtonContentVisibility,
        onAnimation: Bool
    ) {
        let isLabel = self is UILabel

        let currentShowContent = isLabel ? currentContentVisibility.showLabel : currentContentVisibility.showImage
        let newShowContent = isLabel ? newContentVisibility.showLabel : newContentVisibility.showImage

        if currentShowContent != newShowContent {
            if onAnimation {
                self.alpha = newShowContent ? 1 : 0
            } else { // Before the animation
                self.alpha = newShowContent ? 0 : 1
            }
        }
    }
}
