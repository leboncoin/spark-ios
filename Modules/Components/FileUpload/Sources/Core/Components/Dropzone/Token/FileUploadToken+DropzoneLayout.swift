//
//  FileUploadToken+DropzoneLayout.swift
//  SparkComponentFileUpload
//
//  Created by Robin Lemaire on 28/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

// MARK: - Layout

public extension FileUploadToken.Dropzone {

    /// Contains the layout token values of the Dropzone.
    struct Layout: Equatable {

        // MARK: - Properties

        let theme: any Theme

        /// The spacing between the icon and the texts.
        public var verticalSpacing: CGFloat {
            return self.theme.layout.spacing.large
        }

        /// The spacing between the texts and the upload button.
        public var subVerticalSpacing: CGFloat {
            return self.theme.layout.spacing.medium
        }

        /// The padding of the dropzone.
        public var padding: CGFloat {
            return self.theme.layout.spacing.large
        }

        // MARK: - Equatable

        public static func == (lhs: Layout, rhs: Layout) -> Bool {
            return lhs.theme.equals(rhs.theme)
        }
    }
}
