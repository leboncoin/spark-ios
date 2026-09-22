//
//  SparkSegmentedGauge.swift
//  SparkComponentSegmentedGauge
//
//  Created by robin.lemaire on 29/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI
import SparkTheming
@_spi(SI_SPI) import SparkCommon

/// The Segmented Gauge shows a value on a colored scale.
///
/// The Segmented Gauge is a non-interactive visual indicator made up of colored segments.
/// It shows a level or value along a scale (e.g., from “low” to “high”).
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
/// ## EnvironmentValues
///
/// This component use some EnvironmentValues :
/// - **theme** : ``sparkTheme(_:)`` (View extension)
/// - **segmentedGaugeAlignment** : ``sparkSegmentedGaugeAlignment(_:)`` (View extension)
/// - **segmentedGaugeSegments** : ``sparkSegmentedGaugeSegments(_:)`` (View extension)
/// - **segmentedGaugeSize** : ``sparkSegmentedGaugeSize(_:)`` (View extension)
/// - **segmentedGaugeType** : ``sparkSegmentedGaugeType(_:)`` (View extension)
/// - **segmentedGaugeWithMarker** : ``sparkSegmentedGaugeWithMarker(_:)`` (View extension)
///
/// > If theses values are not set, default values will be applied.
///
/// > **YOU MUST PROVIDE ``sparkTheme(_:)``**
///
/// ## Accessibility
///
/// By default, the accessibility combined **all subviews** in this order : title, segments (percent value) and description.
/// To override this value, you need to set a new **accessibilityLabel**
///
/// ## Rendering
///
/// With a title and description:
///
/// ![SegmentedGauge rendering.](segmented_gauge_all.png)
///
/// ![SegmentedGauge rendering.](segmented_gauge_all_label.png)
///
/// With a description only:
///
/// ![SegmentedGauge rendering.](segmented_gauge_description.png)
///
/// ![SegmentedGauge rendering.](segmented_gauge_description_label.png)
///
/// With all segments:
///
/// ![SegmentedGauge rendering.](segmented_gauge_segments_three.png)
///
/// ![SegmentedGauge rendering.](segmented_gauge_segments_five.png)
///
/// With all sizes:
///
/// ![SegmentedGauge rendering.](segmented_gauge_size_small.png)
///
/// ![SegmentedGauge rendering.](segmented_gauge_size_medium.png)
///
/// With a maker:
///
/// ![SegmentedGauge rendering.](segmented_gauge_marker.png)
///
public struct SparkSegmentedGauge<TitleLabel, DescriptionLabel>: View where TitleLabel: View, DescriptionLabel: View {

    // MARK: - Properties

    let titleLabel: () -> TitleLabel
    let descriptionLabel: () -> DescriptionLabel

    @Environment(\.theme) private var theme
    @Environment(\.segmentedGaugeAlignment) private var alignment
    @Environment(\.segmentedGaugeSegments) private var segments
    @Environment(\.segmentedGaugeSize) private var size
    @Environment(\.segmentedGaugeType) private var type
    @Environment(\.segmentedGaugeWithMarker) private var withMarker

    @StateObject private var viewModel = SegmentedGaugeViewModel()

    // MARK: - Initialization

    /// Create a segmented gauge with a titleLabel and a descriptionLabel.
    ///
    /// - Parameters:
    ///   - titleLabel: The content title.
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
    ///             titleLabel: {
    ///                 HStack {
    ///                     Text("My")
    ///                     Text("title")
    ///                         .foregroundColor(.blue)
    ///                 }
    ///             },
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
    /// ![SegmentedGauge rendering.](segmented_gauge_all_label.png)
    public init(
        @ViewBuilder titleLabel: @escaping () -> TitleLabel,
        @ViewBuilder descriptionLabel: @escaping () -> DescriptionLabel
    ) {
        self.titleLabel = titleLabel
        self.descriptionLabel = descriptionLabel
    }

    // MARK: - View

