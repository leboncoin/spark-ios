//
//  FileUploadToken+PreviewTypography.swift
//  SparkComponentFileUpload
//
//  Created by Robin Lemaire on 28/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

// MARK: - Typography

public extension FileUploadToken.Preview {

    /// Contains the typography token values of the Preview.
    struct Typography: Equatable {

        // MARK: - Properties

        let theme: any Theme

        /// The font of the name text.
        public var name: any TypographyFontToken {
            return self.theme.typography.caption
        }

        /// The font of the size text.
        public var size: any TypographyFontToken {
            return self.theme.typography.caption
        }

        /// The font of the error text.
        public var error: any TypographyFontToken {
            return self.theme.typography.caption
        }

        // MARK: - Equatable

        public static func == (lhs: Typography, rhs: Typography) -> Bool {
            return lhs.theme.equals(rhs.theme)
        }
    }
}
