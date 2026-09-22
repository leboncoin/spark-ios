//
//  SparkUICheckbox.swift
//  SparkComponentSelectionControls
//
//  Created by robin.lemaire on 09/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import UIKit
import Combine
import SwiftUI
import SparkResources
@_spi(SI_SPI) import SparkCommon
import SparkTheming

/// A Spark control that checkbox between selected, indeterminate and unselected states.
///
/// This component inherits from **UIControl**.
///
/// Initialization :
/// ```swift
/// let theme: SparkTheming.Theme = MyTheme()
///
/// let myCheckbox = SparkUICheckbox(theme: theme)
/// ```
///
/// Checkbox when selectionState is **selected** or isSelected is **true**:
/// ![Checkbox rendering.](checkbox_selected.png)
///
/// Checkbox when selectionState is **unselected** or isSelected is **false**:
/// ![Checkbox rendering.](checkbox_unselected.png)
///
/// Checkbox when selectionState is **indeterminate**:
/// ![Checkbox rendering.](checkbox_indeterminate.png)
///
/// To add a text, you must provide a **text** or a **attributedText**:
/// ```swift
/// let theme: SparkTheming.Theme = MyTheme()
///
/// let myCheckbox = SparkUICheckbox(theme: theme)
/// myCheckbox.text = "My checkbox"
/// ```
/// *Note*: Please **do not set a text/attributedText** on the ``textLabel`` but use the ``text`` and
/// ``attributedText`` directly on the ``SparkUICheckbox``.
/// ![Checkbox rendering with a text.](checkbox_with_title.png)
///
/// ![Checkbox rendering with a multiline text.](checkbox_with_mutliline.png)
public final class SparkUICheckbox: UIControl {

    // MARK: - Type alias

    private typealias AccessibilityIdentifier = CheckboxAccessibilityIdentifier
    private typealias Constants = CheckboxConstants

    // MARK: - Components

    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView(
            arrangedSubviews: [
                self.toggleContentView,
                self.textLabel
            ]
        )
        stackView.axis = .horizontal
        stackView.isBaselineRelativeArrangement = true

