//
//  FileUploadToken+DropzoneBorder.swift
//  SparkComponentFileUpload
//
//  Created by Robin Lemaire on 28/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

// MARK: - Border

public extension FileUploadToken.Dropzone {

    /// Contains the border token values of the Dropzone.
    struct Border: Equatable {

        // MARK: - Properties

        let theme: any Theme

        /// The border width.
        public var width: CGFloat {
            return self.theme.border.width.small
        }

        /// The border radius.
        public var radius: CGFloat {
            return self.theme.border.radius.large
        }

        /// The dash length of the border.
        public let dash: CGFloat = 2

        // MARK: - Equatable

        public static func == (lhs: Border, rhs: Border) -> Bool {
            return lhs.theme.equals(rhs.theme)
        }
    }
}
