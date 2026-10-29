//
//  FileUploadToken+PreviewGroup.swift
//  SparkComponentFileUpload
//
//  Created by Robin Lemaire on 28/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

// MARK: - Preview Group

public extension FileUploadToken {

    /// Contains the token values of the FileUpload Preview Group.
    struct PreviewGroup: Equatable {

        // MARK: - Properties

        /// The layout properties.
        public let layout: Layout

        // MARK: - Initialization

        init(theme: any Theme) {
            self.layout = .init(theme: theme)
        }
    }
}

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
