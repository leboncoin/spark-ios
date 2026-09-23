//
//  FileUpload.swift
//  SparkComponentFileUpload
//
//  Created by robin.lemaire on 26/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

/// Represents a Spark file upload with its metadata and status.
///
/// This structure encapsulates all information about a file being uploaded,
/// including its identifier, name, source origin, and the result of the upload operation.
public struct FileUpload: Identifiable, Equatable {

    // MARK: - Properties

    /// Unique identifier for the file upload.
    public let id: String

    /// Display name of the file being uploaded.
    public let name: String

    /// The source from which the file originates (photos, files, camera, or drop).
    public let source: FileUploadSource

    /// The result of the upload operation, containing either success details or failure information.
    public var result: Result<FileUploadDetails, FileUploadError>

    // MARK: - Internal Properties

    /// Indicates whether the upload was successful.
    internal var isSucceed: Bool {
        switch self.result {
        case .success: true
        case .failure: false
        }
    }

    // MARK: - Public Initialization

    /// Creates a new spark file upload instance.
    ///
    /// - Parameters:
    ///   - id: Unique identifier for the file upload.
    ///   - name: Display name of the file.
    ///   - source: The source from which the file originates.
    ///   - result: The result of the upload operation.
    public init(
        id: String,
        name: String,
        source: FileUploadSource,
        result: Result<FileUploadDetails, FileUploadError>
    ) {
        self.id = id
        self.name = name
        self.source = source
        self.result = result
    }

    // MARK: - Initialization

    init(
        id: String,
        transfer: FileUploadPhotoTransfer
    ) {
        self.id = id
        self.name = transfer.name
        self.source = .photos
        self.result = .success(.init(transfer: transfer))
    }

    init(
        id: String = UUID().uuidString,
        name: String? = nil,
        source: FileUploadSource,
        error: FileUploadError
    ) {
        self.id = id
        self.name = name ?? id
        self.source = source
        self.result = .failure(error)
    }

    // MARK: - Equatable

    public static func == (lhs: FileUpload, rhs: FileUpload) -> Bool {
        return lhs.id == rhs.id &&
        lhs.name == rhs.name &&
        lhs.source == rhs.source &&
        lhs.result == rhs.result
    }
}
