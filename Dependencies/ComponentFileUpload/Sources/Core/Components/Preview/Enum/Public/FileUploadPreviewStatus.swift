//
//  FileUploadPreviewStatus.swift
//  SparkComponentFileUpload
//
//  Created by robin.lemaire on 24/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

/// `FileUploadPreviewStatus` determines the status of the file upload preview.
public enum FileUploadPreviewStatus: CaseIterable {
    case succeed
    case failed

    // MARK: - Properties

    /// The default value. Equals to **.succeed**
    public static let `default`: FileUploadPreviewStatus = .succeed
}
