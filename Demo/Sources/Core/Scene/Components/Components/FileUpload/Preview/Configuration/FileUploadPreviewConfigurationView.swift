//
//  FileUploadPreviewConfigurationView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 24/04/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

struct FileUploadPreviewConfigurationView: ConfigurationViewable {

    // MARK: - Type Alias

    typealias Configuration = FileUploadPreviewConfiguration

    // MARK: - Properties

    var configuration: Binding<Configuration>

    // MARK: - Initialization

    init(configuration: Binding<Configuration>) {
        self.configuration = configuration
    }

    // MARK: - View

    var body: some View {
        ComponentConfigurationView(
            configuration: self.configuration,
            framework: .swiftUI,
            componentView: {
                FileUploadPreviewImplementationView(configuration: self.configuration)
            },
            mainItemsView: {
                self.itemsView()
            }
        )
    }

    @ViewBuilder
    private func itemsView() -> some View {
        ToggleConfigurationItemView(
            name: "on error",
            isOn: self.configuration.onError
        )

        ToggleConfigurationItemView(
            name: "is progress bar",
            isOn: self.configuration.isProgressBar
        )

        if self.configuration.wrappedValue.isProgressBar {
            ToggleConfigurationItemView(
                name: "is indeterminate",
                isOn: self.configuration.isIndeterminateProgressBar
            )
        }
    }
}
