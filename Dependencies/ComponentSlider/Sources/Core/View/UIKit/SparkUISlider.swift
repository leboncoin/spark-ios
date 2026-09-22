//
//  SparkUISlider.swift
//  SparkComponentSlider
//
//  Created by robin.lemaire on 27/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import UIKit
@_spi(SI_SPI) import SparkCommon
import SparkTheming
import Combine

/// The slider is an interactive component that allows users to set values by moving a handle within a defined range.
///
/// - You can add a label that appears above the thumbnail and follows it.
/// - You can add a range labels that appears below the slider (on left for the min value and right for the max value).
///
/// ## Example of usage
///
/// ```swift
/// let theme: SparkTheming.Theme = MyTheme()
///
/// let slider = SparkUISlider(theme: theme)
/// slider.intent = .main
/// slider.value = 3
/// slider.minimumValue = 0
/// slider.maximumValue = 10
/// slider.step = 1
/// slider.isEnabled = true
/// slider.title = "Value"
/// slider.valueText = "Value"
/// slider.minimumRangeValueText = "0"
/// slider.maximumRangeValueText = "10"
/// self.addSubview(slider)
/// ```
///
/// ## Accessibility
///
/// You must set an **accessibilityLabel** to give some context.
///
/// This component use the native slider **accessibilityValue**'s.
/// To override this value, you need to set a new **accessibilityValue**.
///
/// By default, VoiceOver read in order :
/// - the title
/// - the range values (can be override. Set an **accessibilityLabel** in ``rangeValuesStackView``)
/// - the curent value of the slider.
///
/// If there is not title, please add an accessibilityLabel to give some context.
///
/// This component use the native slider **accessibilityValue**'s.
/// To override this value, you need to set a new **accessibilityValue**.
///
/// ## Rendering
///
/// ### Default
///
/// ![Slider rendering.](slider_default.png)
///
/// ### Value
///
/// ![Slider rendering.](slider_value.png)
///
/// ### Range Values
///
/// ![Slider rendering.](slider_range_values.png)
///
/// ### All Values
///
/// ![Slider rendering.](slider_all_values.png)
///
public final class SparkUISlider: UIControl {

    // MARK: - Components

