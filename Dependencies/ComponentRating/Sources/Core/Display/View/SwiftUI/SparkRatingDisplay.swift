 //
//  SparkRatingDisplay.swift
//  SparkComponentRating
//
//  Created by robin.lemaire on 09/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkCommon

/// The ratings let users see a star rating for a user or experience.
///
/// The **value** passed in parameter must be between **0 and 5**.
///
/// You can also add a text, count and aditional texts or labels in the init.
///
/// ## Example of usage
///
/// ### Default (without text)
///
/// ```swift
/// struct MyView: View {
///     let theme: SparkTheming.Theme = MyTheme()
///
///     var body: some View {
///         SparkRatingDisplay(value: 2.75)
///             .sparkTheme(self.theme)
///             .sparkRatingDisplaySize(.small)
///             .sparkRatingDisplayStars(.one)
///     }
/// }
/// ```
///
/// ### With text
///
/// ```swift
/// struct MyView: View {
///     let theme: SparkTheming.Theme = MyTheme()
///
///     var body: some View {
///         SparkRatingDisplay(
///             value: 2.75,
///             text: "(2,75)"
///         )
///         .sparkTheme(self.theme)
///         .sparkRatingDisplaySize(.small)
///         .sparkRatingDisplayStars(.one)
///     }
/// }
/// ```
///
/// ```swift
/// struct MyView: View {
///     let theme: SparkTheming.Theme = MyTheme()
///
///     var body: some View {
///         SparkRatingDisplay(
///             value: 4.5,
///             valueText: "4.5",
///             countText: "120",
///             additionalText: "Excellent"
///         )
///         .sparkTheme(self.theme)
///         .sparkRatingDisplaySize(.small)
///         .sparkRatingDisplayStars(.one)
///     }
/// }
/// ```
///
/// ### With Label
///
/// ```swift
/// struct MyView: View {
///     let theme: SparkTheming.Theme = MyTheme()
///
///     var body: some View {
///         SparkRatingDisplay(
///             value: 2.75,
///             label: {
///                 VStack {
///                     Text("2").bold()
///                     Text("/")
///                     Text("5")
///                 }
///             }
///         )
///         .sparkTheme(self.theme)
///         .sparkRatingDisplaySize(.small)
///         .sparkRatingDisplayStars(.one)
///     }
/// }
/// ```
///
/// ```swift
/// struct MyView: View {
///     let theme: SparkTheming.Theme = MyTheme()
///
///     var body: some View {
///         SparkRatingDisplay(
///             value: 4.5,
///             valueLabel: {
///                 Text("4.5")
///                     .bold()
///             },
///             countLabel: {
///                 Text("(120)")
///             },
///             additionalLabel: {
///                 Text("Excellent")
///                     .italic()
///             }
///         )
///         .sparkTheme(self.theme)
///         .sparkRatingDisplaySize(.small)
///         .sparkRatingDisplayStars(.one)
///     }
/// }
/// ```
///
/// ## EnvironmentValues
///
/// This component use some EnvironmentValues :
/// - **theme** : ``sparkTheme(_:)`` (View extension)
/// - **size** : ``sparkRatingDisplaySize(_:)`` (View extension)
/// - **stars** : ``sparkRatingDisplayStars(_:)`` (View extension)
///
/// > If theses values are not set, default values will be applied.
///
/// > **YOU MUST PROVIDE ``sparkTheme(_:)``**
///
/// ## Accessibility
///
/// You must set an **accessibilityLabel** to give some context.
///
/// By default, the component set an localized **accessibilityValue**
/// with the current value and the number of stars :"1 out of 5" / "1 sur 5".
/// To override this value, you need to set a new **accessibilityValue**.
///
/// If you use a **count text**, a localized accessibilityValue is set on the Label : "based on XXX reviews".
/// To override this value, you must use the **init** with a **countLabel**
///
/// ## Rendering
///
/// ### With .five star
///
/// ![Rating rendering.](rating_display_default.png)
///
/// ### With .one star
///
/// ![Rating rendering.](rating_display_one_star.png)
///
/// ### With .small size
///
/// ![Rating rendering.](rating_display_small_size.png)
///
/// ### With text
///
/// ![Rating rendering.](rating_display_text.png)
///
/// ### With value label
///
/// ![Rating rendering.](rating_display_label.png)
///
/// ### With value and count labels
///
/// ![Rating rendering.](rating_display_value_and_count_label.png)
///
/// ### With value and additional labels
///
/// ![Rating rendering.](rating_display_value_and_additional_label.png)
///
/// ### With value, count and additional labels
///
/// ![Rating rendering.](rating_display_all_label.png)
///
public struct SparkRatingDisplay<ValueLabel, CountLabel, AdditionalLabel>: View where ValueLabel: View, CountLabel: View, AdditionalLabel: View {

