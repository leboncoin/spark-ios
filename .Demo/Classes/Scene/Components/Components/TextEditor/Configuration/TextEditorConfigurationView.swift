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

    typealias ComponentUIView = TextEditorUIView

    // MARK: - Properties

    var configuration: Binding<TextEditorConfiguration>
    var uiKitComponentImplementationView: ComponentImplementationUIViewRepresentable<TextEditorUIView, TextEditorConfiguration>? = nil

    // MARK: - Initialization

    init(configuration: Binding<TextEditorConfiguration>) {
        self.configuration = configuration
    }

    init(
        configuration: Binding<TextEditorConfiguration>,
        uiKitComponentImplementationView: ComponentImplementationUIViewRepresentable<TextEditorUIView, TextEditorConfiguration>
    ) {
        self.configuration = configuration
        self.uiKitComponentImplementationView = uiKitComponentImplementationView
    }

    // MARK: - View

    var body: some View {
        if let uiKitComponentImplementationView {
            ComponentConfigurationView(
                configuration: self.configuration,
                componentView: uiKitComponentImplementationView,
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
        EnumConfigurationView(
            name: "intent",
            values: TextEditorIntent.allCases,
            selectedValue: self.configuration.intent
        )

        TextFieldConfigurationView(
            name: "placeholder",
            text: self.configuration.placeholder
        )

        if self.framework.isUIKit {
            ToggleConfigurationView(
                name: "is editable",
                isOn: self.configuration.uiKitIsEditable
            )

            ToggleConfigurationView(
                name: "is scroll enabled",
                isOn: self.configuration.uiKitIsScrollEnabled
            )
        }
    }
}
