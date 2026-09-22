//
//  FileUploadFilesConfiguration.swift
//  SparkDemo
//
//  Created by robin.lemaire on 24/04/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

class FileUploadFilesConfiguration: ComponentConfiguration {

    // MARK: - Properties

    var photoTypes: FileUploadPhotoType = .sparkDefault
    var photoSelectionBehavior: FileUploadPhotoSelectionBehavior = .default
    var photoMaxSelectionCount: Int = 5
    var fileTypes: FileUploadFileType = .sparkDefault
    var fileAllowsMultipleSelection: Bool = false

    // MARK: - Initialization

    required init() {
        super.init()

        self.accessibilityLabel.showConfiguration = true
    }
}
