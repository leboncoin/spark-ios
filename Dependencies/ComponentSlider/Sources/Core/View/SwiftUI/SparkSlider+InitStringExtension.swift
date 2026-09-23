//
//  SparkSlider+InitStringExtension.swift
//  SparkComponentSlider
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
import SparkCommon

public extension SparkSlider {

    // MARK: - Init with String

    /// Creates a slider to select a value from a given range with a title.
    ///
    /// - Parameters:
    ///   - value: The selected value within `bounds`.
    ///   - bounds: The range of the valid values. Defaults to `0...1`.
    ///   - title: A text that describes the current value.
    ///   - onEditingChanged: A callback for when editing begins and ends.
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// struct MyView: View {
    ///     @State private var value: Double = 0.5
    ///     let theme: SparkTheming.Theme = MyTheme()
    ///
    ///     var body: some View {
    ///         SparkSlider(
    ///             value: $value,
    ///             in: 0...1,
    ///             title: "Value"
    ///         )
    ///         .sparkTheme(self.theme)
    ///         .sparkSliderIntent(.main)
    ///     }
    /// }
    /// ```
    ///
    /// ## Rendering
    ///
    /// ![Slider rendering.](slider_title.png)
    ///
    init(
        value: Binding<Value>,
        in bounds: ClosedRange<Value> = 0...1,
        title: String,
        onEditingChanged: @escaping (Bool) -> Void = { _ in }
    ) where TitleLabel == Text, ValueLabel == EmptyView, MinValueLabel == EmptyView, MaxValueLabel == EmptyView {
        self.init(
            value,
            in: bounds,
            titleLabel: { Text(title) },
            valueLabel: { EmptyView() },
            minValueLabel: { EmptyView() },
            maxValueLabel: { EmptyView() },
            onEditingChanged: onEditingChanged
        )
    }

    /// Creates a slider to select a value from a given range with a text value label.
    ///
    /// - Parameters:
    ///   - value: The selected value within `bounds`.
    ///   - bounds: The range of the valid values. Defaults to `0...1`.
    ///   - valueText: A text that describes the current value.
    ///   - onEditingChanged: A callback for when editing begins and ends.
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// struct MyView: View {
    ///     @State private var value: Double = 0.5
    ///     let theme: SparkTheming.Theme = MyTheme()
    ///
    ///     var body: some View {
    ///         SparkSlider(
    ///             value: $value,
    ///             in: 0...1,
    ///             valueText: "Value"
    ///         )
    ///         .sparkTheme(self.theme)
    ///         .sparkSliderIntent(.main)
    ///     }
    /// }
    /// ```
    ///
    /// ## Rendering
    ///
    /// ![Slider rendering.](slider_value.png)
    ///
    init(
        value: Binding<Value>,
        in bounds: ClosedRange<Value> = 0...1,
        valueText: String,
        onEditingChanged: @escaping (Bool) -> Void = { _ in }
    ) where TitleLabel == EmptyView, ValueLabel == Text, MinValueLabel == EmptyView, MaxValueLabel == EmptyView {
        self.init(
            value,
            in: bounds,
            titleLabel: { EmptyView() },
            valueLabel: { Text(valueText) },
            minValueLabel: { EmptyView() },
            maxValueLabel: { EmptyView() },
            onEditingChanged: onEditingChanged
        )
    }

    /// Creates a slider to select a value from a given range with a title and text value label.
    ///
    /// - Parameters:
    ///   - value: The selected value within `bounds`.
    ///   - bounds: The range of the valid values. Defaults to `0...1`.
    ///   - title: The title of the slider.
    ///   - valueText: A text that describes the current value.
    ///   - onEditingChanged: A callback for when editing begins and ends.
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// struct MyView: View {
    ///     @State private var value: Double = 0.5
    ///     let theme: SparkTheming.Theme = MyTheme()
    ///
    ///     var body: some View {
    ///         SparkSlider(
    ///             value: $value,
    ///             in: 0...1,
    ///             title: "My Title",
    ///             valueText: "Value"
    ///         )
    ///         .sparkTheme(self.theme)
    ///         .sparkSliderIntent(.main)
    ///     }
    /// }
    /// ```
    ///
    /// ## Rendering
    ///
    /// ![Slider rendering.](slider_title_and_value.png)
    ///
    init(
        value: Binding<Value>,
        in bounds: ClosedRange<Value> = 0...1,
        title: String,
        valueText: String,
        onEditingChanged: @escaping (Bool) -> Void = { _ in }
    ) where TitleLabel == Text, ValueLabel == Text, MinValueLabel == EmptyView, MaxValueLabel == EmptyView {
        self.init(
            value,
            in: bounds,
            titleLabel: { Text(title) },
            valueLabel: { Text(valueText) },
            minValueLabel: { EmptyView() },
            maxValueLabel: { EmptyView() },
            onEditingChanged: onEditingChanged
        )
    }

