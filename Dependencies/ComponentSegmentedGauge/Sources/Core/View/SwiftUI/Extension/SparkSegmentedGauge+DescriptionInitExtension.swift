//
//  SparkSegmentedGauge+DescriptionInitExtension.swift
//  SparkComponentSegmentedGauge
//
//  Created by robin.lemaire on 29/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI
import SparkTheming
@_spi(SI_SPI) import SparkCommon

public extension SparkSegmentedGauge {

    /// Create a segmented gauge with a localized description.
    ///
    /// - Parameters:
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
    ///         SparkSegmentedGauge("My description Key")
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
    /// ![SegmentedGauge rendering.](segmented_gauge_description.png)
    init(
        _ descriptionKey: LocalizedStringKey
    ) where TitleLabel == EmptyView, DescriptionLabel == Text {
        self.titleLabel = { EmptyView() }
        self.descriptionLabel = { Text(descriptionKey) }
    }

    /// Create a segmented gauge with a description.
    ///
    /// - Parameters:
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
    ///         SparkSegmentedGauge("My description")
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
    /// ![SegmentedGauge rendering.](segmented_gauge_description.png)
    init(
        _ description: String
    ) where TitleLabel == EmptyView, DescriptionLabel == Text {
        self.titleLabel = { EmptyView() }
        self.descriptionLabel = { Text(description) }
    }

    /// Create a segmented gauge with a description label.
    ///
    /// - Parameters:
    ///   - descriptionLabel: The content description.
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
    ///             descriptionLabel: {
    ///                 HStack {
    ///                     Text("My")
    ///                     Text("description")
    ///                         .foregroundColor(.blue)
    ///                 }
    ///             }
    ///         )
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
    /// ![SegmentedGauge rendering.](segmented_gauge_description_label.png)
    init(
        @ViewBuilder descriptionLabel: @escaping () -> DescriptionLabel
    ) where TitleLabel == EmptyView {
        self.titleLabel = { EmptyView() }
        self.descriptionLabel = descriptionLabel
    }
}
