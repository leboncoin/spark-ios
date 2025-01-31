//
//  IconComponentView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 28/01/2025.
//  Copyright © 2025 Adevinta. All rights reserved.
//

import SwiftUI

// MARK: - View

typealias IconComponentView = ComponentViewable<IconConfiguration, IconImplementationView, IconConfigurationView>

// MARK: - Subview

struct IconImplementationView: ComponentImplementationViewable {

    // MARK: - Properties

    var configuration: Binding<IconConfiguration>

    // MARK: - View

    var body: some View {
        IconView(
            theme: self.configurationWrapped.theme.value,
            intent: self.configurationWrapped.intent,
            size: self.configurationWrapped.size,
            iconImage: .init(icon: self.configurationWrapped.icon)
        )
        .demoAccessibilityLabel(self.configurationWrapped)
    }
}

struct IconConfigurationView: ConfigurationViewable {

    // MARK: - Properties

    var configuration: Binding<IconConfiguration>

    // MARK: - View

    var body: some View {
        ComponentConfigurationView(
            configuration: self.configuration,
            componentViewType: IconImplementationView.self,
            mainItemsView: {
                EnumConfigurationView(
                    name: "icon",
                    values: Iconography.allCases,
                    selectedValue: self.configuration.icon
                )

                EnumConfigurationView(
                    name: "intent",
                    values: IconIntent.allCases,
                    selectedValue: self.configuration.intent
                )

                EnumConfigurationView(
                    name: "size",
                    values: IconSize.allCases,
                    selectedValue: self.configuration.size
                )
            }
        )
    }
}

// MARK: - Preview

struct IconComponentView_Previews: PreviewProvider {
    static var previews: some View {
        IconComponentView()
    }
}
