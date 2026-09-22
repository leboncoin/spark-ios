//
//  FileUploadButtonContentType.swift
//  SparkComponentFileUpload
//
//  Created by robin.lemaire on 24/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@_spi(SI_SPI) import SparkCommon
import SwiftUI

enum FileUploadButtonContentType {
    case photos
    case files
    case all
    case none

    // MARK: - Properties

    static let `default`: FileUploadButtonContentType = .none

    var isMenu: Bool {
        self == .all
    }

    var showPhotos: Bool {
        self == .photos || self == .all
    }

    var showFiles: Bool {
        self == .files || self == .all
    }
}
