//
//  FileUploadDropzoneConfiguration.swift
//  SparkDemo
//
//  Created by robin.lemaire on 24/04/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

class FileUploadDropzoneConfiguration: FileUploadFilesConfiguration {

    // MARK: - Properties

    var icon: Iconography? = .random
    var isCustomContent: Bool = false
    var descriptionText = "Drag and drop a file or"
    var descriptionSecondText = "is amazing"
    var additionalText = "all files up to 5MB"
    var additionalSecondText = "is amazing"
}
