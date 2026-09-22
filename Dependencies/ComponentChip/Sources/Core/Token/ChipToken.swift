//
//  ChipToken.swift
//  SparkComponentChip
//
//  Created by robin.lemaire on 09/09/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

/// Contains all token values for the Chip component.
///
/// The ``ChipToken`` provides:
/// - **Border properties** (``ChipToken/Border``): width, radius, and dash length
/// - **Opacity values** (``ChipToken/Opacity``): different values for enabled and disabled states
/// - **Layout properties** (``ChipToken/Layout``): spacing and padding values
/// - **Size constants** (``ChipToken/Size``): heights and icon size
/// - **Typography** (``ChipToken/Typography``): font token for the chip title
///
/// > Tip: If you only need specific tokens, you can use the individual sub-structs directly.
/// > For example, use ``ChipToken/Size()`` if you only need size constants, or ``ChipToken/Border(theme:)`` for border properties.
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
///     let isEnabled: Bool
///     let theme: any Theme
///
///     var body: some View {
///         let token = ChipToken(theme: theme)
///
///         SparkHStack(spacing: token.layout.spacingWhenLeadingIcon) {
///             icon
///                 .resizable()
///                 ..sparkFrame(size: token.size.iconSize)
///
///             Text(text)
///                 .font(token.typography.titleFont)
///         }
///         .sparkPadding(.horizontal, token.layout.horizontalPadding)
///         .sparkFrame(height: token.size.mediumHeight)
///         .background(Color.blue)
///         .sparkBorder(
///             width: token.border.width,
///             radius: token.border.radius,
///             dash: token.border.dashLength,
///             colorToken: self.theme.colors.main.main
///         )
///         .opacity(isEnabled ? token.opacity.whenEnabled : token.opacity.whenDisabled)
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
///             isEnabled: true,
///             theme: theme
///         )
///     }
/// }
/// ```
///
/// ### Using Individual Sub-Structs
///
/// If you only need specific token values, you can instantiate the sub-structs directly:
///
/// ```swift
/// // Only need size constants (no theme required)
/// let sizeToken = ChipToken.Size()
/// let height = sizeToken.mediumHeight // 32
///
/// // Only need border properties
/// let borderToken = ChipToken.Border(theme: theme)
/// let borderWidth = borderToken.width
///
/// // Only need layout spacing
/// let layoutToken = ChipToken.Layout(theme: theme)
/// let spacing = layoutToken.spacingWhenLeadingIcon
/// ```
///
public struct ChipToken: Equatable {

    // MARK: - Properties

    /// The border token properties (width, radius, dash length).
    public let border: Border

    /// The opacity properties based on enabled/disabled state.
    public let opacity: Opacity

    /// The size properties (heights and icon size).
    public let size = Size()

    /// The layout properties (spacing and padding values).
    public let layout: Layout

    /// The typography properties (font tokens).
    public let typography: Typography

    // MARK: - Initialization

    /// Creates a ChipToken with the given theme.
    ///
    /// - Parameter theme: The theme to use for token values.
    public init(theme: any Theme) {
        self.border = .init(theme: theme)
        self.opacity = .init(theme: theme)
        self.layout = .init(theme: theme)
        self.typography = .init(theme: theme)
    }
}
