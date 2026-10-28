//
//  FileUploadToken+Preview.swift
//  SparkComponentFileUpload
//
//  Created by Robin Lemaire on 28/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

// MARK: - Preview

public extension FileUploadToken {

    /// Contains the token values of the FileUpload Preview.
    struct Preview: Equatable {

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
            return self.theme.border.width.medium
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

// MARK: - Layout

public extension FileUploadToken.Preview {

    /// Contains the layout token values of the Preview.
    struct Layout: Equatable {

        // MARK: - Properties

        let theme: any Theme

        /// The spacing between the elements.
        public var spacing: CGFloat {
            return self.theme.layout.spacing.medium
        }

        /// The horizontal padding.
        public var horizontalPadding: CGFloat {
            return self.theme.layout.spacing.medium
        }

        /// The vertical padding.
        public var verticalPadding: CGFloat {
            return self.theme.layout.spacing.medium
        }

        // MARK: - Equatable

        public static func == (lhs: Layout, rhs: Layout) -> Bool {
            return lhs.theme.equals(rhs.theme)
        }
    }
}

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
