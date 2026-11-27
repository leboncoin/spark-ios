//
//  DotsIndicatorComponentView.swift
//  SparkDemo
//
//  Created by Robin Lemaire on 24/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkComponentDotsIndicator

// MARK: - View

typealias DotsIndicatorComponentView = ComponentViewable<
    DotsIndicatorConfiguration,
    DotsIndicatorImplementationView,
    DotsIndicatorConfigurationView,
    DotsIndicatorExtraTools
>

extension DotsIndicatorComponentView {
    init() {
        self.init(style: .alone, styles: [.alone])
    }
}

// MARK: - Subview

struct DotsIndicatorImplementationView: ComponentImplementationViewable {

    // MARK: - Properties

    var configuration: Binding<DotsIndicatorConfiguration>
    @State private var currentPage: Int = 0

    // MARK: - Initialization

    init(configuration: Binding<DotsIndicatorConfiguration>) {
        self.configuration = configuration
    }

    // MARK: - View

    var body: some View {
        self.component()
            .sparkTheme(self.configurationWrapped.theme.value)
            .sparkDotsIndicatorSize(self.configurationWrapped.size)
            .sparkDotsIndicatorIntent(self.configurationWrapped.intent)
            .demoDisabled(self.configurationWrapped)
            .demoAccessibilityLabel(self.configurationWrapped)
            .padding(8)
            .background(self.configurationWrapped.intent == .surface ? Color.black : Color.clear)
    }

    @ViewBuilder
    private func component() -> some View {

        Stepper("Value", value: self.$currentPage)

        if self.configurationWrapped.isInteractive {
            SparkDotsIndicator(
                numberOfPages: self.configurationWrapped.numberOfPages,
                currentPage: self.$currentPage
            )
        } else {
            SparkDotsIndicator(
                numberOfPages: self.configurationWrapped.numberOfPages,
                currentPage: self.currentPage
            )
        }
    }
}
