//
//  FileUploadToken+ButtonStyles.swift
//  SparkComponentFileUpload
//
//  Created by Robin Lemaire on 02/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import SparkComponentButton

// MARK: - Styles

public extension FileUploadToken.Button {

    /// Contains the theme-independent style values of the FileUpload Button.
    struct Styles: Equatable {

        // MARK: - Properties

        /// The alignment of the button.
        public let alignment: ButtonAlignment = .leadingImage

        /// The intent of the button.
        public let intent: ButtonIntent = .support

        /// The variant of the button.
        public let variant: ButtonVariant = .default
    }
}