        return stackView
    }()

    // This view (and the label subview) is needed to align
    // the button to the first line of the textLabel. (required when accessibility
    // dynamic type is enabled)
    private lazy var toggleContentView: UIView = {
        let view = UIView()
        view.addSubview(self.toggleHiddenLabel)
        view.addSubview(self.toggleView)
        return view
    }()

    private lazy var toggleHiddenLabel: UILabel = {
        let label = UILabel()
        label.adjustsFontForContentSizeCategory = self.textLabel.adjustsFontForContentSizeCategory
        label.isHidden = true
        return label
    }()

    private lazy var toggleView: UIView = {
        let view = UIView()
        view.accessibilityIdentifier = AccessibilityIdentifier.toggleView
        view.addSubview(self.toggleImageView)
        view.setContentCompressionResistancePriority(
            .required,
            for: .vertical
        )
        view.setContentCompressionResistancePriority(
            .required,
            for: .horizontal
        )
        view.isAccessibilityElement = true
        return view
    }()

    private var toggleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    /// The UILabel used to display the checkbox text.
    ///
    /// Please **do not set a text/attributedText** in this label but use
    /// the ``text`` and ``attributedText`` directly on the ``SparkUICheckbox``.
    public private(set) var textLabel: UILabel = {
        let label = UILabel()
        label.applyStyle()
        label.accessibilityIdentifier = AccessibilityIdentifier.text
        return label
    }()

    // MARK: - Public Properties

    private let selectionStateSubject = PassthroughSubject<CheckboxSelectionState, Never>()
    /// The publisher used to notify when selectionState value changed on checkbox.
    public private(set) lazy var selectionStatePublisher: AnyPublisher<CheckboxSelectionState, Never> = self.selectionStateSubject.eraseToAnyPublisher()

    private let isSelectedChangedSubject = PassthroughSubject<Bool, Never>()
    /// The publisher used to notify when isSelected value changed on checkbox.
    public private(set) lazy var isSelectedChangedPublisher: AnyPublisher<Bool, Never> = self.isSelectedChangedSubject.eraseToAnyPublisher()

    /// The spark theme of the checkbox.
    public var theme: any Theme {
        get {
            return self.viewModel.theme
        }
        set {
            self.viewModel.theme = newValue
        }
    }

    /// The intent of the checkbox.
    public var intent: CheckboxIntent {
        get {
            return self.viewModel.intent
        }
        set {
            self.viewModel.intent = newValue
        }
    }

    /// The text of the checkbox.
    public var text: String? {
        get {
            return self.textLabel.text
        }
        set {
            self.textLabel.text(newValue)
            self.toggleHiddenLabel.text = newValue
            self.contentStackView.alignment(textInArrangedSubviews: newValue)
            self.invalidateIntrinsicContentSize()

            self.accessibilityLabel = newValue
        }
    }

    /// The attributed text of the checkbox.
    public var attributedText: NSAttributedString? {
        get {
            return self.textLabel.attributedText
        }
        set {
            self.textLabel.attributedText(newValue)
            self.toggleHiddenLabel.attributedText = newValue
            self.contentStackView.alignment(attributedTextInArrangedSubviews: newValue)
            self.invalidateIntrinsicContentSize()

            self.accessibilityLabel = newValue?.string
        }
    }

    /// The current selection state of the checkbox.
    ///
    /// Note: If you don't need to have an **indeterminate** state,
    /// you must use the ``isSelected`` property.
    ///
    /// Checkbox when selectionState is **selected**:
    /// ![Checkbox rendering.](checkbox_selected.png)
    ///
    /// Checkbox when selectionState is **unselected**:
    /// ![Checkbox rendering.](checkbox_unselected.png)
    ///
    /// Checkbox when selectionState is **indeterminate**:
    /// ![Checkbox rendering.](checkbox_indeterminate.png)
    public var selectionState: CheckboxSelectionState {
        get {
            return self.viewModel.selectedValue
        }
        set {
            self.viewModel.setSelectedValue(newValue)
            self.updateAccessibilityValue()
        }
    }

    /// The value of the checkbox (retrieve and set without animation).
    ///
    /// Checkbox when isSelected is **selected** :
    /// ![Checkbox rendering.](checkbox_selected.png) 
    ///
    /// Checkbox when isSelected is **unselected**:
    /// ![Checkbox rendering.](checkbox_unselected.png)
    public override var isSelected: Bool {
        get {
            return self.selectionState == .selected
        }
        set {
            self.selectionState = newValue ? .selected : .unselected
        }
    }

    /// The state of the checkbox: enabled or not.
    /// ![Checkbox rendering with when it's disabled.](checkbox_disabled.png)
    public override var isEnabled: Bool {
        get {
            return self.viewModel.isEnabled
        }
        set {
            self.viewModel.isEnabled = newValue
            self.updateAccessibilityEnabledTrait()
        }
    }

    /// A localized string that describes the checkbox.
    public override var accessibilityLabel: String? {
        get {
            return self.toggleView.accessibilityLabel
        }
        set {
            self.toggleView.accessibilityLabel = newValue
        }
    }

    // MARK: - Internal Properties

    /// The identifier of the checkbox. Used by the ``SparkUICheckboxGroup``. *Optional*.
    internal var id: String?

    // MARK: - Private Properties

    private let viewModel: CheckboxUIViewModel

    private var toggleWidthConstraint: NSLayoutConstraint?

    private var toggleSelectedDotWidthConstraint: NSLayoutConstraint?

    private var toggleImageLeadingConstraint: NSLayoutConstraint?
    private var toggleImageTopConstraint: NSLayoutConstraint?

    @LimitedScaledUIMetric private var toggleWidth: CGFloat
    @LimitedScaledUIMetric private var toggleBorderWidth: CGFloat
    @LimitedScaledUIMetric private var toggleCornerRadius: CGFloat = 0
    @LimitedScaledUIMetric private var toggleIconPadding: CGFloat

    private let selectedIcon: UIImage = UIImage(spark: \.check)
    private let indeterminateIcon: UIImage? = UIImage(spark: \.minus)

    private var isReduceMotionEnabled: Bool {
        UIAccessibility.isReduceMotionEnabled
    }

    private var hoverToggleLayer: CAShapeLayer?

    private var subscriptions = Set<AnyCancellable>()

    // MARK: - Initialization

    /// Creates a Spark checkbox.
    ///
    /// Note : You must provide an *accessibilityLabel* !
    ///
    /// - Parameters:
    ///   - theme: The current theme.
    ///
    /// Implementation example :
    /// ```swift
    /// let theme: SparkTheming.Theme = MyTheme()
    ///
    /// let myCheckbox = SparkUICheckbox(
    ///     theme: theme
    /// )
    /// ```
    ///
    /// ![Checkbox rendering.](checkbox_unselected.png)
    public init(theme: any Theme) {
        self.viewModel = .init(
            theme: theme
        )

        self._toggleWidth = .init(wrappedValue: Constants.size)
        self._toggleBorderWidth = .init(wrappedValue: Constants.lineWidth)
        self._toggleIconPadding = .init(wrappedValue: Constants.iconPadding)

        super.init(frame: .zero)

        // Setup
        self.setupView()
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    deinit {
        // Remove notifications
        NotificationCenter.default.removeObserver(
            self,
            name: UIAccessibility.reduceMotionStatusDidChangeNotification,
            object: nil
        )
    }

    // MARK: - Layout

    public override func layoutSubviews() {
        super.layoutSubviews()

        self.updateToggleBorderRadius()
    }

    // MARK: - View setup

    private func setupView() {
        // Add subview
        self.addSubview(self.contentStackView)

        // Setup gestures
        self.setupGesturesRecognizer()

        // Setup constraints
        self.setupConstraints()

        // Setup publisher subcriptions
        self.setupSubscriptions()

        // Setup Notification
        self.setupNotifications()

        // Setup Accessibility
        self.setupAccessibility()

        // Updates
        self.updateToggleViewSize()

        // Load view model
        self.viewModel.load(
            isReduceMotionEnabled: self.isReduceMotionEnabled
        )
    }

    // MARK: - Gesture

    private func setupGesturesRecognizer() {
        let gestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(self.buttonLongGestureAction))
        gestureRecognizer.minimumPressDuration = 0
        self.addGestureRecognizer(gestureRecognizer)
    }

    // MARK: - Constraints

    private func setupConstraints() {
        // Global
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setupContentStackViewConstraints()

        // Checkbox View and subviews
        self.setupContentStackViewConstraints()
        self.setupToggleContentViewConstraints()
        self.setupToggleHiddenLabelConstraints()
        self.setupToggleViewConstraints()
        self.setupToggleImageViewConstraints()
        self.setupTextLabelConstraints()

        // Text Label
        self.setupTextLabelConstraints()
    }

    private func setupContentStackViewConstraints() {
        self.contentStackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.stickEdges(
            from: self.contentStackView,
            to: self
        )
    }

    private func setupToggleContentViewConstraints() {
        self.toggleContentView.translatesAutoresizingMaskIntoConstraints = false

        self.toggleContentView.heightAnchor.constraint(greaterThanOrEqualTo: self.toggleView.heightAnchor).isActive = true
    }

    private func setupToggleHiddenLabelConstraints() {
        self.toggleHiddenLabel.translatesAutoresizingMaskIntoConstraints = false

        self.toggleHiddenLabel.heightAnchor.constraint(greaterThanOrEqualTo: self.toggleView.heightAnchor).isActive = true
        NSLayoutConstraint.stickEdges(
            from: self.toggleHiddenLabel,
            to: self.toggleContentView
        )
    }

    private func setupToggleViewConstraints() {
        self.toggleView.translatesAutoresizingMaskIntoConstraints = false

        self.toggleWidthConstraint = self.toggleView.widthAnchor.constraint(equalToConstant: .zero)
        self.toggleView.heightAnchor.constraint(equalTo: self.toggleView.widthAnchor).isActive = true

        self.toggleView.trailingAnchor.constraint(equalTo: self.toggleContentView.trailingAnchor).isActive = true
        self.toggleView.leadingAnchor.constraint(equalTo: self.toggleContentView.leadingAnchor).isActive = true
        NSLayoutConstraint.center(
            from: self.toggleView,
            to: self.toggleContentView
        )
    }

    private func setupToggleImageViewConstraints() {
        self.toggleImageView.translatesAutoresizingMaskIntoConstraints = false

        self.toggleImageLeadingConstraint = self.toggleImageView.leadingAnchor.constraint(equalTo: self.toggleView.leadingAnchor)
        self.toggleImageLeadingConstraint?.isActive = true
        self.toggleImageTopConstraint = self.toggleImageView.topAnchor.constraint(equalTo: self.toggleView.topAnchor)
        self.toggleImageTopConstraint?.isActive = true

        NSLayoutConstraint.center(
            from: self.toggleImageView,
            to: self.toggleView
        )
    }

    private func setupTextLabelConstraints() {
        self.textLabel.translatesAutoresizingMaskIntoConstraints = false
        self.textLabel.heightAnchor.constraint(greaterThanOrEqualTo: self.toggleView.heightAnchor).isActive = true
    }

    // MARK: - Notification

    private func setupNotifications() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.reduceMotionStatusDidChangeAction(_:)),
            name: UIAccessibility.reduceMotionStatusDidChangeNotification,
            object: nil
        )
    }

    // MARK: - Setter

    /// Set the selection state of the checkbox and optionally animating the transition.
    public func setSelectionState(_ selectionState: CheckboxSelectionState, animated: Bool) {
        self.viewModel.setSelectedValue(
            selectionState,
            animated: animated
        )

        self.updateAccessibilityValue()
    }

    /// Set the isSelected of the checkbox and optionally animating the transition.
    public func setIsSelected(_ isSelected: Bool, animated: Bool) {
        self.setSelectionState(
            isSelected ? .selected : .unselected,
            animated: animated
        )
    }

    // MARK: - Actions

    @objc private func buttonLongGestureAction(_ sender: UILongPressGestureRecognizer) {
        switch sender.state {
        case .began where !self.isReduceMotionEnabled:
            self.updateHover(show: true)
        case .ended:
            self.toggleAction()
            self.updateHover(show: false)

        default: break
        }
    }

    private func toggleAction() {
        self.viewModel.toggle()

        // Accessibility
        self.updateAccessibilityValue()

        // Action
        self.sendActions(for: .valueChanged)
        self.selectionStateSubject.send(self.selectionState)
        self.isSelectedChangedSubject.send(self.isSelected)

        // Haptic
        let generator = UIImpactFeedbackGenerator(style: .light)
        generator.impactOccurred()
    }

    @objc private func reduceMotionStatusDidChangeAction(_ notification: Notification) {
        self.viewModel.isReduceMotionEnabled = UIAccessibility.isReduceMotionEnabled
    }

    // MARK: - Update UI

    private func updateToggleViewSize() {
        if self.toggleWidth > 0 && self.toggleWidth != self.toggleWidthConstraint?.constant {
            self.toggleWidthConstraint?.constant = self.toggleWidth
            self.toggleWidthConstraint?.isActive = true

            self.toggleView.updateConstraints()
            self.invalidateIntrinsicContentSize()
        }
    }

    private func updateToggleBorderRadius(
        dynamicColors: CheckboxDynamicColors? = nil
    ) {
        let dynamicColors = dynamicColors ?? self.viewModel.dynamicColors

        self.contentStackView.layoutIfNeeded()
        self.toggleView.sparkBorderRadius(
            width: self.toggleBorderWidth,
            radius: self.toggleCornerRadius,
            colorToken: dynamicColors.border,
            masksToBounds: false
        )
    }

    private func updateToggleImageViewPadding() {
        // Reload spacing only if value changed
        if self.toggleIconPadding != self.toggleImageLeadingConstraint?.constant {
            self.toggleImageLeadingConstraint?.constant = self.toggleIconPadding
            self.toggleImageTopConstraint?.constant = self.toggleIconPadding

            self.toggleImageView.updateConstraintsIfNeeded()
            self.invalidateIntrinsicContentSize()
        }
    }

    private func updateHover(show: Bool) {
        self.toggleView.updateHover(
            show: show,
            layer: &self.hoverToggleLayer,
            cornerRadius: self.toggleCornerRadius,
            hoverColorToken: self.viewModel.staticColors.hover
        )
    }

    // MARK: - Accessibility

    private func setupAccessibility() {
        self.accessibilityIdentifier = AccessibilityIdentifier.view

        self.toggleView.accessibilityTraits.insert(.button)
        if #available(iOS 17.0, *) {
            self.toggleView.accessibilityTraits.insert(.toggleButton)
        }

        self.updateAccessibility()
    }

    private func updateAccessibility() {
        self.updateAccessibilityValue()
        self.updateAccessibilityEnabledTrait()
    }

    private func updateAccessibilityValue() {
        self.toggleView.accessibilityValue = String.accessibilityValue(selectionState: self.selectionState)
    }

    private func updateAccessibilityEnabledTrait() {
        if self.isEnabled {
            self.toggleView.accessibilityTraits.remove(.notEnabled)
        } else {
            self.toggleView.accessibilityTraits.insert(.notEnabled)
        }
    }

    // MARK: - Subscribe

    private func setupSubscriptions() {
        // **
        // Static colors
        self.viewModel.$staticColors.subscribe(in: &self.subscriptions) { [weak self] staticColors in
            guard let self else { return }

            self.toggleImageView.tintColor(staticColors.iconForeground)
        }
        // **

        // **
        // Dynamic colors
        self.viewModel.$dynamicColors.subscribe(in: &self.subscriptions) { [weak self] dynamicColors in
            guard let self else { return }

            UIView.execute(animationType: self.viewModel.dynamicAnimationType) { [weak self] in
                guard let self else { return }

                self.toggleView.backgroundColor(dynamicColors.background)
                self.updateToggleBorderRadius(dynamicColors: dynamicColors)

            } completion: { [weak self] _ in
                self?.viewModel.setCompletedAnimation(.dynamicColors)
            }
        }
        // **

        // **
        // Is Icon
        self.viewModel.$isIcon.subscribe(in: &self.subscriptions) { [weak self] isIcon in
            guard let self else { return }

            let icon: UIImage? = switch self.selectionState {
            case .selected: self.selectedIcon
            case .indeterminate: self.indeterminateIcon
            default: nil
            }

            UIView.execute(
                with: self.toggleImageView,
                animationType: self.viewModel.dynamicAnimationType,
                options: .transitionCrossDissolve,
                instructions: { [weak self] in
                    self?.toggleImageView.image = icon
                },
                completion: { [weak self] _ in
                    self?.viewModel.setCompletedAnimation(.isIcon)
                }
            )
        }
        // **

        // **
        // Content Radius
        self.viewModel.$contentRadius.subscribe(in: &self.subscriptions) { [weak self] contentRadius in
            guard let self else { return }

            self._toggleCornerRadius = .init(
                wrappedValue: contentRadius,
                traitCollection: self.traitCollection
            )
            self.updateToggleBorderRadius()
        }
        // **

        // **
        // Dim
        self.viewModel.$dim.subscribe(in: &self.subscriptions) { [weak self] dim in
            guard let self else { return }

            self.toggleView.alpha = dim
        }
        // **

        // **
        // Title style
        self.viewModel.$titleStyle.subscribe(in: &self.subscriptions) { [weak self] titleStyle in
            guard let self else { return }

            self.textLabel.textColor(titleStyle.color)

            self.textLabel.font(titleStyle.typography)
            self.toggleHiddenLabel.font(titleStyle.typography)
        }
        // **

        // **
        // Spacing
        self.viewModel.$spacing.subscribe(in: &self.subscriptions) { [weak self] spacing in
            guard let self else { return }

            self.contentStackView.spacing = spacing
            self.invalidateIntrinsicContentSize()
        }
        // **
    }

    // MARK: - Trait Collection

    public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)

        // **
        // Update sizes
        self._toggleWidth.update(traitCollection: self.traitCollection)
        self.updateToggleViewSize()

        self._toggleCornerRadius.update(traitCollection: self.traitCollection)
        self._toggleBorderWidth.update(traitCollection: self.traitCollection)
        self.updateToggleBorderRadius()

        self._toggleIconPadding.update(traitCollection: self.traitCollection)
        self.updateToggleImageViewPadding()
        // **
    }
}
