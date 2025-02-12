//
//  IconButtonConfigurationView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 12/02/2025.
//  Copyright © 2025 Adevinta. All rights reserved.
//

import SwiftUI

struct IconButtonConfigurationView: ConfigurationViewable {

    // MARK: - Properties

    var configuration: Binding<IconButtonConfiguration>

    // MARK: - View

    var body: some View {
        ComponentConfigurationView(
            configuration: self.configuration,
            componentViewType: IconButtonImplementationView.self,
            mainItemsView: {
                ButtonCommonConfigurationView(
                    configuration: self.configuration,
                    isIconButton: true
                )
            },
            otherSectionItemsView: {
                ButtonCommonOtherConfigurationView(
                    configuration: self.configuration,
                    isIconButton: true
                )
            }
        )
    }
}
