//
//  DotsIndicatorToken.swift
//  SparkComponentDotsIndicator
//
//  Created by Robin Lemaire on 24/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

// MARK: - Token

/// Contains all token values for the DotsIndicator component, grouped like the ``Theme``.
///
/// The ``DotsIndicatorToken`` provides:
/// - **Border properties** (``DotsIndicatorToken/Border``): dot radius
/// - **Colors** (``DotsIndicatorToken/Colors``): active and inactive dot color tokens
/// - **Layout properties** (``DotsIndicatorToken/Layout``): spacing between the dots
/// - **Opacity** (``DotsIndicatorToken/Opacity``): opacity for enabled and disabled states
/// - **Size constants** (``DotsIndicatorToken/Size``): dot sizes
/// - **Animation constants** (``DotsIndicatorToken/Animation``): durations and animations
///
/// > Tip: The token is available from the theme with `theme.component.dotsIndicator`.
/// > If you only need specific tokens, use the individual categories directly.
/// > For example, use `theme.component.dotsIndicator.size` if you only need size constants,
/// > or `theme.component.dotsIndicator.colors` for color tokens.
///
/// ## Creating a Custom Dot
///
/// ```swift
/// import SwiftUI
/// import SparkCommon
/// import SparkTheming
/// import SparkComponentDotsIndicator
///
/// struct CustomDot: View {
///     let isActive: Bool
///     let theme: any Theme
///
///     var body: some View {
///         let token = theme.component.dotsIndicator
///
///         Capsule()
///             .fill(token.colors.dot(intent: .support, isActive: isActive))
///             .frame(
///                 width: token.size.dotWidth(size: .medium, isActive: isActive),
///                 height: token.size.dotHeight(size: .medium)
///             )
///     }
/// }
/// ```
///
public struct DotsIndicatorToken: Equatable {

    // MARK: - Properties

    /// The border properties (radius).
    public let border: Border

    /// The colors properties (color tokens).
    public let colors: Colors

    /// The layout properties (spacing).
    public let layout: Layout

    /// The opacity properties (enabled and disabled states).
    public let opacity: Opacity

    /// The size properties (theme-independent).
    public let size = Size()

    /// The animation properties (theme-independent).
    public let animation = Animation()

    // MARK: - Initialization

    /// Creates a DotsIndicatorToken with the given theme.
    ///
    /// - Parameter theme: The theme to use for token values.
    public init(theme: any Theme) {
        self.border = .init(theme: theme)
        self.colors = .init(theme: theme)
        self.layout = .init(theme: theme)
        self.opacity = .init(theme: theme)
    }
}
