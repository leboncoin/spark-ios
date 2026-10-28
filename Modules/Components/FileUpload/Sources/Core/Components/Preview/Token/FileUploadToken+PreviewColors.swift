//
//  FileUploadToken+PreviewColors.swift
//  SparkComponentFileUpload
//
//  Created by Robin Lemaire on 28/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

// MARK: - Colors

public extension FileUploadToken.Preview {

    /// Contains the color token values of the Preview.
    struct Colors: Equatable {

        // MARK: - Properties

        let theme: any Theme

        /// The color of the name text.
        public var nameText: any ColorToken {
            return self.theme.colors.base.onSurface
        }

        /// The color of the size text.
        public var sizeText: any ColorToken {
            return self.theme.colors.base.onSurface.opacity(self.theme.dims.dim1)
        }

        /// The color of the error text.
        public var errorText: any ColorToken {
            return self.theme.colors.feedback.error
        }

        // MARK: - Methods

        /// The background color depending on the pressed state.
        public func background(isPressed: Bool) -> any ColorToken {
            let colors = self.theme.colors

            return isPressed ? colors.states.surfacePressed : colors.base.surface
        }

        /// The border color depending on whether the file is valid.
        public func border(isSucceed: Bool) -> any ColorToken {
            let colors = self.theme.colors

            return isSucceed ? colors.base.outline : colors.feedback.error
        }

        /// The tint color of the image depending on whether the file is valid.
        public func imageTint(isSucceed: Bool) -> any ColorToken {
            let colors = self.theme.colors

            return isSucceed ? colors.feedback.onNeutralContainer : colors.feedback.onErrorContainer
        }

        /// The background color of the image depending on whether the file is valid.
        public func imageBackground(isSucceed: Bool) -> any ColorToken {
            let colors = self.theme.colors

            return isSucceed ? colors.feedback.neutralContainer : colors.feedback.errorContainer
        }

        // MARK: - Equatable

        public static func == (lhs: Colors, rhs: Colors) -> Bool {
            return lhs.theme.equals(rhs.theme)
        }
    }
}
