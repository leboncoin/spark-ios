//
//  SnackbarUIView.swift
//  SparkComponentSnackbar
//
//  Created by louis.borlee on 04/09/2024.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import UIKit
import Combine
import SparkTheming
import SparkComponentButton
@_spi(SI_SPI) import SparkCommon

/// The UIKit version of the snacbkar.
@available(*, deprecated, message: "Replaced by SparkUISnackbar")
public final class SnackbarUIView: UIView {

    /// The spark theme of the snackbar.
    public var theme: any Theme {
        get {
            return self.viewModel.theme
        }
        set {
            self.viewModel.theme = newValue
        }
    }

    /// The intent of the snackbar.
    public var intent: SnackbarIntent {
        get {
            return self.viewModel.intent
        }
        set {
            self.viewModel.intent = newValue
        }
    }

    /// The type of the snackbar.
    public var type: SnackbarType = .vertical {
        didSet {
            guard self.type != oldValue else { return }
            self.setNeedsLayout()
        }
    }

    /// The variant of the snackbar.
    public var variant: SnackbarVariant {
        get {
            return self.viewModel.variant
        } set {
            self.viewModel.variant = newValue
        }
    }

    public private(set) var imageView: UIImageView?

    public let label = UILabel()
    public private(set) var buttonView: ButtonUIView?

    @ScaledUIBorderRadius private var cornerRadius: CGFloat = 0
    @ScaledUIBorderWidth private var borderWidth: CGFloat = 0

    private var buttonContainer: UIView?
    private var imageContainer: UIView?
    private let labelContainer = UIView()

    private let horizontalStackView = UIStackView()
    private let verticalStackView = UIStackView()

    private let viewModel: SnackbarViewModelDeprecated
    private var cancellables = Set<AnyCancellable>()

    private var imageViewWidthConstraint = NSLayoutConstraint()
    private var labelTrailingAnchorConstraint = NSLayoutConstraint()

    private var presentationTransformation = CGAffineTransform.identity
    private var presentationVerticalConstraint = NSLayoutConstraint()
    private var autoDismissWorkItem: DispatchWorkItem?
    private var dismissCompletion: ((Bool) -> Void)?

    private var presentationDuration: CGFloat {
        UIAccessibility.isReduceMotionEnabled ? .zero : SnackbarConstants.presentationDuration
    }

