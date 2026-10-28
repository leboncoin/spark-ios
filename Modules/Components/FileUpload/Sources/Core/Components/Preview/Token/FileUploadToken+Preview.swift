//
//  FileUploadToken+Preview.swift
//  SparkComponentFileUpload
//
//  Created by Robin Lemaire on 28/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

// MARK: - Preview

public extension FileUploadToken {

    /// Contains the token values of the FileUpload Preview.
    struct Preview: Equatable {

        // MARK: - Properties

        /// The border properties.
        public let border: Border

        /// The button properties.
        public let button = Button()

        /// The colors properties.
        public let colors: Colors

        /// The layout properties.
        public let layout: Layout

        /// The scale effect properties.
        public let scaleEffect = ScaleEffect()

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
