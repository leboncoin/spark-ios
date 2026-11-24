//
//  DotIndicatorComponentView.swift
//  SparkDemo
//
//  Created by Robin Lemaire on 24/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkComponentDotIndicator

// MARK: - View

typealias DotIndicatorComponentView = ComponentViewable<
    DotIndicatorConfiguration,
    DotIndicatorImplementationView,
    DotIndicatorConfigurationView,
    DotIndicatorExtraTools
>

extension DotIndicatorComponentView {
    init() {
        self.init(style: .alone, styles: [.alone])
    }
}

// MARK: - Subview

struct DotIndicatorImplementationView: ComponentImplementationViewable {

    // MARK: - Properties

    var configuration: Binding<DotIndicatorConfiguration>

    // MARK: - Initialization

    init(configuration: Binding<DotIndicatorConfiguration>) {
        self.configuration = configuration
    }

    // MARK: - View

    var body: some View {
        self.component()
            .sparkTheme(self.configurationWrapped.theme.value)
            .sparkDotIndicatorSize(self.configurationWrapped.size)
            .sparkDotIndicatorIntent(self.configurationWrapped.intent)
            .demoDisabled(self.configurationWrapped)
            .demoAccessibilityLabel(self.configurationWrapped)
            .padding(8)
            .background(self.configurationWrapped.intent == .surface ? Color.black : Color.clear)
    }

    @ViewBuilder
    private func component() -> some View {
        if self.configurationWrapped.isInteractive {
            SparkDotIndicator(
                numberOfPages: self.configurationWrapped.numberOfPages,
                currentPage: self.configuration.currentPage
            )
        } else {
            SparkDotIndicator(
                numberOfPages: self.configurationWrapped.numberOfPages,
                currentPage: self.configurationWrapped.currentPage
            )
        }
    }
}
