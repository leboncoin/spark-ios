//
//  SparkStepper.swift
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

/// A **Spark** control for incrementing or decrementing a value.
///
/// Use a stepper control when you want the user to have granular control while incrementing or decrementing a value. For example, you can use a stepper to:
/// - Change a value up or down by 1.
/// - Operate strictly over a prescribed range.
/// - Step by specific amounts over a stepper’s range of possible values.
///
/// Implementation example :
/// ```swift
/// struct StepperView: View {
///     let theme: SparkTheming.Theme = MyTheme()
///     @State var value: Float = 1
///     let bounds: ClosedRange<Float> = 0...100
///     let step: Float = 5
///
///     var body: some View {
///         SparkStepper(
///             value: self.$value,
///             in: self.bounds,
///             step: self.step,
///             format: .currency(code: "EUR")
///         )
///         .sparkTheme(self.theme)
///     }
/// }
/// ```
///
/// ![Stepper rendering.](component.png)
///
public struct SparkStepper<V>: View where V: Strideable {

    // MARK: - Properties

    @Binding private var value: V
    private let bounds: ClosedRange<V>
    private let step: V.Stride
    private let decrementImage: Image = Image(spark: \.minus)
    private let incrementImage: Image = Image(spark: \.plus)

    @State private var isTracking: Bool = false
    @State private var trackingInterval: TimeInterval = StepperConstants.trackingInterval
    @State private var trackingTask: Task<Void, Never>?

    @ScaledMetric private var textMinWidth: CGFloat

    @Environment(\.theme) private var theme
    @Environment(\.isEnabled) private var isEnabled

    private var contextAccessibilityLabel: String?
    private var customDecrementAccessibilityLabel: String?
    private var customIncrementAccessibilityLabel: String?

    @ObservedObject private var formattedTextObservable: StepperFormattedTextObservable<V>

    // MARK: - Private Properties

    private let getAccessibilityLabelUseCase = StepperGetAccessibilityLabelUseCase()
    private let getAcceleratedIntervalUseCase = StepperGetAcceleratedIntervalUseCase()
    private let getIsDisabledUseCase = StepperGetIsDisabledUseCase()
    private let getOpacityUseCase = StepperGetOpacityUseCase()
    private let getSpacingUseCase = StepperGetHorizontalSpacingUseCase()
    private let getTextStyleUseCase = StepperGetTextStyleUseCase()
    private let setValueUseCase = StepperSetValueUseCase()
    private let stopTrackingUseCase = StepperStopTrackingUseCase()

    @available(*, deprecated, message: "Remove the deprecated and this property ASAP. (02/02/2026)")
    private var deprecatedTheme: (any Theme)?

    // MARK: - Initialization

    /// Initialize a new spark strideable stepper.
    ///
    /// Implementation example :
    /// ```swift
    /// struct StepperView: View {
    ///     let theme: SparkTheming.Theme = MyTheme()
    ///     @State var value: Int = 1
    ///     let bounds: ClosedRange<Int> = 0...100
    ///     let step: Int = 5
    ///
    ///     var body: some View {
    ///         SparkStepper(
    ///             value: self.$value,
    ///             in: self.bounds,
    ///             step: self.step
    ///         )
    ///         .sparkTheme(self.theme)
    ///     }
    /// }
    /// ```
    ///
    /// ![Stepper rendering.](component.png)
    ///
    /// - Parameters:
    ///   - value: A `Binding` to a value that you provide.
    ///   - bounds: A closed range that describes the upper and lower bounds
    ///     permitted by the stepper.
    ///   - step: The amount to increment or decrement the stepper when the
    ///     user clicks or taps the stepper's increment or decrement buttons,
    ///     respectively.
    public init(
        value: Binding<V>,
        in bounds: ClosedRange<V>,
        step: V.Stride = 1
    ) {
        self._value = value
        self.bounds = bounds
        self.step = step

        self._textMinWidth = .init(wrappedValue: StepperConstants.textMinWidth)

        self.formattedTextObservable = .init(value: value.wrappedValue)
    }

    /// Initialize a new spark strideable stepper.
    ///
    /// Implementation example :
    /// ```swift
    /// struct StepperView: View {
    ///     let theme: SparkTheming.Theme = MyTheme()
    ///     @State var value: Float = 1
    ///     let bounds: ClosedRange<Float> = 0...100
    ///     let step: Float = 5
    ///
    ///     var body: some View {
    ///         SparkStepper(
    ///             value: self.$value,
    ///             in: self.bounds,
    ///             step: self.step,
    ///             format: .currency(code: "EUR")
    ///         )
    ///         .sparkTheme(self.theme)
    ///     }
    /// }
    /// ```
    ///
    /// ![Stepper rendering.](component_with_format.png)
    ///
    /// - Parameters:
    ///   - value: A `Binding` to a value that you provide.
    ///   - bounds: A closed range that describes the upper and lower bounds
    ///     permitted by the stepper.
    ///   - step: The amount to increment or decrement the stepper when the
    ///     user clicks or taps the stepper's increment or decrement buttons,
    ///     respectively.
    ///     Defaults to `1`.
    ///   - format: A format style of type `F` to use when converting between
    ///     the string the user edits and the underlying value of type
    ///     `F.FormatInput`. If `format` can't perform the conversion, the
    ///     stepper leaves `value` unchanged. If the user stops editing the
    ///     text in an invalid state, the stepper updates the text to the last
    ///     known valid value.
    public init<F>(
        value: Binding<F.FormatInput>,
        in bounds: ClosedRange<F.FormatInput>,
        step: F.FormatInput.Stride = 1,
        format: F
    ) where F: ParseableFormatStyle, F.FormatInput == V, F.FormatOutput == String {
        self._value = value
        self.bounds = bounds
        self.step = step

        self._textMinWidth = .init(wrappedValue: StepperConstants.textMinWidth)

        self.formattedTextObservable = .init(
            value: value.wrappedValue,
            format: format
        )
    }

