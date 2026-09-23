//
//  SparkSegmentedGauge+SameTypesInitExtension.swift
//  SparkComponentSegmentedGauge
//
//  Created by robin.lemaire on 29/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI
import SparkTheming
@_spi(SI_SPI) import SparkCommon

public extension SparkSegmentedGauge {

    /// Create a segmented gauge with a localized title and description keys.
    ///
    /// - Parameters:
    ///   - titleKey: The localized title key.
    ///   Displayed at the top of the view.
    ///   - descriptionKey: The localized description key.
    ///   Displayed at the right of the gauge or on bottom.
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// struct MyView: View {
    ///     let theme: SparkTheming.Theme = MyTheme()
    ///
    ///     var body: some View {
    ///         SparkSegmentedGauge(
    ///             "My title Key",
    ///             descriptionKey: "My description Key",
    ///         )
    ///         .sparkTheme(self.theme)
    ///         .sparkSegmentedGaugeAlignment(.horizontal)
    ///         .sparkSegmentedGaugeWithMarker(true)
    ///         .sparkSegmentedGaugeSegments(.five)
    ///         .sparkSegmentedGaugeSize(.small)
    ///         .sparkSegmentedGaugeType(.high)
    ///     }
    /// }
    /// ```
    ///
    /// ## Rendering
    ///
    /// ![SegmentedGauge rendering.](segmented_gauge_all.png)
    init(
        _ titleKey: LocalizedStringKey,
        descriptionKey: LocalizedStringKey
    ) where TitleLabel == Text, DescriptionLabel == Text {
        self.titleLabel = { Text(titleKey) }
        self.descriptionLabel = { Text(descriptionKey) }
    }

    /// Create a segmented gauge with a title and description.
    ///
    /// - Parameters:
    ///   - title: The title.
    ///   Displayed at the top of the view.
    ///   - description: The description.
    ///   Displayed at the right of the gauge or on bottom.
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// struct MyView: View {
    ///     let theme: SparkTheming.Theme = MyTheme()
    ///
    ///     var body: some View {
    ///         SparkSegmentedGauge(
    ///             "My title",
    ///             description: "My description",
    ///         )
    ///         .sparkTheme(self.theme)
    ///         .sparkSegmentedGaugeAlignment(.horizontal)
    ///         .sparkSegmentedGaugeWithMarker(true)
    ///         .sparkSegmentedGaugeSegments(.five)
    ///         .sparkSegmentedGaugeSize(.small)
    ///         .sparkSegmentedGaugeType(.high)
    ///     }
    /// }
    /// ```
    ///
    /// ## Rendering
    ///
    /// ![SegmentedGauge rendering.](segmented_gauge_all.png)
    init(
        _ title: String,
        description: String
    ) where TitleLabel == Text, DescriptionLabel == Text {
        self.titleLabel = { Text(title) }
        self.descriptionLabel = { Text(description) }
    }
}
