//
//  FileUploadConvertible.swift
//  SparkComponentFileUpload
//
//  Created by robin.lemaire on 02/04/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

protocol FileUploadConvertible {

    init(
        name: String,
        fileExtension: String,
        size: Double,
        url: URL,
        data: Data
    )
}
