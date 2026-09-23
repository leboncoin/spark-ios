//
//  FileUploadPreviewContent.swift
//  SparkComponentFileUpload
//
//  Created by robin.lemaire on 24/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct FileUploadPreviewContent: Equatable {

    // MARK: - Properties

    var fileSize: String?
    var error: String?

    // MARK: - Initialization

    init() {
        self.fileSize = nil
        self.error = nil
    }

    init(fileSize: String) {
        self.fileSize = fileSize
        self.error = nil
    }

    init(error: String) {
        self.fileSize = nil
        self.error = error
    }
}
