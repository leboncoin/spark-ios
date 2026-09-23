//
//  SparkUIRadioButton.swift
//  SparkComponentSelectionControls
//
//  Created by robin.lemaire on 02/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import UIKit
import Combine
import SwiftUI
@_spi(SI_SPI) import SparkCommon
import SparkTheming

/// A Spark control that radio button between selected and unselected states.
///
/// This component inherits from **UIControl**.
///
/// Initialization :
/// ```swift
/// let theme: SparkTheming.Theme = MyTheme()
///
/// let myRadioButton = SparkUIRadioButton(
///     theme: theme
/// )
/// ```
///
/// RadioButton when isSelected is **true** :
/// ![RadioButton rendering.](radioButton_selected.png)
///
/// RadioButton when isSelected is **false**:
/// ![RadioButton rendering.](radioButton_unselected.png)
///
/// To add a text, you must provide a **text** or a **attributedText**:
/// ```swift
/// let theme: SparkTheming.Theme = MyTheme()
///
/// let myRadioButton = SparkUIRadioButton(
///     theme: theme
/// )
/// myRadioButton.text = "My radio button"
/// ```
/// *Note*: Please **do not set a text/attributedText** on the ``textLabel`` but use the ``text`` and
/// ``attributedText`` directly on the ``SparkUIRadioButton``.
/// ![RadioButton rendering with a text.](radioButton_with_title.png)
///
/// ![RadioButton rendering with a multiline text.](radioButton_with_mutliline.png)
public final class SparkUIRadioButton: UIControl {

    // MARK: - Type alias

    private typealias AccessibilityIdentifier = RadioButtonAccessibilityIdentifier
    private typealias Constants = RadioButtonConstants

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
        view.addSubview(self.toggleSelectedDotView)
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

    private lazy var toggleSelectedDotView = UIView()

    /// The UILabel used to display the radio button text.
    ///
    /// Please **do not set a text/attributedText** in this label but use
    /// the ``text`` and ``attributedText`` directly on the ``SparkUIRadioButton``.
    public private(set) var textLabel: UILabel = {
        let label = UILabel()
        label.applyStyle()
        label.accessibilityIdentifier = AccessibilityIdentifier.text
        return label
    }()

    // MARK: - Public Properties

    private let isSelectedChangedSubject = PassthroughSubject<Bool, Never>()
    /// The publisher used to notify when isSelected value changed on radio button.
    public private(set) lazy var isSelectedChangedPublisher: AnyPublisher<Bool, Never> = self.isSelectedChangedSubject.eraseToAnyPublisher()

    /// The spark theme of the radio button.
    public var theme: any Theme {
        get {
            return self.viewModel.theme
        }
        set {
            self.viewModel.theme = newValue
        }
    }

    /// The intent of the radio button.
    public var intent: RadioButtonIntent {
        get {
            return self.viewModel.intent
        }
        set {
            self.viewModel.intent = newValue
        }
    }

    /// The text of the radio button.
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

    /// The attributed text of the radio button.
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

    /// The value of the radio button (retrieve and set without animation).
    ///
    /// RadioButton when isSelected is **true** :
    /// ![RadioButton rendering.](radioButton_selected.png)
    ///
    /// RadioButton when isSelected is **false**:
    /// ![RadioButton rendering.](radioButton_unselected.png)
    public override var isSelected: Bool {
        get {
            return self.viewModel.selectedValue
        }
        set {
            self.viewModel.setSelectedValue(newValue)
            self.updateAccessibilityValue()
        }
    }

    /// The state of the radio button: enabled or not.
    /// ![RadioButton rendering with when it's disabled.](radioButton_disabled.png)
    public override var isEnabled: Bool {
        get {
            return self.viewModel.isEnabled
        }
        set {
            self.viewModel.isEnabled = newValue
            self.updateAccessibilityEnabledTrait()
        }
    }

    /// A localized string that describes the radio button.
    public override var accessibilityLabel: String? {
        get {
            return self.toggleView.accessibilityLabel
        }
        set {
            self.toggleView.accessibilityLabel = newValue
        }
    }

    // MARK: - Internal Properties

    /// The identifier of the radio button. Used by the ``SparkUIRadioGroup``. *Optional*.
    internal var id: String?

    // MARK: - Private Properties

    private let viewModel: RadioButtonUIViewModel

    private var toggleWidthConstraint: NSLayoutConstraint?

    private var toggleSelectedDotWidthConstraint: NSLayoutConstraint?

    @LimitedScaledUIMetric private var toggleWidth: CGFloat = Constants.size
    @LimitedScaledUIMetric private var toggleSelectedDotWidth: CGFloat = 0
    @LimitedScaledUIMetric private var toggleBorderWidth: CGFloat = Constants.lineWidth

    private var isReduceMotionEnabled: Bool {
        UIAccessibility.isReduceMotionEnabled
    }

    private var hoverToggleLayer: CAShapeLayer?

    private var subscriptions = Set<AnyCancellable>()

    // MARK: - Initialization

