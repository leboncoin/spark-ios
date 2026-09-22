//
//  SparkUITextLink.swift
//  SparkComponentTextLink
//
//  Created by robin.lemaire on 07/12/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import UIKit
import Combine
import SwiftUI
@_spi(SI_SPI) import SparkCommon
import SparkTheming

/// A textlink is a reference to a resource.
///
/// It can be external (e.g. a different web page) or internal (e.g. a specific element in the current page).
///
/// ## Example of usage
///
/// ```swift
/// let theme: SparkTheming.Theme = MyTheme()
///
/// let textLink = SparkUITextLink(theme: self.theme)
/// textLink.alignment = .leadingImage
/// textLink.image = UIImage(systemName: "pencil")
/// textLink.intent = .main
/// textLink.text = "My TextLing"
/// textLink.textHighlightRange = NSRange(location: 0, length: 2)
/// textLink.typography = .caption
/// textLink.variant = .underline
///
/// textLink.addAction(.init(handler: { _ in
///    // Your action
/// }), for: .touchUpInside)
///
/// self.addSubview(icon)
/// ```
///
/// ## Accessibility
///
/// By default, the **accessibilityLabel** is equals to the text.
/// To override this value, you need to set a new **accessibilityLabel**.
///
/// The image is not accessible.
///
/// ## Rendering
///
/// - With image:
/// ![TextLink rendering.](textlink_with_image.png)
///
/// - Without image:
/// ![TextLink rendering.](textlink_without_image.png)
///
/// - With a long text:
/// ![TextLink rendering.](textlink_with_long_text.png)
///
public final class SparkUITextLink: UIControl {

