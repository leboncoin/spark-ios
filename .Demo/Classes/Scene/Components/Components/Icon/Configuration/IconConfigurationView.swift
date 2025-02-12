//
//  IconConfigurationView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 12/02/2025.
//  Copyright © 2025 Adevinta. All rights reserved.
//

import SwiftUI

struct IconConfigurationView: ConfigurationViewable {

    // MARK: - Properties

    var configuration: Binding<IconConfiguration>

    // MARK: - View

    var body: some View {
        ComponentConfigurationView(
            configuration: self.configuration,
            componentViewType: IconImplementationView.self,
            mainItemsView: {
                EnumConfigurationItemView(
                    name: "icon",
                    values: Iconography.allCases,
                    selectedValue: self.configuration.icon
                )

                EnumConfigurationItemView(
                    name: "intent",
                    values: IconIntent.allCases,
                    selectedValue: self.configuration.intent
                )

                EnumConfigurationItemView(
                    name: "size",
                    values: IconSize.allCases,
                    selectedValue: self.configuration.size
                )
            }
        )
    }
}