    /// Creates a slider to select a value from a given range with text range labels.
    ///
    /// - Parameters:
    ///   - value: The selected value within `bounds`.
    ///   - bounds: The range of the valid values. Defaults to `0...1`.
    ///   - minValueText: A text that describes `bounds.lowerBound` and appears below the slider on the left.
    ///   - maxValueText: A text that describes `bounds.upperBound` and appears below the slider on the right.
    ///   - onEditingChanged: A callback for when editing begins and ends.
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// struct MyView: View {
    ///     @State private var value: Double = 50
    ///     let theme: SparkTheming.Theme = MyTheme()
    ///
    ///     var body: some View {
    ///         SparkSlider(
    ///             value: $value,
    ///             in: 0...100,
    ///             minValueText: "Min",
    ///             maxValueText: "Max"
    ///         )
    ///         .sparkTheme(self.theme)
    ///         .sparkSliderIntent(.main)
    ///     }
    /// }
    /// ```
    ///
    /// ## Rendering
    ///
    /// ![Slider rendering.](slider_range_values.png)
    ///
    init(
        value: Binding<Value>,
        in bounds: ClosedRange<Value> = 0...1,
        minValueText: String,
        maxValueText: String,
        onEditingChanged: @escaping (Bool) -> Void = { _ in }
    ) where TitleLabel == EmptyView, ValueLabel == EmptyView, MinValueLabel == Text, MaxValueLabel == Text {
        self.init(
            value,
            in: bounds,
            rangeValuesAccessibilityLabel: .accessibilityLabel(min: minValueText, max: maxValueText),
            titleLabel: { EmptyView() },
            valueLabel: { EmptyView() },
            minValueLabel: { Text(minValueText) },
            maxValueLabel: { Text(maxValueText) },
            onEditingChanged: onEditingChanged
        )
    }

    /// Creates a slider to select a value from a given range with title and text range labels.
    ///
    /// - Parameters:
    ///   - value: The selected value within `bounds`.
    ///   - bounds: The range of the valid values. Defaults to `0...1`.
    ///   - title: The title of the slider.
    ///   - minValueText: A text that describes `bounds.lowerBound` and appears below the slider on the left.
    ///   - maxValueText: A text that describes `bounds.upperBound` and appears below the slider on the right.
    ///   - onEditingChanged: A callback for when editing begins and ends.
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// struct MyView: View {
    ///     @State private var value: Double = 50
    ///     let theme: SparkTheming.Theme = MyTheme()
    ///
    ///     var body: some View {
    ///         SparkSlider(
    ///             value: $value,
    ///             in: 0...100,
    ///             title: "My Title",
    ///             minValueText: "Min",
    ///             maxValueText: "Max"
    ///         )
    ///         .sparkTheme(self.theme)
    ///         .sparkSliderIntent(.main)
    ///     }
    /// }
    /// ```
    ///
    /// ## Rendering
    ///
    /// ![Slider rendering.](slider_title_and_range_values.png)
    ///
    init(
        value: Binding<Value>,
        in bounds: ClosedRange<Value> = 0...1,
        title: String,
        minValueText: String,
        maxValueText: String,
        onEditingChanged: @escaping (Bool) -> Void = { _ in }
    ) where TitleLabel == Text, ValueLabel == EmptyView, MinValueLabel == Text, MaxValueLabel == Text {
        self.init(
            value,
            in: bounds,
            rangeValuesAccessibilityLabel: .accessibilityLabel(min: minValueText, max: maxValueText),
            titleLabel: { Text(title) },
            valueLabel: { EmptyView() },
            minValueLabel: { Text(minValueText) },
            maxValueLabel: { Text(maxValueText) },
            onEditingChanged: onEditingChanged
        )
    }