    public var body: some View {
        SparkVStack(
            alignment: .leading,
            spacing: self.viewModel.layout.contentSpacing
        ) {
            // Optional Title
            self.titleLabel()
                .font(self.viewModel.labelsStyle.titleTypography)
                .foregroundStyle(self.viewModel.labelsStyle.color)
                .accessibilitySort(.title)

            self.subContentStack {

                // Segments
                SparkHStack(spacing: self.viewModel.layout.segmentsSpacing) {
                    ForEach(1...self.viewModel.levels.levels, id: \.self) { index in
                        ZStack {

                            let isPlainSegment = self.viewModel.levels.isPlainSegment(at: index)

                            // With Marker ?
                            if self.viewModel.levels.displayMarker(at: index, withMarker: self.withMarker) {

                                // Segment with marker
                                SegmentedGaugeMarkedSegmentView(
                                    markerSize: self.viewModel.sizes.markerOuterSize
                                )
                                .fill(self.viewModel.colors.markerOuterBackground)
                                .opacity(self.viewModel.colors.segmentOpacity(isPlain: isPlainSegment))
                                .sparkFrame(
                                    width: self.viewModel.sizes.segmentSize.width,
                                    height: self.viewModel.sizes.segmentSize.height
                                )

                                // Inner Circle
                                Circle()
                                    .fill(self.viewModel.colors.markerInnerBackground)
                                    .sparkFrame(size: self.viewModel.sizes.markerInnerSize)

                            } else {
                                // Segment without marker
                                RoundedRectangle(cornerRadius: self.viewModel.segmentBorder.radius)
                                    .fill(self.viewModel.colors.segmentBackground(isPlain: isPlainSegment).color)
                                    .sparkBorder(
                                        self.viewModel.segmentBorder,
                                        colors: self.viewModel.colors,
                                        isPlainSegment: isPlainSegment
                                    )
                                    .sparkFrame(
                                        width: self.viewModel.sizes.segmentSize.width,
                                        height: self.viewModel.sizes.segmentSize.height
                                    )
                                    .opacity(self.viewModel.colors.segmentOpacity(isPlain: isPlainSegment))
                            }
                        }
                    }
                }
                .dynamicTypeSize(...DynamicTypeSize.xxxLarge)
                .accessibilityLabel(self.viewModel.levels.accessibilityLabel)
                .accessibilitySort(.segments)

                // Description
                self.descriptionLabel()
                    .font(self.viewModel.labelsStyle.descriptionTypography)
                    .foregroundStyle(self.viewModel.labelsStyle.color)
                    .accessibilitySort(.description)
            }
        }
        .accessibilityIdentifier(SegmentedGaugeAccessibilityIdentifier.view)
        .accessibilityElement(children: .combine)
        .dynamicTypeSize(...DynamicTypeSize.accessibility3)
        .onAppear() {
            self.viewModel.setup(
                theme: self.theme.value,
                alignment: self.alignment,
                segments: self.segments,
                size: self.size,
                type: self.type
            )
        }
        .onChange(of: self.theme) { theme in
            self.viewModel.theme = self.theme.value
        }
        .onChange(of: self.alignment) { alignment in
            self.viewModel.alignment = alignment
        }
        .onChange(of: self.segments) { segments in
            self.viewModel.segments = segments
        }
        .onChange(of: self.size) { size in
            self.viewModel.size = size
        }
        .onChange(of: self.type) { type in
            self.viewModel.type = type
        }
    }

    // MARK: - Private Modifier

    @ViewBuilder
    private func subContentStack<Content>(
        @ViewBuilder content: @escaping () -> Content
    ) -> some View where Content: View {
        switch self.alignment {
        case .horizontal:
            SparkAdaptiveStack(
                axis: .horizontal,
                spacing: self.viewModel.layout.subContentSpacing,
                accessibilityAlignment: .leading,
                content: content
            )
        case .vertical:
            SparkVStack(
                alignment: .leading,
                spacing: self.viewModel.layout.subContentSpacing,
                content: content
            )
        }
    }
}

// MARK: - Extension

private extension View {

    @ViewBuilder
    func sparkBorder(
        _ border: SegmentedGaugeSegmentBorder,
        colors: SegmentedGaugeColors,
        isPlainSegment isPlain: Bool
    ) -> some View {
        // Border only if there is no opacity
        if !colors.segmentIsOpacity(isPlain: isPlain) {
            self.sparkBorder(
                width: border.width,
                radius: border.radius,
                colorToken: colors.segmentBorder(isPlain: isPlain),
                position: .inner
            )
        } else {
            self
        }
    }
}
