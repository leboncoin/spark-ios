//
//  FileUploadToken+Dropzone.swift
//  SparkComponentFileUpload
//
//  Created by Robin Lemaire on 28/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

// MARK: - Dropzone

public extension FileUploadToken {

    /// Contains the token values of the FileUpload Dropzone.
    struct Dropzone: Equatable {

        // MARK: - Properties

        /// The border properties.
        public let border: Border

        /// The colors properties.
        public let colors: Colors

        /// The layout properties.
        public let layout: Layout

        /// The size properties.
        public let size = Size()

        /// The typography properties.
        public let typography: Typography

        // MARK: - Initialization

        init(theme: any Theme) {
            self.border = .init(theme: theme)
            self.colors = .init(theme: theme)
            self.layout = .init(theme: theme)
            self.typography = .init(theme: theme)
        }
    }
}
