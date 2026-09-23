//
//  SparkSlider+InitLabelExtension.swift
//  SparkComponentSlider
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
import SparkCommon

public extension SparkSlider {

    // MARK: - Init with Labels

    /// Creates a slider to select a value from a given range with a custom title label.
    ///
    /// - Parameters:
    ///   - value: The selected value within `bounds`.
    ///   - bounds: The range of the valid values. Defaults to `0...1`.
    ///   - titleLabel: A view that describes the slider.
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
    ///             titleLabel: {
    ///                 Text("My Title")
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
    /// ![Slider rendering.](slider_title.png)
    init(
        value: Binding<Value>,
        in bounds: ClosedRange<Value> = 0...1,
        @ViewBuilder titleLabel: @escaping () -> TitleLabel,
        onEditingChanged: @escaping (Bool) -> Void = { _ in }
    ) where ValueLabel == EmptyView, MinValueLabel == EmptyView, MaxValueLabel == EmptyView {
        self.init(
            value,
            in: bounds,
            titleLabel: titleLabel,
            valueLabel: { EmptyView() },
            minValueLabel: { EmptyView() },
            maxValueLabel: { EmptyView() },
            onEditingChanged: onEditingChanged
        )
    }

    /// Creates a slider to select a value from a given range with a custom value label.
    ///
    /// - Parameters:
    ///   - value: The selected value within `bounds`.
    ///   - bounds: The range of the valid values. Defaults to `0...1`.
    ///   - valueLabel: A view that describes the current value.
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
    ///             valueLabel: {
    ///                 Text("\(Int(value * 100))%")
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
    /// ![Slider rendering.](slider_value.png)
    init(
        value: Binding<Value>,
        in bounds: ClosedRange<Value> = 0...1,
        @ViewBuilder valueLabel: @escaping () -> ValueLabel,
        onEditingChanged: @escaping (Bool) -> Void = { _ in }
    ) where TitleLabel == EmptyView, MinValueLabel == EmptyView, MaxValueLabel == EmptyView {
        self.init(
            value,
            in: bounds,
            titleLabel: { EmptyView() },
            valueLabel: valueLabel,
            minValueLabel: { EmptyView() },
            maxValueLabel: { EmptyView() },
            onEditingChanged: onEditingChanged
        )
    }

    /// Creates a slider to select a value from a given range with a title and custom value label.
    ///
    /// - Parameters:
    ///   - value: The selected value within `bounds`.
    ///   - bounds: The range of the valid values. Defaults to `0...1`.
    ///   - titleLabel: A view that displays the title of the slider.
    ///   - valueLabel: A view that describes the current value.
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
    ///             titleLabel: {
    ///                 Text("My Title")
    ///             },
    ///             valueLabel: {
    ///                 Text("\(Int(value * 100))%")
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
    /// ![Slider rendering.](slider_title_and_value.png)
    init(
        value: Binding<Value>,
        in bounds: ClosedRange<Value> = 0...1,
        @ViewBuilder titleLabel: @escaping () -> TitleLabel,
        @ViewBuilder valueLabel: @escaping () -> ValueLabel,
        onEditingChanged: @escaping (Bool) -> Void = { _ in }
    ) where MinValueLabel == EmptyView, MaxValueLabel == EmptyView {
        self.init(
            value,
            in: bounds,
            titleLabel: titleLabel,
            valueLabel: valueLabel,
            minValueLabel: { EmptyView() },
            maxValueLabel: { EmptyView() },
            onEditingChanged: onEditingChanged
        )
    }

