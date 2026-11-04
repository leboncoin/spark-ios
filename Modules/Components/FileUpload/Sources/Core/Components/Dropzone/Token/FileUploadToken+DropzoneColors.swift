//
//  FileUploadToken+DropzoneColors.swift
//  SparkComponentFileUpload
//
//  Created by Robin Lemaire on 28/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

// MARK: - Colors

public extension FileUploadToken.Dropzone {

    /// Contains the color token values of the Dropzone.
    struct Colors: Equatable {

        // MARK: - Properties

        let theme: any Theme

        /// The border color.
        public var border: any ColorToken {
            return self.theme.colors.base.outline
        }

        /// The tint color of the icon.
        public var imageTint: any ColorToken {
            return self.theme.colors.base.onSurface
        }

        /// The color of the description text.
        public var descriptionText: any ColorToken {
            return self.theme.colors.base.onSurface
        }

        /// The color of the additional text.
        public var additionalText: any ColorToken {
            return self.theme.colors.base.onSurface.opacity(self.theme.dims.dim1)
        }

        // MARK: - Methods

        /// The background color depending on whether files are dragged over the dropzone.
        public func background(isTargeted: Bool) -> any ColorToken {
            let colors = self.theme.colors

            return isTargeted ? colors.states.surfacePressed : colors.base.surface
        }

        // MARK: - Equatable

        public static func == (lhs: Colors, rhs: Colors) -> Bool {
            return lhs.theme.equals(rhs.theme)
        }
    }
}
