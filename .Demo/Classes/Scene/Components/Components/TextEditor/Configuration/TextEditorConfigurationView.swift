//
//  TextEditorConfigurationView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 11/02/2025.
//  Copyright © 2025 Adevinta. All rights reserved.
//

import SwiftUI

struct TextEditorConfigurationView: ConfigurationViewable, ConfigurationUIViewable {

    // MARK: - Type Alias

    typealias Configuration = TextEditorConfiguration
    typealias ComponentUIView = TextEditorUIView

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
        if let componentImplementationViewRepresentable {
            ComponentConfigurationView(
                configuration: self.configuration,
                componentView: componentImplementationViewRepresentable,
                mainItemsView: { self.itemsView() }
            )
        } else {
            ComponentConfigurationView(
                configuration: self.configuration,
                componentViewType: TextEditorImplementationView.self,
                mainItemsView: { self.itemsView() }
            )
        }
    }

    @ViewBuilder
    private func itemsView() -> some View {
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
        }
    }
}
