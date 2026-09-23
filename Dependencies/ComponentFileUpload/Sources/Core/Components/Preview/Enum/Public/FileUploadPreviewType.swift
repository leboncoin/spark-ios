//
//  FileUploadPreviewType.swift
//  SparkComponentFileUpload
//
//  Created by robin.lemaire on 24/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

/// `FileUploadPreviewType` determines the type of the file upload preview.
public enum FileUploadPreviewType: CaseIterable {
    case file
    case image
    case pdf
    case video

    // MARK: - Properties

    /// The default value. Equals to **.file**
    public static let `default`: FileUploadPreviewType = .file

    // MARK: - Initialization

    init(fileExtension value: String) {
        self = switch value {
        case "jpg", "jpeg", "png", "gif", "bmp", "webp", "svg", "ico", "tiff", "tif", "heif", "heic", "raw": .image
        case "pdf": .pdf
        case "mp4", "m4v", "avi", "mov", "wmv", "flv", "webm", "mkv": .video
        default: .file
        }
    }
}
