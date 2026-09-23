//
//  ScaledOffsetViewModifier.swift
//  SparkCommon
//
//  Created by robin.lemaire on 11/04/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

private struct ScaledOffsetViewModifier: ViewModifier {

    // MARK: - Properties

    @LimitedScaledMetric private var x: CGFloat
    @LimitedScaledMetric private var y: CGFloat

    // MARK: - Initialization

    init(x: CGFloat, y: CGFloat) {
        self._x = .init(value: x)
        self._y = .init(value: y)
    }

    // MARK: - View

    func body(content: Content) -> some View {
        content
            .offset(x: self.x, y: self.y)
    }
}

// MARK: - Extension

public extension View {

    /// Offset this view by the specified scaled horizontal and vertical distances.
    /// A min and max range is applied to limit the increase and decrease offset modification.
    ///
    /// - Parameters:
    ///   - x: The horizontal distance to offset this view.
    ///   - y: The vertical distance to offset this view.
    ///
    /// - Returns: A view that offsets this view by scaled `x` and `y`.
    ///
    /// Example usage:
    /// ```swift
    /// Text("Hello World")
    /// .sparkOffset(
    ///     x: 10,
    ///     y: 10
    /// )
    /// ```
    func sparkOffset(x: CGFloat = 0, y: CGFloat = 0) -> some View {
        self.modifier(ScaledOffsetViewModifier(
            x: x,
            y: y
        ))
    }

    /// Offset this view by the horizontal and vertical amount specified in the
    /// offset parameter.
    /// A min and max range is applied to limit the increase and decrease offset modification.
    ///
    /// - Parameter offset: The distance to offset this view.
    ///
    /// - Returns: A view that offsets this view by `offset`.
    ///
    /// Example usage:
    /// ```swift
    /// Text("Hello World")
    /// .sparkOffset(size: 10)
    /// ```
    func sparkOffset(_ offset: CGSize) -> some View {
        self.modifier(ScaledOffsetViewModifier(
            x: offset.width,
            y: offset.height
        ))
    }
}
