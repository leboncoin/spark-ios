//
//  ScaledBorderRadiusViewModifier.swift
//  SparkCommon
//
//  Created by robin.lemaire on 01/08/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI
import SparkTheming

private struct ScaledBorderRadiusViewModifier: ViewModifier {

    // MARK: - Properties

    @LimitedScaledMetric var width: CGFloat

    @LimitedScaledMetric var topLeadingRadius: CGFloat
    @LimitedScaledMetric var topTrailingRadius: CGFloat
    @LimitedScaledMetric var bottomTrailingRadius: CGFloat
    @LimitedScaledMetric var bottomLeadingRadius: CGFloat

    @LimitedScaledMetric var dash: CGFloat

    let isHighlighted: Bool
    let colorToken: any ColorToken
    let position: BorderPosition
    let isScaled: Bool

    // MARK: - Initialization

    init(
        width: CGFloat,
        radius: CGFloat,
        dash: CGFloat? = nil,
        isHighlighted: Bool = false,
        colorToken: any ColorToken,
        position: BorderPosition = .default,
        isScaled: Bool
    ) {
        self.init(
            width: width,
            topLeadingRadius: radius,
            topTrailingRadius: radius,
            bottomTrailingRadius: radius,
            bottomLeadingRadius: radius,
            dash: dash,
            isHighlighted: isHighlighted,
            colorToken: colorToken,
            position: position,
            isScaled: isScaled
        )
    }

    init(
        width: CGFloat,
        topLeadingRadius: CGFloat,
        topTrailingRadius: CGFloat,
        bottomTrailingRadius: CGFloat,
        bottomLeadingRadius: CGFloat,
        dash: CGFloat? = nil,
        isHighlighted: Bool = false,
        colorToken: any ColorToken,
        position: BorderPosition = .default,
        isScaled: Bool
    ) {
        self._width = .init(value: width, type: .width)

        let radiusType: ScaledBorderType = .radius
        self._topLeadingRadius = .init(value: topLeadingRadius, type: radiusType)
        self._topTrailingRadius = .init(value: topTrailingRadius, type: radiusType)
        self._bottomTrailingRadius = .init(value: bottomTrailingRadius, type: radiusType)
        self._bottomLeadingRadius = .init(value: bottomLeadingRadius, type: radiusType)

        self._dash = .init(value: dash, type: .dash)

        self.isHighlighted = isHighlighted
        self.colorToken = colorToken
        self.position = position
        self.isScaled = isScaled
    }

    // MARK: - View

    func body(content: Content) -> some View {
        content
            .sparkCornerRadius(
                topLeading: self._topLeadingRadius.value(scaled: self.isScaled),
                topTrailing: self._topTrailingRadius.value(scaled: self.isScaled),
                bottomTrailing: self._bottomTrailingRadius.value(scaled: self.isScaled),
                bottomLeading: self._bottomLeadingRadius.value(scaled: self.isScaled),
                isHighlighted: self.isHighlighted,
                isScaled: false
            )
            .overlay {
                UnevenRoundedRectangle(
                    topLeadingRadius: self._topLeadingRadius.value(scaled: self.isScaled),
                    bottomLeadingRadius: self._bottomLeadingRadius.value(scaled: self.isScaled),
                    bottomTrailingRadius: self._bottomTrailingRadius.value(scaled: self.isScaled),
                    topTrailingRadius: self._topTrailingRadius.value(scaled: self.isScaled),
                    isHighlighted: self.isHighlighted
                )
                .inset(by: self.position.inset(width: self._width.value(scaled: self.isScaled)))
                .stroke(
                    colorToken: self.colorToken,
                    width: self._width.value(scaled: self.isScaled),
                    dash: self._dash.value(scaled: self.isScaled),
                    position: self.position
                )
            }
    }
}

// MARK: - Public View Extension

public extension View {

    /// Add a **Spark** border with corner radius to the current view.
    /// - Parameters:
    ///   - width: The border width.
    ///   - radius: The border radius.
    ///   - dash: The length of painted segments used to make a
    ///     dashed line. *Optional*. Default is *nil*.
    ///   - isHighlighted: Apply a custom style (no radius on bottom left). Default is *false*.
    ///   - colorToken: The color token of the border.
    ///   - position: The position of the border in the view.
    ///     Default is *overlay*.
    ///   - isScaled: Apply a different width and radius depending on current the
    ///   dynamic size. Default is *true*.
    /// - Returns: Current View.
    ///
    /// Example with a corner in a **Text**.
    /// ```swift
    /// Text("Text")
    ///     .padding(4)
    ///     .frame(width: 80, height: 30)
    ///     .background(.white)
    ///     .sparkBorder(
    ///         width: 2,
    ///         radius: 12,
    ///         dash: 4,
    ///         isHighlighted: true,
    ///         colorToken: YourThemes.shared.colors.main.main
    ///     )
    /// ```
    ///
    /// Example with a corner in a **Shape**.
    /// ```swift
    /// Rectangle()
    ///     .fill(.white)
    ///     .frame(width: 80, height: 30)
    ///     .sparkBorder(
    ///         width: 2,
    ///         radius: 12,
    ///         colorToken: YourThemes.shared.colors.main.main
    ///     )
    /// ```
    func sparkBorder(
        width: CGFloat,
        radius: CGFloat,
        dash: CGFloat? = nil,
        isHighlighted: Bool = false,
        colorToken: any ColorToken,
        position: BorderPosition = .default,
        isScaled: Bool = true
    ) -> some View {
        self.modifier(ScaledBorderRadiusViewModifier(
            width: width,
            radius: radius,
            dash: dash,
            isHighlighted: isHighlighted,
            colorToken: colorToken,
            position: position,
            isScaled: isScaled
        ))
    }
}

