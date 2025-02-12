//
//  PopoverConfigurationView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 12/02/2025.
//  Copyright © 2025 Adevinta. All rights reserved.
//

import SwiftUI

struct PopoverConfigurationView: ConfigurationViewable {

    // MARK: - Properties

    var configuration: Binding<PopoverConfiguration>

    // MARK: - View

    var body: some View {
        ComponentConfigurationView(
            configuration: self.configuration,
            componentViewType: PopoverImplementationView.self,
            mainItemsView: {
                EnumConfigurationItemView(
                    name: "intent",
                    values: PopoverIntent.allCases,
                    selectedValue: self.configuration.intent
                )

                TextFieldConfigurationItemView(
                    name: "text",
                    text: self.configuration.text
                )
            }
        )
    }
}