    /// Creates a slider to select a value from a given range with text labels for the value and range.
    ///
    /// - Parameters:
    ///   - value: The selected value within `bounds`.
    ///   - bounds: The range of the valid values. Defaults to `0...1`.
    ///   - valueText: A text that describes the current value.
    ///   - minValueText: A text that describes `bounds.lowerBound` and appears below the slider on the left.
    ///   - maxValueText: A text that describes `bounds.upperBound` and appears below the slider on the right.
    ///   - onEditingChanged: A callback for when editing begins and ends.
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// struct MyView: View {
    ///     @State private var value: Double = 50
    ///     let theme: SparkTheming.Theme = MyTheme()
    ///
    ///     var body: some View {
    ///         SparkSlider(
    ///             value: $value,
    ///             in: 0...100,
    ///             valueText: "Current",
    ///             minValueText: "0",
    ///             maxValueText: "100"
    ///         )
    ///         .sparkTheme(self.theme)
    ///         .sparkSliderIntent(.main)
    ///     }
    /// }
    /// ```
    ///
    /// ## Rendering
    ///
    /// ![Slider rendering.](slider_value_and_range_values.png)
    ///
    init(
        value: Binding<Value>,
        in bounds: ClosedRange<Value> = 0...1,
        valueText: String,
        minValueText: String,
        maxValueText: String,
        onEditingChanged: @escaping (Bool) -> Void = { _ in }
    ) where TitleLabel == EmptyView, ValueLabel == Text, MinValueLabel == Text, MaxValueLabel == Text {
            self.init(
                value,
                in: bounds,
                rangeValuesAccessibilityLabel: .accessibilityLabel(min: minValueText, max: maxValueText),
                titleLabel: { EmptyView() },
                valueLabel: { Text(valueText) },
                minValueLabel: { Text(minValueText) },
                maxValueLabel: { Text(maxValueText) },
                onEditingChanged: onEditingChanged
            )
    }

    /// Creates a slider to select a value from a given range with title and text labels for the value and range.
    ///
    /// - Parameters:
    ///   - value: The selected value within `bounds`.
    ///   - bounds: The range of the valid values. Defaults to `0...1`.
    ///   - title: The title of the slider..
    ///   - valueText: A text that describes the current value.
    ///   - minValueText: A text that describes `bounds.lowerBound` and appears below the slider on the left.
    ///   - maxValueText: A text that describes `bounds.upperBound` and appears below the slider on the right.
    ///   - onEditingChanged: A callback for when editing begins and ends.
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// struct MyView: View {
    ///     @State private var value: Double = 50
    ///     let theme: SparkTheming.Theme = MyTheme()
    ///
    ///     var body: some View {
    ///         SparkSlider(
    ///             value: $value,
    ///             in: 0...100,
    ///             title: "My Title",
    ///             valueText: "Current",
    ///             minValueText: "0",
    ///             maxValueText: "100"
    ///         )
    ///         .sparkTheme(self.theme)
    ///         .sparkSliderIntent(.main)
    ///     }
    /// }
    /// ```
    ///
    /// ## Rendering
    ///
    /// ![Slider rendering.](slider_all_values.png)
    ///
    init(
        value: Binding<Value>,
        in bounds: ClosedRange<Value> = 0...1,
        title: String,
        valueText: String,
        minValueText: String,
        maxValueText: String,
        onEditingChanged: @escaping (Bool) -> Void = { _ in }
    ) where TitleLabel == Text, ValueLabel == Text, MinValueLabel == Text, MaxValueLabel == Text {
            self.init(
                value,
                in: bounds,
                rangeValuesAccessibilityLabel: .accessibilityLabel(min: minValueText, max: maxValueText),
                titleLabel: { Text(title) },
                valueLabel: { Text(valueText) },
                minValueLabel: { Text(minValueText) },
                maxValueLabel: { Text(maxValueText) },
                onEditingChanged: onEditingChanged
            )
    }

    // MARK: - Init with String and Step

