//
//  SparkCircularMeter.swift
//  SparkComponentCircularMeter
//
//  Created by robin.lemaire on 28/05/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
import SparkTheming
@_spi(SI_SPI) import SparkCommon

/// The circular meter displays a circular progress indicator with optional value, label, icon, or image.
///
/// ## Context
///
/// The component supports four main variants:
/// - **Value only**: Displays just the percentage value
/// - **Value with label**: Displays value with a descriptive label
/// - **Icon**: Displays an icon inside the circle
/// - **Image**: Displays an image inside the circle
///
/// The **value** parameter represents progress from **0.0 to 1.0** (0% to 100%).
///
/// ## Example of usage
///
/// ### Value only
///
/// ```swift
/// struct MyView: View {
///     let theme: SparkTheming.Theme = MyTheme()
///
///     var body: some View {
///         SparkCircularMeter(value: 0.70)
///             .sparkTheme(self.theme)
///             .sparkCircularMeterIntent(.success)
///             .sparkCircularMeterSize(.large)
///     }
/// }
/// ```
///
/// ### Value with label
///
/// ```swift
/// struct MyView: View {
///     let theme: SparkTheming.Theme = MyTheme()
///
///     var body: some View {
///         SparkCircularMeter(
///             value: 0.70,
///             valueText: "70%",
///             contentText: "Label"
///         )
///         .sparkTheme(self.theme)
///         .sparkCircularMeterIntent(.success)
///         .sparkCircularMeterSize(.large)
///     }
/// }
/// ```
///
/// ### With icon
///
/// ```swift
/// struct MyView: View {
///     let theme: SparkTheming.Theme = MyTheme()
///
///     var body: some View {
///         SparkCircularMeter(
///             value: 0.70,
///             icon: Image(systemName: "checkmark"),
///             contentText: "Label"
///         )
///         .sparkTheme(self.theme)
///         .sparkCircularMeterIntent(.success)
///         .sparkCircularMeterSize(.large)
///     }
/// }
/// ```
///
/// ### With image
///
/// ```swift
/// struct MyView: View {
///     let theme: SparkTheming.Theme = MyTheme()
///
///     var body: some View {
///         SparkCircularMeter(
///             value: 0.70,
///             image: Image("panda")
///         )
///         .sparkTheme(self.theme)
///         .sparkCircularMeterIntent(.success)
///         .sparkCircularMeterSize(.large)
///     }
/// }
/// ```
///
/// ## EnvironmentValues
///
/// This component uses these EnvironmentValues:
/// - **theme**: ``sparkTheme(_:)`` (View extension)
/// - **intent**: ``sparkCircularMeterIntent(_:)`` (View extension)
/// - **size**: ``sparkCircularMeterSize(_:)`` (View extension)
///
/// > If these values are not set, default values will be applied.
///
/// > **YOU MUST PROVIDE ``sparkTheme(_:)``**
///
/// ## Accessibility
///
/// You should set an **accessibilityLabel** to provide context.
///
/// By default, the component sets an **accessibilityValue** with the percentage.
/// To override this value, set a new **accessibilityValue**.
///
/// ## Rendering
///
/// ### Sizes
///
/// | Small | Medium | Large | Extra Large |
/// |:---:|:---:|:---:|:---:|
/// | ![Small size](circularmeter_small.png) | ![Medium size](circularmeter_medium.png) | ![Large size](circularmeter_large.png) | ![Extra large size](circularmeter_xLarge.png) |
///
/// ### Display Types
///
/// | Value | Text | Icon | Image |
/// |:---:|:---:|:---:|:---:|
/// | ![Value](circularmeter_value.png) | ![Text display](circularmeter_text.png) | ![Icon display](circularmeter_icon.png) | ![Image display](circularmeter_image.png) |
///
public struct SparkCircularMeter<ValueLabel, ContentLabel>: View where ValueLabel: View, ContentLabel: View {

    // MARK: - Properties

    private let value: Double
    private let icon: Image?
    private let image: Image?

    private let valueLabel: () -> ValueLabel
    private let contentLabel: () -> ContentLabel

    @Environment(\.theme) private var theme
    @Environment(\.circularMeterIntent) private var intent
    @Environment(\.circularMeterSize) private var size

    @StateObject private var viewModel = CircularMeterViewModel()

    // MARK: - Public Initialization

