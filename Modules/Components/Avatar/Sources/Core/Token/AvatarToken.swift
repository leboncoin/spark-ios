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
/// The ``AvatarToken`` provides:
/// - **Border properties** (``AvatarToken/Border``): width depending on the size
/// - **Colors** (``AvatarToken/Colors``): border, action background and action tint color tokens
/// - **Layout properties** (``AvatarToken/Layout``): action padding
/// - **Opacity** (``AvatarToken/Opacity``): opacity for enabled and disabled states
/// - **Typography** (``AvatarToken/Typography``): font token of the placeholder
/// - **Size constants** (``AvatarToken/Size``): avatar, placeholder, action and badge sizes
/// - **Scale effect** (``AvatarToken/ScaleEffect``): scale applied when pressed
/// - **Corner view offset** (``AvatarToken/CornerViewOffset``): offset of the corner view
///
/// > Tip: The token is available from the theme with `theme.component.avatar`.
/// > If you only need specific tokens, use the individual categories directly.
/// > For example, use `theme.component.avatar.size` if you only need size constants,
/// > or `theme.component.avatar.border` for border properties.
///
/// ## Creating a Custom Avatar
///
/// You can use ``AvatarToken`` to create custom avatar components with consistent theming.
///
/// ### Example
///
/// ```swift
/// import SwiftUI
/// import SparkCommon
/// import SparkTheming
/// import SparkComponentAvatar
///
/// struct CustomAvatar: View {
///     let image: Image
///     let size: AvatarSize
///     let isEnabled: Bool
///     let isPressed: Bool
///     let theme: any Theme
///
///     var body: some View {
///         let token = theme.component.avatar
///
///         image
///             .resizable()
///             .scaledToFill()
///             .sparkFrame(size: token.size.value(for: size))
///             .sparkBorder(
///                 width: token.border.width(isBorder: true, size: size),
///                 radius: theme.border.radius.full,
///                 colorToken: token.colors.border
///             )
///             .scaleEffect(token.scaleEffect.value(for: size, isPressed: isPressed))
///             .opacity(token.opacity.value(isEnabled: isEnabled))
///     }
/// }
///
/// // Usage
/// struct MyView: View {
///     var theme: any Theme
///
///     var body: some View {
///         CustomAvatar(
///             image: Image("avatar"),
///             size: .md,
///             isEnabled: true,
///             isPressed: false,
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
/// let token = theme.component.avatar
///
/// // Only need size constants (theme-independent)
/// let avatarSize = token.size.value(for: .md) // 40
/// let badgeSize = token.size.badge(for: .md) // .small
///
/// // Only need border properties
/// let borderWidth = token.border.width(isBorder: true, size: .lg)
///
/// // Only need the placeholder font
/// let fontToken = token.typography.placeholder(size: .xl)
/// ```
///
public struct AvatarToken: Equatable {

    // MARK: - Properties

    /// The border properties (width, radius).
    public let border: Border

    /// The colors properties (color tokens).
    public let colors: Colors

    /// The layout properties (padding).
    public let layout: Layout

    /// The opacity properties (enabled and disabled states).
    public let opacity: Opacity

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
        self.layout = .init(theme: theme)
        self.opacity = .init(theme: theme)
        self.typography = .init(theme: theme)
    }
}
