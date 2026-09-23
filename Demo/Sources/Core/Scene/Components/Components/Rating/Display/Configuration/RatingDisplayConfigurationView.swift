//
//  RatingDisplayConfigurationView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 12/02/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

struct RatingDisplayConfigurationView: ConfigurationViewable, ConfigurationUIViewable {

    // MARK: - Type Alias

    typealias Configuration = RatingDisplayConfiguration
    typealias ComponentUIView = SparkUIRatingDisplay

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
                    RatingDisplayImplementationView(configuration: self.configuration)
                }
            },
            mainItemsView: {
                StepperConfigurationItemView(
                    name: "rating",
                    value: self.configuration.rating,
                    bounds: 0...5,
                    step: 0.25
                )

                EnumConfigurationItemView(
                    name: "stars",
                    values: RatingDisplayStars.allCases,
                    selectedValue: self.configuration.stars
                )

                EnumConfigurationItemView(
                    name: "size",
                    values: RatingDisplaySize.allCases,
                    selectedValue: self.configuration.size
                )

                TextFieldConfigurationItemView(
                    name: "text",
                    text: self.configuration.text
                )

                TextFieldConfigurationItemView(
                    name: "count text",
                    text: self.configuration.countText
                )

                TextFieldConfigurationItemView(
                    name: "additional text",
                    text: self.configuration.additionalText
                )

                if self.framework.isUIKit {
                    ToggleConfigurationItemView(
                        name: "is attributed text",
                        isOn: self.configuration.uiKitIsAttributedText
                    )
                } else {
                    ToggleConfigurationItemView(
                        name: "is custom content",
                        isOn: self.configuration.swiftUIIsCustomContent
                    )

                    if self.configuration.wrappedValue.swiftUIIsCustomContent {
                        TextFieldConfigurationItemView(
                            name: "second text",
                            text: self.configuration.swiftUISecondText
                        )
                    }
                }
            }
        )
    }
}