    /// Creates a slider to select a value from a given range with custom range labels.
    ///
    /// - Parameters:
    ///   - value: The selected value within `bounds`.
    ///   - bounds: The range of the valid values. Defaults to `0...1`.
    ///   - minValueLabel: A view that describes `bounds.lowerBound` and appears below the slider on the left.
    ///   - maxValueLabel: A view that describes `bounds.upperBound` and appears below the slider on the right.
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
    ///             minValueLabel: {
    ///                 Text("Min")
    ///             },
    ///             maxValueLabel: {
    ///                 Text("Max")
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
    /// ![Slider rendering.](slider_range_values.png)
    ///
    init(
        value: Binding<Value>,
        in bounds: ClosedRange<Value> = 0...1,
        @ViewBuilder minValueLabel: @escaping () -> MinValueLabel,
        @ViewBuilder maxValueLabel: @escaping () -> MaxValueLabel,
        onEditingChanged: @escaping (Bool) -> Void = { _ in }
    ) where TitleLabel == EmptyView, ValueLabel == EmptyView {
        self.init(
            value,
            in: bounds,
            titleLabel: { EmptyView() },
            valueLabel: { EmptyView() },
            minValueLabel: minValueLabel,
            maxValueLabel: maxValueLabel,
            onEditingChanged: onEditingChanged
        )
    }

    /// Creates a slider to select a value from a given range with title and custom range labels.
    ///
    /// - Parameters:
    ///   - value: The selected value within `bounds`.
    ///   - bounds: The range of the valid values. Defaults to `0...1`.
    ///   - titleLabel: A view that displays the title of the slider.
    ///   - minValueLabel: A view that describes `bounds.lowerBound` and appears below the slider on the left.
    ///   - maxValueLabel: A view that describes `bounds.upperBound` and appears below the slider on the right.
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
    ///             titleLabel: {
    ///                 Text("My Title")
    ///             },
    ///             minValueLabel: {
    ///                 Text("Min")
    ///             },
    ///             maxValueLabel: {
    ///                 Text("Max")
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
    /// ![Slider rendering.](slider_title_and_range_values.png)
    ///
    init(
        value: Binding<Value>,
        in bounds: ClosedRange<Value> = 0...1,
        @ViewBuilder titleLabel: @escaping () -> TitleLabel,
        @ViewBuilder minValueLabel: @escaping () -> MinValueLabel,
        @ViewBuilder maxValueLabel: @escaping () -> MaxValueLabel,
        onEditingChanged: @escaping (Bool) -> Void = { _ in }
    ) where ValueLabel == EmptyView {
        self.init(
            value,
            in: bounds,
            titleLabel: titleLabel,
            valueLabel: { EmptyView() },
            minValueLabel: minValueLabel,
            maxValueLabel: maxValueLabel,
            onEditingChanged: onEditingChanged
        )
    }

    /// Creates a slider to select a value from a given range with custom labels for the value and range.
    ///
    /// - Parameters:
    ///   - value: The selected value within `bounds`.
    ///   - bounds: The range of the valid values. Defaults to `0...1`.
    ///   - valueLabel: A view that describes the current value.
    ///   - minValueLabel: A view that describes `bounds.lowerBound` and appears below the slider on the left.
    ///   - maxValueLabel: A view that describes `bounds.upperBound` and appears below the slider on the right.
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
    ///             valueLabel: {
    ///                 Text("\(Int(value))")
    ///             },
    ///             minValueLabel: {
    ///                 Text("0")
    ///             },
    ///             maxValueLabel: {
    ///                 Text("100")
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
    /// ![Slider rendering.](slider_value_and_range_values.png)
    ///
    init(
        value: Binding<Value>,
        in bounds: ClosedRange<Value> = 0...1,
        @ViewBuilder valueLabel: @escaping () -> ValueLabel,
        @ViewBuilder minValueLabel: @escaping () -> MinValueLabel,
        @ViewBuilder maxValueLabel: @escaping () -> MaxValueLabel,
        onEditingChanged: @escaping (Bool) -> Void = { _ in }
    ) where TitleLabel == EmptyView {
        self.init(
            value,
            in: bounds,
            titleLabel: { EmptyView() },
            valueLabel: valueLabel,
            minValueLabel: minValueLabel,
            maxValueLabel: maxValueLabel,
            onEditingChanged: onEditingChanged
        )
    }

