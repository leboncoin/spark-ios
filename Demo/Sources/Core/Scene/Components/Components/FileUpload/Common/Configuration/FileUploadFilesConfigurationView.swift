//
//  FileUploadFilesConfigurationView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 24/04/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

struct FileUploadFilesConfigurationView<Configuration>: View where Configuration: FileUploadFilesConfiguration {

    // MARK: - Properties

    @Binding var configuration: Configuration

    // MARK: - Initialization

    init(configuration: Binding<Configuration>) {
        self._configuration = configuration
    }

    // MARK: - View

    var body: some View {
        Section("Photos") {
            EnumConfigurationItemView(
                name: "photo types",
                values: FileUploadPhotoType.allCases,
                selectedValue: self.$configuration.photoTypes
            )

            EnumConfigurationItemView(
                name: "photo selection behavior",
                values: FileUploadPhotoSelectionBehavior.allCases,
                selectedValue: self.$configuration.photoSelectionBehavior
            )

            StepperConfigurationItemView(
                name: "photo max selection count",
                value: self.$configuration.photoMaxSelectionCount,
                bounds: 0...10
            )
        }

        Section("Files") {
            EnumConfigurationItemView(
                name: "file types",
                values: FileUploadFileType.allCases,
                selectedValue: self.$configuration.fileTypes
            )

            ToggleConfigurationItemView(
                name: "file allows multiple selection",
                isOn: self.$configuration.fileAllowsMultipleSelection
            )
        }
    }
}
