//
//  ProgressTrackerConfigurationView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 12/02/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

struct ProgressTrackerConfigurationView: ConfigurationViewable, ConfigurationUIViewable {

    // MARK: - Type Alias

    typealias Configuration = ProgressTrackerConfiguration
    typealias ComponentUIView = ProgressTrackerUIControl

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

        if self.framework.isSwiftUI {
            ToggleConfigurationItemView(
                name: "use full width",
                isOn: self.configuration.swiftUIUseFullWidth
            )
        }

        ToggleConfigurationItemView(
            name: "show label",
            isOn: self.configuration.showLabel
        )

        OptionalEnumConfigurationItemView(
            name: "completed page indicator icon",
            values: Iconography.allCases,
            selectedValue: self.configuration.completedPageIndicatorIcon
        )

        OptionalEnumConfigurationItemView(
            name: "current page indicator icon",
            values: Iconography.allCases,
            selectedValue: self.configuration.currentPageIndicatorIcon
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

        ForEach(self.configuration.pages, id: \.id) { page in
            Section("Item \(page.id + 1)") {
                TextFieldConfigurationItemView(
                    name: "title",
                    text: page.title
                )

                if self.framework.isUIKit {
                    ToggleConfigurationItemView(
                        name: "is attributed title",
                        isOn: page.isAttributedTitle
                    )
                }

                switch configuration.wrappedValue.contentType {
                case .icon:
                    EnumConfigurationItemView(
                        name: "icon indicator",
                        values: Iconography.allCases,
                        selectedValue: page.indicatorIcon
                    )

                case .text:
                    TextFieldConfigurationItemView(
                        name: "text indicator",
                        text: page.indicatorText
                    )

                default:
                    EmptyView()
                }
            }
        }
    }
}
