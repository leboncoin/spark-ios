//
//  XXXToken.swift
//  SparkComponentXXX
//
//  Created by {Firstname Lastname} on DD/MM/YYYY.
//  Copyright © YYYY Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

// MARK: - Token

/// Contains all token values for the XXX component, grouped like the ``Theme``.
///
/// The ``XXXToken`` provides:
/// - **Border properties** (``XXXToken/Border``): width and radius
/// - **Typography** (``XXXToken/Typography``): font token of the title
/// - **Size constants** (``XXXToken/Size``): heights and icon size
///
/// > Tip: The token is available from the theme with `theme.component.xxx`.
/// > If you only need specific tokens, use the individual categories directly.
/// > For example, use `theme.component.xxx.size` if you only need size constants,
/// > or `theme.component.xxx.border` for border properties.
///
/// ## Creating a Custom XXX
///
/// ```swift
/// import SwiftUI
/// import SparkCommon
/// import SparkTheming
/// import SparkComponentXXX
///
/// struct CustomXXX: View {
///     let text: String
///     let isSelected: Bool
///     let theme: any Theme
///
///     var body: some View {
///         let token = theme.component.xxx
///
///         Text(text)
///             .font(token.typography.title)
///             .sparkFrame(height: token.size.mediumHeight)
///             .sparkBorder(
///                 width: token.border.width(isSelected: isSelected),
///                 radius: token.border.radius,
///                 colorToken: theme.colors.main.main
///             )
///     }
/// }
/// ```
///
public struct XXXToken: Equatable {

    // MARK: - Properties

    /// The border properties (width, radius).
    public let border: Border

    /// The typography properties (font tokens).
    public let typography: Typography

    /// The size properties (theme-independent).
    public let size = Size()

    // MARK: - Initialization

    /// Creates a XXXToken with the given theme.
    ///
    /// - Parameter theme: The theme to use for token values.
    public init(theme: any Theme) {
        self.border = .init(theme: theme)
        self.typography = .init(theme: theme)
    }
}
