//
//  SparkSlider.swift
//  SparkComponentSlider
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkCommon

/// The slider is an interactive component that allows users to set values by moving a handle within a defined range.
///
/// - You can add a label that appears above the thumbnail and follows it.
/// - You can add a range labels that appears below the slider (on left for the min value and right for the max value).
///
/// ## Example of usage
///
/// ### Default
///
/// ```swift
/// struct MyView: View {
///     let theme: SparkTheming.Theme = MyTheme()
///     @State private var value: Double = 0.75
///
///     var body: some View {
///         SparkSlider(
///             value: self.$value,
///             in: 0...1
///         )
///         .sparkTheme(self.theme)
///         .sparkSliderIntent(.main)
///     }
/// }
/// ```
/// ### With step
///
/// ```swift
/// struct MyView: View {
///     let theme: SparkTheming.Theme = MyTheme()
///     @State private var value: Double = 0.75
///
///     var body: some View {
///         SparkSlider(
///             value: self.$value,
///             in: 0...1,
///             step: 0.25
///         )
///         .sparkTheme(self.theme)
///         .sparkSliderIntent(.main)
///     }
/// }
/// ```
/// ### Other
///
/// There is many others way to init the component :
///  - with value text
///  - with value label
///  - with range values text
///  - with range values label
///  - ...
///
/// ## EnvironmentValues
///
/// This component use some EnvironmentValues :
/// - **theme** : ``sparkTheme(_:)`` (View extension)
/// - **intent** : ``sparkSliderIntent(_:)`` (View extension)
/// - **IsFloatingValue** : ``sparkSliderIsFloatingValueLabel(_:)`` (View extension)
/// - **accessibilityRangeValuesLabel** : ``sparkSliderAccessibilityRangeValuesLabel(_:max:)`` (View extension)
///
/// > If theses values are not set, default values will be applied.
///
/// > **YOU MUST PROVIDE ``sparkTheme(_:)``**
///
/// ## Accessibility
///
/// By default, VoiceOver read in order :
/// - the title
/// - the range values (can be override with ``sparkSliderAccessibilityRangeValuesLabel(_:max:)``)
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
/// ### Title
///
/// ![Slider rendering.](slider_title.png)
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
public struct SparkSlider<TitleLabel, ValueLabel, MinValueLabel, MaxValueLabel, Value>: View where TitleLabel: View, ValueLabel: View, MinValueLabel: View, MaxValueLabel: View, Value: BinaryFloatingPoint, Value.Stride: BinaryFloatingPoint {

    // MARK: - Properties

    private let titleLabel: () -> TitleLabel
    private let valueLabel: () -> ValueLabel
    private let minValueLabel: () -> MinValueLabel
    private let maxValueLabel: () -> MaxValueLabel

    private let rangeValuesAccessibilityLabel: String?

    @Binding private var value: Value
    private let bounds: ClosedRange<Value>
    private let step: Value.Stride?

    private let onEditingChanged: (Bool) -> Void

    @Environment(\.theme) private var theme
    @Environment(\.sliderIntent) private var intent
    @Environment(\.sliderIsFloatingValueLabel) private var isFloatingValueLabel
    @Environment(\.sliderAccessibilityRangeValuesLabel) private var customRangeValuesAccessibilityLabel
    @Environment(\.isEnabled) private var isEnabled

    @StateObject private var viewModel = SliderViewModel()

    @State private var floatingValueLabelSize: CGSize = .zero
    @State private var sliderHeight: CGFloat = .zero

    @State private var feedbackID: UUID?

    // MARK: - Initialization