    /// Creates a slider to select a value from a given range with title and custom labels for the value and range.
    ///
    /// - Parameters:
    ///   - value: The selected value within `bounds`.
    ///   - bounds: The range of the valid values. Defaults to `0...1`.
    ///   - titleLabel: A view that displays the title of the slider.
    ///   - valueLabel: A view that describes the current value.
    ///   - minValueLabel: A view that describes `bounds.lowerBound` and appears below the slider on the left.
    ///   - maxValueLabel: A view that describes `bounds.upperBound` and appears below the slider on the right.
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
    ///             titleLabel: {
    ///                 Text("My Title")
    ///             },
    ///             valueLabel: {
    ///                 Text("\(Int(value))")
    ///             },
    ///             minValueLabel: {
    ///                 Text("0")
    ///             },
    ///             maxValueLabel: {
    ///                 Text("100")
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
    /// ![Slider rendering.](slider_all_values.png)
    ///
    init(
        value: Binding<Value>,
        in bounds: ClosedRange<Value> = 0...1,
        @ViewBuilder titleLabel: @escaping () -> TitleLabel,
        @ViewBuilder valueLabel: @escaping () -> ValueLabel,
        @ViewBuilder minValueLabel: @escaping () -> MinValueLabel,
        @ViewBuilder maxValueLabel: @escaping () -> MaxValueLabel,
        onEditingChanged: @escaping (Bool) -> Void = { _ in }
    ) {
        self.init(
            value,
            in: bounds,
            titleLabel: titleLabel,
            valueLabel: valueLabel,
            minValueLabel: minValueLabel,
            maxValueLabel: maxValueLabel,
            onEditingChanged: onEditingChanged
        )
    }

    // MARK: - Init with String Values and Step

    /// Creates a slider to select a value from a given range with a title,
    /// subject to a step increment.
    ///
    /// - Parameters:
    ///   - value: The selected value within `bounds`.
    ///   - bounds: The range of the valid values. Defaults to `0...1`.
    ///   - step: The distance between each valid value.
    ///   - titleLabel: A view that describes the slide.
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
    ///             titleLabel: {
    ///                 Text("My Title")
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
    /// ![Slider rendering.](slider_title.png)
    ///
    init(
        value: Binding<Value>,
        in bounds: ClosedRange<Value> = 0...1,
        step: Value.Stride,
        @ViewBuilder titleLabel: @escaping () -> TitleLabel,
        onEditingChanged: @escaping (Bool) -> Void = { _ in }
    ) where ValueLabel == EmptyView, MinValueLabel == EmptyView, MaxValueLabel == EmptyView {
        self.init(
            value,
            in: bounds,
            step: step,
            titleLabel: titleLabel,
            valueLabel: { EmptyView() },
            minValueLabel: { EmptyView() },
            maxValueLabel: { EmptyView() },
            onEditingChanged: onEditingChanged
        )
    }

    /// Creates a slider to select a value from a given range with a custom value label,
    /// subject to a step increment.
    ///
    /// - Parameters:
    ///   - value: The selected value within `bounds`.
    ///   - bounds: The range of the valid values. Defaults to `0...1`.
    ///   - step: The distance between each valid value.
    ///   - valueLabel: A view that describes the current value.
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
    ///             valueLabel: {
    ///                 Text("\(Int(value * 100))%")
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
    /// ![Slider rendering.](slider_value.png)
    ///
    init(
        value: Binding<Value>,
        in bounds: ClosedRange<Value> = 0...1,
        step: Value.Stride,
        @ViewBuilder valueLabel: @escaping () -> ValueLabel,
        onEditingChanged: @escaping (Bool) -> Void = { _ in }
    ) where TitleLabel == EmptyView, MinValueLabel == EmptyView, MaxValueLabel == EmptyView {
        self.init(
            value,
            in: bounds,
            step: step,
            titleLabel: { EmptyView() },
            valueLabel: valueLabel,
            minValueLabel: { EmptyView() },
            maxValueLabel: { EmptyView() },
            onEditingChanged: onEditingChanged
        )
    }

