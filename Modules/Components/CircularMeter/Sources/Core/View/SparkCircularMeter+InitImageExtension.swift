//
//  SparkCircularMeter+InitImageExtension.swift
//  SparkComponentCircularMeter
//
//  Created by robin.lemaire on 28/05/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

// MARK: - Image Initializers

public extension SparkCircularMeter {

    /// Create a circular meter with an icon inside.
    ///
    /// - Parameters:
    ///   - value: The progress value from 0.0 to 1.0.
    ///   - icon: The icon to display inside the circle.
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
    ///             icon: Image(systemName: "checkmark")
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
    /// ![Image display](circularmeter_image.png)
    ///
    init(
        value: Double,
        icon: Image
    ) where ValueLabel == EmptyView, ContentLabel == EmptyView {
        self.init(
            value: value,
            icon: icon,
            image: nil,
            valueLabel: { EmptyView() },
            contentLabel: { EmptyView() }
        )
    }

    /// Create a circular meter with an image inside.
    ///
    /// - Parameters:
    ///   - value: The progress value from 0.0 to 1.0.
    ///   - image: The image to display inside the circle.
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
    ///             image: Image("panda")
    ///         )
    ///         .sparkTheme(self.theme)
    ///         .sparkCircularMeterIntent(.success)
    ///         .sparkCircularMeterSize(.large)
    ///     }
    /// }
    /// ```
    init(
        value: Double,
        image: Image
    ) where ValueLabel == EmptyView, ContentLabel == EmptyView {
        self.init(
            value: value,
            icon: nil,
            image: image,
            valueLabel: { EmptyView() },
            contentLabel: { EmptyView() }
        )
    }
}
