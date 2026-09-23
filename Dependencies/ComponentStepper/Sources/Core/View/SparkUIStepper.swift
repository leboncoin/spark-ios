//
//  SparkUIStepper.swift
//  SparkComponentStepper
//
//  Created by robin.lemaire on 26/02/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI
import SparkComponentButton
import SparkResources
import SparkTheming
@_spi(SI_SPI) import SparkCommon
import Combine

/// A **Spark** control for incrementing or decrementing a value.
///
/// By default, pressing and holding a stepper’s button increments or decrements the stepper’s value repeatedly.
/// The rate of change depends on how long the user continues pressing the control.
/// To turn off this behavior, set the autorepeat property to false.
///
/// The maximum value must be greater than or equal to the minimum value.
/// If you set a maximum or minimum value that would break this invariant, both values are set to the new value.
/// For example, if the minimum value is 200 and you set a maximum value of 100, then both the minimum and maximum become 200.
///
/// Implementation example :
/// ```swift
/// let theme: SparkTheming.Theme = MyTheme()
/// let stepper = SparkUIStepper(
///     theme: theme
/// )
/// stepper.isContinuous = false
/// stepper.minimumValue = 100
/// stepper.maximumValue = 200
/// stepper.step = 10
/// stepper.value = 100
///
/// let formatter = NumberFormatter()
/// formatter.numberStyle = .currency
/// stepper.valueNumberFormatter = formatter
///
/// stepper.autoRepeat = false
/// stepper.isEnabled = false
/// self.addSubview(stepper)
/// ```
///
/// ![Stepper rendering.](component.png)
///
public final class SparkUIStepper: UIControl {

    // MARK: - Public Properties

    /// The stepper's current theme.
    public var theme: any Theme {
        didSet {
            self.updateAll()
        }
    }

    /// A Boolean value indicating whether changes in the stepper’s value generate continuous update events.
    ///
    /// If true, the stepper sends value change events immediately as the value changes during user interaction. If false, the stepper sends a value change event after user interaction ends.
    ///
    /// The default value for this property is **true**.
    public var isContinuous: Bool = true

    /// The lowest possible numeric value for the stepper.
    ///
    /// Must be numerically less than maximumValue. If you attempt to set a value equal to or greater than maximumValue, the system raises an invalidArgumentException exception.
    ///
    /// The default value for this property is **0.**
    public var minimumValue: Double = 0 {
        didSet {
            self.updateButtonsIsDisabled()
        }
    }

    /// The highest possible numeric value for the stepper.
    ///
    /// Must be numerically greater than minimumValue. If you attempt to set a value equal to or lower than minimumValue, the system raises an invalidArgumentException exception.
    ///
    /// The default value of this property is **100**.
    public var maximumValue: Double = 100 {
        didSet {
            self.updateButtonsIsDisabled()
        }
    }

    /// The distance between each valid value.
    ///
    /// Must be numerically greater than 0. If you attempt to set this property’s value to 0 or to a negative number, the system raises an invalidArgumentException exception.
    ///
    /// The default value for this property is **1**.
    public var step: Double.Stride = 1

    /// The stepper’s current value.
    ///
    /// The default value for this property is **0**.
    public var value: Double = 0 {
        didSet {
            self.updateButtonsIsDisabled()
            self.updateValueLabel()
            self.updateButtonAccessibilityLabel()
            self.updateButtonAccessibilityValue()
        }
    }

    /// The formatter use to display the value.
    ///
    /// The default value for this property is :
    /// ```swift
    /// let formatter = NumberFormatter()
    /// formatter.numberStyle = .none
    /// ```
    public var valueNumberFormatter: NumberFormatter = NumberFormatter() {
        didSet {
            self.updateValueLabel()
            self.updateButtonAccessibilityLabel()
            self.updateButtonAccessibilityValue()
        }
    }

