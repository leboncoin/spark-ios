//
//  SpinnerConfigurationView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 12/02/2025.
//  Copyright © 2025 Adevinta. All rights reserved.
//

import SwiftUI

struct SpinnerConfigurationView: ConfigurationViewable, ConfigurationUIViewable {

    // MARK: - Type Alias

    typealias Configuration = SpinnerConfiguration
    typealias ComponentUIView = SpinnerUIView

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
                componentViewType: SpinnerImplementationView.self,
                mainItemsView: { self.itemsView() }
            )
        }
    }

    @ViewBuilder
    private func itemsView() -> some View {
        EnumConfigurationItemView(
            name: "intent",
            values: SpinnerIntent.allCases,
            selectedValue: self.configuration.intent
        )

        EnumConfigurationItemView(
            name: "size",
            values: SpinnerSize.allCases,
            selectedValue: self.configuration.spinnerSize
        )
    }
}
