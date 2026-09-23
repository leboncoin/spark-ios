//
//  FileUploadDetails.swift
//  SparkComponentFileUpload
//
//  Created by robin.lemaire on 28/04/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

/// Contains detailed information about a successfully uploaded file.
///
/// This structure provides metadata about the uploaded file including its location,
/// file type, size, and preview configuration.
public struct FileUploadDetails: Equatable {

    // MARK: - Properties

    /// The local or remote URL where the file is located.
    public let url: URL

    /// The data of the file.
    public let data: Data

    /// The file extension (e.g., "pdf", "jpg", "png").
    public let fileExtension: String

    /// The size of the file in bytes.
    public let size: Double

    // MARK: - Internal Properties

    /// The preview type determined by the file extension.
    internal let previewType: FileUploadPreviewType

    /// The viewer type for previewing the file, determined by the file extension.
    internal let previewViewerType: FileUploadPreviewViewerType

    // MARK: - Initialization

    /// Creates a new file upload details instance.
    ///
    /// The preview type and viewer type are automatically determined from the file extension.
    ///
    /// - Parameters:
    ///   - url: The location of the file.
    ///   - data: The data of the file.
    ///   - fileExtension: The file extension.
    ///   - size: The size of the file in bytes.
    public init(
        url: URL,
        data: Data,
        fileExtension: String,
        size: Double
    ) {
        self.url = url
        self.data = data
        self.fileExtension = fileExtension
        self.size = size
        self.previewType = .init(fileExtension: fileExtension)
        self.previewViewerType = .init(fileExtension: fileExtension)
    }

    /// Creates a new file upload details instance from a photo transfer.
    ///
    /// - Parameter transfer: The photo transfer containing file details.
    init(transfer: FileUploadPhotoTransfer) {
        let fileExtension = transfer.fileExtension

        self.url = transfer.url
        self.data = transfer.data
        self.fileExtension = fileExtension
        self.size = transfer.size
        self.previewType = .init(fileExtension: fileExtension)
        self.previewViewerType = .init(fileExtension: fileExtension)
    }
}
