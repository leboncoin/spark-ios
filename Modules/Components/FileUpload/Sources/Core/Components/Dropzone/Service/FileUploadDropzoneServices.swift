//
//  FileUploadDropzoneServices.swift
//  SparkComponentFileUpload
//
//  Created by robin.lemaire on 02/04/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkTheming

final class FileUploadDropzoneServices: ObservableObject {

    // MARK: - Properties

    let fetchDroppedFiles = FileUploadDropzoneFetchDroppedFilesService()
}