    /// Creates a slider to select a value from a given range with a title and custom value label,
    /// subject to a step increment.
    ///
    /// - Parameters:
    ///   - value: The selected value within `bounds`.
    ///   - bounds: The range of the valid values. Defaults to `0...1`.
    ///   - step: The distance between each valid value.
    ///   - titleLabel: A view that displays the title of the slider.
    ///   - valueLabel: A view that describes the current value.
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
    ///             titleLabel: {
    ///                 Text("My Title")
    ///             },
    ///             valueLabel: {
    ///                 Text("\(Int(value * 100))%")
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
    /// ![Slider rendering.](slider_title_and_value.png)
    ///
    init(
        value: Binding<Value>,
        in bounds: ClosedRange<Value> = 0...1,
        step: Value.Stride,
        @ViewBuilder titleLabel: @escaping () -> TitleLabel,
        @ViewBuilder valueLabel: @escaping () -> ValueLabel,
        onEditingChanged: @escaping (Bool) -> Void = { _ in }
    ) where MinValueLabel == EmptyView, MaxValueLabel == EmptyView {
        self.init(
            value,
            in: bounds,
            step: step,
            titleLabel: titleLabel,
            valueLabel: valueLabel,
            minValueLabel: { EmptyView() },
            maxValueLabel: { EmptyView() },
            onEditingChanged: onEditingChanged
        )
    }

    /// Creates a slider to select a value from a given range with custom range labels,
    /// subject to a step increment.
    ///
    /// - Parameters:
    ///   - value: The selected value within `bounds`.
    ///   - bounds: The range of the valid values. Defaults to `0...1`.
    ///   - step: The distance between each valid value.
    ///   - minValueLabel: A view that describes `bounds.lowerBound` and appears below the slider on the left.
    ///   - maxValueLabel: A view that describes `bounds.upperBound` and appears below the slider on the right.
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
    ///             minValueLabel: {
    ///                 Text("Min")
    ///             },
    ///             maxValueLabel: {
    ///                 Text("Max")
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
    /// ![Slider rendering.](slider_range_values.png)
    ///
    init(
        value: Binding<Value>,
        in bounds: ClosedRange<Value> = 0...1,
        step: Value.Stride,
        @ViewBuilder minValueLabel: @escaping () -> MinValueLabel,
        @ViewBuilder maxValueLabel: @escaping () -> MaxValueLabel,
        onEditingChanged: @escaping (Bool) -> Void = { _ in }
    ) where TitleLabel == EmptyView, ValueLabel == EmptyView {
        self.init(
            value,
            in: bounds,
            step: step,
            titleLabel: { EmptyView() },
            valueLabel: { EmptyView() },
            minValueLabel: minValueLabel,
            maxValueLabel: maxValueLabel,
            onEditingChanged: onEditingChanged
        )
    }

    /// Creates a slider to select a value from a given range with title and custom range labels,
    /// subject to a step increment.
    ///
    /// - Parameters:
    ///   - value: The selected value within `bounds`.
    ///   - bounds: The range of the valid values. Defaults to `0...1`.
    ///   - step: The distance between each valid value.
    ///   - titleLabel: A view that displays the title of the slider.
    ///   - minValueLabel: A view that describes `bounds.lowerBound` and appears below the slider on the left.
    ///   - maxValueLabel: A view that describes `bounds.upperBound` and appears below the slider on the right.
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
    ///             titleLabel: {
    ///                 Text("My Title")
    ///             },
    ///             minValueLabel: {
    ///                 Text("Min")
    ///             },
    ///             maxValueLabel: {
    ///                 Text("Max")
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
    /// ![Slider rendering.](slider_title_and_range_values.png)
    ///
    init(
        value: Binding<Value>,
        in bounds: ClosedRange<Value> = 0...1,
        step: Value.Stride,
        @ViewBuilder titleLabel: @escaping () -> TitleLabel,
        @ViewBuilder minValueLabel: @escaping () -> MinValueLabel,
        @ViewBuilder maxValueLabel: @escaping () -> MaxValueLabel,
        onEditingChanged: @escaping (Bool) -> Void = { _ in }
    ) where ValueLabel == EmptyView {
        self.init(
            value,
            in: bounds,
            step: step,
            titleLabel: titleLabel,
            valueLabel: { EmptyView() },
            minValueLabel: minValueLabel,
            maxValueLabel: maxValueLabel,
            onEditingChanged: onEditingChanged
        )
    }

