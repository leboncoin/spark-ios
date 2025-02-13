//
//  ProgressTrackerConfigurationView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 12/02/2025.
//  Copyright © 2025 Adevinta. All rights reserved.
//

import SwiftUI

struct ProgressTrackerConfigurationView: ConfigurationViewable, ConfigurationUIViewable {

    // MARK: - Type Alias

    typealias Configuration = ProgressTrackerConfiguration
    typealias ComponentUIView = ProgressTrackerUIControl

    // MARK: - Properties

    var configuration: Binding<Configuration>
    var componentImplementationViewRepresentable: ComponentImplementationRepresentable? = nil

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
                    ProgressTrackerImplementationView(configuration: self.configuration)
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
            name: "intent",
            values: ProgressTrackerIntent.allCases,
            selectedValue: self.configuration.intent
        )

        EnumConfigurationItemView(
            name: "variant",
            values: ProgressTrackerVariant.allCases,
            selectedValue: self.configuration.variant
        )

        EnumConfigurationItemView(
            name: "size",
            values: ProgressTrackerSize.allCases,
            selectedValue: self.configuration.size
        )

        EnumConfigurationItemView(
            name: "orientation",
            values: ProgressTrackerOrientation.allCases,
            selectedValue: self.configuration.orientation
        )

        EnumConfigurationItemView(
            name: "interaction",
            values: ProgressTrackerInteractionState.allCases,
            selectedValue: self.configuration.interaction
        )

        EnumConfigurationItemView(
            name: "content type",
            values: ProgressTrackerContentType.allCases,
            selectedValue: self.configuration.contentType
        )

        ToggleConfigurationItemView(
            name: "use full width",
            isOn: self.configuration.useFullWidth
        )

        ToggleConfigurationItemView(
            name: "show label",
            isOn: self.configuration.showLabel
        )

        OptionalEnumConfigurationItemView(
            name: "completed page indicator icon",
            values: Iconography.allCases,
            selectedValue: self.configuration.completedPageIndicatorIcon
        )

        ToggleConfigurationItemView(
            name: "is current page indicator",
            isOn: self.configuration.isCurrentPageIndicator
        )
    }

    @ViewBuilder
    private func otherSectionItemsView() -> some View {
        Section("Pages") {
            StepperConfigurationItemView(
                name: "no. of pages",
                value: self.configuration.numberOfPages,
                bounds: 2...5
            )

            ForEach(self.configuration.pages, id: \.id) { page in
                TextFieldConfigurationItemView(
                    name: "Page \(page.id) text",
                    text: page.text
                )

                if configuration.wrappedValue.contentType == .icon {
                    OptionalEnumConfigurationItemView(
                        name: "Page \(page.id) icon",
                        values: Iconography.allCases,
                        selectedValue: page.icon
                    )
                }
            }

            StepperConfigurationItemView(
                name: "current page",
                value: self.configuration.currentPageIndex,
                bounds: 0...(self.configuration.wrappedValue.numberOfPages - 1)
            )

            StepperConfigurationItemView(
                name: "disabled page",
                value: self.configuration.disabledPageIndex,
                bounds: -1...(self.configuration.wrappedValue.numberOfPages - 1)
            )
        }
    }
}
