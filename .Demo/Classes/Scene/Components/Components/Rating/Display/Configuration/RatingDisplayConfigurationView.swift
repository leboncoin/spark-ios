//
//  RatingDisplayConfigurationView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 12/02/2025.
//  Copyright © 2025 Adevinta. All rights reserved.
//

import SwiftUI

struct RatingDisplayConfigurationView: ConfigurationViewable {

    // MARK: - Properties

    var configuration: Binding<RatingDisplayConfiguration>

    // MARK: - View

    var body: some View {
        ComponentConfigurationView(
            configuration: self.configuration,
            componentViewType: RatingDisplayImplementationView.self,
            mainItemsView: {
                EnumConfigurationItemView(
                    name: "intent",
                    values: RatingIntent.allCases,
                    selectedValue: self.configuration.intent
                )

                EnumConfigurationItemView(
                    name: "size",
                    values: RatingDisplaySize.allCases,
                    selectedValue: self.configuration.size
                )

                EnumConfigurationItemView(
                    name: "no. of stars",
                    values: RatingStarsCount.allCases,
                    selectedValue: self.configuration.numberOfStars
                )

                StepperConfigurationItemView(
                    name: "rating",
                    value: self.configuration.rating,
                    bounds: 0...5,
                    step: 0.5
                )
            }
        )
    }
}