// MARK: - Uneven View Extension

public extension View {

    /// Add a **Spark** border with corner radius to the current view.
    /// - Parameters:
    ///   - width: The border width.
    ///   - topLeadingRadius:The radius to apply for the top leading corner.
    ///   - topTrailingRadius: The radius to apply for the top traling corner.
    ///   - bottomTrailingRadius: The radius to apply for the bottom trailing corner.
    ///   - bottomLeadingRadius: The radius to apply for the bottom leading corner.
    ///   - dash: The length of painted segments used to make a
    ///     dashed line. *Optional*. Default is *nil*.
    ///   - isHighlighted: Apply a custom style (no radius on bottom left). Default is *false*.
    ///   - colorToken: The color token of the border.
    ///   - position: The position of the border in the view.
    ///     Default is *overlay*.
    ///   - isScaled: Apply a different width and radius depending on current the
    ///   dynamic size. Default is *true*.
    /// - Returns: Current View.
    ///
    /// Example with a corner in a **Text**.
    /// ```swift
    /// Text("Text")
    ///     .padding(4)
    ///     .frame(width: 80, height: 30)
    ///     .background(.white)
    ///     .sparkBorder(
    ///         width: 2,
    ///         topLeadingRadius: 8,
    ///         topTrailingRadius: 12,
    ///         bottomTrailingRadius: 14,
    ///         bottomLeadingRadius: 16,
    ///         dash: 4,
    ///         isHighlighted: true,
    ///         colorToken: YourThemes.shared.colors.main.main
    ///     )
    /// ```
    ///
    /// Example with a corner in a **Shape**.
    /// ```swift
    /// Rectangle()
    ///     .fill(.white)
    ///     .frame(width: 80, height: 30)
    ///     .sparkBorder(
    ///         width: 2,
    ///         topLeadingRadius: 8,
    ///         topTrailingRadius: 12,
    ///         bottomTrailingRadius: 14,
    ///         bottomLeadingRadius: 16,
    ///         colorToken: YourThemes.shared.colors.main.main
    ///     )
    /// ```
    func sparkBorder(
        width: CGFloat,
        topLeadingRadius: CGFloat,
        topTrailingRadius: CGFloat,
        bottomTrailingRadius: CGFloat,
        bottomLeadingRadius: CGFloat,
        dash: CGFloat? = nil,
        isHighlighted: Bool = false,
        colorToken: any ColorToken,
        position: BorderPosition = .default,
        isScaled: Bool = true
    ) -> some View {
        self.modifier(ScaledBorderRadiusViewModifier(
            width: width,
            topLeadingRadius: topLeadingRadius,
            topTrailingRadius: topTrailingRadius,
            bottomTrailingRadius: bottomTrailingRadius,
            bottomLeadingRadius: bottomLeadingRadius,
            dash: dash,
            isHighlighted: isHighlighted,
            colorToken: colorToken,
            position: position,
            isScaled: isScaled
        ))
    }