    /// Initialize a new snackbar view.
    /// - Parameters:
    ///   - theme: The spark theme of the snackbar.
    ///   - intent: The intent of the snackbar.
    public init(
        theme: any Theme,
        intent: SnackbarIntent
    ) {
        self.viewModel = .init(
            theme: theme,
            variant: .filled,
            intent: intent
        )

        super.init(frame: .zero)
        self.setupView()
        self.setupVerticalStackViewLayout()
        self.setupAdvancedLayout()
        self.setupSubscriptions()
        self.setupAccessibility()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup View
    private func setupView() {
        self.setupLabel()
        self.setupHorizontalStackView()
        self.setupVerticalStackView()

        self.layer.cornerRadius = self.cornerRadius

        self.addSubview(self.verticalStackView)

        self.applyShadow(self.theme.elevation.dropShadow)

        self.horizontalStackView.addArrangedSubviews(self.getHorizontalContent())
        self.verticalStackView.addArrangedSubviews(self.getVerticalContent())
    }

    private func setupVerticalStackView() {
        self.verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        self.verticalStackView.axis = .vertical
        self.verticalStackView.addArrangedSubview(self.horizontalStackView)
    }

    private func setupHorizontalStackView() {
        self.horizontalStackView.spacing = self.theme.layout.spacing.medium
        self.horizontalStackView.alignment = .center
        self.horizontalStackView.axis = .horizontal
    }

    private func setupLabel() {
        self.label.numberOfLines = 0
        self.label.textColor = self.viewModel.colors.tintColorToken.uiColor
        self.label.font = self.viewModel.textFont.uiFont
        self.label.adjustsFontForContentSizeCategory = true
        self.label.setContentCompressionResistancePriority(.required, for: .vertical)
        self.label.translatesAutoresizingMaskIntoConstraints = false
        self.labelContainer.addSubview(self.label)

        self.labelTrailingAnchorConstraint = self.label.trailingAnchor.constraint(equalTo: self.labelContainer.trailingAnchor)
        self.labelTrailingAnchorConstraint.priority = .required - 1

        NSLayoutConstraint.activate([
            self.label.leadingAnchor.constraint(equalTo: self.labelContainer.leadingAnchor),
            self.label.topAnchor.constraint(greaterThanOrEqualTo: self.labelContainer.topAnchor),
            self.label.centerYAnchor.constraint(equalTo: self.labelContainer.centerYAnchor),
            self.labelTrailingAnchorConstraint
        ])
    }

    // MARK: - Setup Layout
    private func setupVerticalStackViewLayout() {
        NSLayoutConstraint.activate([
            self.verticalStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.theme.layout.spacing.large),
            self.verticalStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -self.theme.layout.spacing.medium),
            self.verticalStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: self.theme.layout.spacing.medium),
            self.verticalStackView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ])
    }

    private func setupAdvancedLayout() {
        // Image
        if let imageView {
            self.addMinimumTopSpacing(self.theme.layout.spacing.small, to: imageView)
        }

        // Label
        self.addMinimumTopSpacing(self.theme.layout.spacing.large, to: self.label)
        self.updateLabelTrailingConstraint()

        // Button
        if let buttonView {
            self.addMinimumTopSpacing(self.theme.layout.spacing.small, to: buttonView)
        }
    }

    private func addMinimumTopSpacing(_ constant: CGFloat, to view: UIView) {
        let topAnchorConstraint = view.topAnchor.constraint(
            greaterThanOrEqualTo: self.topAnchor,
            constant: constant
        )
        topAnchorConstraint.priority = .required - 1
        topAnchorConstraint.isActive = true
    }

    /// Label trailing space management.
    /// Spacing will be `0` if `button` exists and is in the `horizontalStackView`.
    /// Spacing will be `(spacing.large - spacing.medium)` otherwise to be further away from the borders.
    private func updateLabelTrailingConstraint() {
        var trailingConstant = -(self.theme.layout.spacing.large - self.theme.layout.spacing.medium)
        if let buttonView, buttonView.isDescendant(of: self.horizontalStackView) {
            trailingConstant = 0
        }
        self.labelTrailingAnchorConstraint.constant = trailingConstant
    }

    // MARK: - Setup Subscriptions
    private func setupSubscriptions() {
        self.viewModel.$colors.removeDuplicates().subscribe(in: &self.cancellables) { [weak self] colors in
            guard let self else { return }
            self.backgroundColor = colors.backgroundColorToken.uiColor
            self.label.textColor = colors.tintColorToken.uiColor
            self.imageView?.tintColor = colors.tintColorToken.uiColor
            self.updateBorder(colors: colors)
        }

        self.viewModel.$border.removeDuplicates().subscribe(in: &self.cancellables) { [weak self] border in
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

        self.viewModel.$buttonIntent.removeDuplicates().subscribe(in: &self.cancellables) { [weak self] buttonIntent in
            guard let self else { return }
            self.buttonView?.intent = buttonIntent
        }
        self.viewModel.$buttonVariant.removeDuplicates().subscribe(in: &self.cancellables) { [weak self] buttonVariant in
            guard let self else { return }
            self.buttonView?.variant = buttonVariant
        }
    }

    // MARK: - Setup accessibility
    private func setupAccessibility() {
        self.accessibilityIdentifier = SnackbarAccessibilityIdentifier.view
        self.accessibilityContainerType = .semanticGroup
        self.setupLabelAccessibility()
    }

    private func setupLabelAccessibility() {
        self.label.accessibilityIdentifier = SnackbarAccessibilityIdentifier.label
    }

    private func setupButtonAccessibility(_ button: ButtonUIView) {
        button.accessibilityIdentifier = SnackbarAccessibilityIdentifier.button
    }

    // MARK: - Reload
    public override func layoutSubviews() {
        if self.shouldReloadStackViews() {
            self.horizontalStackView.removeArrangedSubviews()
            self.verticalStackView.removeArrangedSubviews()
            self.horizontalStackView.addArrangedSubviews(self.getHorizontalContent())
            self.verticalStackView.addArrangedSubviews(self.getVerticalContent())
            self.setupAdvancedLayout()
        }

        super.layoutSubviews()

        self.updateBorder()
    }

    private func updateBorder(colors: SnackbarColors? = nil) {
        let colors = colors ?? self.viewModel.colors

        self.sparkBorderRadius(
            width: self.borderWidth,
            radius: self.cornerRadius,
            colorToken: colors.borderColorToken
        )
    }

    private func shouldReloadStackViews() -> Bool {
        return self.horizontalStackView.arrangedSubviews != self.getHorizontalContent() ||
        self.verticalStackView.arrangedSubviews != self.getVerticalContent()
    }

    private func getHorizontalContent() -> [UIView] {
        return [
            self.imageContainer,
            self.labelContainer,
            self.type == .horizontal ? self.buttonContainer : nil,
        ].compactMap { $0 }
    }

    private func getVerticalContent() -> [UIView] {
        return [
            self.horizontalStackView,
            self.type == .vertical ? self.buttonContainer : nil
        ].compactMap { $0 }
    }

    // MARK: - Set Image
    /// Creates or removes the snackbar `imageView`.
    /// - Parameter image: The image to add in the `imageView`. If nil, `imageView` will become nil.
    public func setImage(_ image: UIImage?) {
        if let image {
            if self.imageContainer == nil {
                let imageView = UIImageView(frame: .init(origin: .zero, size: .init(width: SnackbarConstants.iconSize, height: SnackbarConstants.iconSize)))
                imageView.image = image
                self.addImageView(imageView)
                self.setNeedsLayout()
            } else {
                self.imageView?.image = image
            }
        } else {
            self.imageContainer = nil
            self.imageView = nil
            self.setNeedsLayout()
        }
    }

    private func addImageView(_ imageView: UIImageView) {
        imageView.tintColor = self.viewModel.colors.tintColorToken.uiColor
        imageView.translatesAutoresizingMaskIntoConstraints = false

        let imageContainer = UIView()
        imageContainer.addSubview(imageView)

        let leadingAnchorConstraint = imageView.leadingAnchor.constraint(equalTo: imageContainer.leadingAnchor)
        let topAnchorConstraint = imageView.topAnchor.constraint(greaterThanOrEqualTo: imageContainer.topAnchor)
        leadingAnchorConstraint.priority = .required - 1
        topAnchorConstraint.priority = .required - 1

        NSLayoutConstraint.activate([
            imageView.centerYAnchor.constraint(equalTo: imageContainer.centerYAnchor),
            imageView.centerXAnchor.constraint(equalTo: imageContainer.centerXAnchor),
            leadingAnchorConstraint,
            topAnchorConstraint,
            imageView.widthAnchor.constraint(equalToConstant: SnackbarConstants.iconSize),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor)
        ])

        self.imageView = imageView
        self.imageContainer = imageContainer
    }

    // MARK: - Set Button
    @discardableResult
    /// Adds a ButtonUIView to the snackbar (if it doesn't already exist).
    /// This button can be accessed using the snackbar's public property `.button`.
    /// - Returns: the snackbar's button.
    public func addButton() -> ButtonUIView {
        if let buttonView {
            return buttonView
        }
        let button = ButtonUIView(
            theme: self.theme,
            intent: self.viewModel.buttonIntent,
            variant: self.viewModel.buttonVariant,
            size: SnackbarConstants.buttonSize,
            shape: SnackbarConstants.buttonShape,
            alignment: .leadingImage
        )
        button.titleLabel.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        self.setupButtonAccessibility(button)
        let buttonContainer = UIView()
        buttonContainer.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false

        let trailingAnchorConstraint = button.trailingAnchor.constraint(equalTo: buttonContainer.trailingAnchor)
        let topAnchorConstraint = button.topAnchor.constraint(equalTo: buttonContainer.topAnchor)
        topAnchorConstraint.priority = .required - 1
        trailingAnchorConstraint.priority = .required - 1

        NSLayoutConstraint.activate([
            topAnchorConstraint,
            button.centerYAnchor.constraint(equalTo: buttonContainer.centerYAnchor),
            trailingAnchorConstraint,
            button.leadingAnchor.constraint(greaterThanOrEqualTo: buttonContainer.leadingAnchor)
        ])

        self.buttonContainer = buttonContainer
        self.buttonView = button
        self.setNeedsLayout()
        return button
    }

    /// Removes the snackbar's button.
    public func removeButton() {
        self.buttonView = nil
        self.buttonContainer = nil
        self.setNeedsLayout()
    }

    // MARK: - Trait Collection
    public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        if self.traitCollection.hasDifferentSizeCategory(comparedTo: previousTraitCollection) {
            self.layer.cornerRadius = self.cornerRadius
        }
        if self.traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection) {
            self.applyShadow(self.theme.elevation.dropShadow)
        }

        // Corner
        self._cornerRadius.update(traitCollection: self.traitCollection)
        self._borderWidth.update(traitCollection: self.traitCollection)
        self.updateBorder()
    }

    // MARK: - Presentation
    /// This method displays the Snackbar in a specified view.
    /// - Parameters:
    ///   - view: The UIView in which to display the Snackbar.
    ///   - direction: The SnackbarPresentationDirection (top or bottom) from which the Snackbar appears.
    ///   - animated: Boolean to determine if the presentation should be animated. Default is ``true``.
    ///   - insets: UIEdgeInsets to apply additional spacing around the Snackbar. Default is ``.zero``.
    ///   - useSafeAreaLayoutGuide: Boolean to determine if the Snackbar should respect the safe area. Default is ``false``.
    public func show(
        in view: UIView,
        from direction: SnackbarPresentationDirection,
        animated: Bool = true,
        insets: UIEdgeInsets = .zero,
        useSafeAreaLayoutGuide: Bool = false
    ) {
        self.autoDismissWorkItem?.cancel()
        self.removeFromSuperview()
        view.addSubview(self)

        let defaultSpacing = self.theme.layout.spacing.large

        self.setupConstraints(
            in: view,
            from: direction,
            insets: insets,
            useSafeAreaLayoutGuide: useSafeAreaLayoutGuide,
            defaultSpacing: defaultSpacing
        )

        self.setNeedsLayout()
        self.layoutIfNeeded()

        self.startPresentation(direction: direction)
    }

    /// This method displays the Snackbar and automatically dismisses it after a specified delay.
    /// - Parameters:
    ///   - view: The UIView in which to display the Snackbar.
    ///   - direction: The SnackbarPresentationDirection (top or bottom) from which the Snackbar appears.
    ///   - animated: Boolean to determine if the presentation should be animated. Default is ``true``.
    ///   - insets: UIEdgeInsets to apply additional spacing around the Snackbar. Default is ``.zero``.
    ///   - useSafeAreaLayoutGuide: Boolean to determine if the Snackbar should respect the safe area. Default is ``false``.
    ///   - autoDismissDelay: A SnackbarAutoDismissDelay value determining how long the Snackbar should be displayed before auto-dismissing. Default is ``.fast``.
    ///   - dismissCompletion: An optional closure to be called when the Snackbar is dismissed.
    public func showAndDismiss(
        in view: UIView,
        from direction: SnackbarPresentationDirection,
        animated: Bool = true,
        insets: UIEdgeInsets = .zero,
        useSafeAreaLayoutGuide: Bool = false,
        autoDismissDelay: SnackbarAutoDismissDelay = .fast,
        dismissCompletion: ((Bool) -> Void)? = nil
    ) {
        self.show(
            in: view,
            from: direction,
            animated: animated,
            insets: insets,
            useSafeAreaLayoutGuide: useSafeAreaLayoutGuide
        )

        self.queueDismiss(
            delay: autoDismissDelay.seconds,
            completion: dismissCompletion
        )
    }

    private func setupConstraints(
        in view: UIView,
        from direction: SnackbarPresentationDirection,
        insets: UIEdgeInsets,
        useSafeAreaLayoutGuide: Bool,
        defaultSpacing: CGFloat
    ) {
        self.translatesAutoresizingMaskIntoConstraints = false

        let leadingConstraint = self.leadingAnchor.constraint(
            equalTo: useSafeAreaLayoutGuide ? view.safeAreaLayoutGuide.leadingAnchor : view.leadingAnchor,
            constant: defaultSpacing + insets.left
        )
        leadingConstraint.priority = .required - 1
        let trailingConstraint = self.trailingAnchor.constraint(
            equalTo: useSafeAreaLayoutGuide ? view.safeAreaLayoutGuide.trailingAnchor : view.trailingAnchor,
            constant: -defaultSpacing + insets.right
        )
        trailingConstraint.priority = .required - 1

        let centerXConstraint = self.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        centerXConstraint.priority = .defaultHigh

        let topConstraint: NSLayoutConstraint
        let bottomConstraint: NSLayoutConstraint
        switch direction {
        case .top:
            topConstraint = self.topAnchor.constraint(
                equalTo: useSafeAreaLayoutGuide ? view.safeAreaLayoutGuide.topAnchor : view.topAnchor,
                constant: defaultSpacing + insets.top
            )
            bottomConstraint = self.bottomAnchor.constraint(
                lessThanOrEqualTo: useSafeAreaLayoutGuide ? view.safeAreaLayoutGuide.bottomAnchor : view.bottomAnchor,
                constant: -defaultSpacing + insets.bottom
            )
            self.presentationVerticalConstraint = topConstraint
        case .bottom:
            topConstraint = self.topAnchor.constraint(
                greaterThanOrEqualTo: useSafeAreaLayoutGuide ? view.safeAreaLayoutGuide.topAnchor : view.topAnchor,
                constant: defaultSpacing + insets.top
            )
            bottomConstraint = self.bottomAnchor.constraint(
                equalTo: useSafeAreaLayoutGuide ? view.safeAreaLayoutGuide.bottomAnchor : view.bottomAnchor,
                constant: -defaultSpacing + insets.bottom
            )
            self.presentationVerticalConstraint = bottomConstraint
        }

        NSLayoutConstraint.activate([
            leadingConstraint,
            trailingConstraint,
            topConstraint,
            bottomConstraint,
            centerXConstraint
        ])
    }

    private func startPresentation(direction: SnackbarPresentationDirection) {
        let yTranslation = switch direction {
        case .top: -self.presentationVerticalConstraint.constant - self.frame.height
        case .bottom: -self.presentationVerticalConstraint.constant + self.frame.height
        }
        self.alpha = 0
        self.presentationTransformation = .init(translationX: 0, y: yTranslation)
        self.transform = self.presentationTransformation

        UIView.animate(
            withDuration: presentationDuration,
            delay: .zero,
            options: [.curveEaseOut],
            animations: {
                self.alpha = 1
                self.transform = .identity
            },
            completion: nil
        )
    }

    private func queueDismiss(delay: Double, completion: ((Bool) -> Void)?) {
        self.autoDismissWorkItem?.cancel()
        let workItem = DispatchWorkItem { [weak self] in
            self?.dismiss(completion: completion)
        }
        self.autoDismissWorkItem = workItem
        let deadline: DispatchTime = .now() + self.presentationDuration + delay
        DispatchQueue.main.asyncAfter(deadline: deadline, execute: workItem)
    }

    /// This method dismisses the Snackbar.
    /// - Parameter completion: An optional closure to be called when the dismissal animation is complete.
    public func dismiss(completion: ((Bool) -> Void)?) {
        self.autoDismissWorkItem?.cancel()
        UIView.animate(
            withDuration: self.presentationDuration,
            delay: .zero,
            options: [.curveEaseIn],
            animations: {
                self.transform = self.presentationTransformation
                self.alpha = 0
            },
            completion: { [weak self] isFinished in
                guard let self else { return }
                self.removeFromSuperview()
                completion?(isFinished)
            }
        )
    }

    /// This method cancels any scheduled auto-dismissal of the Snackbar.
    public func cancelAutoDismiss() {
        self.autoDismissWorkItem?.cancel()
    }
}
