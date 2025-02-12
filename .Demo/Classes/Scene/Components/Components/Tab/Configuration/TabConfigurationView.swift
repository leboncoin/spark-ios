//
//  TabConfigurationView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 11/02/2025.
//  Copyright © 2025 Adevinta. All rights reserved.
//

import SwiftUI

struct TabConfigurationView: ConfigurationViewable, ConfigurationUIViewable {

    // MARK: - Type Alias

    typealias Configuration = TabConfiguration
    typealias ComponentUIView = TabUIView

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
                componentViewType: TabImplementationView.self,
                mainItemsView: { self.itemsView() }
            )
        }
    }
    
    @ViewBuilder
    private func itemsView() -> some View {
        EnumConfigurationItemView(
            name: "intent",
            values: TabIntent.allCases,
            selectedValue: self.configuration.intent
        )

        HStack(spacing: .medium) {
            EnumConfigurationItemView(
                name: "size",
                values: TabSize.allCases,
                selectedValue: self.configuration.tabSize
            )

            ToggleConfigurationItemView(
                name: "is equal size",
                isOn: self.configuration.isEqualSize
            )
        }

        StepperConfigurationItemView(
            name: "no. of tabs",
            value: self.configuration.numberOfTabs,
            bounds: 1...10
        )

        HStack(spacing: .medium) {
            ToggleConfigurationItemView(
                name: "is text",
                isOn: self.configuration.isText
            )

            ToggleConfigurationItemView(
                name: "is long label",
                isOn: self.configuration.isLongLabel
            )
        }

        HStack(spacing: .medium) {
            ToggleConfigurationItemView(
                name: "is icon",
                isOn: self.configuration.isIcon
            )

            ToggleConfigurationItemView(
                name: "is badge",
                isOn: self.configuration.isBadge
            )
        }

        ToggleConfigurationItemView(
            name: "disabled random tab",
            isOn: self.configuration.isDisabledRandomTab
        )
    }
}
