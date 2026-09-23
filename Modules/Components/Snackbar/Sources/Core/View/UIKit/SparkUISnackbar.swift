//
//  SparkUISnackbar.swift
//  SparkComponentSnackbar
//
//  Created by robin.lemaire on 13/05/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import UIKit
import Combine
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkCommon
import SparkComponentButton

/// Spark Snackbars provide brief notifications at the bottom of the screen.
///
/// Snackbars inform users of a process that an app has performed or will perform.
/// They appear temporarily, towards the bottom of the screen. They shouldn't interrupt
/// the user experience, and they don't require user input to disappear.
///
/// ## Example of usage
///
/// ### Basic Snackbar with Title and Message
///
/// ```swift
/// let snackbar = SparkUISnackbar(theme: theme)
/// snackbar.title = "Upload complete"
/// snackbar.message = "Your file has been uploaded successfully"
/// snackbar.intent = .success
/// view.addSubview(snackbar)
/// ```
///
/// ### Snackbar with Icon
///
/// ```swift
/// let snackbar = SparkUISnackbar(theme: theme)
/// snackbar.icon = UIImage(systemName: "wifi.slash")
/// snackbar.title = "Connection lost"
/// snackbar.message = "Unable to reach the server"
/// snackbar.intent = .error
/// view.addSubview(snackbar)
/// ```
///
/// ### Snackbar with Action Button
///
/// ```swift
/// let snackbar = SparkUISnackbar(theme: theme)
/// snackbar.icon = UIImage(systemName: "trash")
/// snackbar.title = "Item deleted"
/// snackbar.message = "The item has been removed"
/// snackbar.intent = .alert
///
/// let button = SparkUIButton(theme: theme)
/// button.setTitle("Undo", for: .normal)
/// button.variant = .ghost
/// button.addAction(UIAction { _ in
///     // Undo action
/// }, for: .touchUpInside)
/// snackbar.button = button
///
/// view.addSubview(snackbar)
/// ```
///
/// ### Snackbar with Different Alignment
///
/// ```swift
/// let snackbar = SparkUISnackbar(theme: theme)
/// snackbar.title = "Settings saved"
/// snackbar.message = "Your preferences have been updated"
/// snackbar.intent = .success
/// snackbar.alignment = .vertical
/// view.addSubview(snackbar)
/// ```
///
/// ## Accessibility
///
/// SparkUISnackbar automatically supports:
/// - VoiceOver with proper accessibility traits
/// - Dynamic Type for text scaling
/// - Semantic grouping of title and message
///
/// The icon is automatically hidden from accessibility as it's decorative.
///
/// ## Rendering
///
/// ![Snackbar rendering.](snackbar_full.png)
///
public final class SparkUISnackbar: UIView {

    // MARK: - Components

    private lazy var contentStackView: SparkAdaptiveUIStackView = {
        let stackView = SparkAdaptiveUIStackView(arrangedSubviews: [
            self.mainContentStackView,
            self.buttonContentStackView
        ])
        stackView.accessibilityAxis = .vertical
        stackView.accessibilityAlignment = .fill
        return stackView
    }()