    /// Creates a slider to select a value from a given range with a title,
    /// subject to a step increment.
    ///
    /// - Parameters:
    ///   - value: The selected value within `bounds`.
    ///   - bounds: The range of the valid values. Defaults to `0...1`.
    ///   - step: The distance between each valid value.
    ///   - title: A title that describes the slider.
    ///   - onEditingChanged: A callback for when editing begins and ends.
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// struct MyView: View {
    ///     @State private var value: Double = 0.5
    ///     let theme: SparkTheming.Theme = MyTheme()
    ///
    ///     var body: some View {
    ///         SparkSlider(
    ///             value: $value,
    ///             in: 0...1,
    ///             step: 0.25,
    ///             title: "My Title"
    ///         )
    ///         .sparkTheme(self.theme)
    ///         .sparkSliderIntent(.main)
    ///     }
    /// }
    /// ```
    ///
    /// ## Rendering
    ///
    /// ![Slider rendering.](slider_title.png)
    ///
    init(
        value: Binding<Value>,
        in bounds: ClosedRange<Value> = 0...1,
        step: Value.Stride,
        title: String,
        onEditingChanged: @escaping (Bool) -> Void = { _ in }
    ) where TitleLabel == Text, ValueLabel == EmptyView, MinValueLabel == EmptyView, MaxValueLabel == EmptyView {
            self.init(
                value,
                in: bounds,
                step: step,
                titleLabel: { Text(title) },
                valueLabel: { EmptyView() },
                minValueLabel: { EmptyView() },
                maxValueLabel: { EmptyView() },
                onEditingChanged: onEditingChanged
            )
    }

    /// Creates a slider to select a value from a given range with a text value label,
    /// subject to a step increment.
    ///
    /// - Parameters:
    ///   - value: The selected value within `bounds`.
    ///   - bounds: The range of the valid values. Defaults to `0...1`.
    ///   - step: The distance between each valid value.
    ///   - valueText: A text that describes the current value.
    ///   - onEditingChanged: A callback for when editing begins and ends.
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// struct MyView: View {
    ///     @State private var value: Double = 0.5
    ///     let theme: SparkTheming.Theme = MyTheme()
    ///
    ///     var body: some View {
    ///         SparkSlider(
    ///             value: $value,
    ///             in: 0...1,
    ///             step: 0.25,
    ///             valueText: "Value"
    ///         )
    ///         .sparkTheme(self.theme)
    ///         .sparkSliderIntent(.main)
    ///     }
    /// }
    /// ```
    ///
    /// ## Rendering
    ///
    /// ![Slider rendering.](slider_value.png)
    ///
    init(
        value: Binding<Value>,
        in bounds: ClosedRange<Value> = 0...1,
        step: Value.Stride,
        valueText: String,
        onEditingChanged: @escaping (Bool) -> Void = { _ in }
    ) where TitleLabel == EmptyView, ValueLabel == Text, MinValueLabel == EmptyView, MaxValueLabel == EmptyView {
            self.init(
                value,
                in: bounds,
                step: step,
                titleLabel: { EmptyView() },
                valueLabel: { Text(valueText) },
                minValueLabel: { EmptyView() },
                maxValueLabel: { EmptyView() },
                onEditingChanged: onEditingChanged
            )
    }

    /// Creates a slider to select a value from a given range with a title and text value label,
    /// subject to a step increment.
    ///
    /// - Parameters:
    ///   - value: The selected value within `bounds`.
    ///   - bounds: The range of the valid values. Defaults to `0...1`.
    ///   - step: The distance between each valid value.
    ///   - title: The title of the slider.
    ///   - valueText: A text that describes the current value.
    ///   - onEditingChanged: A callback for when editing begins and ends.
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// struct MyView: View {
    ///     @State private var value: Double = 0.5
    ///     let theme: SparkTheming.Theme = MyTheme()
    ///
    ///     var body: some View {
    ///         SparkSlider(
    ///             value: $value,
    ///             in: 0...1,
    ///             step: 0.25,
    ///             title: "My Title",
    ///             valueText: "Value"
    ///         )
    ///         .sparkTheme(self.theme)
    ///         .sparkSliderIntent(.main)
    ///     }
    /// }
    /// ```
    ///
    /// ## Rendering
    ///
    /// ![Slider rendering.](slider_title_and_value.png)
    ///
    init(
        value: Binding<Value>,
        in bounds: ClosedRange<Value> = 0...1,
        step: Value.Stride,
        title: String,
        valueText: String,
        onEditingChanged: @escaping (Bool) -> Void = { _ in }
    ) where TitleLabel == Text, ValueLabel == Text, MinValueLabel == EmptyView, MaxValueLabel == EmptyView {
            self.init(
                value,
                in: bounds,
                step: step,
                titleLabel: { Text(title) },
                valueLabel: { Text(valueText) },
                minValueLabel: { EmptyView() },
                maxValueLabel: { EmptyView() },
                onEditingChanged: onEditingChanged
            )
    }