    /// Creates a slider to select a value from a given range.
    ///
    /// - Parameters:
    ///   - value: The selected value within `bounds`.
    ///   - bounds: The range of the valid values. Defaults to `0...1`.
    ///   - onEditingChanged: A callback for when editing begins and ends.
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// struct MyView: View {
    ///     let theme: SparkTheming.Theme = MyTheme()
    ///     @State private var value: Double = 0.75
    ///
    ///     var body: some View {
    ///         SparkSlider(
    ///             value: self.$value,
    ///             in: 0...1,
    ///             onEditingChanged: { isEditing in
    ///                 // Do what you want.
    ///             }
    ///         )
    ///         .sparkTheme(self.theme)
    ///         .sparkSliderIntent(.main)
    ///     }
    /// }
    /// ```
    ///
    /// ## Rendering
    ///
    /// ![Slider rendering.](slider_default.png)
    ///
    public init(
        value: Binding<Value>,
        in bounds: ClosedRange<Value> = 0...1,
        onEditingChanged: @escaping (Bool) -> Void = { _ in }
    ) where TitleLabel == EmptyView, ValueLabel == EmptyView, MinValueLabel == EmptyView, MaxValueLabel == EmptyView {
        self.init(
            value,
            in: bounds,
            titleLabel: { EmptyView() },
            valueLabel: { EmptyView() },
            minValueLabel: { EmptyView() },
            maxValueLabel: { EmptyView() },
            onEditingChanged: onEditingChanged
        )
    }

    /// Creates a slider to select a value from a given range,
    /// subject to a step increment.
    ///
    /// - Parameters:
    ///   - value: The selected value within `bounds`.
    ///   - bounds: The range of the valid values. Defaults to `0...1`.
    ///   - step: The distance between each valid value.
    ///   - onEditingChanged: A callback for when editing begins and ends.
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// struct MyView: View {
    ///     let theme: SparkTheming.Theme = MyTheme()
    ///     @State private var value: Double = 0.75
    ///
    ///     var body: some View {
    ///         SparkSlider(
    ///             value: self.$value,
    ///             in: 0...1,
    ///             step: 0.25,
    ///             onEditingChanged: { isEditing in
    ///                 // Do what you want.
    ///             }
    ///         )
    ///         .sparkTheme(self.theme)
    ///         .sparkSliderIntent(.main)
    ///     }
    /// }
    /// ```
    ///
    /// ## Rendering
    ///
    /// ![Slider rendering.](slider_default.png)
    /// 
    public init(
        value: Binding<Value>,
        in bounds: ClosedRange<Value> = 0...1,
        step: Value.Stride,
        onEditingChanged: @escaping (Bool) -> Void = { _ in }
    ) where TitleLabel == EmptyView, ValueLabel == EmptyView, MinValueLabel == EmptyView, MaxValueLabel == EmptyView {
        self.init(
            value,
            in: bounds,
            step: step,
            titleLabel: { EmptyView() },
            valueLabel: { EmptyView() },
            minValueLabel: { EmptyView() },
            maxValueLabel: { EmptyView() },
            onEditingChanged: onEditingChanged
        )
    }

    // MARK: - Internal Initialization

    internal init(
        _ value: Binding<Value>,
        in bounds: ClosedRange<Value>,
        step: Value.Stride? = nil,
        rangeValuesAccessibilityLabel: String? = nil,
        titleLabel: @escaping () -> TitleLabel,
        valueLabel: @escaping () -> ValueLabel,
        minValueLabel: @escaping () -> MinValueLabel,
        maxValueLabel: @escaping () -> MaxValueLabel,
        onEditingChanged: @escaping (Bool) -> Void = { _ in }
    ) {
        self._value = value
        self.bounds = bounds
        self.step = step
        self.rangeValuesAccessibilityLabel = rangeValuesAccessibilityLabel
        self.titleLabel = titleLabel
        self.valueLabel = valueLabel
        self.minValueLabel = minValueLabel
        self.maxValueLabel = maxValueLabel
        self.onEditingChanged = onEditingChanged
    }

    // MARK: - View

