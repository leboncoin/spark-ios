//
//  FileUploadButtonGetContentTypeUseCase.swift
//  SparkComponentFileUpload
//
//  Created by robin.lemaire on 01/04/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
@_spi(SI_SPI) import SparkTheming
import SwiftUI
import PhotosUI

// sourcery: AutoMockable, AutoMockTest
protocol FileUploadButtonGetContentTypeUseCaseable {
    func execute(
        photoTypes: [PHPickerFilter],
        fileTypes: [UTType]
    ) -> FileUploadButtonContentType
}

struct FileUploadButtonGetContentTypeUseCase: FileUploadButtonGetContentTypeUseCaseable {

    // MARK: - Methods

    func execute(
        photoTypes: [PHPickerFilter],
        fileTypes: [UTType]
    ) -> FileUploadButtonContentType {
        switch (photoTypes.isEmpty, fileTypes.isEmpty) {
        case (false, false): .all
        case (true, false): .files
        case (false, true): .photos
        default: .none
        }
    }
}