    // MARK: - Deprecated Initialization

    @available(*, deprecated, message: "Use the init without theme and images instead. Set the theme after the init.")
    public init(
        theme: any Theme,
        value: Binding<V>,
        in bounds: ClosedRange<V>,
        step: V.Stride = 1,
        decrementImage: Image,
        incrementImage: Image
    ) {
        self.deprecatedTheme = theme
        self._value = value
        self.bounds = bounds
        self.step = step

        self._textMinWidth = .init(wrappedValue: StepperConstants.textMinWidth)
        self.formattedTextObservable = .init(value: value.wrappedValue)
    }

    @available(*, deprecated, message: "Use the init without theme instead. Set the theme after the init.")
    public init(
        theme: any Theme,
        value: Binding<V>,
        in bounds: ClosedRange<V>,
        step: V.Stride = 1
    ) {
        self.deprecatedTheme = theme
        self._value = value
        self.bounds = bounds
        self.step = step

        self._textMinWidth = .init(wrappedValue: StepperConstants.textMinWidth)
        self.formattedTextObservable = .init(value: value.wrappedValue)
    }

    @available(*, deprecated, message: "Use the init without theme instead. Set the theme after the init.")
    public init<F>(
        theme: any Theme,
        value: Binding<F.FormatInput>,
        in bounds: ClosedRange<F.FormatInput>,
        step: F.FormatInput.Stride = 1,
        format: F,
        decrementImage: Image,
        incrementImage: Image
    ) where F: ParseableFormatStyle, F.FormatInput == V, F.FormatOutput == String {
        self.deprecatedTheme = theme
        self._value = value
        self.bounds = bounds
        self.step = step

        self._textMinWidth = .init(wrappedValue: StepperConstants.textMinWidth)

        self.formattedTextObservable = .init(
            value: value.wrappedValue,
            format: format
        )
    }

    @available(*, deprecated, message: "Use the init without theme instead. Set the theme after the init.")
    public init<F>(
        theme: any Theme,
        value: Binding<F.FormatInput>,
        in bounds: ClosedRange<F.FormatInput>,
        step: F.FormatInput.Stride = 1,
        format: F
    ) where F: ParseableFormatStyle, F.FormatInput == V, F.FormatOutput == String {
        self.deprecatedTheme = theme
        self._value = value
        self.bounds = bounds
        self.step = step

        self._textMinWidth = .init(wrappedValue: StepperConstants.textMinWidth)

        self.formattedTextObservable = .init(
            value: value.wrappedValue,
            format: format
        )
    }

    @available(*, deprecated, message: "Use the init wihout images")
    public init<F>(
        value: Binding<F.FormatInput>,
        in bounds: ClosedRange<F.FormatInput>,
        step: F.FormatInput.Stride = 1,
        format: F,
        decrementImage: Image,
        incrementImage: Image
    ) where F: ParseableFormatStyle, F.FormatInput == V, F.FormatOutput == String {
        self._value = value
        self.bounds = bounds
        self.step = step

        self._textMinWidth = .init(wrappedValue: StepperConstants.textMinWidth)

        self.formattedTextObservable = .init(
            value: value.wrappedValue,
            format: format
        )
    }

    // MARK: - View

    public var body: some View {
        HStack(spacing: self.horizontalSpacing()) {
            // Decrement button
            self.button(for: .decrement)

            Group {
                Spacer(minLength: 0)

                Text(self.formattedTextObservable.getText())
                    .font(self.getTextStyleUseCase.executeFontToken(theme: self.getTheme()).font)
                    .foregroundStyle(self.getTextStyleUseCase.executeColorToken(theme: self.getTheme()).color)
                    .frame(minWidth: self.textMinWidth)

                Spacer(minLength: 0)
            }
            .accessibilityHidden(true)

            // Increment Button
            self.button(for: .increment)
        }
        .opacity(self.opacity())
        .compositingGroup()
        .onChange(of: self.value) { value in
            self.formattedTextObservable.setValue(value)
        }
    }

    // MARK: - Subview

