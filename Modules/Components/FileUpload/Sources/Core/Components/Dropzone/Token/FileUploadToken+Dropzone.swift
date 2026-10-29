//
//  FileUploadToken+Dropzone.swift
//  SparkComponentFileUpload
//
//  Created by Robin Lemaire on 28/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

// MARK: - Dropzone

public extension FileUploadToken {

    /// Contains the token values of the FileUpload Dropzone.
    struct Dropzone: Equatable {

        // MARK: - Properties

        /// The border properties.
        public let border: Border

        /// The colors properties.
        public let colors: Colors

        /// The layout properties.
        public let layout: Layout

        /// The typography properties.
        public let typography: Typography

        // MARK: - Initialization

        init(theme: any Theme) {
            self.border = .init(theme: theme)
            self.colors = .init(theme: theme)
            self.layout = .init(theme: theme)
            self.typography = .init(theme: theme)
        }
    }
}

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

        // MARK: - Equatable

        public static func == (lhs: Border, rhs: Border) -> Bool {
            return lhs.theme.equals(rhs.theme)
        }
    }
}

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

// MARK: - Typography

public extension FileUploadToken.Dropzone {

    /// Contains the typography token values of the Dropzone.
    struct Typography: Equatable {

        // MARK: - Properties

        let theme: any Theme

        /// The font of the description text.
        public var descriptionText: any TypographyFontToken {
            return self.theme.typography.body1Highlight
        }

        /// The font of the additional text.
        public var additionalText: any TypographyFontToken {
            return self.theme.typography.caption
        }

        // MARK: - Equatable

        public static func == (lhs: Typography, rhs: Typography) -> Bool {
            return lhs.theme.equals(rhs.theme)
        }
    }
}
