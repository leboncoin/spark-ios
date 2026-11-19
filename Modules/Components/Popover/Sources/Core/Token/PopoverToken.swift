//
//  PopoverToken.swift
//  SparkComponentPopover
//
//  Created by Robin Lemaire on 18/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

// MARK: - Token

/// Contains all token values for the Popover component, grouped like the ``Theme``.
///
/// The ``PopoverToken`` provides:
/// - **Colors** (``PopoverToken/Colors``): foreground color token for each intent
/// - **Layout properties** (``PopoverToken/Layout``): padding
///
/// > Tip: The token is available from the theme with `theme.component.popover`.
/// > If you only need specific tokens, use the individual categories directly.
/// > For example, use `theme.component.popover.colors` if you only need the color tokens,
/// > or `theme.component.popover.layout` for the layout properties.
///
/// ## Creating a Custom Popover
///
/// ```swift
/// import SwiftUI
/// import SparkCommon
/// import SparkTheming
/// import SparkComponentPopover
///
/// struct CustomPopoverContent: View {
///     let intent: PopoverIntent
///     let theme: any Theme
///
///     var body: some View {
///         let token = theme.component.popover
///
///         Text("My popover")
///             .foregroundStyle(token.colors.foreground(intent: intent).color)
///             .padding(.horizontal, token.layout.horizontalPadding)
///             .padding(.vertical, token.layout.verticalPadding)
///     }
/// }
/// ```
///
public struct PopoverToken: Equatable {

    // MARK: - Properties

    /// The colors properties (color tokens).
    public let colors: Colors

    /// The layout properties (padding).
    public let layout: Layout

    // MARK: - Initialization

    /// Creates a PopoverToken with the given theme.
    ///
    /// - Parameter theme: The theme to use for token values.
    public init(theme: any Theme) {
        self.colors = .init(theme: theme)
        self.layout = .init(theme: theme)
    }
}
