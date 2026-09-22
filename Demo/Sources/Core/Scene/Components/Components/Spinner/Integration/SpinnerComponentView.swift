//
//  SpinnerImplementationView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 27/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

// MARK: - View

typealias SpinnerComponentView = ComponentViewable<SpinnerConfiguration, SpinnerImplementationView, SpinnerConfigurationView, SpinnerExtraTools>

// MARK: - Subview

struct SpinnerImplementationView: ComponentImplementationViewable {

    // MARK: - Properties

    var configuration: Binding<SpinnerConfiguration>

    // MARK: - View

    var body: some View {
        HStack {
            SparkSpinner()
                .sparkTheme(self.configurationWrapped.theme.value)
                .sparkSpinnerIntent(self.configurationWrapped.intent.toRealType(self.configurationWrapped))
                .sparkSpinnerSize(self.configurationWrapped.size)
            .demoAccessibilityLabel(self.configurationWrapped)
            .demoAccessibilityHidden(self.configurationWrapped)

            SpinnerView(
                theme: self.configurationWrapped.theme.value,
                intent: self.configurationWrapped.intent.toRealType(self.configurationWrapped),
                spinnerSize: self.configurationWrapped.size
            )
        }
        .demoAccessibilityLabel(self.configurationWrapped)
        .demoAccessibilityHidden(self.configurationWrapped)
    }
}
