//
//  FileUploadToken+PreviewBorder.swift
//  SparkComponentFileUpload
//
//  Created by Robin Lemaire on 28/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

// MARK: - Border

public extension FileUploadToken.Preview {

    /// Contains the border token values of the Preview.
    struct Border: Equatable {

        // MARK: - Properties

        let theme: any Theme

        /// The border radius.
        public var radius: CGFloat {
            return self.theme.border.radius.medium
        }

        /// The corner radius of the image container.
        public var imageRadius: CGFloat {
            return self.theme.border.radius.medium
        }

        // MARK: - Methods

        /// The border width depending on whether the file is valid.
        public func width(isSucceed: Bool) -> CGFloat {
            let width = self.theme.border.width

            return isSucceed ? width.small : width.medium
        }

        // MARK: - Equatable

        public static func == (lhs: Border, rhs: Border) -> Bool {
            return lhs.theme.equals(rhs.theme)
        }
    }
}