    /// A Boolean value that determines whether to repeatedly change the stepper’s value as the user presses and holds a stepper button.
    ///
    /// If true, the user pressing and holding on the stepper repeatedly alters value.
    ///
    /// The default value for this property is **true**.
    public var autoRepeat = true {
        didSet {
            guard self.autoRepeat != oldValue else { return }
            if self.autoRepeat {
                self.addLongPressGestures()
            } else {
                self.removeLongPressGestures()
            }
        }
    }

    /// Value changes are sent to the publisher.
    /// Alternative: use *addAction(UIAction, for: .valueChanged)*.
    public var valuePublisher: some Publisher<Double, Never> {
        return self.valueSubject
    }

    // MARK: - Public A11y Properties

    /// Set a context for decrement and increment accessibility label of the stepper.
    ///
    /// The default value for this property is **nil**.
    ///
    /// Example of usage  :
    /// ```swift
    /// let stepper = SparkUIStepper()
    /// stepper.contextAccessibilityLabel = "Number of people"
    /// ```
    /// So, **Voice Over** will read the following value :
    /// - for the **decrement button**: *Number of people, Decrement*
    /// - for the **increment button**: *Number of people, Increment*
    public var contextAccessibilityLabel: String? {
        didSet {
            self.updateButtonAccessibilityValue()
        }
    }

    /// Set a custom decrement accessibility label of the stepper
    ///
    /// The default value for this property is **nil**.
    ///
    /// Example of usage  :
    /// ```swift
    /// let stepper = SparkUIStepper(...)
    /// stepper.customDecrementAccessibilityLabel = "My custom decrement Label"
    /// ```
    /// So, **Voice Over** will read the following value: *My custom decrement Label*
    public var customDecrementAccessibilityLabel: String? {
        didSet {
            self.updateButtonAccessibilityLabel()
        }
    }

    /// Set a custom increment accessibility label of the stepper
    ///
    /// The default value for this property is **nil**.
    ///
    /// Example of usage  :
    /// ```swift
    /// let stepper = SparkUIStepper(...)
    /// stepper.customIncrementAccessibilityLabel = "My custom increment Label"
    /// ```
    /// So, **Voice Over** will read the following value: *My custom increment Label*
    public var customIncrementAccessibilityLabel: String? {
        didSet {
            self.updateButtonAccessibilityLabel()
        }
    }

    // MARK: - Override UIControl Properties

    override public var isEnabled: Bool {
        didSet {
            self.updateAlpha()
            self.updateButtonsIsDisabled()
        }
    }

    // MARK: - Private Properties

    private var formattedValue: String {
        return self.getGetFormattedValueUseCase.execute(
            value: self.value,
            formatter: self.valueNumberFormatter
        )
    }

    private var valueSubject = PassthroughSubject<Double, Never>()
    private var valueLabelMinWidthConstraint: NSLayoutConstraint?
    @ScaledUIMetric private var valueLabelMinWidth: CGFloat = StepperConstants.textMinWidth

    private var range: ClosedRange<Double> {
        self.minimumValue...self.maximumValue
    }

    private var _isTracking: Bool = false
    private var trackingInterval: TimeInterval = StepperConstants.trackingInterval
    private var trackingTask: Task<Void, Never>?
    private var decrementLongPressGesture: UILongPressGestureRecognizer?
    private var incrementLongPressGesture: UILongPressGestureRecognizer?

    private let getAccessibilityLabelUseCase: StepperGetAccessibilityLabelUseCaseable
    private let getAcceleratedIntervalUseCase: StepperGetAcceleratedIntervalUseCaseable
    private let getGetFormattedValueUseCase: StepperGetFormattedValueUseCaseable
    private let getIsDisabledUseCase: StepperGetIsDisabledUseCaseable
    private let getOpacityUseCase: StepperGetOpacityUseCaseable
    private let getHorizontalSpacingUseCase: StepperGetHorizontalSpacingUseCaseable
    private let getTextStyleUseCase: StepperGetTextStyleUseCaseable
    private let setValueUseCase: StepperSetValueUseCaseable
    private let stopTrackingUseCase: StepperStopTrackingUseCaseable