    @ViewBuilder
    private func button(for type: StepperButtonType) -> some View {
        IconButtonView(
            theme: self.getTheme(),
            image: self.buttonImage(for: type)
        ) {
            if !self.isTracking {
                self.updateValue(for: type)
            }
            self.stopUpdating()
        }
        .image(self.buttonImage(for: type), for: .normal)
        .disabled(self.buttonIsDisabled(for: type))
        .accessibilityValue(self.formattedTextObservable.getText())
        .accessibilityLabel(self.buttonAccessibilityLabel(for: type))
        .accessibilityIdentifier(type.accessibilityIdentifer)
        .simultaneousGesture(
            LongPressGesture(minimumDuration: self.trackingInterval)
                .onEnded { _ in
                    self.startUpdating(for: type)
                }
        )
    }

    // MARK: - Setter

    private func updateValue(for type: StepperButtonType) {
        self.value = self.setValueUseCase.execute(
            for: type,
            value: self.value,
            step: self.step,
            bounds: self.bounds
        )
    }

    // MARK: - Getter

    private func getTheme() -> any Theme {
        return self.deprecatedTheme ?? self.theme.value
    }

    private func horizontalSpacing() -> CGFloat {
        return self.getSpacingUseCase.execute(
            spacing: self.getTheme().layout.spacing
        )
    }

    private func opacity() -> CGFloat {
        return self.getOpacityUseCase.execute(
            dims: self.getTheme().dims,
            isDisabled: !self.isEnabled
        )
    }

    private func buttonImage(for type: StepperButtonType) -> Image {
        switch type {
        case .decrement: self.decrementImage
        case .increment: self.incrementImage
        }
    }

    private func buttonIsDisabled(for type: StepperButtonType) -> Bool {
        return self.getIsDisabledUseCase.execute(
            for: type,
            value: self.value,
            bounds: self.bounds,
            componentIsDisabled: !self.isEnabled
        )
    }

    private func buttonAccessibilityLabel(for type: StepperButtonType) -> String {
        let customAccessibilityLabel = switch type {
        case .decrement: self.customDecrementAccessibilityLabel
        case .increment: self.customIncrementAccessibilityLabel
        }

        return self.getAccessibilityLabelUseCase.execute(
            for: type,
            context: self.contextAccessibilityLabel,
            customLabel: customAccessibilityLabel
        )
    }

    // MARK: - Tracking

    private func startUpdating(for type: StepperButtonType) {
        guard !self.isTracking else { return }

        self.isTracking = true
        self.trackingTask = Task { @MainActor in
            await self.updateRepeatedly(for: type)
        }
    }

    private func stopUpdating() {
        self.stopTrackingUseCase.execute(
            isTracking: &self.isTracking,
            task: &self.trackingTask,
            trackingInterval: &self.trackingInterval
        )
    }

    private func updateRepeatedly(for type: StepperButtonType) async {
        while self.isTracking {
            let oldValue = self.value
            self.updateValue(for: type)
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

    // MARK: - Public Modifier

    /// Set a context for decrement and increment accessibility label of the stepper.
    /// - parameter context: the context for the accessibility label
    /// - Returns: Current Stepper View.
    ///
    /// Example of usage  :
    /// ```swift
    /// SparkStepper(...)
    ///     .contextAccessibilityLabel("Number of people")
    /// ```
    /// So, **Voice Over** will read the following value :
    /// - for the **decrement button**: *Number of people, Decrement*
    /// - for the **increment button**: *Number of people, Increment*
    public func contextAccessibilityLabel(_ context: String) -> Self {
        var copy = self
        copy.contextAccessibilityLabel = context
        return copy
    }

    /// Set the Increment accessibility label of the stepper
    /// - parameter label: the accessibility label
    /// - Returns: Current Stepper View.
    ///
    /// Example of usage  :
    /// ```swift
    /// SparkStepper(...)
    ///     .incrementAccessibilityLabel("My custom increment Label")
    /// ```
    /// So, **Voice Over** will read the following value: *My custom increment Label*
    public func incrementAccessibilityLabel(_ label: String) -> Self {
        var copy = self
        copy.customIncrementAccessibilityLabel = label
        return copy
    }

    /// Set the Decrement accessibility label of the stepper
    /// - parameter label: the accessibility label
    /// - Returns: Current Stepper View.
    ///
    /// Example of usage  :
    /// ```swift
    /// SparkStepper(...)
    ///     .decrementAccessibilityLabel("My custom decrement Label")
    /// ```
    /// So, **Voice Over** will read the following value: *My custom decrement Label*
    public func decrementAccessibilityLabel(_ label: String) -> Self {
        var copy = self
        copy.customDecrementAccessibilityLabel = label
        return copy
    }
}

// MARK: - Extension

private extension IconButtonView {

    init(
        theme: any Theme,
        image: Image,
        action: @escaping () -> Void
    ) {
        self = .init(
            theme: theme,
            intent: StepperConstants.IconButton.intent,
            variant: StepperConstants.IconButton.variant,
            size: StepperConstants.IconButton.size,
            shape: StepperConstants.IconButton.shape,
            action: action
        )
    }
}
