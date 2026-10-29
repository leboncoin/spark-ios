//
//  SegmentedControlToken.swift
//  SparkComponentSegmentedControl
//
//  Created by robin.lemaire on 27/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

// MARK: - Token

/// Contains all token values for the SegmentedControl component, grouped like the ``Theme``.
///
/// The ``SegmentedControlToken`` provides:
/// - **Border properties** (``SegmentedControlToken/Border``): width and radius of the control and the selected item
/// - **Colors** (``SegmentedControlToken/Colors``): background, border, separator, item and accessibility color tokens
/// - **Layout properties** (``SegmentedControlToken/Layout``): paddings and spacings
/// of the control, the items and the accessibility list
/// - **Opacity** (``SegmentedControlToken/Opacity``): opacity for enabled and disabled states
/// - **Typography** (``SegmentedControlToken/Typography``): font token of the item text
/// - **Scale effect** (``SegmentedControlToken/ScaleEffect``): scale applied to a pressed item
/// - **Size constants** (``SegmentedControlToken/Size``): icon, minimum height and separator sizes
///
/// > Tip: The token is available from the theme with `theme.component.segmentedControl`.
/// > If you only need specific tokens, use the individual categories directly.
/// > For example, use `theme.component.segmentedControl.size` if you only need size constants,
/// > or `theme.component.segmentedControl.border` for border properties.
///
/// ## Creating a Custom SegmentedControl
///
/// You can use ``SegmentedControlToken`` to create custom segmented control components with consistent theming.
///
/// ### Example
///
/// ```swift
/// import SwiftUI
/// import SparkCommon
/// import SparkTheming
/// import SparkComponentSegmentedControl
///
/// struct CustomSegmentedControl: View {
///     let items: [String]
///     @Binding var selection: Int
///     let isEnabled: Bool
///     let theme: any Theme
///
///     var body: some View {
///         let token = theme.component.segmentedControl
///
///         HStack(spacing: token.layout.spacing) {
///             ForEach(items.indices, id: \.self) { index in
///                 let isSelected = index == selection
///
///                 Text(items[index])
///                     .font(token.typography.itemFontToken(isSelected: isSelected))
///                     .foregroundStyle(token.colors.itemContent)
///                     .padding(token.layout.itemPadding)
///                     .frame(maxWidth: .infinity)
///                     .background(isSelected ? token.colors.selectedItemBackground : token.colors.background)
///                     .sparkBorder(
///                         width: isSelected ? token.border.selectedItemWidth : .zero,
///                         radius: token.border.selectedItemRadius,
///                         colorToken: token.colors.selectedItemBorder
///                     )
///                     .onTapGesture { selection = index }
///             }
///         }
///         .padding(token.layout.padding)
///         .frame(minHeight: token.size.minHeight)
///         .sparkBorder(
///             width: token.border.width,
///             radius: token.border.radius,
///             colorToken: token.colors.border
///         )
///         .opacity(token.opacity.value(isEnabled: isEnabled))
///     }
/// }
///
/// // Usage
/// struct MyView: View {
///     var theme: any Theme
///     @State private var selection = 0
///
///     var body: some View {
///         CustomSegmentedControl(
///             items: ["Day", "Week", "Month"],
///             selection: $selection,
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
/// let token = theme.component.segmentedControl
///
/// // Only need size constants (theme-independent)
/// let minHeight = token.size.minHeight // 44
///
/// // Only need border properties
/// let borderWidth = token.border.width
///
/// // Only need the item font
/// let fontToken = token.typography.itemFontToken(isSelected: true)
/// ```
///
public struct SegmentedControlToken: Equatable {

    // MARK: - Properties

    /// The border properties (width, radius).
    public let border: Border

    /// The colors properties (color tokens).
    public let colors: Colors

    /// The layout properties (paddings and spacings).
    public let layout: Layout

    /// The opacity properties (enabled and disabled states).
    public let opacity: Opacity

    /// The typography properties (font tokens).
    public let typography: Typography

    /// The scale effect properties (theme-independent).
    public let scaleEffect = ScaleEffect()

    /// The size properties (theme-independent).
    public let size = Size()

    // MARK: - Initialization

    /// Creates a SegmentedControlToken with the given theme.
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
