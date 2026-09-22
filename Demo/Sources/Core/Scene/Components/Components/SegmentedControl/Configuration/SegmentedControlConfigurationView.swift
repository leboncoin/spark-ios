//
//  SegmentedControlConfigurationView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 25/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

struct SegmentedControlConfigurationView: ConfigurationViewable, ConfigurationUIViewable {

    // MARK: - Type Alias

    typealias Configuration = SegmentedControlConfiguration
    typealias ComponentUIView = UIView

    // MARK: - Properties

    var configuration: Binding<Configuration>
    var componentImplementationViewRepresentable: ComponentImplementationRepresentable?

    // MARK: - Initialization

    init(configuration: Binding<Configuration>) {
        self.configuration = configuration
    }

    init(
        configuration: Binding<Configuration>,
        componentImplementationViewRepresentable: ComponentImplementationRepresentable
    ) {
        self.configuration = configuration
        self.componentImplementationViewRepresentable = componentImplementationViewRepresentable
    }

    // MARK: - View

    var body: some View {
        ComponentConfigurationView(
            configuration: self.configuration,
            framework: self.framework,
            componentView: {
                if let componentImplementationViewRepresentable {
                    componentImplementationViewRepresentable
                } else {
                    SegmentedControlImplementationView(configuration: self.configuration)
                }
            },
            mainItemsView: {
                self.itemsView()
            },
            otherSectionItemsView: {
                self.otherSectionItemsView()
            }
        )
    }

    @ViewBuilder
    private func itemsView() -> some View {
        EnumConfigurationItemView(
            name: "content type",
            values: SegmentedControlContentType.allCases,
            selectedValue: self.configuration.contentType
        )
    }

    @ViewBuilder
    private func otherSectionItemsView() -> some View {
        Section("Segments") {
            StepperConfigurationItemView(
                name: "no. of segments",
                value: self.configuration.numberOfSegments,
                bounds: 2...12
            )
        }

        ForEach(self.configuration.items, id: \.id) { item in
            Section("Segment \(item.id)") {

                if self.configuration.wrappedValue.contentType == .multiple {
                    EnumConfigurationItemView(
                        name: "content type",
                        values: SegmentedControlContentType.multipleCases,
                        selectedValue: item.contentType
                    )
                }

                if self.configuration.wrappedValue.contentType.isText {
                    TextFieldConfigurationItemView(
                        name: "text",
                        text: item.text
                    )
                }

                if self.configuration.wrappedValue.contentType.isIcon {
                    EnumConfigurationItemView(
                        name: "icon",
                        values: Iconography.allCases,
                        selectedValue: item.icon
                    )
                }
            }
        }
    }
}
