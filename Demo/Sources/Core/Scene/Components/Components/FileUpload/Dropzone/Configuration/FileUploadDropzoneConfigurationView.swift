//
//  FileUploadDropzoneConfigurationView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 24/04/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

struct FileUploadDropzoneConfigurationView: ConfigurationViewable {

    // MARK: - Type Alias

    typealias Configuration = FileUploadDropzoneConfiguration

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
                FileUploadDropzoneImplementationView(configuration: self.configuration)
            },
            mainItemsView: {
                self.itemsView()
            },
            otherSectionItemsView: {
                FileUploadFilesConfigurationView(configuration: self.configuration)
            }
        )
    }

    @ViewBuilder
    private func itemsView() -> some View {
        OptionalEnumConfigurationItemView(
            name: "icon",
            values: Iconography.allCases,
            selectedValue: self.configuration.icon
        )

        ToggleConfigurationItemView(
            name: "is custom content",
            isOn: self.configuration.isCustomContent
        )

        TextFieldConfigurationItemView(
            name: "description",
            text: self.configuration.descriptionText,
            orientation: .vertical
        )

        if self.configuration.wrappedValue.isCustomContent {
            TextFieldConfigurationItemView(
                name: "second description",
                text: self.configuration.descriptionSecondText
            )
        }

        TextFieldConfigurationItemView(
            name: "additional",
            text: self.configuration.additionalText,
            orientation: .vertical
        )

        if self.configuration.wrappedValue.isCustomContent {
            TextFieldConfigurationItemView(
                name: "second additional",
                text: self.configuration.additionalSecondText
            )
        }
    }
}
