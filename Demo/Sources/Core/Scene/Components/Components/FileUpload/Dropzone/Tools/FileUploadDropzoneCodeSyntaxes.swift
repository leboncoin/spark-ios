//
//  FileUploadDropzoneCodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 24/04/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct FileUploadDropzoneCodeSyntaxes {

    // MARK: - Properties

    static var content: [CodeSyntax] = {
        return [
            .init(title: "Button Only", code: Self.buttonOnly),
            .init(title: "Description Only", code: Self.descriptionOnly),
            .init(title: "Description (Text)", code: Self.descriptionText),
            .init(title: "Additional Only", code: Self.additionalOnly),
            .init(title: "Additional (Text)", code: Self.additionalText),
            .init(title: "Complete (Text)", code: Self.completeText),
            .init(title: "Complete (Custom)", code: Self.completeCustom)
        ]
    }()

    // MARK: - Private Properties

    private static var buttonOnly: String {
        """
        SparkFileUploadDropzone(
            files: $files,
            uploadButton: {
                SparkFileUploadButton(
                    "Upload",
                    files: $files
                )
            }
        )
        .sparkTheme(theme)
        """
    }

    private static var descriptionOnly: String {
        """
        SparkFileUploadDropzone(
            files: $files,
            descriptionLabel: {
                VStack {
                    Text("Upload files")
                    Text("Drag and drop or browse")
                }
            },
            uploadButton: {
                SparkFileUploadButton(
                    "Browse",
                    files: $files
                )
            }
        )
        .sparkTheme(theme)
        """
    }

    private static var descriptionText: String {
        """
        SparkFileUploadDropzone(
            icon: Image(systemName: "arrow.up.doc"),
            descriptionText: "Drag and drop a file or",
            files: $files,
            uploadButton: {
                SparkFileUploadButton(
                    "Browse my files",
                    files: $files
                )
            }
        )
        .sparkTheme(theme)
        """
    }

    private static var additionalOnly: String {
        """
        SparkFileUploadDropzone(
            icon: Image(systemName: "arrow.up.doc"),
            files: $files,
            uploadButton: {
                SparkFileUploadButton(
                    "Upload Files",
                    files: $files
                )
            },
            additionalLabel: {
                HStack {
                    Image(systemName: "info.circle")
                    Text("Max 5MB")
                }
            }
        )
        .sparkTheme(theme)
        """
    }

    private static var additionalText: String {
        """
        SparkFileUploadDropzone(
            icon: Image(systemName: "arrow.up.doc"),
            additionalText: ".png, .jpg up to 5MB",
            files: $files,
            uploadButton: {
                SparkFileUploadButton(
                    "Upload Files",
                    files: $files
                )
            }
        )
        .sparkTheme(theme)
        """
    }

    private static var completeText: String {
        """
        SparkFileUploadDropzone(
            icon: Image(systemName: "arrow.up.doc"),
            descriptionText: "Drag and drop a file or",
            additionalText: ".png, .jpg up to 5MB",
            files: $files,
            fileTypes: [.pdf, .png, .jpeg],
            uploadButton: {
                SparkFileUploadButton(
                    "Browse my files",
                    files: $files,
                    fileTypes: [.pdf, .png, .jpeg]
                )
            }
        )
        .sparkTheme(theme)
        """
    }

    private static var completeCustom: String {
        """
        SparkFileUploadDropzone(
            icon: Image(systemName: "arrow.up.doc"),
            files: $files,
            fileTypes: [.pdf, .image],
            descriptionLabel: {
                VStack {
                    Text("Upload files")
                        .font(.headline)
                    Text("Drag and drop or browse")
                        .font(.subheadline)
                }
            },
            uploadButton: {
                SparkFileUploadButton(
                    "Browse",
                    files: $files,
                    fileTypes: [.pdf, .image]
                )
            },
            additionalLabel: {
                Text("Max 5MB")
                    .font(.caption)
            }
        )
        .sparkTheme(theme)
        """
    }
}
