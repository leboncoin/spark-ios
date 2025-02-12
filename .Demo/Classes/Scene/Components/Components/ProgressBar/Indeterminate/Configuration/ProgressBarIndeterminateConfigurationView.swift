//
//  ProgressBarIndeterminateConfigurationView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 12/02/2025.
//  Copyright © 2025 Adevinta. All rights reserved.
//

import SwiftUI

struct ProgressBarIndeterminateConfigurationView: ConfigurationViewable {

    // MARK: - Properties

    var configuration: Binding<ProgressBarIndeterminateConfiguration>

    // MARK: - View

    var body: some View {
        ComponentConfigurationView(
            configuration: self.configuration,
            componentViewType: ProgressBarIndeterminateImplementationView.self,
            mainItemsView: {
                EnumConfigurationItemView(
                    name: "intent",
                    values: ProgressBarIntent.allCases,
                    selectedValue: self.configuration.intent
                )

                EnumConfigurationItemView(
                    name: "shape",
                    values: ProgressBarShape.allCases,
                    selectedValue: self.configuration.shape
                )

                ToggleConfigurationItemView(
                    name: "is animating",
                    isOn: self.configuration.isAnimating
                )
            }
        )
    }
}
