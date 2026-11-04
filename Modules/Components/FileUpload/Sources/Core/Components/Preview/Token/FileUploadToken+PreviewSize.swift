//
//  FileUploadToken+PreviewSize.swift
//  SparkComponentFileUpload
//
//  Created by Robin Lemaire on 02/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

// MARK: - Size

public extension FileUploadToken.Preview {

    /// Contains the theme-independent size values of the Preview.
    struct Size: Equatable {

        // MARK: - Properties

        /// The size of the icon.
        public let image: CGFloat = 24

        /// The size of the image container.
        public let imageContainer: CGFloat = 36
    }
}
