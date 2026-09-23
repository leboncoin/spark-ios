//
//  ScaledBorderViewModifier.swift
//  SparkCommon
//
//  Created by robin.lemaire on 01/08/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI
import SparkTheming

private struct ScaledBorderViewModifier: ViewModifier {

    // MARK: - Properties

    @LimitedScaledMetric var width: CGFloat
    @LimitedScaledMetric var dash: CGFloat

    let colorToken: any ColorToken
    let position: BorderPosition
    let isScaled: Bool

    // MARK: - Initialization

    init(
        width: CGFloat,
        dash: CGFloat? = nil,
        colorToken: any ColorToken,
        position: BorderPosition = .default,
        isScaled: Bool
    ) {
        self._width = .init(value: width, type: .width)
        self._dash = .init(value: dash, type: .dash)

        self.colorToken = colorToken
        self.position = position
        self.isScaled = isScaled
    }

    // MARK: - View

    func body(content: Content) -> some View {
        content
            .overlay(
                Rectangle()
                    .inset(by: self.position.inset(width: self._width.value(scaled: self.isScaled)))
                    .stroke(
                        colorToken: self.colorToken,
                        width: self._width.value(scaled: self.isScaled),
                        dash: self._dash.value(scaled: self.isScaled),
                        position: self.position
                    )
            )
    }
}

// MARK: - View Extension

public extension View {

    /// Add a **Spark** border to the current view.
    /// - Parameters:
    ///   - width: The border width.
    ///   - dash: The length of painted segments used to make a
    ///     dashed line. *Optional*. Default is *nil*.
    ///   - colorToken: The color token of the border.
    ///   - position: The position of the border in the view.
    ///     Default is *overlay*.
    ///   - isScaled: Apply a scaled width depending on current the
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
    ///         dash: 4,
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
    ///         colorToken: YourThemes.shared.colors.main.main
    ///     )
    /// ```
    func sparkBorder(
        width: CGFloat,
        dash: CGFloat? = nil,
        colorToken: any ColorToken,
        position: BorderPosition = .default,
        isScaled: Bool = true
    ) -> some View {
        self.modifier(ScaledBorderViewModifier(
            width: width,
            dash: dash,
            colorToken: colorToken,
            position: position,
            isScaled: isScaled
        ))
    }
}