    /// Creates a Spark radio button.
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
    /// let myRadioButton = SparkUIRadioButton(
    ///     theme: theme
    /// )
    /// ```
    ///
    /// ![RadioButton rendering.](radioButton_unselected.png)
    public init(theme: any Theme) {
        self.viewModel = .init(
            theme: theme
        )

        self._toggleWidth = .init(wrappedValue: Constants.size)
        self._toggleSelectedDotWidth = .init(wrappedValue: 0)
        self._toggleBorderWidth = .init(wrappedValue: Constants.lineWidth)

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
        self.updateToggleSelectedDotCornerRadius()
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
        self.updateToggleSelectedDotView()

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

        // RadioButton View and subviews
        self.setupContentStackViewConstraints()
        self.setupToggleContentViewConstraints()
        self.setupToggleHiddenLabelConstraints()
        self.setupToggleViewConstraints()
        self.setupToggleSelectedDotViewConstraints()
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

    private func setupToggleSelectedDotViewConstraints() {
        self.toggleSelectedDotView.translatesAutoresizingMaskIntoConstraints = false

        self.toggleSelectedDotWidthConstraint = self.toggleSelectedDotView.widthAnchor.constraint(equalToConstant: .zero)
        self.toggleSelectedDotView.heightAnchor.constraint(equalTo: self.toggleSelectedDotView.widthAnchor).isActive = true

        NSLayoutConstraint.center(
            from: self.toggleSelectedDotView,
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

    /// Set the selection of the radio button and optionally animating the transition.
    public func setIsSelected(_ isSelected: Bool, animated: Bool) {
        self.viewModel.setSelectedValue(
            isSelected,
            animated: animated
        )

        self.updateAccessibilityValue()
    }

    // MARK: - Actions

    @objc private func buttonLongGestureAction(_ sender: UILongPressGestureRecognizer) {
        switch sender.state {
        case .began where !self.isReduceMotionEnabled && !self.isSelected:
            self.updateHover(show: true)
        case .ended:
            self.toggleAction()
            self.updateHover(show: false)

        default: break
        }
    }

    private func toggleAction() {
        guard self.viewModel.toggleIfPossible() else {
            return
        }

        // Accessibility
        self.updateAccessibilityValue()

        // Action
        self.sendActions(for: .valueChanged)
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

    private func updateToggleSelectedDotView() {
        if self.toggleSelectedDotWidth != self.toggleSelectedDotWidthConstraint?.constant {

            self.toggleSelectedDotWidthConstraint?.constant = self.toggleSelectedDotWidth
            self.toggleSelectedDotWidthConstraint?.isActive = true

            self.toggleSelectedDotView.updateConstraints()

            self.updateToggleSelectedDotCornerRadius()
        }
    }

    private func updateToggleBorderRadius(
        dynamicColors: RadioButtonDynamicColors? = nil,
        contentRadius: CGFloat? = nil
    ) {
        let dynamicColors = dynamicColors ?? self.viewModel.dynamicColors
        let contentRadius = contentRadius ?? self.viewModel.contentRadius

        self.toggleContentView.layoutIfNeeded()
        self.toggleView.sparkBorderRadius(
            width: self.toggleBorderWidth,
            radius: contentRadius,
            colorToken: dynamicColors.circle,
            cornerCurve: .circular,
            masksToBounds: false
        )
    }

    private func updateToggleSelectedDotCornerRadius(contentRadius: CGFloat? = nil) {
        let contentRadius = contentRadius ?? self.viewModel.contentRadius

        self.toggleContentView.layoutIfNeeded()
        self.toggleSelectedDotView.sparkCornerRadius(contentRadius)
    }

    private func updateHover(show: Bool) {
        self.toggleView.updateHover(
            show: show,
            layer: &self.hoverToggleLayer,
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
        self.toggleView.accessibilityValue = String.accessibilityValue(isSelected: self.isSelected)
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

            self.toggleSelectedDotView.backgroundColor(staticColors.dot)
        }
        // **

        // **
        // Dynamic colors
        self.viewModel.$dynamicColors.subscribe(in: &self.subscriptions) { [weak self] dynamicColors in
            guard let self else { return }

            self.updateToggleBorderRadius(dynamicColors: dynamicColors)
        }
        // **

        // **
        // Content Radius
        self.viewModel.$contentRadius.subscribe(in: &self.subscriptions) { [weak self] contentRadius in
            guard let self else { return }

            self.updateToggleBorderRadius(contentRadius: contentRadius)
            self.updateToggleSelectedDotCornerRadius(contentRadius: contentRadius)
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

        // **
        // Show selected dot
        self.viewModel.$showSelectedDot.subscribe(in: &self.subscriptions) { [weak self] showSelectedDot in
            guard let self else { return }

            UIView.execute(animationType: self.viewModel.dynamicAnimationType) { [weak self] in
                guard let self else { return }

                self._toggleSelectedDotWidth = .init(
                    wrappedValue: showSelectedDot ? Constants.dotSize : 0,
                    traitCollection: self.traitCollection
                )

                self.updateToggleSelectedDotView()

            } completion: { [weak self] _ in
                guard let self else { return }

                self.viewModel.setCompletedAnimation(.showSelectedDot)
            }
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

        self._toggleSelectedDotWidth.update(traitCollection: self.traitCollection)
        self.updateToggleSelectedDotView()
        self.updateToggleSelectedDotCornerRadius()

        self._toggleBorderWidth.update(traitCollection: self.traitCollection)
        self.updateToggleBorderRadius()
        // **
    }
}
