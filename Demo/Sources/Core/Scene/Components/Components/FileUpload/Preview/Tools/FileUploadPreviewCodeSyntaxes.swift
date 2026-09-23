//
//  FileUploadPreviewCodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 24/04/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct FileUploadPreviewCodeSyntaxes {

    // MARK: - Properties

    static var content: [CodeSyntax] = {
        return [
            .init(title: "Basic Preview", code: Self.basicPreview),
            .init(title: "Custom Progress", code: Self.customProgress)
        ]
    }()

    // MARK: - Private Properties

    private static var basicPreview: String {
        """
        let file = FileUpload(
            id: "unique-id",
            name: "document.pdf",
            source: .files,
            result: .success(.init(
                url: fileURL,
                fileExtension: "pdf",
                size: 1024000
            ))
        )

        SparkFileUploadPreview(
            file: file,
            removeAction: {
                files.removeAll { $0.id == file.id }
            }
        )
        .sparkTheme(theme)
        """
    }

    private static var customProgress: String {
        """
        let file = FileUpload(
            id: "unique-id",
            name: "image.jpg",
            source: .photos,
            result: .success(.init(
                url: imageURL,
                fileExtension: "jpg",
                size: 2048000
            ))
        )

        SparkFileUploadPreview(
            file: file,
            progressContent: {
                ProgressView(value: uploadProgress)
                    .progressViewStyle(.linear)
            },
            removeAction: {
                files.removeAll { $0.id == file.id }
            }
        )
        .sparkTheme(theme)
        """
    }
}