    /// The UILabel used to display the text appears above the slider handle.
    ///
    /// Please **do not set a text/attributedText** in this label but use
    /// the ``valueText`` and ``attributedValueText`` directly on the ``SparkUISlider``.
    public private(set) var valueLabel: UILabel = {
        let label = UILabel()
        label.addProperties()
        label.textAlignment = .center
        return label
    }()

    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView(
            arrangedSubviews: [
                self.headerStackView,
                self.hiddenValueLabel,
                self.slider,
                self.rangeValuesStackView
            ]
        )
        stackView.axis = .vertical
        return stackView
    }()

    private lazy var headerStackView: SparkAdaptiveUIStackView = {
        let stackView = SparkAdaptiveUIStackView(
            arrangedSubviews: [
                self.titleLabel,
                UIView(),
                self.valueLabel
            ]
        )
        stackView.axis = .horizontal
        stackView.isHidden = true
        return stackView
    }()

    /// The UILabel that describes `bounds.lowerBound` and appears below the slider on the left.
    ///
    /// Please **do not set a text/attributedText** in this label but use
    /// the ``title`` and ``attributedTitle`` directly on the ``SparkUISlider``.
    public private(set) var titleLabel: UILabel = {
        let label = UILabel()
        label.addProperties()
        label.isAccessibilityElement = true
        return label
    }()

    /// Needed to have a space use by the ``valueLabel``.
    private var hiddenValueLabel: UILabel = {
        let label = UILabel()
        label.addProperties()
        label.alpha = .zero
        return label
    }()

    private let slider: SteppedSlider = {
        let slider = SteppedSlider()
        slider.accessibilityIdentifier = SliderAccessibilityIdentifier.sliderContent
        return slider
    }()

    private lazy var rangeValuesStackView: UIStackView = {
        let stackView = UIStackView(
            arrangedSubviews: [
                self.minimumRangeValueLabel,
                UIView(),
                self.maximumRangeValueLabel
            ]
        )
        stackView.axis = .horizontal
        stackView.isHidden = true
        return stackView
    }()

    /// The UILabel that describes `bounds.lowerBound` and appears below the slider on the left.
    ///
    /// Please **do not set a text/attributedText** in this label but use
    /// the ``minimumRangeValueText`` and ``attributedMinimumRangeValueText`` directly on the ``SparkUISlider``.
    public private(set) var minimumRangeValueLabel: UILabel = {
        let label = UILabel()
        label.addProperties()
        return label
    }()

    /// The UILabel that describes `bounds.upperBound` and appears below the slider on the right.
    ///
    /// Please **do not set a text/attributedText** in this label but use
    /// the ``maximumRangeValueText`` and ``attributedMaximumRangeValueText`` directly on the ``SparkUISlider``.
    public private(set) var maximumRangeValueLabel: UILabel = {
        let label = UILabel()
        label.addProperties()
        return label
    }()

    // MARK: - Public Properties

    private let valueChangedSubject = PassthroughSubject<Float, Never>()
    /// The publisher used to notify when value changed.
    public private(set) lazy var valueChangedPublisher: AnyPublisher<Float, Never> = self.valueChangedSubject.eraseToAnyPublisher()

    /// The spark theme of the slider.
    public var theme: any Theme {
        didSet {
            self.viewModel.theme = self.theme
        }
    }

    /// The intent of the slider.
    /// Check the ``SliderIntent`` to see the **default** value.
    public lazy var intent: SliderIntent = .default {
        didSet {
            self.viewModel.intent = self.intent
        }
    }

    /// The value of the slider.
    public var value: Float {
        get {
            self.slider.value
        }
        set {
            self.slider.value = newValue
        }
    }

    /// The minimum value of the slider.
    public var minimumValue: Float {
        get {
            self.slider.minimumValue
        }
        set {
            self.slider.minimumValue = newValue
        }
    }

    /// The maximum value of the slider.
    public var maximumValue: Float {
        get {
            self.slider.maximumValue
        }
        set {
            self.slider.maximumValue = newValue
        }
    }

    /// The distance between each valid value.
    /// Optional. Default is **nil**.
    ///
    /// Also set the ``isContinuous`` at *true*.
    public var step: Float? {
        didSet {
            if self.step != nil {
                self.isContinuous = true
            }
        }
    }

    /// A Boolean value indicating whether changes in the slider’s value
    /// generate continuous update events.
    ///
    /// If the ``step`` is setted, isContinuous is locked at true.
    ///
    /// Do not set to *false* if a ``valueText`` or ``attributedValueText`` is set.
    public var isContinuous: Bool {
        get {
            self.slider.isContinuous
        }
        set {
            self.slider.isContinuous = self.step != nil ? true : newValue
        }
    }

    /// A Boolean value indicating if the ``valueLabel`` follow the thumb.
    /// Default is **false**.
    public var isFloatingValueLabel: Bool = false {
        didSet {
            self.updateHeaderStackViewVisibility()
            self.updateHiddenValueLabelVisibility()
            self.updateValueLabelVisibility()
        }
    }

    /// A Boolean value indicating whether the control is in the enabled state.
    public override var isEnabled: Bool {
        didSet {
            self.viewModel.isEnabled = self.isEnabled
            self.slider.isEnabled = self.isEnabled
        }
    }

    /// The title of the slider.
    /// Text can be nil, in this case, no titleLabel is displayed.
    public var title: String? {
        get {
            self.titleLabel.text
        }
        set {
            self.titleLabel.text(newValue)
            self.updateHeaderStackViewVisibility()
        }
    }

    /// The attributedText title of the slider.
    /// Text can be nil, in this case, no titleLabel is displayed.
    public var attributedTitle: NSAttributedString? {
        get {
            self.titleLabel.attributedText
        }
        set {
            self.titleLabel.attributedText(newValue)
            self.updateHeaderStackViewVisibility()
        }
    }

    /// The text value of the slider.
    /// Text can be nil, in this case, no valueLabel is displayed.
    public var valueText: String? {
        get {
            self.valueLabel.text
        }
        set {
            self.valueLabel.text(newValue)
            self.hiddenValueLabel.text(newValue)
            self.updateHeaderStackViewVisibility()
            self.updateHiddenValueLabelVisibility()
            self.updateValueLabelPosition()
        }
    }

    /// The attributedText value of the slider.
    /// Text can be nil, in this case, no valueLabel is displayed.
    public var attributedValueText: NSAttributedString? {
        get {
            self.valueLabel.attributedText
        }
        set {
            self.valueLabel.attributedText(newValue)
            self.hiddenValueLabel.attributedText(newValue)
            self.updateHeaderStackViewVisibility()
            self.updateHiddenValueLabelVisibility()
            self.updateValueLabelPosition()
        }
    }

    /// The minimum range text value of the slider. Appears below the slider on the left.
    /// Text can be nil, in this case, no minimumRangeValueLabel is displayed.
    ///
    /// Also update the accessibilityLabel of the parent stackview.
    public var minimumRangeValueText: String? {
        get {
            self.minimumRangeValueLabel.text
        }
        set {
            self.minimumRangeValueLabel.text(newValue)
            self.updateRangeValuesAccessibilityLabel()
            self.updateRangeValuesVisibility()
        }
    }

    /// The minimum range attributedText value of the slider. Appears below the slider on the left.
    /// Text can be nil, in this case, no minimumRangeValueLabel is displayed.
    ///
    /// Also update the accessibilityLabel of the parent stackview.
    public var attributedMinimumRangeValueText: NSAttributedString? {
        get {
            self.minimumRangeValueLabel.attributedText
        }
        set {
            self.minimumRangeValueLabel.attributedText(newValue)
            self.updateRangeValuesAccessibilityLabel()
            self.updateRangeValuesVisibility()
        }
    }

    /// The maximum range text value of the slider. Appears below the slider on the right.
    /// Text can be nil, in this case, no maximumRangeValueLabel is displayed.
    ///
    /// Also update the accessibilityLabel of the parent stackview.
    public var maximumRangeValueText: String? {
        get {
            self.maximumRangeValueLabel.text
        }
        set {
            self.maximumRangeValueLabel.text(newValue)
            self.updateRangeValuesAccessibilityLabel()
            self.updateRangeValuesVisibility()
        }
    }

    /// The maximum range attributedText value of the slider. Appears below the slider on the right.
    /// Text can be nil, in this case, no maximumRangeValueLabel is displayed.
    ///
    /// Also update the accessibilityLabel of the parent stackview.
    public var attributedMaximumRangeValueText: NSAttributedString? {
        get {
            self.maximumRangeValueLabel.attributedText
        }
        set {
            self.maximumRangeValueLabel.attributedText(newValue)
            self.updateRangeValuesAccessibilityLabel()
            self.updateRangeValuesVisibility()
        }
    }

    public override var accessibilityLabel: String? {
        get {
            if let customAccessibilityLabel {
                return customAccessibilityLabel
            } else {
                return [
                    self.titleLabel.accessibilityLabel,
                    self.rangeValuesStackView.accessibilityLabel,
                    self.slider.accessibilityLabel
                ].compactMap { $0 }
                    .joined(separator: ",")
            }
        }
        set {
            self.customAccessibilityLabel = newValue
        }
    }

    public override var accessibilityValue: String? {
        get {
            self.slider.accessibilityValue
        }
        set {
            self.slider.accessibilityValue = newValue
        }
    }

    // MARK: - Private Properties

    private let viewModel = SliderViewModel()

    @LimitedScaledUIMetric private var spacing: CGFloat = 0

    private var latestStepValue: Float?
    private var customAccessibilityLabel: String?

    private var subscriptions = Set<AnyCancellable>()

    // MARK: - Initialization

    /// Create a slider.
    ///
    /// - Parameters:
    ///   - theme: The current theme.
    ///
    /// Implementation example :
    /// ```swift
    /// let theme: SparkTheming.Theme = MyTheme()
    ///
    /// let slider = SparkUISlider(theme: theme)
    /// slider.intent = .main
    /// slider.value = 3
    /// slider.minimumValue = 0
    /// slider.maximumValue = 10
    /// slider.step = 1
    /// slider.isEnabled = true
    /// slider.valueText = "Value"
    /// slider.minimumRangeValueText = "0"
    /// slider.maximumRangeValueText = "10"
    /// self.addSubview(slider)
    /// ```
    ///
    /// ## Rendering
    ///
    /// ![Slider rendering.](slider_default.png)
    public init(theme: any Theme) {
        self.theme = theme

        super.init(frame: .zero)

        // Setup
        self.setupView()
    }

    /// Creates a new slider from a storyboard or nib file.
    /// - Parameter coder: An unarchiver object.
    /// - Note: This initializer is not implemented and will cause a fatal error if called.
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    // MARK: - View setup

    func setupView() {
        // Add subviews
        self.addSubview(self.contentStackView)

        // Updates UI
        self.updateSpacing()
        self.updateHeaderStackViewVisibility()
        self.updateHiddenValueLabelVisibility()
        self.updateValueLabelVisibility()
        self.updateValueLabelPosition()

        // Setup action
        self.setupAction()

        // Setup constraints
        self.setupConstraints()

        // Setup subscriptions
        self.setupSubscriptions()

        // Setup Accessibility
        self.setupAccessibility()

        // Load view model
        self.viewModel.setup(
            theme: self.theme,
            intent: self.intent,
            isFloatingValueLabel: self.isFloatingValueLabel,
            isEnabled: self.isEnabled
        )
    }

    // MARK: - Layout

    /// Lays out subviews and updates the value label position relative to the slider thumb.
    public override func layoutSubviews() {
        super.layoutSubviews()

        self.updateValueLabelPosition()
    }

    // MARK: - Constraints

    private func setupConstraints() {
        self.translatesAutoresizingMaskIntoConstraints = false

        self.setupContentViewConstraints()
    }

    private func setupContentViewConstraints() {
        self.contentStackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.stickEdges(
            from: self.contentStackView,
            to: self
        )
    }

    // MARK: - Value

    /// Sets the slider’s current value, allowing you to animate the change visually.
    /// - Parameters:
    ///     - value: The new value to assign to the ``value`` property
    ///     - animated: Specify **true** to animate the change in value; otherwise,
    ///     specify **false** to update the slider’s appearance immediately.
    ///     Animations are performed asynchronously and do not block the calling thread.
    public func setValue(_ value: Float, animated: Bool) {
        self.slider.setValue(value, animated: animated)
    }

    // MARK: - Action

    private func setupAction() {
        self.slider.addTarget(
            self,
            action: #selector(sliderChanged(_:)),
            for: .valueChanged
        )
    }

    @objc private func sliderChanged(_ sender: SteppedSlider) {
        if let step {

            let newValue = round(sender.value / step) * step
            sender.setValue(newValue, animated: false)

            if newValue != self.latestStepValue {
                self.valueChanged()

                // Haptic
                UISelectionFeedbackGenerator().selectionChanged()
            }

            self.latestStepValue = newValue

        } else {
            self.valueChanged()
        }
    }

    private func valueChanged() {
        // Update Value Label
        self.updateValueLabelPosition()

        // Send actions
        self.valueChangedSubject.send(self.value)
        self.sendActions(for: .valueChanged)
    }

    // MARK: - Accessibility

    private func setupAccessibility() {
        self.accessibilityIdentifier = SliderAccessibilityIdentifier.view
        self.accessibilityTraits = .adjustable
        self.isAccessibilityElement = true
    }

    /// Decrements the slider's value by the accessibility step.
    public override func accessibilityDecrement() {
        super.accessibilityDecrement()
        self.slider.accessibilityDecrement()
    }

    /// Increments the slider's value by the accessibility step.
    public override func accessibilityIncrement() {
        super.accessibilityIncrement()
        self.slider.accessibilityIncrement()
    }

    // MARK: - Update UI

    private func updateSpacing() {
        self.contentStackView.spacing = self.spacing
        self.headerStackView.spacing = self.spacing
        self.rangeValuesStackView.spacing = self.spacing
    }

    private func updateHeaderStackViewVisibility() {
        self.headerStackView.isHidden = self.titleLabel.isHidden && self.valueLabel.isHidden
    }

    private func updateHiddenValueLabelVisibility() {
        if self.isFloatingValueLabel {
            self.hiddenValueLabel.isHidden = self.valueLabel.isHidden
        } else {
            self.hiddenValueLabel.isHidden = true
        }
    }

    private func updateValueLabelVisibility() {
        self.valueLabel.removeFromSuperview()

        if self.isFloatingValueLabel {
            self.headerStackView.removeArrangedSubview(self.valueLabel)
            self.addSubview(self.valueLabel)
        } else {
            self.headerStackView.addArrangedSubview(self.valueLabel)
        }
    }

    private func updateValueLabelPosition() {
        guard !self.valueLabel.isHidden, self.isFloatingValueLabel else {
            return
        }

        self.contentStackView.layoutIfNeeded()
        self.slider.layoutIfNeeded()
        self.valueLabel.sizeToFit()

        let trackRect = self.slider.trackRect(forBounds: self.slider.bounds)
        let thumbRect = self.slider.thumbRect(
            forBounds: self.slider.bounds,
            trackRect: trackRect,
            value: self.value
        )

        self.valueLabel.center = CGPoint(
            x: thumbRect.midX + self.slider.frame.minX,
            y: self.hiddenValueLabel.frame.centerY
        )

        // Repositioning if label is over the view limit
        if self.valueLabel.frame.origin.x < 0 {
            self.valueLabel.frame.origin.x = 0
        } else if self.valueLabel.frame.maxX > self.frame.width {
            self.valueLabel.frame.origin.x = self.frame.width - self.valueLabel.frame.width
        }
    }

    private func updateRangeValuesVisibility() {
        self.rangeValuesStackView.isHidden = self.minimumRangeValueLabel.isHidden && self.maximumRangeValueLabel.isHidden
    }

    private func updateRangeValuesAccessibilityLabel() {
        guard let minText = self.minimumRangeValueLabel.text,
              let maxText = self.maximumRangeValueLabel.text else {
            return
        }

        self.rangeValuesStackView.accessibilityLabel = .accessibilityLabel(
            min: minText,
            max: maxText
        )
    }

    // MARK: - Subscribe

    func setupSubscriptions() {
        // Colors
        self.viewModel.$colors.subscribe(in: &self.subscriptions) { [weak self] colors in
            guard let self else { return }

            self.slider.tintColor(colors.tintColorToken)
            self.titleLabel.textColor(colors.titleColorToken)
            self.valueLabel.textColor(colors.valueColorToken)
            self.minimumRangeValueLabel.textColor(colors.rangeValuesColorToken)
            self.maximumRangeValueLabel.textColor(colors.rangeValuesColorToken)
        }

        // Dim
        self.viewModel.$dim.subscribe(in: &self.subscriptions) { [weak self] dim in
            guard let self else { return }

            self.alpha = dim
        }

        // Spacing
        self.viewModel.$spacing.subscribe(in: &self.subscriptions) { [weak self] spacing in
            guard let self else { return }

            self._spacing = .init(wrappedValue: spacing)
            self._spacing.update(traitCollection: self.traitCollection)

            self.updateSpacing()
        }

        // Typographies
        self.viewModel.$typographies.subscribe(in: &self.subscriptions) { [weak self] typographies in
            guard let self else { return }

            self.titleLabel.font(typographies.titleFontToken)
            self.valueLabel.font(typographies.valueFontToken)
            self.hiddenValueLabel.font(typographies.valueFontToken)
            self.minimumRangeValueLabel.font(typographies.rangeValuesFontToken)
            self.maximumRangeValueLabel.font(typographies.rangeValuesFontToken)
        }
    }

    // MARK: - Trait Collection

    /// Called when the trait collection of the slider changes.
    /// This updates the spacing to adapt to the new trait collection (e.g., Dynamic Type changes).
    /// - Parameter previousTraitCollection: The previous trait collection.
    public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)

        self._spacing.update(traitCollection: self.traitCollection)
        self.updateSpacing()
    }
}

// MARK: - Extension

private extension UILabel {

    func addProperties() {
        self.numberOfLines = 1
        self.lineBreakMode = .byWordWrapping
        self.adjustsFontForContentSizeCategory = true
        self.setContentCompressionResistancePriority(
            .required,
            for: .vertical
        )
        self.isHidden = true
        self.isAccessibilityElement = false
    }
}

// MARK: - Other class

private final class SteppedSlider: UISlider {
    var step: Float?
}
