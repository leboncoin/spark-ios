//
//  RatingInputComponentView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 28/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

// MARK: - View

typealias RatingInputComponentView = ComponentViewable<RatingInputConfiguration, RatingInputImplementationView, RatingInputConfigurationView, RatingExtraTools>

extension RatingInputComponentView {

    init() {
        self.init(style: .verticalList, styles: [.alone, .verticalList])
    }
}

// MARK: - Subview

struct RatingInputImplementationView: ComponentImplementationViewable {

    // MARK: - Properties

    var configuration: Binding<RatingInputConfiguration>
    @State private var rating: Double = 0

    // MARK: - View

    var body: some View {
        VStack {
            SparkRatingInput(value: self.$rating)
                .sparkTheme(self.configurationWrapped.theme.value)
                .demoDisabled(self.configurationWrapped)
                .demoAccessibilityLabel(self.configurationWrapped)
                .demoAccessibilityValue(self.configurationWrapped)

            Text(self.configurationWrapped.getInfoValue(from: self.rating))
                .demoComponentInfoBackground()
        }
    }
}
