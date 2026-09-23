//
//  SparkCircularMeter+InitTextExtension.swift
//  SparkComponentCircularMeter
//
//  Created by robin.lemaire on 28/05/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

public extension SparkCircularMeter {

    /// Create a circular meter with only value text displayed.
    ///
    /// - Parameters:
    ///   - value: The progress value from 0.0 to 1.0.
    ///   - valueText: The text to display for the value (e.g., "70%").
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
    ///             valueText: "70%"
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
        valueText: String
    ) where ValueLabel == Text, ContentLabel == EmptyView {
        self.init(
            value: value,
            icon: nil,
            image: nil,
            valueLabel: { Text(valueText) },
            contentLabel: { EmptyView() }
        )
    }

    /// Create a circular meter with value and content text displayed inside.
    ///
    /// - Parameters:
    ///   - value: The progress value from 0.0 to 1.0.
    ///   - valueText: The text to display for the value (e.g., "70%").
    ///   - contentText: The text to display for the content/label (e.g., "Label").
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
    /// ## Rendering
    ///
    /// ![Image display](circularmeter_text.png)
    ///
    init(
        value: Double,
        valueText: String,
        contentText: String
    ) where ValueLabel == Text, ContentLabel == Text {
        self.init(
            value: value,
            icon: nil,
            image: nil,
            valueLabel: { Text(valueText) },
            contentLabel: { Text(contentText) }
        )
    }

    /// Create a circular meter with icon and content text.
    ///
    /// - Parameters:
    ///   - value: The progress value from 0.0 to 1.0.
    ///   - icon: The icon to display inside the circle.
    ///   - contentText: The text to display for the content/label.
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
    ///             contentText: "Label"
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
        contentText: String
    ) where ValueLabel == EmptyView, ContentLabel == Text {
        self.init(
            value: value,
            icon: icon,
            image: nil,
            valueLabel: { EmptyView() },
            contentLabel: { Text(contentText) }
        )
    }
}