    /// Create a circular meter with only a value displayed inside.
    ///
    /// - Parameters:
    ///   - value: The progress value from 0.0 to 1.0.
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// struct MyView: View {
    ///     let theme: SparkTheming.Theme = MyTheme()
    ///
    ///     var body: some View {
    ///         SparkCircularMeter(value: 0.70)
    ///             .sparkTheme(self.theme)
    ///             .sparkCircularMeterIntent(.success)
    ///             .sparkCircularMeterSize(.large)
    ///     }
    /// }
    /// ```
    ///
    /// ## Rendering
    ///
    /// ![Image display](circularmeter_value.png)
    public init(
        value: Double
    ) where ValueLabel == Text, ContentLabel == EmptyView {
        self.init(
            value: value,
            icon: nil,
            image: nil,
            valueLabel: { Text(value.validatedValue.toPercentageString()) },
            contentLabel: { EmptyView() }
        )
    }

    // MARK: - Internal Initialization

    internal init(
        value: Double,
        icon: Image?,
        image: Image?,
        @ViewBuilder valueLabel: @escaping () -> ValueLabel,
        @ViewBuilder contentLabel: @escaping () -> ContentLabel
    ) {
        self.value = value.validatedValue
        self.icon = icon
        self.image = image
        self.valueLabel = valueLabel
        self.contentLabel = contentLabel
    }

    // MARK: - View

    public var body: some View {
        SparkHStack(
            alignment: .center,
            spacing: self.viewModel.layout.spacing
        ) {
            // Circular gauge with inside content
            ZStack {
                // Track circle
                Circle()
                    .inset(by: self.viewModel.sizes.gaugeStroke / 2)
                    .stroke(
                        self.viewModel.colors.trackColorToken.color,
                        lineWidth: self.viewModel.sizes.gaugeStroke
                    )

                // Indicator arc
                Circle()
                    .inset(by: self.viewModel.sizes.gaugeStroke / 2)
                    .trim(from: .zero, to: CGFloat(min(self.value, 1.0)))
                    .stroke(
                        self.viewModel.colors.indicatorColorToken.color,
                        style: StrokeStyle(
                            lineWidth: self.viewModel.sizes.gaugeStroke,
                            lineCap: .round
                        )
                    )
                    .rotationEffect(.degrees(-90))
                    .optionalAnimation(
                        .easeOut(duration: CircularMeterConstants.Animation.duration),
                        value: self.value
                    )

                // Inside content
                if self.viewModel.isInsideContent {

                    VStack(spacing: .zero) {
                        // Image
                        if let image = self.image {
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .clipShape(Circle())
                                .accessibilityHidden(true)

                        } else {
                            // Icon
                            if let icon = self.icon {
                                icon
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .foregroundStyle(self.viewModel.colors.iconColorToken)
                                    .sparkFrame(size: self.viewModel.sizes.icon)
                                    .accessibilityHidden(true)

                            } else {
                                // Value
                                self.valueLabel()
                                    .font(self.viewModel.typographies.valueFontToken)
                                    .foregroundStyle(self.viewModel.colors.valueColorToken)
                                    .lineLimit(1)
                            }

                            // Content above Icon & Value
                            self.contentLabel()
                                .font(self.viewModel.typographies.contentFontToken)
                                .foregroundStyle(self.viewModel.colors.contentColorToken)
                                .dynamicTypeSize(...DynamicTypeSize.accessibility3)
                                .lineLimit(1)
                        }
                    }
                    .sparkPadding(self.viewModel.sizes.gaugeStroke + self.viewModel.layout.padding)
                }
            }
            .sparkFrame(size: self.viewModel.sizes.gaugeDiameter)

            // Outside content
            self.outsideContent()
        }
        .accessibilityElement(children: .combine)
        .accessibilityIdentifier(CircularMeterAccessibilityIdentifier.view)
        .accessibilityValue(Text(self.value.toPercentageString()))
        .onAppear {
            self.viewModel.setup(
                theme: self.theme.value,
                intent: self.intent,
                size: self.size
            )
        }
        .onChange(of: self.theme) { theme in
            self.viewModel.theme = theme.value
        }
        .onChange(of: self.intent) { intent in
            self.viewModel.intent = intent
        }
        .onChange(of: self.size) { size in
            self.viewModel.size = size
        }
    }

    // MARK: - Private Modifier

    @ViewBuilder
    private func outsideContent() -> some View {
        // Inside content or value and content are empty ?
        if self.viewModel.isInsideContent || (self.valueLabel().isEmptyView && self.contentLabel().isEmptyView) {
            EmptyView()

        } else {
            VStack(
                alignment: .leading,
                spacing: .zero
            ) {
                self.valueLabel()
                    .font(self.viewModel.typographies.valueFontToken)
                    .foregroundStyle(self.viewModel.colors.valueColorToken)

                self.contentLabel()
                    .font(self.viewModel.typographies.contentFontToken)
                    .foregroundStyle(self.viewModel.colors.contentColorToken)
            }
            .lineLimit(1)
        }
    }
}
