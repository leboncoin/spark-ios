//
//  RatingInputConfigurationView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 12/02/2025.
//  Copyright © 2025 Adevinta. All rights reserved.
//

import SwiftUI

struct RatingInputConfigurationView: ConfigurationViewable {

    // MARK: - Properties

    var configuration: Binding<RatingInputConfiguration>

    // MARK: - View

    var body: some View {
        ComponentConfigurationView(
            configuration: self.configuration,
            componentViewType: RatingInputImplementationView.self,
            mainItemsView: {
                EnumConfigurationItemView(
                    name: "intent",
                    values: RatingIntent.allCases,
                    selectedValue: self.configuration.intent
                )
            }
        )
    }
}
