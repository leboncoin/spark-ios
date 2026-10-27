//
//  CircularMeterToken.swift
//  SparkComponentCircularMeter
//
//  Created by robin.lemaire on 27/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

// MARK: - Token

/// Contains all token values for the CircularMeter component, grouped like the ``Theme``.
///
/// The ``CircularMeterToken`` provides:
/// - **Colors** (``CircularMeterToken/Colors``): track, indicator, icon, value and content color tokens
/// - **Layout properties** (``CircularMeterToken/Layout``): spacing and padding
/// - **Typography** (``CircularMeterToken/Typography``): font tokens of the value and the content
/// - **Content** (``CircularMeterToken/Content``): whether the content is displayed inside the gauge
/// - **Size constants** (``CircularMeterToken/Size``): gauge diameter, gauge stroke and icon sizes
///
/// > Tip: The token is available from the theme with `theme.component.circularMeter`.
/// > If you only need specific tokens, use the individual categories directly.
/// > For example, use `theme.component.circularMeter.size` if you only need size constants,
/// > or `theme.component.circularMeter.colors` for color tokens.
///
/// ## Creating a Custom CircularMeter
///
/// You can use ``CircularMeterToken`` to create custom circular meter components with consistent theming.
///
/// ### Example
///
/// ```swift
/// import SwiftUI
/// import SparkCommon
/// import SparkTheming
/// import SparkComponentCircularMeter
///
/// struct CustomCircularMeter: View {
///     let value: Double
///     let intent: CircularMeterIntent
///     let size: CircularMeterSize
///     let theme: any Theme
///
///     var body: some View {
///         let token = self.theme.component.circularMeter
///         let stroke = token.size.gaugeStroke(for: self.size)
///
///         ZStack {
///             Circle()
///                 .inset(by: stroke / 2)
///                 .stroke(token.colors.track(intent: self.intent).color, lineWidth: stroke)
///
///             Circle()
///                 .inset(by: stroke / 2)
///                 .trim(from: .zero, to: CGFloat(self.value))
///                 .stroke(
///                     token.colors.indicator(intent: self.intent).color,
///                     style: StrokeStyle(lineWidth: stroke, lineCap: .round)
///                 )
///                 .rotationEffect(.degrees(-90))
///
///             if token.content.isInside(size: self.size) {
///                 Text("\(Int(self.value * 100))%")
///                     .font(token.typography.value(size: self.size))
///                     .foregroundStyle(token.colors.value.color)
///             }
///         }
///         .sparkFrame(size: token.size.gaugeDiameter(for: self.size))
///     }
/// }
///
/// // Usage
/// struct MyView: View {
///     var theme: any Theme
///
///     var body: some View {
///         CustomCircularMeter(
///             value: 0.7,
///             intent: .success,
///             size: .large,
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
/// let token = theme.component.circularMeter
///
/// // Only need size constants (theme-independent)
/// let diameter = token.size.gaugeDiameter(for: .large) // 96
///
/// // Only need the indicator color
/// let indicatorColor = token.colors.indicator(intent: .success)
///
/// // Only need the value font
/// let fontToken = token.typography.value(size: .xLarge)
/// ```
///
public struct CircularMeterToken: Equatable {

    // MARK: - Properties

    /// The colors properties (color tokens).
    public let colors: Colors

    /// The layout properties (spacing and padding).
    public let layout: Layout

    /// The typography properties (font tokens).
    public let typography: Typography

    /// The content properties (theme-independent).
    public let content = Content()

    /// The size properties (theme-independent).
    public let size = Size()

    // MARK: - Initialization

    /// Creates a CircularMeterToken with the given theme.
    ///
    /// - Parameter theme: The theme to use for token values.
    public init(theme: any Theme) {
        self.colors = .init(theme: theme)
        self.layout = .init(theme: theme)
        self.typography = .init(theme: theme)
    }
}
