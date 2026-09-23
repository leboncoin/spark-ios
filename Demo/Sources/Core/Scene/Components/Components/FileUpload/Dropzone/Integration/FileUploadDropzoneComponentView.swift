//
//  FileUploadDropzoneComponentView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 24/04/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

// MARK: - View

typealias FileUploadDropzoneComponentView = ComponentViewable<FileUploadDropzoneConfiguration, FileUploadDropzoneImplementationView, FileUploadDropzoneConfigurationView, FileUploadDropzoneExtraTools>

extension FileUploadDropzoneComponentView {

    init() {
        self.init(style: .alone, styles: [.alone])
    }
}

// MARK: - Subview

struct FileUploadDropzoneImplementationView: ComponentImplementationViewable {

    // MARK: - Properties

    var configuration: Binding<FileUploadDropzoneConfiguration>
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
        let image = Image(icon: self.configurationWrapped.icon)
        let description = self.configurationWrapped.descriptionText.nilIfEmpty
        let additional = self.configurationWrapped.additionalText.nilIfEmpty
        let isCustomContent = self.configurationWrapped.isCustomContent

        // Description and Additional
        if let description, let additional {
            self.makeFullDropzone(
                image: image,
                description: description,
                additional: additional,
                isCustomContent: isCustomContent
            )

        } else if let description { // Description only
            self.makeDescriptionDropzone(
                image: image,
                description: description,
                isCustomContent: isCustomContent
            )

        } else if let additional { // Additional only
            self.makeAdditionalDropzone(
                image: image,
                additional: additional,
                isCustomContent: isCustomContent
            )
        }
    }

    @ViewBuilder
    private func makeFullDropzone(
        image: Image?,
        description: String,
        additional: String,
        isCustomContent: Bool
    ) -> some View {
        if isCustomContent {
            SparkFileUploadDropzone(
                icon: image,
                files: self.$files,
                fileTypes: self.configurationWrapped.fileTypes.toUITypes,
                descriptionLabel: {
                    self.makeCustomLabel(
                        description,
                        secondText: self.configurationWrapped.descriptionSecondText
                    )
                },
                uploadButton: {
                    self.makeButton()
                },
                additionalLabel: {
                    self.makeCustomLabel(
                        additional,
                        secondText: self.configurationWrapped.additionalSecondText
                    )
                }
            )

        } else {
            SparkFileUploadDropzone(
                icon: image,
                descriptionText: description,
                additionalText: additional,
                files: self.$files,
                fileTypes: self.configurationWrapped.fileTypes.toUITypes,
                uploadButton: {
                    self.makeButton()
                }
            )
        }
    }

    @ViewBuilder
    private func makeDescriptionDropzone(
        image: Image?,
        description: String,
        isCustomContent: Bool
    ) -> some View {
        if isCustomContent {
            SparkFileUploadDropzone(
                icon: image,
                files: self.$files,
                fileTypes: self.configurationWrapped.fileTypes.toUITypes,
                descriptionLabel: {
                    self.makeCustomLabel(
                        description,
                        secondText: self.configurationWrapped.descriptionSecondText
                    )
                },
                uploadButton: {
                    self.makeButton()
                }
            )

        } else {
            SparkFileUploadDropzone(
                icon: image,
                descriptionText: description,
                files: self.$files,
                fileTypes: self.configurationWrapped.fileTypes.toUITypes,
                uploadButton: {
                    self.makeButton()
                }
            )
        }
    }

    @ViewBuilder
    private func makeAdditionalDropzone(
        image: Image?,
        additional: String,
        isCustomContent: Bool
    ) -> some View {
        if isCustomContent {
            SparkFileUploadDropzone(
                icon: image,
                files: self.$files,
                fileTypes: self.configurationWrapped.fileTypes.toUITypes,
                uploadButton: {
                    self.makeButton()
                },
                additionalLabel: {
                    self.makeCustomLabel(
                        additional,
                        secondText: self.configurationWrapped.additionalSecondText
                    )
                },
            )

        } else {
            SparkFileUploadDropzone(
                icon: image,
                additionalText: additional,
                files: self.$files,
                fileTypes: self.configurationWrapped.fileTypes.toUITypes,
                uploadButton: {
                    self.makeButton()
                }
            )
        }
    }

    // MARK: - Other View

    private func makeButton() -> some View {
        SparkFileUploadButton(
            "Browse my files",
            files: self.$files,
            photoTypes: self.configurationWrapped.photoTypes.toUITypes,
            photoSelectionBehavior: self.configurationWrapped.photoSelectionBehavior,
            photoMaxSelectionCount: self.configurationWrapped.photoMaxSelectionCount,
            fileTypes: self.configurationWrapped.fileTypes.toUITypes,
            fileAllowsMultipleSelection: self.configurationWrapped.fileAllowsMultipleSelection
        )
    }

    private func makeCustomLabel(_ text: String, secondText: String) -> some View {
        HStack {
            Text(text)
                .foregroundStyle(.orange)
            Text(secondText)
                .font(.footnote)
                .foregroundStyle(.blue)
        }
    }
}
