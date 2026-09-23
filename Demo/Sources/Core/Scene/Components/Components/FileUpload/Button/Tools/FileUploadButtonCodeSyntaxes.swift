//
//  FileUploadButtonCodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 24/04/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct FileUploadButtonCodeSyntaxes {

    // MARK: - Properties

    static var content: [CodeSyntax] = {
        return [
            .init(title: "Text Only", code: Self.textOnly),
            .init(title: "Text + Icon", code: Self.textIcon),
            .init(title: "Icon Only", code: Self.iconOnly),
            .init(title: "Custom Label", code: Self.customLabel),
            .init(title: "Full Configuration", code: Self.fullConfiguration)
        ]
    }()

    // MARK: - Private Properties

    private static var textOnly: String {
        """
        SparkFileUploadButton(
            "Upload File",
            files: $uploadedFiles
        )
        .sparkTheme(theme)
        """
    }

    private static var textIcon: String {
        """
        SparkFileUploadButton(
            "Upload Photo",
            image: Image(systemName: "photo"),
            files: $uploadedFiles,
            photoTypes: [.images, .videos],
            photoMaxSelectionCount: 3
        )
        .sparkTheme(theme)
        """
    }

    private static var iconOnly: String {
        """
        SparkFileUploadButton(
            Image(systemName: "photo.badge.plus"),
            files: $uploadedFiles,
            photoTypes: [.images],
            photoMaxSelectionCount: 1
        )
        .sparkTheme(theme)
        """
    }

    private static var customLabel: String {
        """
        SparkFileUploadButton(
            files: $uploadedFiles,
            photoTypes: [.images],
            fileTypes: [.pdf]
        ) {
            VStack {
                Image(systemName: "cloud.upload")
                    .font(.largeTitle)
                Text("Upload Files")
                    .font(.headline)
            }
            .padding()
            .background(Color.blue.opacity(0.1))
            .cornerRadius(8)
        }
        .sparkTheme(theme)
        """
    }

    private static var fullConfiguration: String {
        """
        SparkFileUploadButton(
            "Upload File",
            image: Image(systemName: "arrow.up.doc"),
            files: $uploadedFiles,
            photoTypes: [.images, .videos],
            photoSelectionBehavior: .continuous,
            photoMaxSelectionCount: 5,
            fileTypes: [.pdf, .png, .plainText],
            fileAllowsMultipleSelection: true
        )
        .sparkTheme(theme)
        """
    }
}
