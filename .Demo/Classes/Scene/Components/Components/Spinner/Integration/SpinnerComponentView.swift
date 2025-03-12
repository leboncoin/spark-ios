//
//  SpinnerImplementationView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 27/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

// MARK: - View

typealias SpinnerComponentView = ComponentViewable<SpinnerConfiguration, SpinnerImplementationView, SpinnerConfigurationView>

// MARK: - Subview

struct SpinnerImplementationView: ComponentImplementationViewable {

    // MARK: - Properties

    var configuration: Binding<SpinnerConfiguration>

    // MARK: - View

    var body: some View {
        SpinnerView(
            theme: self.configurationWrapped.theme.value,
            intent: self.configurationWrapped.intent,
            spinnerSize: self.configurationWrapped.spinnerSize
        )
        .demoAccessibilityLabel(self.configurationWrapped)
    }
}

// MARK: - Preview

struct SpinnerComponentView_Previews: PreviewProvider {
    static var previews: some View {
        SpinnerComponentView()
    }
}
