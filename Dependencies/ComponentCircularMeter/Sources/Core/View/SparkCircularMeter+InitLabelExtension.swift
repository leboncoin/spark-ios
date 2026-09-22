//
//  SparkCircularMeter+InitLabelExtension.swift
//  SparkComponentCircularMeter
//
//  Created by robin.lemaire on 28/05/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

public extension SparkCircularMeter {

    /// Create a circular meter with custom value label.
    ///
    /// - Parameters:
    ///   - value: The progress value from 0.0 to 1.0.
    ///   - valueLabel: A view builder for the value label.
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// struct MyView: View {
    ///     let theme: SparkTheming.Theme = MyTheme()
    ///
    ///     var body: some View {
    ///         SparkCircularMeter(
    ///             value: 0.70,
    ///             valueLabel: {
    ///                 Text("70%")
    ///                     .bold()
    ///             }
    ///         )
    ///         .sparkTheme(self.theme)
    ///         .sparkCircularMeterIntent(.success)
    ///         .sparkCircularMeterSize(.large)
    ///     }
    /// }
    /// ```
    ///
    /// ## Rendering
    ///
    /// ![Image display](circularmeter_text.png)
    ///
    init(
        value: Double,
        @ViewBuilder valueLabel: @escaping () -> ValueLabel
    ) where ContentLabel == EmptyView {
        self.init(
            value: value,
            icon: nil,
            image: nil,
            valueLabel: valueLabel,
            contentLabel: { EmptyView() }
        )
    }

    /// Create a circular meter with custom value and content labels.
    ///
    /// - Parameters:
    ///   - value: The progress value from 0.0 to 1.0.
    ///   - valueLabel: A view builder for the value label.
    ///   - contentLabel: A view builder for the content label.
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// struct MyView: View {
    ///     let theme: SparkTheming.Theme = MyTheme()
    ///
    ///     var body: some View {
    ///         SparkCircularMeter(
    ///             value: 0.70,
    ///             valueLabel: {
    ///                 Text("70%")
    ///                     .bold()
    ///             },
    ///             contentLabel: {
    ///                 Text("Label")
    ///                     .italic()
    ///             }
    ///         )
    ///         .sparkTheme(self.theme)
    ///         .sparkCircularMeterIntent(.success)
    ///         .sparkCircularMeterSize(.large)
    ///     }
    /// }
    /// ```
    ///
    /// ## Rendering
    ///
    /// ![Image display](circularmeter_text.png)
    ///
    init(
        value: Double,
        @ViewBuilder valueLabel: @escaping () -> ValueLabel,
        @ViewBuilder contentLabel: @escaping () -> ContentLabel
    ) {
        self.init(
            value: value,
            icon: nil,
            image: nil,
            valueLabel: valueLabel,
            contentLabel: contentLabel
        )
    }

    /// Create a circular meter with icon and custom content label.
    ///
    /// - Parameters:
    ///   - value: The progress value from 0.0 to 1.0.
    ///   - icon: The icon to display inside the circle.
    ///   - contentLabel: A view builder for the content label.
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// struct MyView: View {
    ///     let theme: SparkTheming.Theme = MyTheme()
    ///
    ///     var body: some View {
    ///         SparkCircularMeter(
    ///             value: 0.70,
    ///             icon: Image(systemName: "checkmark"),
    ///             contentLabel: {
    ///                 Text("Success")
    ///                     .italic()
    ///             }
    ///         )
    ///         .sparkTheme(self.theme)
    ///         .sparkCircularMeterIntent(.success)
    ///         .sparkCircularMeterSize(.large)
    ///     }
    /// }
    /// ```
    ///
    /// ## Rendering
    ///
    /// ![Image display](circularmeter_icon.png)
    ///
    init(
        value: Double,
        icon: Image,
        @ViewBuilder contentLabel: @escaping () -> ContentLabel
    ) where ValueLabel == EmptyView {
        self.init(
            value: value,
            icon: icon,
            image: nil,
            valueLabel: { EmptyView() },
            contentLabel: contentLabel
        )
    }
}
