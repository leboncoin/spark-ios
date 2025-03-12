//
//  RadioButtonConfigurationView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 12/02/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

struct RadioButtonConfigurationView: ConfigurationViewable, ConfigurationUIViewable {

    // MARK: - Type Alias

    typealias Configuration = RadioButtonConfiguration
    typealias ComponentUIView = RadioButtonIntUIView

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
                    RadioButtonImplementationView(configuration: self.configuration)
                }
            },
            mainItemsView: {
                self.itemsView()
            }
        )
    }

    @ViewBuilder
    private func itemsView() -> some View {
        EnumConfigurationItemView(
            name: "intent",
            values: RadioButtonIntent.allCases,
            selectedValue: self.configuration.intent
        )

        EnumConfigurationItemView(
            name: "label alignment",
            values: RadioButtonLabelAlignment.allCases,
            selectedValue: self.configuration.labelAlignment
        )

        TextFieldConfigurationItemView(
            name: "text",
            text: self.configuration.text
        )

        if self.framework.isUIKit {
            ToggleConfigurationItemView(
                name: "is attributed text",
                isOn: self.configuration.uiKitIsAttributedText
            )
        }
    }
}
