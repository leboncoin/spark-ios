//
//  FileUploadToken+PreviewGroupLayout.swift
//  SparkComponentFileUpload
//
//  Created by Robin Lemaire on 28/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

// MARK: - Layout

public extension FileUploadToken.PreviewGroup {

    /// Contains the layout token values of the Preview Group.
    struct Layout: Equatable {

        // MARK: - Properties

        let theme: any Theme

        /// The spacing between the previews.
        public var spacing: CGFloat {
            return self.theme.layout.spacing.medium
        }

        // MARK: - Equatable

        public static func == (lhs: Layout, rhs: Layout) -> Bool {
            return lhs.theme.equals(rhs.theme)
        }
    }
}
