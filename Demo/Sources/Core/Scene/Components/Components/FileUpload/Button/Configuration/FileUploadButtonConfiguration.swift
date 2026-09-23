//
//  FileUploadButtonConfiguration.swift
//  SparkDemo
//
//  Created by robin.lemaire on 24/04/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

class FileUploadButtonConfiguration: FileUploadFilesConfiguration {

    // MARK: - Properties

    var icon: Iconography? = .random
    var title: String = "Upload file"

    // MARK: - Initialization

    required init() {
        super.init()

        self.accessibilityLabel.showConfiguration = true
    }
}
