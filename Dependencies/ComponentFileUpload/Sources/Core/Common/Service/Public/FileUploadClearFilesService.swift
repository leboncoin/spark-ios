//
//  FileUploadClearFilesService.swift
//  SparkComponentFileUpload
//
//  Created by robin.lemaire on 04/05/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

/// A service that clears temporary files associated with file uploads.
///
/// This service removes files from the temporary directory that were created during the upload process.
/// It specifically targets files that are located in the system's temporary directory.
public protocol FileUploadClearFilesServicing {
    /// Clears temporary files for the provided file uploads.
    ///
    /// This method removes files from the temporary directory for each successful upload.
    /// Files that are not in the temporary directory or failed uploads are ignored.
    ///
    /// - Parameter fileUploads: An array of file uploads whose temporary files should be cleared.
    /// - Throws: An error if file removal fails for any file.
    func execute(fileUploads: [FileUpload]) throws
}

public struct FileUploadClearFilesService: FileUploadClearFilesServicing {

    // MARK: - Properties

    private let fileManager: FileManager

    // MARK: - Initialization

    /// Creates a new instance of the temporary file clearing service.
    ///
    /// - Parameter fileManager: The file manager to use for file operations. Defaults to `.default`.
    public init(fileManager: FileManager = .default) {
        self.fileManager = fileManager
    }

    // MARK: - Methods

    public func execute(fileUploads: [FileUpload]) throws {
        let temporaryDirectory = fileManager.temporaryDirectory

        for fileUpload in fileUploads {
            // Only process successful uploads
            guard case .success(let details) = fileUpload.result else {
                continue
            }

            let fileURL = details.url

            // Check if the file is in the temporary directory
            guard fileURL.path.hasPrefix(temporaryDirectory.path) else {
                continue
            }

            // Check if the file exists before attempting to remove it
            guard fileManager.fileExists(atPath: fileURL.path) else {
                continue
            }

            // Remove the temporary file
            try fileManager.removeItem(at: fileURL)
        }
    }
}
