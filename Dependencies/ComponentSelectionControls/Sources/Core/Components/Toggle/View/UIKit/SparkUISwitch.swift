//
//  SparkUISwitch.swift
//  SparkComponentSelectionControls
//
//  Created by robin.lemaire on 04/07/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import UIKit
import Combine
import SwiftUI
import SparkResources
@_spi(SI_SPI) import SparkCommon
import SparkTheming

/// A Spark control that offers a binary choice, such as on/off.
///
/// This component inherits from **UIControl**.
///
/// Initialization :
/// ```swift
/// let theme: SparkTheming.Theme = MyTheme()
///
/// let myToggle = SparkUISwitch(
///     theme: theme
/// )
/// ```
///
/// Toggle when isOn is **true** :
/// ![Toggle rendering.](toggle_on.png)
///
/// Toggle when isOn is **false**:
/// ![Toggle rendering.](toggle_off.png)
///
/// To add a text, you must provide a **text** or a **attributedText**:
/// ```swift
/// let theme: SparkTheming.Theme = MyTheme()
///
/// let myToggle = SparkUISwitch(
///     theme: theme
/// )
/// myToggle.text = "My switch"
/// ```
/// *Note*: Please **do not set a text/attributedText** on the ``textLabel`` but use the ``text`` and
/// ``attributedText`` directly on the ``SparkUISwitch``.
/// ![Toggle rendering with a text.](toggle_with_title.png)
///
/// ![Toggle rendering with a multiline text.](toggle_with_mutliline.png)
public final class SparkUISwitch: UIControl {

    // MARK: - Type alias

