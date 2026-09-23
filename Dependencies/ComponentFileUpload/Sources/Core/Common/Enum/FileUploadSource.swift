//
//  FileUploadSource.swift
//  SparkComponentFileUpload
//
//  Created by robin.lemaire on 27/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

/// The source of the file.
public enum FileUploadSource: CaseIterable {
    /// Comes from the photo library
    case photos
    /// Comes from the files app
    case files
    /// Comes from the camera
    case camera
    /// Comes from drop gesture
    case drop
}