    /// Creates a slider to select a value from a given range with custom labels for the value and range,
    /// subject to a step increment.
    ///
    /// - Parameters:
    ///   - value: The selected value within `bounds`.
    ///   - bounds: The range of the valid values. Defaults to `0...1`.
    ///   - step: The distance between each valid value.
    ///   - valueLabel: A view that describes the current value.
    ///   - minValueLabel: A view that describes `bounds.lowerBound` and appears below the slider on the left.
    ///   - maxValueLabel: A view that describes `bounds.upperBound` and appears below the slider on the right.
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
    ///             valueLabel: {
    ///                 Text("\(Int(value))")
    ///             },
    ///             minValueLabel: {
    ///                 Text("0")
    ///             },
    ///             maxValueLabel: {
    ///                 Text("100")
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
    /// ![Slider rendering.](slider_value_and_range_values.png)
    ///
    init(
        value: Binding<Value>,
        in bounds: ClosedRange<Value> = 0...1,
        step: Value.Stride,
        @ViewBuilder valueLabel: @escaping () -> ValueLabel,
        @ViewBuilder minValueLabel: @escaping () -> MinValueLabel,
        @ViewBuilder maxValueLabel: @escaping () -> MaxValueLabel,
        onEditingChanged: @escaping (Bool) -> Void = { _ in }
    ) where TitleLabel == EmptyView {
        self.init(
            value,
            in: bounds,
            step: step,
            titleLabel: { EmptyView() },
            valueLabel: valueLabel,
            minValueLabel: minValueLabel,
            maxValueLabel: maxValueLabel,
            onEditingChanged: onEditingChanged
        )
    }

    /// Creates a slider to select a value from a given range with title and custom labels for the value and range,
    /// subject to a step increment.
    ///
    /// - Parameters:
    ///   - value: The selected value within `bounds`.
    ///   - bounds: The range of the valid values. Defaults to `0...1`.
    ///   - step: The distance between each valid value.
    ///   - titleLabel: A view that displays the title of the slider.
    ///   - valueLabel: A view that describes the current value.
    ///   - minValueLabel: A view that describes `bounds.lowerBound` and appears below the slider on the left.
    ///   - maxValueLabel: A view that describes `bounds.upperBound` and appears below the slider on the right.
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
    ///             titleLabel: {
    ///                 Text("My Title")
    ///             },
    ///             valueLabel: {
    ///                 Text("\(Int(value))")
    ///             },
    ///             minValueLabel: {
    ///                 Text("0")
    ///             },
    ///             maxValueLabel: {
    ///                 Text("100")
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
    /// ![Slider rendering.](slider_all_values.png)
    ///
    init(
        value: Binding<Value>,
        in bounds: ClosedRange<Value> = 0...1,
        step: Value.Stride,
        @ViewBuilder titleLabel: @escaping () -> TitleLabel,
        @ViewBuilder valueLabel: @escaping () -> ValueLabel,
        @ViewBuilder minValueLabel: @escaping () -> MinValueLabel,
        @ViewBuilder maxValueLabel: @escaping () -> MaxValueLabel,
        onEditingChanged: @escaping (Bool) -> Void = { _ in }
    ) {
        self.init(
            value,
            in: bounds,
            step: step,
            titleLabel: titleLabel,
            valueLabel: valueLabel,
            minValueLabel: minValueLabel,
            maxValueLabel: maxValueLabel,
            onEditingChanged: onEditingChanged
        )
    }
}
