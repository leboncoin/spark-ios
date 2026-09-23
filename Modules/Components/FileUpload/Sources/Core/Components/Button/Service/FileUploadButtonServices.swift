//
//  FileUploadButtonServices.swift
//  SparkComponentFileUpload
//
//  Created by robin.lemaire on 01/04/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkTheming

final class FileUploadButtonServices: ObservableObject {

    // MARK: - Properties

    let clearFiles = FileUploadButtonClearFilesService()
    let clearPhotosSelection = FileUploadButtonClearPhotosSelectionService()
    let fetchCameraImage = FileUploadButtonFetchCameraImageService()
    let fetchFiles = FileUploadButtonFetchFilesService()
    let fetchPhotos = FileUploadButtonFetchPhotosService()
}
