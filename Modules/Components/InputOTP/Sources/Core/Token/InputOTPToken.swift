//
//  InputOTPToken.swift
//  SparkComponentInputOTP
//
//  Created by Robin Lemaire on 28/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

// MARK: - Token

/// Contains all token values for the InputOTP component, grouped like the ``Theme``.
///
/// The ``InputOTPToken`` provides:
/// - **Border properties** (``InputOTPToken/Border``): slot width and radius
/// - **Colors** (``InputOTPToken/Colors``): separator and slot (content, border, background) color tokens
/// - **Layout properties** (``InputOTPToken/Layout``): spacing and padding
/// - **Opacity** (``InputOTPToken/Opacity``): opacity for enabled and disabled states
/// - **Typography** (``InputOTPToken/Typography``): font token of the slot content
/// - **Size constants** (``InputOTPToken/Size``): slot and separator sizes
///
/// > Tip: The token is available from the theme with `theme.component.inputOTP`.
/// > If you only need specific tokens, use the individual categories directly.
/// > For example, use `theme.component.inputOTP.size` if you only need size constants,
/// > or `theme.component.inputOTP.border` for border properties.
///
/// ## Creating a Custom Slot
///
/// ```swift
/// import SwiftUI
/// import SparkCommon
/// import SparkTheming
/// import SparkComponentInputOTP
///
/// struct CustomSlot: View {
///     let value: String
///     let onError: Bool
///     let isFocus: Bool
///     let theme: any Theme
///
///     var body: some View {
///         let token = theme.component.inputOTP
///
///         Text(value)
///             .font(token.typography.content)
///             .foregroundStyle(token.colors.slotContent(value: value, onError: onError, isFocus: isFocus))
///             .sparkFrame(width: token.size.slotWidth, height: token.size.slotHeight)
///             .background(token.colors.slotBackground(value: value, onError: onError, isFocus: isFocus))
///             .sparkBorder(
///                 width: token.border.slotWidth(onError: onError, isFocus: isFocus),
///                 radius: token.border.slotRadius,
///                 colorToken: token.colors.slotBorder(onError: onError)
///             )
///     }
/// }
/// ```
///
public struct InputOTPToken: Equatable {

    // MARK: - Properties

    /// The border properties (width, radius).
    public let border: Border

    /// The colors properties (color tokens).
    public let colors: Colors

    /// The layout properties (spacing, padding).
    public let layout: Layout

    /// The opacity properties (enabled and disabled states).
    public let opacity: Opacity

    /// The typography properties (font tokens).
    public let typography: Typography

    /// The size properties (theme-independent).
    public let size = Size()

    // MARK: - Initialization

    /// Creates a InputOTPToken with the given theme.
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