    public var body: some View {
        SparkVStack(alignment: .leading, spacing: self.viewModel.spacing) {

            // Optional Header
            if !(self.titleLabel() is EmptyView) || !(self.valueLabel() is EmptyView) {
                SparkAdaptiveStack(spacing: self.viewModel.spacing) {
                    self.titleLabel()
                        .font(self.viewModel.typographies.titleFontToken)
                        .foregroundStyle(self.viewModel.colors.titleColorToken)

                    Spacer()

                    // ValueLabel if no floating
                    if !self.isFloatingValueLabel {
                        self.valueStyledLabel()
                    }
                }
            }

            if self.isFloatingValueLabel && !(self.valueLabel() is EmptyView) {
                GeometryReader { geometry in
                    ZStack(alignment: .leading) {

                        // Native slider
                        self.slider()
                        .viewSize { newSize in
                            self.sliderHeight = newSize.height
                        }

                        // Optional Value Label
                        if self.isFloatingValueLabel && !(self.valueLabel() is EmptyView) {
                            self.valueStyledLabel()
                                .viewSize { newSize in
                                    self.floatingValueLabelSize = newSize
                                }
                                .offset(
                                    x: self.valueLabelX(
                                        parentWidth: geometry.size.width,
                                        labelWidth: self.floatingValueLabelSize.width
                                    ),
                                    y: -(self.floatingValueLabelSize.height + self.viewModel.spacing)
                                )
                        }
                    }
                }
                .frame(height: self.sliderHeight)
                .padding(.top, self.floatingValueLabelSize.height + self.viewModel.spacing)
            } else {

                // Native slider
                self.slider()
            }

            // Optional Range Labels
            if !(self.minValueLabel() is EmptyView) || !(self.maxValueLabel() is EmptyView) {
                SparkHStack(spacing: self.viewModel.spacing) {
                    self.minValueLabel()

                    Spacer()

                    self.maxValueLabel()
                }
                .font(self.viewModel.typographies.rangeValuesFontToken)
                .foregroundStyle(self.viewModel.colors.rangeValuesColorToken)
                .accessibilityElement(children: .ignore)
                .accessibilityLabel(optional: self.customRangeValuesAccessibilityLabel ?? self.rangeValuesAccessibilityLabel)
            }
        }
        .accessibilityElement(children: .combine)
        .accessibilityIdentifier(SliderAccessibilityIdentifier.view)
        .sparkSensoryFeedback(.selection, trigger: self.feedbackID)
        .onAppear() {
            self.viewModel.setup(
                theme: self.theme.value,
                intent: self.intent,
                isFloatingValueLabel: self.isFloatingValueLabel,
                isEnabled: self.isEnabled
            )
        }
        .onChange(of: self.theme) { theme in
            self.viewModel.theme = theme.value
        }
        .onChange(of: self.intent) { intent in
            self.viewModel.intent = intent
        }
        .onChange(of: self.isFloatingValueLabel) { isFloatingValueLabel in
            self.viewModel.isFloatingValueLabel = isFloatingValueLabel
        }
        .onChange(of: self.isEnabled) { isEnabled in
            self.viewModel.isEnabled = isEnabled
        }
        .onChange(of: self.value) { value in
            if self.step != nil {
                self.feedbackID = .init()
            }
        }
    }

    // MARK: - Subviews

    private func slider() -> some View {
        Group {
            if let step {
                SwiftUI.Slider(
                    value: self.$value,
                    in: self.bounds,
                    step: step,
                    onEditingChanged: self.onEditingChanged
                )
            } else {
                SwiftUI.Slider(
                    value: self.$value,
                    in: self.bounds,
                    onEditingChanged: self.onEditingChanged
                )
            }
        }
        .tint(self.viewModel.colors.tintColorToken)
        .accessibilityIdentifier(SliderAccessibilityIdentifier.sliderContent)
    }

    private func valueStyledLabel() -> some View {
        self.valueLabel()
            .font(self.viewModel.typographies.valueFontToken)
            .foregroundStyle(self.viewModel.colors.valueColorToken)
            .frame(minWidth: SliderConstants.thumbWidth)
            .accessibilityHidden(true)
    }

    // MARK: - Methods

    private func valueLabelX(parentWidth: CGFloat, labelWidth: CGFloat) -> CGFloat {
        let thumbWidth: CGFloat = SliderConstants.thumbWidth / 2

        // Calculate thumb position
        let availableWidth = parentWidth - (thumbWidth * 2)
        let thumbX = thumbWidth + (availableWidth * CGFloat(self.value))

        // Calculate ideal label position (centered on thumb)
        let idealLabelX = thumbX - (labelWidth / 2)

        // Clamp between 0 and parentWidth - labelWidth
        return max(0, min(idealLabelX, parentWidth - labelWidth))
    }
}
