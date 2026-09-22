//
//  FileUploadButtonConfigurationView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 24/04/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

struct FileUploadButtonConfigurationView: ConfigurationViewable {

    // MARK: - Type Alias

    typealias Configuration = FileUploadButtonConfiguration

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
                FileUploadButtonImplementationView(configuration: self.configuration)
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

        TextFieldConfigurationItemView(
            name: "title",
            text: self.configuration.title
        )
    }
}