    private typealias AccessibilityIdentifier = ToggleAccessibilityIdentifier
    private typealias Constants = ToggleConstants

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
    // the toggle to the first line of the textLabel. (required when accessibility
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
        view.addSubview(self.toggleContentStackView)
        view.isUserInteractionEnabled = true
        view.setContentCompressionResistancePriority(.required,
                                                     for: .vertical)
        view.setContentCompressionResistancePriority(.required,
                                                     for: .horizontal)
        view.isAccessibilityElement = true
        return view
    }()

    private lazy var toggleContentStackView: UIStackView = {
        let stackView = UIStackView(
            arrangedSubviews:
                [
                    self.toggleLeftSpaceView,
                    self.toggleDotView,
                    self.toggleRightSpaceView
                ]
        )
        stackView.axis = .horizontal
        stackView.isUserInteractionEnabled = false
        stackView.accessibilityElementsHidden = true
        return stackView
    }()

    private let toggleLeftSpaceView = UIView()

    private lazy var toggleDotView: UIView = {
        let view = UIView()
        view.accessibilityIdentifier = AccessibilityIdentifier.toggleDotView
        view.addSubview(self.toggleDotImageView)
        return view
    }()

    private var toggleDotImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.accessibilityIdentifier = AccessibilityIdentifier.toggleDotImageView
        return imageView
    }()

    private let toggleRightSpaceView = UIView()

    /// The UILabel used to display the switch text.
    ///
    /// Please **do not set a text/attributedText** in this label but use
    /// the ``text`` and ``attributedText`` directly on the ``SparkUISwitch``.
    public private(set) var textLabel: UILabel = {
        let label = UILabel()
        label.applyStyle()
        label.accessibilityIdentifier = AccessibilityIdentifier.text
        return label
    }()

    // MARK: - Public Properties

    private let isOnChangedSubject = PassthroughSubject<Bool, Never>()
    /// The publisher used to notify when isOn value changed on switch.
    public private(set) lazy var isOnChangedPublisher: AnyPublisher<Bool, Never> = self.isOnChangedSubject.eraseToAnyPublisher()

    /// The spark theme of the switch.
    public var theme: any Theme {
        get {
            return self.viewModel.theme
        }
        set {
            self.viewModel.theme = newValue
        }
    }

    /// The value of the switch (retrieve and set without animation).
    ///
    /// Toggle when isOn is **true** :
    /// ![Toggle rendering.](toggle/component.png)
    ///
    /// Toggle when isOn is **false**:
    /// ![Toggle rendering.](toggle_off.png)
    public var isOn: Bool {
        get {
            return self.viewModel.selectedValue
        }
        set {
            self.viewModel.setSelectedValue(newValue)
            self.updateAccessibilityValue()
        }
    }

    /// The text of the switch.
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

    /// The attributed text of the switch.
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

    /// The state of the switch: enabled or not.
    /// ![Toggle rendering with when it's disabled.](toggle_disabled.png)
    public override var isEnabled: Bool {
        get {
            return self.viewModel.isEnabled
        }
        set {
            self.viewModel.isEnabled = newValue
            self.updateToggleViewUserInteractionEnabled()
            self.updateAccessibilityEnabledTrait()
        }
    }

    /// A localized string that describes the switch.
    public override var accessibilityLabel: String? {
        get {
            return self.toggleView.accessibilityLabel
        }
        set {
            self.toggleView.accessibilityLabel = newValue
        }
    }

    // MARK: - Private Properties

    private let viewModel: ToggleUIViewModel

    private var toggleWidthConstraint: NSLayoutConstraint?
    private var toggleHeightConstraint: NSLayoutConstraint?

    private var toggleContentLeadingConstraint: NSLayoutConstraint?
    private var toggleContentTopConstraint: NSLayoutConstraint?

    private var toggleDotWidthConstraint: NSLayoutConstraint?

    private var toggleDotImageLeadingConstraint: NSLayoutConstraint?
    private var toggleDotImageTopConstraint: NSLayoutConstraint?

    private let toggleHeight: CGFloat = Constants.height
    private let toggleWidth: CGFloat = Constants.width
    private let toggleSpacing: CGFloat = Constants.padding
    private let toggleDotSpacing: CGFloat = Constants.toggleDotImagePadding

    private let onIcon: UIImage = UIImage(spark: \.check)
    private let offIcon: UIImage = UIImage(spark: \.cross)

    private var isReduceMotionEnabled: Bool {
        UIAccessibility.isReduceMotionEnabled
    }

    private var hoverToggleLayer: CAShapeLayer?

    private var subscriptions = Set<AnyCancellable>()

    // MARK: - Initialization

    /// Creates a Spark switch.
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
    /// let myToggle = SparkUISwitch(
    ///     theme: theme
    /// )
    /// ```
    ///
    /// ![Toggle rendering.](toggle_on.png)
    public init(theme: any Theme) {
        self.viewModel = .init(
            theme: theme
        )

        super.init(frame: .zero)

        // Setup
        self.setupView()
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    deinit {
        // Remove notifications
        NotificationCenter.default.removeObserver(
            self,
            name: UIAccessibility.onOffSwitchLabelsDidChangeNotification,
            object: nil
        )
        NotificationCenter.default.removeObserver(
            self,
            name: UIAccessibility.reduceMotionStatusDidChangeNotification,
            object: nil
        )
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
        self.updateToggleContentViewSpacings()
        self.updateToggleViewSize()
        self.updateToggleDotImageViewSpacings()

        // Load view model
        self.viewModel.load(
            isOnOffSwitchLabelsEnabled: UIAccessibility.isOnOffSwitchLabelsEnabled,
            isReduceMotionEnabled: self.isReduceMotionEnabled,
            contrast: self.traitCollection.accessibilityContrast
        )
    }

    // MARK: - Layout

    public override func layoutSubviews() {
        super.layoutSubviews()

        self.updateCornerRadius()
    }

    // MARK: - Gesture

    private func setupGesturesRecognizer() {
        let gestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(self.toggleLongGestureAction))
        gestureRecognizer.minimumPressDuration = 0
        self.toggleView.addGestureRecognizer(gestureRecognizer)
    }

    // MARK: - Constraints

    private func setupConstraints() {
        // Global
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setupContentStackViewConstraints()

        // Toggle View and subviews
        self.setupToggleContentViewConstraints()
        self.setupToggleHiddenLabelConstraints()
        self.setupToggleViewConstraints()
        self.setupToggleContentStackViewConstraints()
        self.setupToggleDotViewConstraints()
        self.setupToggleDotImageViewConstraints()

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
        self.toggleHeightConstraint = self.toggleView.heightAnchor.constraint(equalToConstant: .zero)

        self.toggleView.trailingAnchor.constraint(equalTo: self.toggleContentView.trailingAnchor).isActive = true
        self.toggleView.leadingAnchor.constraint(equalTo: self.toggleContentView.leadingAnchor).isActive = true
        NSLayoutConstraint.center(
            from: self.toggleView,
            to: self.toggleContentView
        )
    }

    private func setupToggleContentStackViewConstraints() {
        self.toggleContentStackView.translatesAutoresizingMaskIntoConstraints = false

        self.toggleContentLeadingConstraint = self.toggleContentStackView.leadingAnchor.constraint(equalTo: self.toggleView.leadingAnchor)
        self.toggleContentLeadingConstraint?.isActive = true
        self.toggleContentTopConstraint = self.toggleContentStackView.topAnchor.constraint(equalTo: self.toggleView.topAnchor)
        self.toggleContentTopConstraint?.isActive = true

        NSLayoutConstraint.center(
            from: self.toggleContentStackView,
            to: self.toggleView
        )
    }

    private func setupToggleDotViewConstraints() {
        self.toggleDotView.translatesAutoresizingMaskIntoConstraints = false

        self.toggleDotWidthConstraint = self.toggleDotView.widthAnchor.constraint(equalTo: self.toggleDotView.heightAnchor)
        self.toggleDotWidthConstraint?.isActive = true
    }

    private func setupToggleDotImageViewConstraints() {
        self.toggleDotImageView.translatesAutoresizingMaskIntoConstraints = false

        self.toggleDotImageLeadingConstraint = self.toggleDotImageView.leadingAnchor.constraint(equalTo: self.toggleDotView.leadingAnchor)
        self.toggleDotImageLeadingConstraint?.isActive = true
        self.toggleDotImageTopConstraint = self.toggleDotImageView.topAnchor.constraint(equalTo: self.toggleDotView.topAnchor)
        self.toggleDotImageTopConstraint?.isActive = true

        NSLayoutConstraint.center(
            from: self.toggleDotImageView,
            to: self.toggleDotView
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
            selector: #selector(self.onOffToggleLabelsDidChangeAction(_:)),
            name: UIAccessibility.onOffSwitchLabelsDidChangeNotification,
            object: nil
        )

        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.reduceMotionStatusDidChangeAction(_:)),
            name: UIAccessibility.reduceMotionStatusDidChangeNotification,
            object: nil
        )
    }

    // MARK: - Setter

    /// Sets the state of the switch to the on or off position, optionally animating the transition.
    public func setOn(_ isOn: Bool, animated: Bool) {
        self.viewModel.setSelectedValue(
            isOn,
            animated: animated
        )

        self.updateAccessibilityValue()
    }

    // MARK: - Actions

    @objc private func toggleLongGestureAction(_ sender: UILongPressGestureRecognizer) {
        switch sender.state {
        case .began where !self.isReduceMotionEnabled:
            UIView.execute(animationType: self.viewModel.staticAnimationType) { [weak self] in
                guard let self else { return }

                self.toggleDotWidthConstraint?.constant = Constants.dotIncreasePressedSize
                self.updateHover(show: true)
                self.layoutIfNeeded()
            }

        case .ended:
            self.toggleAction()

            UIView.execute(animationType: self.viewModel.staticAnimationType) { [weak self] in
                guard let self else { return }

                self.toggleDotWidthConstraint?.constant = 0
                self.updateHover(show: false)
                self.layoutIfNeeded()
            }

        default: break
        }
    }

    private func toggleAction() {
        self.viewModel.toggle()

        // Accessibility
        self.updateAccessibilityValue()

        // Action
        self.sendActions(for: .valueChanged)
        self.isOnChangedSubject.send(self.isOn)

        // Haptic
        let generator = UIImpactFeedbackGenerator(style: .light)
        generator.impactOccurred()
    }

    @objc private func onOffToggleLabelsDidChangeAction(_ notification: Notification) {
        self.viewModel.isOnOffSwitchLabelsEnabled = UIAccessibility.isOnOffSwitchLabelsEnabled
    }

    @objc private func reduceMotionStatusDidChangeAction(_ notification: Notification) {
        self.viewModel.isReduceMotionEnabled = UIAccessibility.isReduceMotionEnabled
    }

    // MARK: - Update UI

    private func updateToggleContentViewSpacings() {
        // Reload spacing only if value changed
        if self.toggleSpacing != self.toggleContentLeadingConstraint?.constant {

            self.toggleContentLeadingConstraint?.constant = self.toggleSpacing
            self.toggleContentTopConstraint?.constant = self.toggleSpacing

            self.toggleContentStackView.updateConstraintsIfNeeded()
            self.invalidateIntrinsicContentSize()
        }
    }

    private func updateToggleViewSize() {
        // Reload size only if value changed
        var valueChanged = false

        if self.toggleWidth > 0 && self.toggleWidth != self.toggleWidthConstraint?.constant {
            self.toggleWidthConstraint?.constant = self.toggleWidth
            self.toggleWidthConstraint?.isActive = true
            valueChanged = true
        }

        if self.toggleHeight > 0 && self.toggleHeight != self.toggleHeightConstraint?.constant {
            self.toggleHeightConstraint?.constant = self.toggleHeight
            self.toggleHeightConstraint?.isActive = true
            valueChanged = true
        }
        if valueChanged {
            self.toggleView.updateConstraints()
            self.invalidateIntrinsicContentSize()
        }
    }

    private func updateToggleDotImageViewSpacings() {
        // Reload spacing only if value changed
        if self.toggleDotSpacing != self.toggleDotImageLeadingConstraint?.constant {
            self.toggleDotImageLeadingConstraint?.constant = self.toggleDotSpacing
            self.toggleDotImageTopConstraint?.constant = self.toggleDotSpacing

            self.toggleDotImageView.updateConstraintsIfNeeded()
            self.invalidateIntrinsicContentSize()
        }
    }

    private func updateCornerRadius(_ value: CGFloat? = nil) {
        self.toggleView.layoutIfNeeded()
        self.toggleDotView.layoutIfNeeded()

        self.toggleView.sparkCornerRadius(value ?? self.viewModel.contentRadius)
        self.toggleDotView.sparkCornerRadius(value ?? self.viewModel.contentRadius)
    }

    private func updateHover(show: Bool) {
        self.toggleView.updateHover(
            show: show,
            layer: &self.hoverToggleLayer,
            hoverColorToken: self.viewModel.staticColors.hover
        )
    }

    private func updateToggleViewUserInteractionEnabled() {
        self.toggleView.isUserInteractionEnabled = self.isEnabled
    }

    // MARK: - Accessibility

    private func setupAccessibility() {
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
        self.toggleView.accessibilityValue = self.isOn ? "1" : "0"
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

            self.toggleDotView.backgroundColor(staticColors.dotBackground)
        }
        // **

        // **
        // Dynamic colors
        self.viewModel.$dynamicColors.subscribe(in: &self.subscriptions) { [weak self] dynamicColors in
            guard let self else { return }

            UIView.execute(animationType: self.viewModel.dynamicAnimationType) { [weak self] in
                guard let self else { return }

                self.toggleView.backgroundColor(dynamicColors.background)
                self.toggleDotImageView.tintColor(dynamicColors.dotForeground)

            } completion: { [weak self] _ in
                guard let self else { return }

                self.viewModel.setCompletedAnimation(.dynamicColors)
            }
        }
        // **

        // **
        // Content Radius
        self.viewModel.$contentRadius.subscribe(in: &self.subscriptions) { [weak self] contentRadius in
            guard let self else { return }

            self.updateCornerRadius(contentRadius)
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
        // Is Icon
        self.viewModel.$isIcon.subscribe(in: &self.subscriptions) { [weak self] isIcon in
            guard let self else { return }

            if isIcon {
                let image = self.isOn ? self.onIcon : self.offIcon

                UIView.execute(
                    with: self.toggleDotImageView,
                    animationType: self.viewModel.dynamicAnimationType,
                    options: .transitionCrossDissolve,
                    instructions: { [weak self] in
                        self?.toggleDotImageView.image = image
                    },
                    completion: { [weak self] _ in
                        self?.viewModel.setCompletedAnimation(.isIcon)
                    }
                )

            } else {
                self.toggleDotImageView.image = nil
                self.viewModel.setCompletedAnimation(.isIcon)
            }
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
        // Show space
        self.viewModel.$showSpace.subscribe(in: &self.subscriptions) { [weak self] showSpace in
            guard let self else { return }

            // showLeftSpace MUST be different to continue
            // Or if the both space have the same isHidden (default state)
            guard self.toggleLeftSpaceView.isHidden == showSpace.showLeft ||
            self.toggleRightSpaceView.isHidden == self.toggleLeftSpaceView.isHidden else {
                return
            }

            // Lock interaction before animation
            self.toggleView.isUserInteractionEnabled = false

            UIView.execute(animationType: self.viewModel.dynamicAnimationType) { [weak self] in
                guard let self else { return }

                self.toggleLeftSpaceView.isHidden = !showSpace.showLeft
                self.toggleRightSpaceView.isHidden = !showSpace.showRight

            } completion: { [weak self] _ in
                guard let self else { return }

                self.viewModel.setCompletedAnimation(.showSpace)

                // Reset interaction after animation
                self.updateToggleViewUserInteractionEnabled()
            }
        }
        // **
    }

    // MARK: - Trait Collection

    public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)

        if previousTraitCollection?.accessibilityContrast != self.traitCollection.accessibilityContrast {
            self.viewModel.contrast = self.traitCollection.accessibilityContrast
        }
    }
}