    /// Creates a slider to select a value from a given range with text range labels,
    /// subject to a step increment.
    ///
    /// - Parameters:
    ///   - value: The selected value within `bounds`.
    ///   - bounds: The range of the valid values. Defaults to `0...1`.
    ///   - step: The distance between each valid value.
    ///   - minValueText: A text that describes `bounds.lowerBound` and appears below the slider on the left.
    ///   - maxValueText: A text that describes `bounds.upperBound` and appears below the slider on the right.
    ///   - onEditingChanged: A callback for when editing begins and ends.
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// struct MyView: View {
    ///     @State private var value: Double = 50
    ///     let theme: SparkTheming.Theme = MyTheme()
    ///
    ///     var body: some View {
    ///         SparkSlider(
    ///             value: $value,
    ///             in: 0...100,
    ///             step: 10,
    ///             minValueText: "Min",
    ///             maxValueText: "Max"
    ///         )
    ///         .sparkTheme(self.theme)
    ///         .sparkSliderIntent(.main)
    ///     }
    /// }
    /// ```
    ///
    /// ## Rendering
    ///
    /// ![Slider rendering.](slider_range_values.png)
    ///
    init(
        value: Binding<Value>,
        in bounds: ClosedRange<Value> = 0...1,
        step: Value.Stride,
        minValueText: String,
        maxValueText: String,
        onEditingChanged: @escaping (Bool) -> Void = { _ in }
    ) where TitleLabel == EmptyView, ValueLabel == EmptyView, MinValueLabel == Text, MaxValueLabel == Text {
        self.init(
            value,
            in: bounds,
            step: step,
            rangeValuesAccessibilityLabel: .accessibilityLabel(min: minValueText, max: maxValueText),
            titleLabel: { EmptyView() },
            valueLabel: { EmptyView() },
            minValueLabel: { Text(minValueText) },
            maxValueLabel: { Text(maxValueText) },
            onEditingChanged: onEditingChanged
        )
    }

    /// Creates a slider to select a value from a given range with title and text range labels,
    /// subject to a step increment.
    ///
    /// - Parameters:
    ///   - value: The selected value within `bounds`.
    ///   - bounds: The range of the valid values. Defaults to `0...1`.
    ///   - step: The distance between each valid value.
    ///   - title: The title of the slider.
    ///   - minValueText: A text that describes `bounds.lowerBound` and appears below the slider on the left.
    ///   - maxValueText: A text that describes `bounds.upperBound` and appears below the slider on the right.
    ///   - onEditingChanged: A callback for when editing begins and ends.
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// struct MyView: View {
    ///     @State private var value: Double = 50
    ///     let theme: SparkTheming.Theme = MyTheme()
    ///
    ///     var body: some View {
    ///         SparkSlider(
    ///             value: $value,
    ///             in: 0...100,
    ///             step: 10,
    ///             title: "My Title",
    ///             minValueText: "Min",
    ///             maxValueText: "Max"
    ///         )
    ///         .sparkTheme(self.theme)
    ///         .sparkSliderIntent(.main)
    ///     }
    /// }
    /// ```
    ///
    /// ## Rendering
    ///
    /// ![Slider rendering.](slider_title_and_range_values.png)
    ///
    init(
        value: Binding<Value>,
        in bounds: ClosedRange<Value> = 0...1,
        step: Value.Stride,
        title: String,
        minValueText: String,
        maxValueText: String,
        onEditingChanged: @escaping (Bool) -> Void = { _ in }
    ) where TitleLabel == Text, ValueLabel == EmptyView, MinValueLabel == Text, MaxValueLabel == Text {
        self.init(
            value,
            in: bounds,
            step: step,
            rangeValuesAccessibilityLabel: .accessibilityLabel(min: minValueText, max: maxValueText),
            titleLabel: { Text(title) },
            valueLabel: { EmptyView() },
            minValueLabel: { Text(minValueText) },
            maxValueLabel: { Text(maxValueText) },
            onEditingChanged: onEditingChanged
        )
    }