    // MARK: - Properties

    private let value: Double

    private let valueLabel: () -> ValueLabel
    private let countLabel: () -> CountLabel
    private let additionalLabel: () -> AdditionalLabel

    @Environment(\.theme) private var theme
    @Environment(\.ratingDisplaySize) private var size
    @Environment(\.ratingDisplayStars) private var stars

    private let countAccessibilityLabel: String?

    @StateObject private var viewModel = RatingDisplayViewModel()

    // MARK: - Initialization

    /// Create a rating with a value.
    ///
    /// - Parameters:
    ///   - value: The Double value.
    ///   Must be between **0 and 5**.
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// struct MyView: View {
    ///     let theme: SparkTheming.Theme = MyTheme()
    ///
    ///     var body: some View {
    ///         SparkRatingDisplay(value: 2.75)
    ///             .sparkTheme(self.theme)
    ///             .sparkRatingDisplaySize(.small)
    ///             .sparkRatingDisplayStars(.one)
    ///     }
    /// }
    /// ```
    ///
    /// ## Rendering
    ///
    /// ![Rating rendering.](rating_display_default.png)
    public init(value: Double) where ValueLabel == EmptyView, CountLabel == EmptyView, AdditionalLabel == EmptyView {
        self.init(
            value,
            valueLabel: { EmptyView() },
            countLabel: { EmptyView() },
            additionalLabel: { EmptyView() }
        )
    }

    // MARK: - Internal Initialization

    internal init(
        _ value: Double,
        countAccessibilityLabel: String? = nil,
        @ViewBuilder valueLabel: @escaping () -> ValueLabel,
        @ViewBuilder countLabel: @escaping () -> CountLabel,
        @ViewBuilder additionalLabel: @escaping () -> AdditionalLabel
    ) {
        self.value = value
        self.countAccessibilityLabel = countAccessibilityLabel
        self.valueLabel = valueLabel
        self.countLabel = countLabel
        self.additionalLabel = additionalLabel
    }

    // MARK: - View

    public var body: some View {
        SparkHStack(spacing: self.viewModel.spacings.content) {
            SparkHStack(spacing: self.viewModel.spacings.stars) {
                ForEach((0...self.stars.rawValue - 1), id: \.self) { index in
                    let ratio = self.viewModel.getFillingRatio(
                        at: index,
                        count: self.stars.rawValue,
                        value: self.value
                    )

                    RatingStarView(
                        colors: self.viewModel.colors,
                        ratio: ratio
                    )
                    .sparkFrame(size: self.size.cgFloat)
                }
            }
            .accessibilityElement(children: .ignore)

            // Optional Value
            self.valueLabel()
                .labelStyle(self.viewModel.textStyles.value)

            // Optional Count
            self.countLabel()
                .labelStyle(self.viewModel.textStyles.count)
                .accessibilityLabel(optional: self.countAccessibilityLabel)

            // Optional Additional
            self.additionalLabel()
                .labelStyle(self.viewModel.textStyles.additional)
        }
        .accessibilityElement(children: .combine)
        .accessibilityIdentifier(RatingDisplayAccessibilityIdentifier.view)
        .accessibilityValue(String.accessibilityValue(
            rating: self.value,
            numberOfStars: stars.rawValue
        ))
        .onAppear() {
            self.viewModel.setup(
                theme: self.theme.value,
                size: self.size
            )
        }
        .onChange(of: self.theme) { theme in
            self.viewModel.theme = theme.value
        }
        .onChange(of: self.size) { size in
            self.viewModel.size = size
        }
    }
}

// MARK: - Extension

private extension View {

    func labelStyle(_ textStyle: RatingDisplayTextStyle) -> some View {
        self.font(textStyle.fontToken)
            .foregroundStyle(textStyle.colorToken)
            .lineLimit(1)
            .truncationMode(.tail)
    }
}
