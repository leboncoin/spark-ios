//
//  FileUploadPreviewImage.swift
//  SparkComponentFileUpload
//
//  Created by robin.lemaire on 24/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@_spi(SI_SPI) import SparkCommon
import SparkResources
import SwiftUI

enum FileUploadPreviewImage {
    case file
    case image
    case pdf
    case video
    case error

    // MARK: - Properties

    var swiftUIImage: Image {
        switch self {
        case .file:
            return Image(spark: \.fileOutline)
        case .image:
            return Image(spark: \.imageOutline)
        case .pdf:
            return Image(spark: \.pdfOutline)
        case .video:
            return Image(spark: \.playOutline)
        case .error:
            return Image(spark: \.warningOutline)
        }
    }
}
