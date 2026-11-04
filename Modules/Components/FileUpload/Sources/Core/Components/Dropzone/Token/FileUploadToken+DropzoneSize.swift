//
//  FileUploadToken+DropzoneSize.swift
//  SparkComponentFileUpload
//
//  Created by Robin Lemaire on 02/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

// MARK: - Size

public extension FileUploadToken.Dropzone {

    /// Contains the theme-independent size values of the Dropzone.
    struct Size: Equatable {

        // MARK: - Properties

        /// The size of the icon.
        public let image: CGFloat = 24
    }
}