    /// Add a **Spark** border with corner radius to the current view.
    /// - Parameters:
    ///   - width: The border width.
    ///   - topRadius:The radius to apply for the top corners.
    ///   - bottomRadius: The radius to apply for the bottom corners.
    ///   - dash: The length of painted segments used to make a
    ///     dashed line. *Optional*. Default is *nil*.
    ///   - isHighlighted: Apply a custom style (no radius on bottom left). Default is *false*.
    ///   - colorToken: The color token of the border.
    ///   - position: The position of the border in the view.
    ///     Default is *overlay*.
    ///   - isScaled: Apply a different width and radius depending on current the
    ///   dynamic size. Default is *true*.
    /// - Returns: Current View.
    ///
    /// Example with a corner in a **Text**.
    /// ```swift
    /// Text("Text")
    ///     .padding(4)
    ///     .frame(width: 80, height: 30)
    ///     .background(.white)
    ///     .sparkBorder(
    ///         width: 2,
    ///         topRadius: 8,
    ///         bottomRadius: 14,
    ///         dash: 4,
    ///         isHighlighted: true,
    ///         colorToken: YourThemes.shared.colors.main.main
    ///     )
    /// ```
    ///
    /// Example with a corner in a **Shape**.
    /// ```swift
    /// Rectangle()
    ///     .fill(.white)
    ///     .frame(width: 80, height: 30)
    ///     .sparkBorder(
    ///         width: 2,
    ///         topRadius: 8,
    ///         bottomRadius: 14,
    ///         colorToken: YourThemes.shared.colors.main.main
    ///     )
    /// ```
    func sparkBorder(
        width: CGFloat,
        topRadius: CGFloat,
        bottomRadius: CGFloat,
        dash: CGFloat? = nil,
        isHighlighted: Bool = false,
        colorToken: any ColorToken,
        position: BorderPosition = .default,
        isScaled: Bool = true
    ) -> some View {
        self.modifier(ScaledBorderRadiusViewModifier(
            width: width,
            topLeadingRadius: topRadius,
            topTrailingRadius: topRadius,
            bottomTrailingRadius: bottomRadius,
            bottomLeadingRadius: bottomRadius,
            dash: dash,
            isHighlighted: isHighlighted,
            colorToken: colorToken,
            position: position,
            isScaled: isScaled
        ))
    }

    /// Add a **Spark** border with corner radius to the current view.
    /// - Parameters:
    ///   - width: The border width.
    ///   - leadingRadius:The radius to apply for the leader corners.
    ///   - trailingRadius: The radius to apply for the trailing corners.
    ///   - dash: The length of painted segments used to make a
    ///     dashed line. *Optional*. Default is *nil*.
    ///   - isHighlighted: Apply a custom style (no radius on bottom left). Default is *false*.
    ///   - colorToken: The color token of the border.
    ///   - position: The position of the border in the view.
    ///     Default is *overlay*.
    ///   - isScaled: Apply a different width and radius depending on current the
    ///   dynamic size. Default is *true*.
    /// - Returns: Current View.
    ///
    /// Example with a corner in a **Text**.
    /// ```swift
    /// Text("Text")
    ///     .padding(4)
    ///     .frame(width: 80, height: 30)
    ///     .background(.white)
    ///     .sparkBorder(
    ///         width: 2,
    ///         leadingRadius: 8,
    ///         trailingRadius: 14,
    ///         dash: 4,
    ///         isHighlighted: true,
    ///         colorToken: YourThemes.shared.colors.main.main
    ///     )
    /// ```
    ///
    /// Example with a corner in a **Shape**.
    /// ```swift
    /// Rectangle()
    ///     .fill(.white)
    ///     .frame(width: 80, height: 30)
    ///     .sparkBorder(
    ///         width: 2,
    ///         leadingRadius: 8,
    ///         trailingRadius: 14,
    ///         colorToken: YourThemes.shared.colors.main.main
    ///     )
    /// ```
    func sparkBorder(
        width: CGFloat,
        leadingRadius: CGFloat,
        trailingRadius: CGFloat,
        dash: CGFloat? = nil,
        isHighlighted: Bool = false,
        colorToken: any ColorToken,
        position: BorderPosition = .default,
        isScaled: Bool = true
    ) -> some View {
        self.modifier(ScaledBorderRadiusViewModifier(
            width: width,
            topLeadingRadius: leadingRadius,
            topTrailingRadius: trailingRadius,
            bottomTrailingRadius: trailingRadius,
            bottomLeadingRadius: leadingRadius,
            dash: dash,
            isHighlighted: isHighlighted,
            colorToken: colorToken,
            position: position,
            isScaled: isScaled
        ))
    }
}

// MARK: - Deprecated Public View Extension

public extension View {

    @available(*, deprecated, message: "Use sparkBorder instead.")
    func border(
        width: CGFloat,
        radius: CGFloat,
        colorToken: any ColorToken
    ) -> some View {
        self.sparkBorder(
            width: width,
            radius: radius,
            colorToken: colorToken,
            isScaled: false
        )
    }

    @available(*, deprecated, message: "Use sparkBorder or sparkCornerRadius instead.")
    @ViewBuilder
    func scaledBorder(
        width: CGFloat? = nil,
        radius: CGFloat? = nil,
        isHighlighted: Bool = false,
        colorToken: (any ColorToken)? = nil
    ) -> some View {
        if let width, let radius, radius > 0, let colorToken {
            self.sparkBorder(
                width: width,
                radius: radius,
                isHighlighted: isHighlighted,
                colorToken: colorToken,
                isScaled: true
            )

        } else if let width, let colorToken {
            self.sparkBorder(
                width: width,
                colorToken: colorToken,
                isScaled: true
            )

        } else if let radius {
            self.sparkCornerRadius(
                radius,
                isHighlighted: isHighlighted,
                isScaled: true
            )
        } else {
            self
        }
    }
}
