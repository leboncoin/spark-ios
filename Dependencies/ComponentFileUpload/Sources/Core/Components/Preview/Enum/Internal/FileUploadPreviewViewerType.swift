//
//  FileUploadPreviewViewerType.swift
//  SparkComponentFileUpload
//
//  Created by robin.lemaire on 24/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

enum FileUploadPreviewViewerType: CaseIterable {
    case image
    case video
    case pdf
    case webview

    // MARK: - Initialization

    init(fileExtension value: String) {
        self = switch value {
        case "jpg", "jpeg", "png", "tiff", "tif", "heif", "heic", "raw": .image
        case "mp4", "m4v", "mov": .video
        case "pdf": .pdf
        default: .webview
        }
    }
}
