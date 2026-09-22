//
//  FileUploadError.swift
//  SparkComponentFileUpload
//
//  Created by robin.lemaire on 28/04/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

/// Represents the various failure cases that can occur during file upload.
public enum FileUploadError: LocalizedError, Equatable {
    /// The photo resource could not be found in the library.
    case photoResourceNotFound

    /// An error occurred during photo transfer from the photo library.
    case photoTransfer(_ error: Error?)

    /// The file size could not be determined.
    case fileSizeNotFound(_ error: Error?)

    /// An error occurred while converting file data.
    case fileDataConversion(_ error: Error?)

    /// An error occurred during drop gesture file conversion.
    case dropConversion(_ error: Error?)

    /// A general error not covered by specific cases.
    case other(_ error: Error)

    // MARK: - Properties

    /// Returns a localized description of the error. If a sub error exists, returns its localized description.
    var localizedDescription: String {
        return switch self {
        case .photoResourceNotFound:
            .errorPhotoResourceNotFound
        case .photoTransfer(let error):
            error?.localizedDescription ?? .errorPhotoTransfer
        case .fileSizeNotFound(let error):
            error?.localizedDescription ?? .errorFileSizeNotFound
        case .fileDataConversion(let error):
            error?.localizedDescription ?? .errorFileDataConversion
        case .dropConversion(let error):
            error?.localizedDescription ?? .errorDropConversion
        case .other(let error):
            error.localizedDescription
        }
    }

    // MARK: - Equatable

    public static func == (lhs: FileUploadError, rhs: FileUploadError) -> Bool {
        switch (lhs, rhs) {
        case (.photoResourceNotFound, .photoResourceNotFound):
            return true
        case (.photoTransfer(let lhsError), .photoTransfer(let rhsError)):
            return lhsError?.localizedDescription == rhsError?.localizedDescription
        case (.fileSizeNotFound(let lhsError), .fileSizeNotFound(let rhsError)):
            return lhsError?.localizedDescription == rhsError?.localizedDescription
        case (.fileDataConversion(let lhsError), .fileDataConversion(let rhsError)):
            return lhsError?.localizedDescription == rhsError?.localizedDescription
        case (.dropConversion(let lhsError), .dropConversion(let rhsError)):
            return lhsError?.localizedDescription == rhsError?.localizedDescription
        case (.other(let lhsError), .other(let rhsError)):
            return lhsError.localizedDescription == rhsError.localizedDescription
        default:
            return false
        }
    }
}