    // MARK: - Components

    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView(
            arrangedSubviews:
                [
                    self.imageContentStackView,
                    self.textLabel
                ]
        )
        stackView.axis = .horizontal
        stackView.alignment = .top
        stackView.accessibilityIdentifier = TextLinkAccessibilityIdentifier.contentStackView
        stackView.isUserInteractionEnabled = false
        return stackView
    }()

    private lazy var imageContentStackView: UIStackView = {
        let stackView = UIStackView(
            arrangedSubviews:
                [
                    self.imageTopSpaceView,
                    self.imageView,
                    self.imageBottomSpaceView,
                ]
        )
        stackView.axis = .vertical
        stackView.accessibilityIdentifier = TextLinkAccessibilityIdentifier.imageContentStackView
        return stackView
    }()

    private let imageTopSpaceView = UIView()

    private var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.tintAdjustmentMode = .normal
        imageView.accessibilityIdentifier = TextLinkAccessibilityIdentifier.image
        imageView.isAccessibilityElement = false
        return imageView
    }()

    private let imageBottomSpaceView = UIView()

    /// The UILabel used to display the text.
    ///
    /// Please **do not set a text** in this label but use
    /// the ``text`` directly on the ``SparkUITextLink``.
    public private(set) var textLabel: UILabel = {
        let label = UILabel()
        label.lineBreakMode = .byTruncatingTail
        label.textAlignment = .natural
        label.adjustsFontForContentSizeCategory = true
        label.accessibilityIdentifier = TextLinkAccessibilityIdentifier.text
        label.setContentCompressionResistancePriority(
            .required,
            for: .vertical
        )
        label.setContentCompressionResistancePriority(
            .required,
            for: .horizontal
        )
        label.isAccessibilityElement = false
        return label
    }()

    // MARK: - Public Properties

    private let tapSubject = PassthroughSubject<Void, Never>()
    /// The publisher used to notify when user tap on textlink.
    public private(set) lazy var tapPublisher: AnyPublisher<Void, Never> = self.tapSubject.eraseToAnyPublisher()

    /// The spark theme of the text link.
    public var theme: any Theme {
        didSet {
            self.viewModel.theme = self.theme
        }
    }

    /// The alignment of the text link.
    public var alignment: TextLinkAlignment = .default {
        didSet {
            self.updateAlignment()
        }
    }

    /// The optional image of the text link.
    public var image: UIImage? {
        didSet {
            self.updateImage()
        }
    }

    /// The intent of the text link.
    public var intent: TextLinkIntent = .default {
        didSet {
            self.viewModel.intent = self.intent
        }
    }

    /// A Boolean value indicating whether the text link draws a highlight.
    public override var isHighlighted: Bool {
        get {
            return super.isHighlighted
        }
        set {
            super.isHighlighted = newValue
            self.viewModel.isHighlighted = newValue

            self.updateExtendedPressedBackground()
        }
    }

    /// The text of the textLink.
    /// Displayed at the top of the view.
    ///
    /// > This will also change the **accessibilityLabel** of the components.
    public var text: String? {
        get {
            return self.viewModel.text
        }
        set {
            self.viewModel.text = newValue
            self.accessibilityLabel = newValue
        }
    }

    /// The optional range to specify the highlighted part of the text link.
    public var textHighlightRange: NSRange? {
        didSet {
            self.viewModel.textHighlightRange = self.textHighlightRange
        }
    }

    /// The typography of the text link.
    public var typography: TextLinkTypography = .default {
        didSet {
            self.viewModel.typography = self.typography
        }
    }

    /// The variant of the text link.
    public var variant: TextLinkVariant = .default {
        didSet {
            self.viewModel.variant = self.variant
        }
    }

    // MARK: - Private Properties

    private let viewModel = TextLinkUIViewModel()

    private var imageTopSpaceViewConstraint: NSLayoutConstraint?
    private var imageViewHeightConstraint: NSLayoutConstraint?

    @LimitedScaledUIMetric private var spacing: CGFloat = 0

    private var hoverLayer: CAShapeLayer?

    private var subscriptions = Set<AnyCancellable>()

    // MARK: - Initialization

    /// Create an icon with an image.
    ///
    /// - Parameters:
    ///   - theme: The current theme.
    ///
    /// Implementation example :
    /// ```swift
    /// let theme: SparkTheming.Theme = MyTheme()
    ///
    /// let textLink = SparkUITextLink(theme: self.theme)
    /// textLink.alignment = .leadingImage
    /// textLink.image = UIImage(systemName: "pencil")
    /// textLink.intent = .main
    /// textLink.text = "My TextLing"
    /// textLink.textHighlightRange = NSRange(location: 0, length: 2)
    /// textLink.typography = .caption
    /// textLink.variant = .underline
    ///
    /// textLink.addAction(.init(handler: { _ in
    ///    // Your action
    /// }), for: .touchUpInside)    
    ///
    /// self.addSubview(icon)
    /// ```
    ///
    /// ## Rendering
    ///
    /// ![TextLink rendering.](textlink_with_image.png)
    public init(theme: any Theme) {
        self.theme = theme

        super.init(frame: .zero)

        // Setup
        self.setupView()
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    // MARK: - View setup

    func setupView() {
        // Add subviews
        self.addSubview(self.contentStackView)

        // Accessibility
        self.accessibilityIdentifier = TextLinkAccessibilityIdentifier.view

        // Setup action
        self.setupAction()

        // Setup constraints
        self.setupConstraints()

        // Setup gesture
        self.enableTouch()

        // Setup accessibility
        self.setupAccessibility()

        // Update
        self.updateImage()
        self.updateAlignment()

        // Setup subscriptions
        self.setupSubscriptions()

        // Load view model
        self.viewModel.setup(
            theme: self.theme,
            intent: self.intent,
            text: self.text ?? "",
            textHighlightRange: self.textHighlightRange,
            typography: self.typography,
            variant: self.variant
        )
    }

    // MARK: - Action

    private func setupAction() {
        self.addAction(.init(handler: { [weak self] _ in
            guard let self else { return }

            // Action
            self.tapSubject.send()

            // Haptic
            let generator = UIImpactFeedbackGenerator(style: .light)
            generator.impactOccurred()

        }), for: .touchUpInside)
    }

    // MARK: - Constraints

    private func setupConstraints() {
        self.setupViewConstraints()
        self.setupContentStackViewConstraints()
        self.setupImageSpaceViewsConstraints()
        self.setupImageViewConstraints()
    }

    private func setupViewConstraints() {
        self.translatesAutoresizingMaskIntoConstraints = false
    }

    private func setupContentStackViewConstraints() {
        self.contentStackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.stickEdges(
            from: self.contentStackView,
            to: self,
            insets: .zero
        )
    }

    private func setupImageSpaceViewsConstraints() {
        self.imageTopSpaceView.translatesAutoresizingMaskIntoConstraints = false
        self.imageBottomSpaceView.translatesAutoresizingMaskIntoConstraints = false

        self.imageTopSpaceViewConstraint = self.imageTopSpaceView.heightAnchor.constraint(equalToConstant: .zero)
        self.imageTopSpaceViewConstraint?.isActive = true

        self.imageBottomSpaceView.heightAnchor.constraint(equalTo: self.imageTopSpaceView.heightAnchor).isActive = true
    }

    private func setupImageViewConstraints() {
        self.imageView.translatesAutoresizingMaskIntoConstraints = false

        self.imageViewHeightConstraint = self.imageView.widthAnchor.constraint(equalToConstant: .zero)
        self.imageViewHeightConstraint?.isActive = true

        self.imageView.widthAnchor.constraint(equalTo: self.imageView.heightAnchor).isActive = true
    }

    // MARK: - Accessibility

    private func setupAccessibility() {
        self.isAccessibilityElement = true
        self.accessibilityTraits.insert(.link)
    }

    // MARK: - Update UI

    private func updateAlignment() {
        self.contentStackView.semanticContentAttribute = self.alignment.isTrailingImage ? .forceRightToLeft : .forceLeftToRight
    }

    private func updateImage() {
        self.imageContentStackView.isHidden = self.image == nil
        self.imageView.image = self.image
    }

    private func updateContentStackViewSpacing() {
        self.contentStackView.spacing = self.spacing
    }

    private func updateExtendedPressedBackground() {
        // Remove previous layer
        self.hoverLayer?.removeFromSuperlayer()

        if self.isHighlighted {
            let backgroundColor = self.viewModel.hoverStyle.backgroundColor.uiColor.withAlphaComponent(
                self.viewModel.hoverStyle.dim
            )

            let radius = self.viewModel.hoverStyle.cornerRadius

            let path = UIBezierPath(
                roundedRect: self.bounds.insetBy(
                    dx: -self.viewModel.hoverStyle.horizontalPadding,
                    dy: -self.viewModel.hoverStyle.verticalPadding
                ),
                byRoundingCorners: [
                    .topLeft,
                    .bottomLeft,
                    .topRight,
                    .bottomRight
                ],
                cornerRadii: CGSize(
                    width: radius,
                    height: radius
                )
            )

            let shape = CAShapeLayer()
            shape.path = path.cgPath
            shape.fillColor = backgroundColor.resolvedColor(with: self.traitCollection).cgColor

            self.layer.addSublayer(shape)
            self.hoverLayer = shape
        }
    }

    // MARK: - Subscribe

    private func setupSubscriptions() {
        // Attributed Text
        self.viewModel.$attributedString.subscribe(in: &self.subscriptions) { [weak self] attributedString in
            guard let self else { return }

            self.textLabel.attributedText = attributedString
        }

        // Spacing
        self.viewModel.$spacing.subscribe(in: &self.subscriptions) { [weak self] spacing in
            guard let self else { return }

            self._spacing = .init(
                wrappedValue: spacing,
                traitCollection: self.traitCollection
            )

            self.updateContentStackViewSpacing()
        }

        // Image Size
        self.viewModel.$imageSize.subscribe(in: &self.subscriptions) { [weak self] imageSize in
            guard let self else { return }

            self.imageViewHeightConstraint?.constant = imageSize.size
            self.imageView.updateConstraintsIfNeeded()

            self.imageTopSpaceViewConstraint?.constant = imageSize.padding
            self.imageTopSpaceView.updateConstraintsIfNeeded()
        }

        // Image Tint Color
        self.viewModel.$imageColor.subscribe(in: &self.subscriptions) { [weak self] imageColor in
            guard let self else { return }

            self.imageView.tintColor(imageColor)
        }

        // Dot
        self.viewModel.$dim.subscribe(in: &self.subscriptions) { [weak self] dim in
            guard let self else { return }

            self.alpha = dim
        }
    }

    // MARK: - Trait Collection

    public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)

        // Update spacings
        self._spacing.update(traitCollection: self.traitCollection)
        self.updateContentStackViewSpacing()

        self.viewModel.contentSizeCategoryDidUpdate()
    }
}
