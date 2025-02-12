//
//  ButtonConfigurationView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 12/02/2025.
//  Copyright © 2025 Adevinta. All rights reserved.
//

import SwiftUI

struct ButtonConfigurationView: ConfigurationViewable {

    // MARK: - Properties

    var configuration: Binding<ButtonConfiguration>

    // MARK: - View

    var body: some View {
        ComponentConfigurationView(
            configuration: self.configuration,
            componentViewType: ButtonImplementationView.self,
            mainItemsView: {
                ButtonCommonConfigurationView(
                    configuration: self.configuration,
                    isIconButton: false
                )
            },
            otherSectionItemsView: {
                ButtonCommonOtherConfigurationView(
                    configuration: self.configuration,
                    isIconButton: false
                )
            }
        )
    }
}
