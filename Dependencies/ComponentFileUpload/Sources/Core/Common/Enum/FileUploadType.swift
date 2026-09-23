//
//  FileUploadType.swift
//  SparkComponentFileUpload
//
//  Created by robin.lemaire on 24/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

/// `FileUploadType` determines the type of the file upload.
public enum FileUploadType: CaseIterable {
    case file
    case image
    case pdf
    case video

    // MARK: - Properties

    /// The default value. Equals to **.file**
    public static let `default`: FileUploadType = .file
}
