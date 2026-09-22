//
//  TextEditorConfigurationView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 11/02/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

struct TextEditorConfigurationView: ConfigurationViewable, ConfigurationUIViewable {

    // MARK: - Type Alias

    typealias Configuration = TextEditorConfiguration
    typealias ComponentUIView = TextEditorUIView

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
                    TextEditorImplementationView(configuration: self.configuration)
                }
            },
            mainItemsView: {
                EnumConfigurationItemView(
                    name: "intent",
                    values: TextEditorIntent.allCases,
                    selectedValue: self.configuration.intent
                )

                TextFieldConfigurationItemView(
                    name: "placeholder",
                    text: self.configuration.placeholder
                )

                if self.framework.isUIKit {
                    ToggleConfigurationItemView(
                        name: "is editable",
                        isOn: self.configuration.uiKitIsEditable
                    )

                    ToggleConfigurationItemView(
                        name: "is scroll enabled",
                        isOn: self.configuration.uiKitIsScrollEnabled
                    )
                } else {
                    ToggleConfigurationItemView(
                        name: "is read only",
                        isOn: self.configuration.swiftUIIsReadOnly
                    )

                }
            }
        )
    }
}
