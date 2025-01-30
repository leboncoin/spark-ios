//
//  RatingComponentView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 28/01/2025.
//  Copyright © 2025 Adevinta. All rights reserved.
//

import SwiftUI

// MARK: - View

typealias RatingDisplayComponentView = ComponentViewable<RatingDisplayConfiguration, RatingDisplayImplementationView, RatingDisplayConfigurationView>

extension RatingDisplayComponentView {

    init() {
        self.init(style: .verticalList, styles: [.alone, .verticalList])
    }
}

// MARK: - Subview

struct RatingDisplayImplementationView: ComponentImplementationViewable {

    // MARK: - Properties

    var configuration: Binding<RatingDisplayConfiguration>

    // MARK: - View

    var body: some View {
        RatingDisplayView(
            theme: self.configurationWrapped.theme.value,
            intent: self.configurationWrapped.intent,
            count: self.configurationWrapped.numberOfStars,
            size: self.configurationWrapped.size,
            rating: self.configurationWrapped.rating
        )
        .demoAccessibilityLabel(self.configurationWrapped)
    }
}

struct RatingDisplayConfigurationView: ConfigurationViewable {

    // MARK: - Properties

    var configuration: Binding<RatingDisplayConfiguration>

    // MARK: - View

    var body: some View {
        ComponentConfigurationView(
            configuration: self.configuration,
            componentViewType: RatingDisplayImplementationView.self,
            itemsView: {
                EnumConfigurationView(
                    name: "intent",
                    values: RatingIntent.allCases,
                    selectedValue: self.configuration.intent
                )

                EnumConfigurationView(
                    name: "size",
                    values: RatingDisplaySize.allCases,
                    selectedValue: self.configuration.size
                )

                EnumConfigurationView(
                    name: "no. of stars",
                    values: RatingStarsCount.allCases,
                    selectedValue: self.configuration.numberOfStars
                )

                StepperConfigurationView(
                    name: "rating",
                    value: self.configuration.rating,
                    bounds: 0...5,
                    step: 0.5
                )
            }
        )
    }
}

// MARK: - Preview

struct RatingDisplayComponentView_Previews: PreviewProvider {
    static var previews: some View {
        RatingDisplayComponentView()
    }
}
