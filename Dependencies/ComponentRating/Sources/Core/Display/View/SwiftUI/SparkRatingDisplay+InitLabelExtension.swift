//
//  SparkRatingDisplay+InitLabelExtension.swift
//  SparkComponentRating
//
//  Created by robin.lemaire on 11/02/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
import SparkCommon

public extension SparkRatingDisplay {

    /// Create a rating with a value and a custom label positioned on the right.
    ///
    /// - Parameters:
    ///   - value: The Double value.
    ///   Must be between **0 and 5**.
    ///   - label: A view that describes the purpose of the rating.
    ///
    /// ## Example of usage
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
    /// ## Rendering
    ///
    /// ![Rating rendering.](rating_display_label.png)
    ///
    init(
        value: Double,
        @ViewBuilder label: @escaping () -> ValueLabel
    ) where CountLabel == EmptyView, AdditionalLabel == EmptyView {
        self.init(
            value,
            valueLabel: label,
            countLabel: { EmptyView() },
            additionalLabel: { EmptyView() }
        )
    }

    /// Creates a rating with a value, custom value label, and custom count label.
    ///
    /// - Parameters:
    ///   - value: The Double value.
    ///   Must be between **0 and 5**.
    ///   - valueLabel: A view that displays the value.
    ///   - countLabel: A view that displays the count of reviews.
    ///
    /// ## Example of usage
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
    ///             }
    ///         )
    ///         .sparkTheme(self.theme)
    ///         .sparkRatingDisplaySize(.medium)
    ///         .sparkRatingDisplayStars(.five)
    ///     }
    /// }
    /// ```
    ///
    /// ## Rendering
    ///
    /// ![Rating rendering.](rating_display_value_and_count_label.png)
    ///
    init(
        value: Double,
        @ViewBuilder valueLabel: @escaping () -> ValueLabel,
        @ViewBuilder countLabel: @escaping () -> CountLabel
    ) where AdditionalLabel == EmptyView {
        self.init(
            value,
            valueLabel: valueLabel,
            countLabel: countLabel,
            additionalLabel: { EmptyView() }
        )
    }

    /// Creates a rating with a value, custom value label, and custom additional label.
    ///
    /// - Parameters:
    ///   - value: The Double value.
    ///   Must be between **0 and 5**.
    ///   - valueLabel: A view that displays the value.
    ///   - additionalLabel: A view that provides additional information.
    ///
    /// ## Example of usage
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
    ///             additionalLabel: {
    ///                 Text("Excellent")
    ///             }
    ///         )
    ///         .sparkTheme(self.theme)
    ///         .sparkRatingDisplaySize(.medium)
    ///         .sparkRatingDisplayStars(.five)
    ///     }
    /// }
    /// ```
    ///
    /// ## Rendering
    ///
    /// ![Rating rendering.](rating_display_value_and_additional_label.png)
    ///
    init(
        value: Double,
        @ViewBuilder valueLabel: @escaping () -> ValueLabel,
        @ViewBuilder additionalLabel: @escaping () -> AdditionalLabel
    ) where CountLabel == EmptyView {
        self.init(
            value,
            valueLabel: valueLabel,
            countLabel: { EmptyView() },
            additionalLabel: additionalLabel
        )
    }

    /// Creates a rating with a value, custom value label, custom count label, and custom additional label.
    ///
    /// - Parameters:
    ///   - value: The Double value.
    ///   Must be between **0 and 5**.
    ///   - valueLabel: A view that displays the value.
    ///   - countLabel: A view that displays the count of reviews.
    ///   - additionalLabel: A view that provides additional information.
    ///
    /// ## Example of usage
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
    ///         .sparkRatingDisplaySize(.medium)
    ///         .sparkRatingDisplayStars(.five)
    ///     }
    /// }
    /// ```
    ///
    /// ### Rendering
    ///
    /// ![Rating rendering.](rating_display_all_label.png)
    ///
    init(
        value: Double,
        @ViewBuilder valueLabel: @escaping () -> ValueLabel,
        @ViewBuilder countLabel: @escaping () -> CountLabel,
        @ViewBuilder additionalLabel: @escaping () -> AdditionalLabel
    ) {
        self.init(
            value,
            valueLabel: valueLabel,
            countLabel: countLabel,
            additionalLabel: additionalLabel
        )
    }
}
