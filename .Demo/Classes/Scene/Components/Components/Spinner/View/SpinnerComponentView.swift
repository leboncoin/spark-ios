//
//  SpinnerImplementationView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 27/01/2025.
//  Copyright © 2025 Adevinta. All rights reserved.
//

import SwiftUI

// MARK: - View

typealias SpinnerComponentView = ComponentViewable<SpinnerConfiguration, SpinnerImplementationView, SpinnerConfigurationView>

// MARK: - Subview

struct SpinnerImplementationView: ComponentImplementationViewable {

    // MARK: - Properties

    var configuration: Binding<SpinnerConfiguration>

    // MARK: - View

    var body: some View {
        SpinnerView(
            theme: self.configurationWrapped.theme.value,
            intent: self.configurationWrapped.intent,
            spinnerSize: self.configurationWrapped.spinnerSize
        )
        .demoAccessibilityLabel(self.configurationWrapped)
    }
}

struct SpinnerConfigurationView: ConfigurationViewable {

    // MARK: - Properties

    var configuration: Binding<SpinnerConfiguration>

    // MARK: - View

    var body: some View {
        ComponentConfigurationView(
            configuration: self.configuration,
            componentViewType: SpinnerImplementationView.self,
            itemsView: {
                EnumConfigurationView(
                    name: "intent",
                    values: SpinnerIntent.allCases,
                    selectedValue: self.configuration.intent
                )

                EnumConfigurationView(
                    name: "size",
                    values: SpinnerSize.allCases,
                    selectedValue: self.configuration.spinnerSize
                )
            }
        )
    }
}

// MARK: - Preview

struct SpinnerComponentView_Previews: PreviewProvider {
    static var previews: some View {
        SpinnerComponentView()
    }
}
