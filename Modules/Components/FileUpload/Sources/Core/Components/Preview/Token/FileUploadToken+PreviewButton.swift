//
//  FileUploadToken+PreviewButton.swift
//  SparkComponentFileUpload
//
//  Created by Robin Lemaire on 02/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import SparkComponentButton

// MARK: - Button

public extension FileUploadToken.Preview {

    /// Contains the theme-independent values of the Preview remove button.
    struct Button: Equatable {

        // MARK: - Properties

        /// The intent of the remove button.
        public let intent: ButtonIntent = .surface

        /// The variant of the remove button.
        public let variant: ButtonVariant = .contrast

        /// The size of the remove button.
        public let size: ButtonSize = .small
    }
}
