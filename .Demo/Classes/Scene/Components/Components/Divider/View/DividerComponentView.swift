//
//  DividerComponentView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 28/01/2025.
//  Copyright © 2025 Adevinta. All rights reserved.
//

import SwiftUI

// MARK: - View

typealias DividerComponentView = ComponentViewable<DividerConfiguration, DividerImplementationView, DividerConfigurationView>

// MARK: - Subview

struct DividerImplementationView: ComponentImplementationViewable {

    // MARK: - Properties

    var configuration: Binding<DividerConfiguration>

    // MARK: - View

    var body: some View {
        self.component()
            .demoAccessibilityLabel(self.configurationWrapped)
    }

    private func component() -> DividerView {
        if !self.configurationWrapped.text.isEmpty {
            return DividerView(
                theme: self.configurationWrapped.theme.value,
                intent: self.configurationWrapped.intent,
                axis: self.configurationWrapped.axis,
                alignment: self.configurationWrapped.alignment,
                text: {
                    Text(self.configurationWrapped.text)
                }
            )
        } else {
            return DividerView(
                theme: self.configurationWrapped.theme.value,
                intent: self.configurationWrapped.intent,
                axis: self.configurationWrapped.axis,
                alignment: self.configurationWrapped.alignment
            )
        }
    }
}

struct DividerConfigurationView: ConfigurationViewable {

    // MARK: - Properties

    var configuration: Binding<DividerConfiguration>

    // MARK: - View

    var body: some View {
        ComponentConfigurationView(
            configuration: self.configuration,
            componentViewType: DividerImplementationView.self,
            itemsView: {
                EnumConfigurationView(
                    name: "intent",
                    values: DividerIntent.allCases,
                    selectedValue: self.configuration.intent
                )

                EnumConfigurationView(
                    name: "axis",
                    values: DividerAxis.allCases,
                    selectedValue: self.configuration.axis
                )

                EnumConfigurationView(
                    name: "alignment",
                    values: DividerAlignment.allCases,
                    selectedValue: self.configuration.alignment
                )

                TextFieldConfigurationView(
                    name: "text",
                    text: self.configuration.text
                )
            }
        )
    }
}

// MARK: - Preview

struct DividerComponentView_Previews: PreviewProvider {
    static var previews: some View {
        DividerComponentView()
    }
}
