//
//  SegmentedGaugeComponentView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 31/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

// MARK: - View

typealias SegmentedGaugeComponentView = ComponentViewable<SegmentedGaugeConfiguration, SegmentedGaugeImplementationView, SegmentedGaugeConfigurationView, SegmentedGaugeExtraTools>

// MARK: - Subview

struct SegmentedGaugeImplementationView: ComponentImplementationViewable {

    // MARK: - Properties

    var configuration: Binding<SegmentedGaugeConfiguration>

    // MARK: - View

    var body: some View {
        self.component()
            .sparkTheme(self.configurationWrapped.theme.value)
            .sparkSegmentedGaugeAlignment(self.configurationWrapped.alignment)
            .sparkSegmentedGaugeSegments(self.configurationWrapped.segments)
            .sparkSegmentedGaugeSize(self.configurationWrapped.size)
            .sparkSegmentedGaugeWithMarker(self.configurationWrapped.withMarker)
            .demoSegmentedGaugeType(self.configurationWrapped)
            .demoAccessibilityLabel(self.configurationWrapped)
    }

    @ViewBuilder
    private func component() -> some View {
        if self.configurationWrapped.swiftUIIsCustomTitle,
           self.configurationWrapped.swiftUIIsCustomDescription {
            SparkSegmentedGauge(
                titleLabel: {
                    self.customContent(forTitle: true)
                },
                descriptionLabel: {
                    self.customContent(forTitle: false)
                }
            )

        } else if let description = self.configurationWrapped.description.nilIfEmpty,
                  self.configurationWrapped.swiftUIIsCustomTitle {
            SparkSegmentedGauge(
                description,
                titleLabel: {
                    self.customContent(forTitle: true)
                }
            )
        } else if let title = self.configurationWrapped.title.nilIfEmpty,
                  self.configurationWrapped.swiftUIIsCustomDescription {
            SparkSegmentedGauge(
                title,
                descriptionLabel: {
                    self.customContent(forTitle: false)
                }
            )
        } else if self.configurationWrapped.title.nilIfEmpty == nil,
                  self.configurationWrapped.swiftUIIsCustomDescription {
            SparkSegmentedGauge(
                descriptionLabel: {
                    self.customContent(forTitle: false)
                }
            )
        } else if let title = self.configurationWrapped.title.nilIfEmpty,
                  let description = self.configurationWrapped.description.nilIfEmpty {
            SparkSegmentedGauge(
                title,
                description: description
            )

        } else if let description = self.configurationWrapped.description.nilIfEmpty {
            SparkSegmentedGauge(
                description
            )
        } else {
            SparkSegmentedGauge(
                "Bad parameters"
            )
        }
    }

    // MARK: - Custom Content

    private func customContent(forTitle: Bool) -> some View {
        HStack {
            Text(forTitle ? self.configurationWrapped.title : self.configurationWrapped.description)

            Text(forTitle ? self.configurationWrapped.swiftUICustomTitle : self.configurationWrapped.swiftUICustomDescription)
                .font(.footnote)
                .foregroundStyle(.blue)
        }
    }
}

// MARK: - Extension

private extension View {

    func demoSegmentedGaugeType(_ configuration: SegmentedGaugeConfiguration) -> some View {
        self.sparkSegmentedGaugeType(configuration.type.toRealType(configuration))
    }
}
