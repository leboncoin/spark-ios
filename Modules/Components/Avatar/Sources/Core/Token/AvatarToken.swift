//
//  AvatarToken.swift
//  SparkComponentAvatar
//
//  Created by Robin Lemaire on 23/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

// MARK: - Token

/// Contains all token values for the Avatar component, grouped like the ``Theme``.
///
/// All categories are reached from the theme (`theme.component.avatar.border`, `theme.component.avatar.size`).
public struct AvatarToken: Equatable {

    // MARK: - Properties

    /// The border properties (width, radius).
    public let border: Border

    /// The colors properties (color tokens).
    public let colors: Colors

    /// The dims properties (opacity).
    public let dims: Dims

    /// The layout properties (padding).
    public let layout: Layout

    /// The typography properties (font tokens).
    public let typography: Typography

    /// The size properties (theme-independent).
    public let size = Size()

    /// The scale effect properties (theme-independent).
    public let scaleEffect = ScaleEffect()

    /// The corner view offset properties (theme-independent).
    public let cornerViewOffset = CornerViewOffset()

    // MARK: - Initialization

    /// Creates a AvatarToken with the given theme.
    ///
    /// - Parameter theme: The theme to use for token values.
    public init(theme: any Theme) {
        self.border = .init(theme: theme)
        self.colors = .init(theme: theme)
        self.dims = .init(theme: theme)
        self.layout = .init(theme: theme)
        self.typography = .init(theme: theme)
    }
}
