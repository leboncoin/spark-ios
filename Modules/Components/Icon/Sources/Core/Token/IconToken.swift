//
//  IconToken.swift
//  SparkComponentIcon
//
//  Created by robin.lemaire on 18/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

// MARK: - Token

/// Contains all token values for the Icon component, grouped like the ``Theme``.
///
/// The ``IconToken`` provides:
/// - **Colors** (``IconToken/Colors``): tint color token
/// - **Size constants** (``IconToken/Size``): icon size
///
/// > Tip: The token is available from the theme with `theme.component.icon`.
///
/// ## Creating a Custom Icon
///
/// ```swift
/// struct CustomIcon: View {
///     let image: Image
///     let theme: any Theme
///
///     var body: some View {
///         let token = theme.component.icon
///
///         image
///             .resizable()
///             .sparkFrame(size: token.size.value(for: .medium))
///             .foregroundStyle(token.colors.tint(intent: .main).color)
///     }
/// }
/// ```
public struct IconToken: Equatable {

    // MARK: - Properties

    /// The colors properties (color tokens).
    public let colors: Colors

    /// The size properties (theme-independent).
    public let size = Size()

    // MARK: - Initialization

    /// Creates an IconToken with the given theme.
    ///
    /// - Parameter theme: The theme to use for token values.
    public init(theme: any Theme) {
        self.colors = .init(theme: theme)
    }
}