    // MARK: - Components

    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView(
            arrangedSubviews:
                [
                    self.decrementButton,
                    self.valueContentStackView,
                    self.incrementButton
                ])
        stackView.axis = .horizontal
        return stackView
    }()

    public private(set) lazy var decrementButton: IconButtonUIView = {
        let button = IconButtonUIView(
            theme: self.theme,
            accessibilityIdentifier: StepperAccessibilityIdentifier.decrementButton
        )
        button.addAction(.init(handler: { [weak self] _ in
            self?.updateValue(for: .decrement)
        }), for: .touchUpInside)
        return button
    }()

    private lazy var valueContentStackView: UIStackView = {
        let stackView = UIStackView(
            arrangedSubviews:
                [
                    self.leftValueSpaceView,
                    self.valueLabel,
                    self.rightValueSpaceView
                ])
        stackView.axis = .horizontal
        stackView.spacing = 0
        return stackView
    }()

    private var leftValueSpaceView = UIView()

    private var valueLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 1
        label.adjustsFontForContentSizeCategory = true
        label.isAccessibilityElement = false
        return label
    }()

    private var rightValueSpaceView = UIView()

    public private(set) lazy var incrementButton: IconButtonUIView = {
        let button = IconButtonUIView(
            theme: self.theme,
            accessibilityIdentifier: StepperAccessibilityIdentifier.incrementButton
        )
        button.addAction(.init(handler: { [weak self] _ in
            self?.updateValue(for: .increment)
        }), for: .touchUpInside)
        return button
    }()

    // MARK: - Initialization

    @available(*, deprecated, message: "Use the init wihout images")
    public convenience init(
        theme: any Theme,
        decrementImage: UIImage,
        incrementImage: UIImage
    ) {
        self.init(
            theme
        )
    }

    /// Initialize a new spark strideable stepper.
    ///
    /// Implementation example :
    /// ```swift
    /// let theme: SparkTheming.Theme = MyTheme()
    /// let stepper = SparkUIStepper(
    ///     theme: theme
    /// )
    /// self.addSubview(stepper)
    /// ```
    ///
    /// ![Stepper rendering.](component.png)
    ///
    /// - Parameters:
    ///   - theme: The spark theme of the stepper.
    public convenience init(
        theme: any Theme
    ) {
        self.init(
            theme
        )
    }

    internal init(
        _ theme: any Theme,
        getAccessibilityLabelUseCase: StepperGetAccessibilityLabelUseCaseable = StepperGetAccessibilityLabelUseCase(),
        getAcceleratedIntervalUseCase: StepperGetAcceleratedIntervalUseCaseable = StepperGetAcceleratedIntervalUseCase(),
        getGetFormattedValueUseCase: StepperGetFormattedValueUseCaseable = StepperGetFormattedValueUseCase(),
        getIsDisabledUseCase: StepperGetIsDisabledUseCaseable = StepperGetIsDisabledUseCase(),
        getOpacityUseCase: StepperGetOpacityUseCaseable = StepperGetOpacityUseCase(),
        getHorizontalSpacingUseCase: StepperGetHorizontalSpacingUseCaseable = StepperGetHorizontalSpacingUseCase(),
        getTextStyleUseCase: StepperGetTextStyleUseCaseable = StepperGetTextStyleUseCase(),
        setValueUseCase: StepperSetValueUseCaseable = StepperSetValueUseCase(),
        stopTrackingUseCase: StepperStopTrackingUseCaseable = StepperStopTrackingUseCase()
    ) {
        self.theme = theme

        self.getAccessibilityLabelUseCase = getAccessibilityLabelUseCase
        self.getAcceleratedIntervalUseCase = getAcceleratedIntervalUseCase
        self.getGetFormattedValueUseCase = getGetFormattedValueUseCase
        self.getIsDisabledUseCase = getIsDisabledUseCase
        self.getOpacityUseCase = getOpacityUseCase
        self.getHorizontalSpacingUseCase = getHorizontalSpacingUseCase
        self.getTextStyleUseCase = getTextStyleUseCase
        self.setValueUseCase = setValueUseCase
        self.stopTrackingUseCase = stopTrackingUseCase

        super.init(frame: .zero)

        self.decrementButton.setImage(UIImage(spark: \.minus), for: .normal)
        self.incrementButton.setImage(UIImage(spark: \.plus), for: .normal)

        self.setupView()
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    // MARK: - View setup

    private func setupView() {
        // Default value
        self.backgroundColor = .clear
        self.valueNumberFormatter.numberStyle = .none

        // Add subviews
        self.addSubview(self.contentStackView)

        // Add gestures (if needed)
        if self.autoRepeat {
            self.addLongPressGestures()
        }

        // Add Actions
        self.addAction(.init(handler: { [weak self] _ in
            guard let self else { return }
            self.valueSubject.send(self.value)
        }), for: .valueChanged)

        // Update UI
        self.updateAll()

        // Setup constraints
        self.setupConstraints()
    }

    // MARK: - Constraints

    private func setupConstraints() {
        self.setupViewConstraints()
        self.setupValueLabelConstraints()
        self.setupValueSpacerViewsConstraints()
    }

    private func setupViewConstraints() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.contentStackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.stickEdges(from: self.contentStackView, to: self)
    }

    private func setupValueLabelConstraints() {
        self.translatesAutoresizingMaskIntoConstraints = false

        self.valueLabelMinWidthConstraint = self.valueLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: self.valueLabelMinWidth)
        self.valueLabelMinWidthConstraint?.isActive = true
    }

    private func setupValueSpacerViewsConstraints() {
        self.leftValueSpaceView.translatesAutoresizingMaskIntoConstraints = false
        self.rightValueSpaceView.translatesAutoresizingMaskIntoConstraints = false

        self.leftValueSpaceView.widthAnchor.constraint(equalTo: self.rightValueSpaceView.widthAnchor).isActive = true
    }

    // MARK: - Update Value

    private func updateValue(for type: StepperButtonType, sendValueChanged: Bool = true) {
        let currentValue = self.value
        self.value = self.setValueUseCase.execute(
            for: type,
            value: self.value,
            step: self.step,
            bounds: self.range
        )

        if currentValue != self.value && sendValueChanged {
            self.sendActions(for: .valueChanged)
        }
    }

    // MARK: - Update UI

    private func updateAll() {
        self.updateAlpha()
        self.updateValueLabel()
        self.updateValueLabelStyle()
        self.updateValueLabelMinWidth()
        self.updateButtonsIsDisabled()
        self.updateButtonAccessibilityLabel()
        self.updateButtonAccessibilityValue()
        self.updateContentStackViewHorizontalSpacing()
    }

    private func updateAlpha() {
        self.alpha = self.getOpacityUseCase.execute(
            dims: self.theme.dims,
            isDisabled: !self.isEnabled
        )
    }

    private func updateValueLabel() {
        self.valueLabel.text = self.formattedValue
    }

    private func updateValueLabelStyle() {
        self.valueLabel.font = self.getTextStyleUseCase.executeFontToken(theme: self.theme).uiFont
        self.valueLabel.textColor = self.getTextStyleUseCase.executeColorToken(theme: self.theme).uiColor
    }

    private func updateValueLabelMinWidth() {
        // Reload height only if value changed
        if self.valueLabelMinWidthConstraint?.constant != self.valueLabelMinWidth {
            self.valueLabelMinWidthConstraint?.constant = self.valueLabelMinWidth
            self.valueLabel.updateConstraintsIfNeeded()
        }
    }

    private func updateButtonsIsDisabled() {
        for type in StepperButtonType.allCases {
            let button = switch type {
            case .decrement: self.decrementButton
            case .increment: self.incrementButton
            }

            button.isEnabled = !self.getIsDisabledUseCase.execute(
                for: type,
                value: self.value,
                bounds: self.range,
                componentIsDisabled: !self.isEnabled
            )
        }
    }

    private func updateButtonAccessibilityLabel() {
        for type in StepperButtonType.allCases {
            let object: (button: IconButtonUIView, customAccessibilityLabel: String?) = switch type {
            case .decrement: (self.decrementButton, self.customDecrementAccessibilityLabel)
            case .increment: (self.incrementButton, self.customIncrementAccessibilityLabel)
            }

            object.button.accessibilityLabel = self.getAccessibilityLabelUseCase.execute(
                for: type,
                context: self.contextAccessibilityLabel,
                customLabel: object.customAccessibilityLabel
            )
        }
    }

    private func updateButtonAccessibilityValue() {
        for type in StepperButtonType.allCases {
            let button = switch type {
            case .decrement: self.decrementButton
            case .increment: self.incrementButton
            }

            button.accessibilityValue = self.formattedValue
        }
    }

    private func updateContentStackViewHorizontalSpacing() {
        let value = self.getHorizontalSpacingUseCase.execute(
            spacing: self.theme.layout.spacing
        )

        self.contentStackView.spacing = value
    }

    // MARK: - Gesture

    private func addLongPressGestures() {
        let decrementLongPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(decrementLongPressAction))
        self.decrementButton.addGestureRecognizer(decrementLongPressGesture)
        self.decrementLongPressGesture = decrementLongPressGesture

        let incrementLongPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(incrementLongPressAction))
        self.incrementButton.addGestureRecognizer(incrementLongPressGesture)
        self.incrementLongPressGesture = incrementLongPressGesture
    }

    private func removeLongPressGestures() {
        if let decrementLongPressGesture {
            self.decrementButton.removeGestureRecognizer(decrementLongPressGesture)
        }
        if let incrementLongPressGesture {
            self.incrementButton.removeGestureRecognizer(incrementLongPressGesture)
        }
    }

    // MARK: - Tracking

    @objc
    private func decrementLongPressAction(_ gestureRecognizer: UILongPressGestureRecognizer) {
        self.startUpdating(for: .decrement, gestureRecognizer: gestureRecognizer)
    }

    @objc
    private func incrementLongPressAction(_ gestureRecognizer: UILongPressGestureRecognizer) {
        self.startUpdating(for: .increment, gestureRecognizer: gestureRecognizer)
    }

    private func startUpdating(for type: StepperButtonType, gestureRecognizer: UILongPressGestureRecognizer) {
        if gestureRecognizer.state == .began {
            self._isTracking = true
            self.trackingTask = Task { @MainActor in
                await self.updateRepeatedly(for: type)
            }
        } else if gestureRecognizer.state == .ended {
            self._isTracking = false
            self.stopUpdating()
            if self.isContinuous == false {
                self.sendActions(for: .valueChanged)
            }
        }
    }

    private func stopUpdating() {
        self.stopTrackingUseCase.execute(
            isTracking: &self._isTracking,
            task: &self.trackingTask,
            trackingInterval: &self.trackingInterval
        )
    }

    private func updateRepeatedly(for type: StepperButtonType) async {
        while self._isTracking {
            let oldValue = self.value
            self.updateValue(for: type, sendValueChanged: self.isContinuous)

            if oldValue == self.value {
                self.stopUpdating()
            }

            do {
                let nanoseconds = UInt64(self.trackingInterval * 1_000_000_000)
                try await Task.sleep(nanoseconds: nanoseconds)
            } catch {
                break
            }

            self.trackingInterval = self.getAcceleratedIntervalUseCase.execute(from: self.trackingInterval)
        }
    }

    // MARK: - Trait Collection

    public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)

        // Update Label min width
        self._valueLabelMinWidth.update(traitCollection: self.traitCollection)
        self.updateValueLabelMinWidth()
    }
}

// MARK: - Extension

extension IconButtonUIView {

    convenience init(
        theme: any Theme,
        accessibilityIdentifier: String
    ) {
        self.init(
            theme: theme,
            intent: StepperConstants.IconButton.intent,
            variant: StepperConstants.IconButton.variant,
            size: StepperConstants.IconButton.size,
            shape: StepperConstants.IconButton.shape
        )
        self.accessibilityIdentifier = accessibilityIdentifier
    }
}
