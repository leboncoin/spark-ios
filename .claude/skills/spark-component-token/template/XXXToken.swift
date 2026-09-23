//
//  XXXToken.swift
//  SparkComponentXXX
//
//  Created by robin.lemaire on 09/09/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

/// Contains all token values for the XXX component.
///
/// The ``XXXToken`` provides:
/// - **Border properties** (``XXXToken/Border``): width and radius
/// - **Size constants** (``XXXToken/Size``): heights and icon size
/// - **Typography** (``XXXToken/Typography``): font token for the title
///
/// > Tip: If you only need specific tokens, you can use the individual sub-structs directly.
/// > For example, use ``XXXToken/Size()`` if you only need size constants, or ``XXXToken/Border(theme:)`` for border properties.
///
/// ## Creating a Custom XXX
///
/// You can use ``XXXToken`` to create custom XXX components with consistent theming.
///
/// ### Example
///
/// ```swift
/// import SwiftUI
/// import SparkCommon
/// import SparkTheming
/// import SparkComponentXXX
///
/// struct CustomXXX: View {
///     let text: String
///     let theme: any Theme
///
///     var body: some View {
///         let token = XXXToken(theme: theme)
///
///         Text(text)
///             .font(token.typography.titleFont)
///             .sparkFrame(height: token.size.mediumHeight)
///             .sparkBorder(
///                 width: token.border.width,
///                 radius: token.border.radius,
///                 colorToken: self.theme.colors.main.main
///             )
///     }
/// }
///
/// // Usage
/// struct MyView: View {
///     var theme: any Theme
///
///     var body: some View {
///         CustomXXX(text: "Custom XXX", theme: theme)
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
/// let sizeToken = XXXToken.Size()
/// let height = sizeToken.mediumHeight // 32
///
/// // Only need border properties
/// let borderToken = XXXToken.Border(theme: theme)
/// let borderWidth = borderToken.width
/// ```
///
public struct XXXToken: Equatable {

    // MARK: - Properties

    /// The border token properties (width and radius).
    public let border: Border

    /// The size properties (heights and icon size).
    public let size = Size()

    /// The typography properties (font tokens).
    public let typography: Typography

    // MARK: - Initialization

    /// Creates a XXXToken with the given theme.
    ///
    /// - Parameter theme: The theme to use for token values.
    public init(theme: any Theme) {
        self.border = .init(theme: theme)
        self.typography = .init(theme: theme)
    }
}