    /// Creates a slider to select a value from a given range with text labels for the value and range,
    /// subject to a step increment.
    ///
    /// - Parameters:
    ///   - value: The selected value within `bounds`.
    ///   - bounds: The range of the valid values. Defaults to `0...1`.
    ///   - step: The distance between each valid value.
    ///   - valueText: A text that describes the current value.
    ///   - minValueText: A text that describes `bounds.lowerBound` and appears below the slider on the left.
    ///   - maxValueText: A text that describes `bounds.upperBound` and appears below the slider on the right.
    ///   - onEditingChanged: A callback for when editing begins and ends.
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// struct MyView: View {
    ///     @State private var value: Double = 50
    ///     let theme: SparkTheming.Theme = MyTheme()
    ///
    ///     var body: some View {
    ///         SparkSlider(
    ///             value: $value,
    ///             in: 0...100,
    ///             step: 10,
    ///             valueText: "Current",
    ///             minValueText: "0",
    ///             maxValueText: "100"
    ///         )
    ///         .sparkTheme(self.theme)
    ///         .sparkSliderIntent(.main)
    ///     }
    /// }
    /// ```
    ///
    /// ## Rendering
    ///
    /// ![Slider rendering.](slider_value_and_range_values.png)
    ///
    init(
        value: Binding<Value>,
        in bounds: ClosedRange<Value> = 0...1,
        step: Value.Stride,
        valueText: String,
        minValueText: String,
        maxValueText: String,
        onEditingChanged: @escaping (Bool) -> Void = { _ in }
    ) where TitleLabel == EmptyView, ValueLabel == Text, MinValueLabel == Text, MaxValueLabel == Text {
        self.init(
            value,
            in: bounds,
            step: step,
            rangeValuesAccessibilityLabel: .accessibilityLabel(min: minValueText, max: maxValueText),
            titleLabel: { EmptyView() },
            valueLabel: { Text(valueText) },
            minValueLabel: { Text(minValueText) },
            maxValueLabel: { Text(maxValueText) },
            onEditingChanged: onEditingChanged
        )
    }

    /// Creates a slider to select a value from a given range with title and text labels for the value and range,
    /// subject to a step increment.
    ///
    /// - Parameters:
    ///   - value: The selected value within `bounds`.
    ///   - bounds: The range of the valid values. Defaults to `0...1`.
    ///   - step: The distance between each valid value.
    ///   - title: The title of the slider.
    ///   - valueText: A text that describes the current value.
    ///   - minValueText: A text that describes `bounds.lowerBound` and appears below the slider on the left.
    ///   - maxValueText: A text that describes `bounds.upperBound` and appears below the slider on the right.
    ///   - onEditingChanged: A callback for when editing begins and ends.
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// struct MyView: View {
    ///     @State private var value: Double = 50
    ///     let theme: SparkTheming.Theme = MyTheme()
    ///
    ///     var body: some View {
    ///         SparkSlider(
    ///             value: $value,
    ///             in: 0...100,
    ///             step: 10,
    ///             title: "My Title",
    ///             valueText: "Current",
    ///             minValueText: "0",
    ///             maxValueText: "100"
    ///         )
    ///         .sparkTheme(self.theme)
    ///         .sparkSliderIntent(.main)
    ///     }
    /// }
    /// ```
    ///
    /// ## Rendering
    ///
    /// ![Slider rendering.](slider_all_values.png)
    ///
    init(
        value: Binding<Value>,
        in bounds: ClosedRange<Value> = 0...1,
        step: Value.Stride,
        title: String,
        valueText: String,
        minValueText: String,
        maxValueText: String,
        onEditingChanged: @escaping (Bool) -> Void = { _ in }
    ) where TitleLabel == Text, ValueLabel == Text, MinValueLabel == Text, MaxValueLabel == Text {
        self.init(
            value,
            in: bounds,
            step: step,
            rangeValuesAccessibilityLabel: .accessibilityLabel(min: minValueText, max: maxValueText),
            titleLabel: { Text(title) },
            valueLabel: { Text(valueText) },
            minValueLabel: { Text(minValueText) },
            maxValueLabel: { Text(maxValueText) },
            onEditingChanged: onEditingChanged
        )
    }
}