    private lazy var mainContentStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            self.iconImageView,
            self.secondaryContentStackView
        ])
        stackView.axis = .horizontal
        stackView.alignment = .center
        return stackView
    }()

    private lazy var secondaryContentStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            self.titleLabel,
            self.messageLabel
        ])
        stackView.axis = .vertical
        stackView.alignment = .fill
        return stackView
    }()

    private lazy var buttonContentStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            self.buttonLeftSpaceView
        ])
        stackView.axis = .horizontal
        return stackView
    }()

    private let buttonLeftSpaceView = UIView()

    /// The UIImageView used to display the snackbar icon.
    ///
    /// Please **do not set an image** in this imageView but use
    /// the ``icon`` directly on the ``SparkUISnackbar``.
    public let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.isHidden = true
        return imageView
    }()

    /// The UILabel used to display the snackbar title.
    ///
    /// *Optional*. Hide if nil.
    ///
    /// Please **do not set a text/attributedText** in this label but use
    /// the ``title`` and ``attributedTitle`` directly on the ``SparkUISnackbar``.
    let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.adjustsFontForContentSizeCategory = true
        label.isHidden = true
        return label
    }()

    /// The UILabel used to display the snackbar message.
    ///
    /// Please **do not set a text/attributedText** in this label but use
    /// the ``messageString`` and ``attributedMessage`` directly on the ``SparkUISnackbar``.
    let messageLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.adjustsFontForContentSizeCategory = true
        label.isHidden = true
        return label
    }()

    /// The ``SparkUIButton`` used to display the snackbar action.
    ///
    /// *Optional*. Hide if nil.
    public var button: SparkUIButton? {
        didSet {
            self.updateButton()
        }
    }

    // MARK: - Public Properties

    /// The theme applied to the snackbar
    public var theme: any Theme {
        didSet {
            self.viewModel.theme = self.theme
        }
    }

    /// The intent applied to the snackbar
    /// Check the ``SnackbarIntent`` to see the **default** value.
    public var intent: SnackbarIntent = .default {
        didSet {
            self.viewModel.intent = self.intent
        }
    }

    /// The alignment applied to the snackbar
    /// Check the ``SnackbarAlignment`` to see the **default** value.
    public var alignment: SnackbarAlignment = .default {
        didSet {
            self.updateAlignment()
            self.updateLayout()
        }
    }

    /// The icon of the snackbar.
    /// Image can be nil, in this case, no image is displayed.
    /// If image is nil, **you must add a text or an attributedText**.
    public var icon: UIImage? {
        get {
            self.iconImageView.image
        }
        set {
            self.iconImageView.image = newValue
            self.iconImageView.isHidden = (newValue == nil)
        }
    }

    /// The title of the snackbar.
    /// Text can be nil, in this case, no text is displayed.
    public var title: String? {
        get {
            self.titleLabel.text
        }
        set {
            self.titleLabel.text(newValue)
        }
    }

    /// The attributedTitle of the snackbar.
    /// Text can be nil, in this case, no text is displayed.
    public var attributedTitle: NSAttributedString? {
        get {
            self.titleLabel.attributedText
        }
        set {
            self.titleLabel.attributedText(newValue)
        }
    }

    /// The message of the snackbar.
    /// Text can be nil, in this case, no text is displayed.
    public var message: String? {
        get {
            self.messageLabel.text
        }
        set {
            self.messageLabel.text(newValue)
        }
    }

    /// The attributedMessage of the snackbar.
    /// Text can be nil, in this case, no text is displayed.
    public var attributedMessage: NSAttributedString? {
        get {
            self.messageLabel.attributedText
        }
        set {
            self.messageLabel.attributedText(newValue)
        }
    }

    // MARK: - Internal Properties

    internal var presentationTransformation = CGAffineTransform.identity
    internal var presentationVerticalConstraint = NSLayoutConstraint()
    internal var autoDismissWorkItem: DispatchWorkItem?
    internal var dismissCompletion: ((Bool) -> Void)?

    // MARK: - Private Properties

    private let viewModel = SnackbarViewModel()
    private var subscriptions = Set<AnyCancellable>()

    @LimitedScaledUIMetric private var leadingPadding: CGFloat = .zero
    @LimitedScaledUIMetric private var trailingPadding: CGFloat = .zero
    @LimitedScaledUIMetric private var horizontalSpacing: CGFloat = .zero
    @LimitedScaledUIMetric private var verticalPadding: CGFloat = .zero
    @LimitedScaledUIMetric private var verticalSpacing: CGFloat = .zero
    @LimitedScaledUIMetric private var verticalSubSpacing: CGFloat = .zero

    @ScaledUIBorderWidth private var borderWidth: CGFloat = .zero
    @ScaledUIBorderRadius private var borderRadius: CGFloat = .zero

    @ScaledUIMetric private var iconSize: CGFloat

    private var contentStackViewLeadingConstraint: NSLayoutConstraint?
    private var contentStackViewTopConstraint: NSLayoutConstraint?
    private var contentStackViewTrailingConstraint: NSLayoutConstraint?

    private var iconWidthConstraint: NSLayoutConstraint?

    // MARK: - Initialization

    /// Creates a snackbar with a theme.
    ///
    /// - Parameter theme: The theme to apply to the snackbar.
    ///
    /// ## Example of usage
    ///
    /// ### Basic Snackbar with Title and Message
    ///
    /// ```swift
    /// let snackbar = SparkUISnackbar(theme: theme)
    /// snackbar.title = "Upload complete"
    /// snackbar.message = "Your file has been uploaded successfully"
    /// snackbar.intent = .success
    /// view.addSubview(snackbar)
    /// ```
    ///
    /// ### Snackbar with Icon
    ///
    /// ```swift
    /// let snackbar = SparkUISnackbar(theme: theme)
    /// snackbar.icon = UIImage(systemName: "wifi.slash")
    /// snackbar.title = "Connection lost"
    /// snackbar.message = "Unable to reach the server"
    /// snackbar.intent = .error
    /// view.addSubview(snackbar)
    /// ```
    ///
    /// ### Snackbar with Action Button
    ///
    /// ```swift
    /// let snackbar = SparkUISnackbar(theme: theme)
    /// snackbar.icon = UIImage(systemName: "trash")
    /// snackbar.title = "Item deleted"
    /// snackbar.message = "The item has been removed"
    /// snackbar.intent = .alert
    ///
    /// let button = SparkUIButton(theme: theme)
    /// button.setTitle("Undo", for: .normal)
    /// button.variant = .ghost
    /// button.addAction(UIAction { _ in
    ///     // Undo action
    /// }, for: .touchUpInside)
    /// snackbar.button = button
    ///
    /// view.addSubview(snackbar)
    /// ```
    ///
    /// ## Rendering
    ///
    /// ### Title
    ///
    /// ![Snackbar rendering.](snackbar_full.png)
    ///
    public init(theme: any Theme) {
        self.theme = theme

        self._iconSize = .init(
            wrappedValue: SnackbarConstants.iconSize,
            relativeTo: .title3
        )

        super.init(frame: .zero)

        self.setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup

    private func setupView() {
        // View Properties
        self.accessibilityIdentifier = SnackbarAccessibilityIdentifier.view

            // Add subviews
        self.addSubview(self.contentStackView)

        // Update UI
        self.updateAlignment()
        self.updateButton()
        self.updateLayout()
        self.updateSize()

        // Setup constraints
        self.setupConstraints()

        // Setup subscriptions
        self.setupSubscriptions()

        // Setup view model
        self.viewModel.setup(
            theme: self.theme,
            intent: self.intent
        )
    }

    // MARK: - Layout

    public override func layoutSubviews() {
        super.layoutSubviews()

        self.updateLayer()
    }

    // MARK: - Constraints

    private func setupConstraints() {
        self.translatesAutoresizingMaskIntoConstraints = false

        self.setupContentStackViewContraints()
        self.setupIconViewContraints()
    }

    private func setupContentStackViewContraints() {
        self.contentStackView.translatesAutoresizingMaskIntoConstraints = false

        self.contentStackViewLeadingConstraint = self.contentStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        self.contentStackViewTopConstraint = self.contentStackView.topAnchor.constraint(equalTo: self.topAnchor)
        let contentStackViewCenterXAnchor = self.contentStackView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        self.contentStackViewTrailingConstraint = self.contentStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor)

        NSLayoutConstraint.activate([
            self.contentStackViewLeadingConstraint,
            self.contentStackViewTopConstraint,
            contentStackViewCenterXAnchor,
            self.contentStackViewTrailingConstraint,
        ].compactMap { $0 })
    }

    private func setupIconViewContraints() {
        self.iconImageView.translatesAutoresizingMaskIntoConstraints = false

        self.iconWidthConstraint = self.iconImageView.widthAnchor.constraint(equalToConstant: self.iconSize)
        self.iconWidthConstraint?.isActive = false

        self.iconImageView.heightAnchor.constraint(equalTo: self.iconImageView.widthAnchor).isActive = true
    }

    // MARK: - Update UI

    private func updateAlignment() {
        switch self.alignment {
        case .horizontal:
            self.contentStackView.regularAxis = .horizontal
            self.contentStackView.regularAlignment = .center
        case .vertical:
            self.contentStackView.regularAxis = .vertical
            self.contentStackView.regularAlignment = .fill
        }
    }

    private func updateButton() {
        // Remove old button if exists
        let views = self.buttonContentStackView.subviews.filter { $0 is SparkUIButton }
        self.buttonContentStackView.removeArrangedSubviews(views)

        // Add new button if it exists
        if let button {
            self.buttonContentStackView.addArrangedSubview(button)
        }

        self.buttonContentStackView.isHidden = self.button == nil
    }

    private func updateLayer(colors: SnackbarColors? = nil) {
        let colors = colors ?? self.viewModel.colors

        self.sparkBorderRadius(
            width: self.borderWidth,
            radius: self.borderRadius,
            colorToken: colors.borderColorToken
        )

        self.applyShadow(
            self.theme.elevation.dropShadow
        )
    }

    private func updateColors(_ colors: SnackbarColors) {
        self.backgroundColor(colors.backgroundColorToken)
        self.iconImageView.tintColor(colors.tintColorToken)
        self.titleLabel.textColor(colors.tintColorToken)
        self.messageLabel.textColor(colors.tintColorToken)
    }

    private func updateLayout() {
        // Content Stack Constraints
        self.contentStackViewLeadingConstraint?.constant = self.leadingPadding
        self.contentStackViewTopConstraint?.constant = self.verticalPadding
        self.contentStackViewTrailingConstraint?.constant = -self.trailingPadding

        // Content Stack Spacings
        switch self.alignment {
        case .horizontal:
            self.contentStackView.regularSpacing = self.horizontalSpacing
            self.contentStackView.accessibilitySpacing = self.verticalSpacing

        case .vertical:
            self.contentStackView.regularSpacing = self.verticalSpacing
            self.contentStackView.accessibilitySpacing = self.verticalSpacing
        }

        // Other Stacks Spacings
        self.mainContentStackView.spacing = self.horizontalSpacing
        self.secondaryContentStackView.spacing = self.verticalSubSpacing
    }

    private func updateShadow() {
        self.applyShadow(self.theme.elevation.dropShadow)
    }

    private func updateSize() {
        self.iconWidthConstraint?.constant = self.iconSize
        self.iconWidthConstraint?.isActive = true

        self.setNeedsUpdateConstraints()
    }

    // MARK: - Subscribe

    private func setupSubscriptions() {
        // Border changes
        self.viewModel.$border
            .removeDuplicates()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] border in
                guard let self else {
                    return
                }

                self._borderWidth = .init(
                    wrappedValue: border.width,
                    traitCollection: self.traitCollection
                )
                self._borderRadius = .init(
                    wrappedValue: border.radius,
                    traitCollection: self.traitCollection
                )

                self.updateLayer()
            }
            .store(in: &self.subscriptions)

        // Colors changes
        self.viewModel.$colors
            .removeDuplicates()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] colors in
                self?.updateColors(colors)
                self?.updateLayer(colors: colors)
            }
            .store(in: &self.subscriptions)

        // Intents changes
        self.viewModel.$intents
            .removeDuplicates()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] intents in
                self?.button?.intent = intents.button
            }
            .store(in: &self.subscriptions)

        // Layout changes
        self.viewModel.$layout
            .removeDuplicates()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] layout in
                guard let self else {
                    return
                }

                self._leadingPadding = .init(
                    wrappedValue: layout.leadingPadding,
                    traitCollection: self.traitCollection
                )
                self._trailingPadding = .init(
                    wrappedValue: layout.trailingPadding,
                    traitCollection: self.traitCollection
                )
                self._horizontalSpacing = .init(
                    wrappedValue: layout.horizontalSpacing,
                    traitCollection: self.traitCollection
                )
                self._verticalPadding = .init(
                    wrappedValue: layout.verticalPadding,
                    traitCollection: self.traitCollection
                )
                self._verticalSpacing = .init(
                    wrappedValue: layout.verticalSpacing,
                    traitCollection: self.traitCollection
                )
                self._verticalSubSpacing = .init(
                    wrappedValue: layout.verticalSubSpacing,
                    traitCollection: self.traitCollection
                )

                self.updateLayout()
            }
            .store(in: &self.subscriptions)

        // Typographies changes
        self.viewModel.$typographies
            .removeDuplicates()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] typographies in
                guard let self else {
                    return
                }

                self.titleLabel.font(typographies.titleFontToken)
                self.messageLabel.font(typographies.descriptionFontToken)
            }
            .store(in: &self.subscriptions)
    }

    // MARK: - Trait Collection

    public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)

        // Sizes
        self._iconSize.update(traitCollection: self.traitCollection)
        self.updateSize()

        // Corner
        self._borderRadius.update(traitCollection: self.traitCollection)
        self._borderWidth.update(traitCollection: self.traitCollection)
        self.updateLayer()

        // Layout
        self._leadingPadding.update(traitCollection: self.traitCollection)
        self._trailingPadding.update(traitCollection: self.traitCollection)
        self._horizontalSpacing.update(traitCollection: self.traitCollection)
        self._verticalPadding.update(traitCollection: self.traitCollection)
        self._verticalSpacing.update(traitCollection: self.traitCollection)
        self._verticalSubSpacing.update(traitCollection: self.traitCollection)
        self.updateLayout()
    }
}
