//
//  ChipToken.swift
//  SparkComponentChip
//
//  Created by robin.lemaire on 09/09/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

// MARK: - Token

/// Contains all token values for the Chip component, grouped like the ``Theme``.
///
/// The ``ChipToken`` provides:
/// - **Border properties** (``ChipToken/Border``): width, radius, and dash length
/// - **Colors** (``ChipToken/Colors``): background, border and content color tokens
/// - **Layout properties** (``ChipToken/Layout``): spacing and padding values
/// - **Opacity** (``ChipToken/Opacity``): opacity for enabled and disabled states
/// - **Typography** (``ChipToken/Typography``): font token of the title
/// - **Size constants** (``ChipToken/Size``): heights and icon size
/// - **Alignment** (``ChipToken/Alignment``): order of the icon and the title
///
/// > Tip: The token is available from the theme with `theme.component.chip`.
/// > If you only need specific tokens, use the individual categories directly.
/// > For example, use `theme.component.chip.size` if you only need size constants,
/// > or `theme.component.chip.border` for border properties.
///
/// ## Creating a Custom Chip
///
/// You can use ``ChipToken`` to create custom chip components with consistent theming.
///
/// ### Example
///
/// ```swift
/// import SwiftUI
/// import SparkCommon
/// import SparkTheming
/// import SparkComponentChip
///
/// struct CustomChip: View {
///     let text: String
///     let icon: Image
///     let size: ChipSize
///     let variant: ChipVariant
///     let alignment: ChipAlignment
///     let isEnabled: Bool
///     let theme: any Theme
///
///     var body: some View {
///         let token = theme.component.chip
///         let colors = token.colors
///
///         SparkHStack(spacing: token.layout.spacing(alignment: alignment)) {
///             icon
///                 .resizable()
///                 .sparkFrame(size: token.size.icon)
///
///             Text(text)
///                 .font(token.typography.title)
///         }
///         .sparkPadding(.horizontal, token.layout.horizontalPadding)
///         .sparkFrame(height: token.size.height(for: size))
///         .foregroundStyle(colors.content(intent: .main, variant: variant, isSelected: false, isPressed: false).color)
///         .background(colors.background(intent: .main, variant: variant, isSelected: false, isPressed: false).color)
///         .sparkBorder(
///             width: token.border.width,
///             radius: token.border.radius,
///             dash: token.border.dash(variant: variant),
///             colorToken: colors.border(intent: .main, variant: variant, isSelected: false, isPressed: false)
///         )
///         .opacity(token.opacity.value(isEnabled: isEnabled))
///     }
/// }
///
/// // Usage
/// struct MyView: View {
///     var theme: any Theme
///
///     var body: some View {
///         CustomChip(
///             text: "Custom Chip",
///             icon: Image(systemName: "star.fill"),
///             size: .medium,
///             variant: .outlined,
///             alignment: .leadingIcon,
///             isEnabled: true,
///             theme: theme
///         )
///     }
/// }
/// ```
///
/// ### Using Individual Categories
///
/// If you only need specific token values, you can use the categories directly:
///
/// ```swift
/// let token = theme.component.chip
///
/// // Only need size constants (theme-independent)
/// let height = token.size.height(for: .medium) // 32
///
/// // Only need border properties
/// let borderWidth = token.border.width
///
/// // Only need layout spacing
/// let spacing = token.layout.spacing(alignment: .leadingIcon)
/// ```
///
public struct ChipToken: Equatable {

    // MARK: - Properties

    /// The border properties (width, radius, dash length).
    public let border: Border

    /// The colors properties (color tokens).
    public let colors: Colors

    /// The layout properties (spacing and padding).
    public let layout: Layout

    /// The opacity properties (enabled and disabled states).
    public let opacity: Opacity

    /// The typography properties (font tokens).
    public let typography: Typography

    /// The size properties (theme-independent).
    public let size = Size()

    /// The alignment properties (theme-independent).
    public let alignment = Alignment()

    // MARK: - Initialization

    /// Creates a ChipToken with the given theme.
    ///
    /// - Parameter theme: The theme to use for token values.
    public init(theme: any Theme) {
        self.border = .init(theme: theme)
        self.colors = .init(theme: theme)
        self.layout = .init(theme: theme)
        self.opacity = .init(theme: theme)
        self.typography = .init(theme: theme)
    }
}
