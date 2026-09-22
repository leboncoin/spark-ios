//
//  SparkSegmentedGauge+DifferentTypesInitExtension.swift
//  SparkComponentSegmentedGauge
//
//  Created by robin.lemaire on 29/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI
import SparkTheming
@_spi(SI_SPI) import SparkCommon

public extension SparkSegmentedGauge {

    /// Create a segmented gauge with a localized title and a content description.
    ///
    /// - Parameters:
    ///   - titleKey: The localized description key.
    ///   Displayed at the top of the view.
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
    ///             "My title Key",
    ///             descriptionLabel: {
    ///                 HStack {
    ///                     Text("My")
    ///                     Text("description")
    ///                         .foregroundColor(.blue)
    ///                 }
    ///             }
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
        @ViewBuilder descriptionLabel: @escaping () -> DescriptionLabel
    ) where TitleLabel == Text {
        self.titleLabel = { Text(titleKey) }
        self.descriptionLabel = descriptionLabel
    }

    /// Create a segmented gauge with a title and a content description.
    ///
    /// - Parameters:
    ///   - title: The title.
    ///   Displayed at the top of the view.
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
    ///             "My title",
    ///             descriptionLabel: {
    ///                 HStack {
    ///                     Text("My")
    ///                     Text("description")
    ///                         .foregroundColor(.blue)
    ///                 }
    ///             }
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
        @ViewBuilder descriptionLabel: @escaping () -> DescriptionLabel
    ) where TitleLabel == Text {
        self.titleLabel = { Text(title) }
        self.descriptionLabel = descriptionLabel
    }

    /// Create a segmented gauge with a localized description key and a content title.
    ///
    /// - Parameters:
    ///   - descriptionKey: The localized description key.
    ///   Displayed at the right of the gauge or on bottom.
    ///   - titleLabel: The content title.
    ///   Displayed at the top of the view.
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// struct MyView: View {
    ///     let theme: SparkTheming.Theme = MyTheme()
    ///
    ///     var body: some View {
    ///         SparkSegmentedGauge(
    ///             "My description Key",
    ///             titleLabel: {
    ///                 HStack {
    ///                     Text("My")
    ///                     Text("title")
    ///                         .foregroundColor(.blue)
    ///                 }
    ///             }
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
        _ descriptionKey: LocalizedStringKey,
        @ViewBuilder titleLabel: @escaping () -> TitleLabel
    ) where DescriptionLabel == Text {
        self.titleLabel = titleLabel
        self.descriptionLabel = { Text(descriptionKey) }
    }

    /// Create a segmented gauge with a description and a content title.
    ///
    /// - Parameters:
    ///   - description: The description.
    ///   Displayed at the right of the gauge or on bottom.
    ///   - titleLabel: The content title.
    ///   Displayed at the top of the view.
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// struct MyView: View {
    ///     let theme: SparkTheming.Theme = MyTheme()
    ///
    ///     var body: some View {
    ///         SparkSegmentedGauge(
    ///             "My description",
    ///             titleLabel: {
    ///                 HStack {
    ///                     Text("My")
    ///                     Text("title")
    ///                         .foregroundColor(.blue)
    ///                 }
    ///             }
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
        _ description: String,
        @ViewBuilder titleLabel: @escaping () -> TitleLabel
    ) where DescriptionLabel == Text {
        self.titleLabel = titleLabel
        self.descriptionLabel = { Text(description) }
    }
}
