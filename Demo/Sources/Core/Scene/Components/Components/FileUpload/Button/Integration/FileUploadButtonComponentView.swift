//
//  FileUploadButtonComponentView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 24/04/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

// MARK: - View

typealias FileUploadButtonComponentView = ComponentViewable<FileUploadButtonConfiguration, FileUploadButtonImplementationView, FileUploadButtonConfigurationView, FileUploadButtonExtraTools>

// MARK: - Subview

struct FileUploadButtonImplementationView: ComponentImplementationViewable {

    // MARK: - Properties

    var configuration: Binding<FileUploadButtonConfiguration>
    @State private var files: [FileUpload] = []

    // MARK: - View

    var body: some View {
        VStack {
        self.component()
            .sparkTheme(self.configurationWrapped.theme.value)
            .demoAccessibilityLabel(self.configurationWrapped)

            ForEach(self.files) { file in
                Text(file.name)
            }
        }
    }

    @ViewBuilder
    private func component() -> some View {
        let title = self.configurationWrapped.title.nilIfEmpty
        let icon = self.configurationWrapped.icon

        // Title + Icon
        if let title, let icon {
            self.makeFullButton(
                title: title,
                icon: icon
            )

        } else if let title { // Title only
            self.makeTitleButton(
                title: title
            )

        } else if let icon { // Icon only
            self.makeIconButton(
                icon: icon
            )
        }
    }

    @ViewBuilder
    private func makeFullButton(
        title: String,
        icon: Iconography
    ) -> some View {
        let image = Image(icon: icon)

        SparkFileUploadButton(
            title,
            image: image,
            files: self.$files,
            photoTypes: self.configurationWrapped.photoTypes.toUITypes,
            photoSelectionBehavior: self.configurationWrapped.photoSelectionBehavior,
            photoMaxSelectionCount: self.configurationWrapped.photoMaxSelectionCount,
            fileTypes: self.configurationWrapped.fileTypes.toUITypes,
            fileAllowsMultipleSelection: self.configurationWrapped.fileAllowsMultipleSelection
        )
    }

    @ViewBuilder
    private func makeTitleButton(
        title: String
    ) -> some View {
        SparkFileUploadButton(
            title,
            files: self.$files,
            photoTypes: self.configurationWrapped.photoTypes.toUITypes,
            photoSelectionBehavior: self.configurationWrapped.photoSelectionBehavior,
            photoMaxSelectionCount: self.configurationWrapped.photoMaxSelectionCount,
            fileTypes: self.configurationWrapped.fileTypes.toUITypes,
            fileAllowsMultipleSelection: self.configurationWrapped.fileAllowsMultipleSelection
        )
    }

    @ViewBuilder
    private func makeIconButton(
        icon: Iconography
    ) -> some View {
        let image = Image(icon: icon)

        SparkFileUploadButton(
            image,
            files: self.$files,
            photoTypes: self.configurationWrapped.photoTypes.toUITypes,
            photoSelectionBehavior: self.configurationWrapped.photoSelectionBehavior,
            photoMaxSelectionCount: self.configurationWrapped.photoMaxSelectionCount,
            fileTypes: self.configurationWrapped.fileTypes.toUITypes,
            fileAllowsMultipleSelection: self.configurationWrapped.fileAllowsMultipleSelection)
    }
}
