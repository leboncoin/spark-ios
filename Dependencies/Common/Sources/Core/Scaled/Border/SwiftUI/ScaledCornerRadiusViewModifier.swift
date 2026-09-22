//
//  ScaledCornerRadiusViewModifier.swift
//  SparkCommon
//
//  Created by robin.lemaire on 01/08/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI
import SparkTheming

private struct ScaledCornerRadiusViewModifier: ViewModifier {

    // MARK: - Properties

    @LimitedScaledMetric var topLeadingRadius: CGFloat
    @LimitedScaledMetric var topTrailingRadius: CGFloat
    @LimitedScaledMetric var bottomTrailingRadius: CGFloat
    @LimitedScaledMetric var bottomLeadingRadius: CGFloat

    let isHighlighted: Bool
    let isScaled: Bool

    // MARK: - Initialization

    init(
        radius: CGFloat,
        isHighlighted: Bool,
        isScaled: Bool
    ) {
        self.init(
            topLeadingRadius: radius,
            topTrailingRadius: radius,
            bottomTrailingRadius: radius,
            bottomLeadingRadius: radius,
            isHighlighted: isHighlighted,
            isScaled: isScaled
        )
    }

    init(
        topLeadingRadius: CGFloat,
        topTrailingRadius: CGFloat,
        bottomTrailingRadius: CGFloat,
        bottomLeadingRadius: CGFloat,
        isHighlighted: Bool,
        isScaled: Bool
    ) {
        let type: ScaledBorderType = .radius
        self._topLeadingRadius = .init(value: topLeadingRadius, type: type)
        self._topTrailingRadius = .init(value: topTrailingRadius, type: type)
        self._bottomTrailingRadius = .init(value: bottomTrailingRadius, type: type)
        self._bottomLeadingRadius = .init(value: bottomLeadingRadius, type: type)

        self.isHighlighted = isHighlighted
        self.isScaled = isScaled
    }

    // MARK: - View

    func body(content: Content) -> some View {
        content
            .clipShape(UnevenRoundedRectangle(
                topLeadingRadius: self._topLeadingRadius.value(scaled: self.isScaled),
                bottomLeadingRadius: self._bottomLeadingRadius.value(scaled: self.isScaled),
                bottomTrailingRadius: self._bottomTrailingRadius.value(scaled: self.isScaled),
                topTrailingRadius: self._topTrailingRadius.value(scaled: self.isScaled),
                isHighlighted: self.isHighlighted
            ))
    }
}

// MARK: - View Extension

public extension View {

    /// Add a **Spark** corner radius to the current view.
    /// - Parameters:
    ///   - radius: The border radius.
    ///   - isHighlighted: Apply a custom style (no radius on bottom left).
    ///   Default is *false*.
    ///   - isScaled: Apply a scaled radius depending on current the
    ///   dynamic size. Default is *true*.
    /// - Returns: Current View.
    ///
    /// Example with a corner in a **Text**.
    /// ```swift
    /// Text("Text")
    ///     .padding(4)
    ///     .frame(width: 80, height: 30)
    ///     .background(.white)
    ///     .sparkCornerRadius(12, isHighlighted: true)
    /// ```
    ///
    /// Example with a corner in a **Shape**.
    /// ```swift
    /// Rectangle()
    ///     .fill(.white)
    ///     .frame(width: 80, height: 30)
    ///     .sparkCornerRadius(12, isScaled: false)
    /// ```
    func sparkCornerRadius(
        _ radius: CGFloat,
        isHighlighted: Bool = false,
        isScaled: Bool = true
    ) -> some View {
        self.modifier(ScaledCornerRadiusViewModifier(
            radius: radius,
            isHighlighted: isHighlighted,
            isScaled: isScaled
        ))
    }
}

// MARK: - Uneven View Extension

public extension View {

    /// Add a **Spark** uneven corner radius to the current view.
    /// - Parameters:
    ///   - topLeading:The radius to apply for the top leading corner.
    ///   - topTrailing: The radius to apply for the top traling corner.
    ///   - bottomTrailing: The radius to apply for the bottom trailing corner.
    ///   - bottomLeading: The radius to apply for the bottom leading corner.
    ///   - isHighlighted: Apply a custom style (no radius on bottom left).
    ///   Default is *false*.
    ///   - isScaled: Apply a scaled radius depending on current the
    ///   dynamic size. Default is *true*.
    /// - Returns: Current View.
    ///
    /// Example with a corner in a **Text**.
    /// ```swift
    /// Text("Text")
    ///     .padding(4)
    ///     .frame(width: 80, height: 30)
    ///     .background(.white)
    ///     .sparkCornerRadius(
    ///         topLeading: 8,
    ///         topTrailing: 12,
    ///         bottomTrailing: 14,
    ///         bottomLeading: 16,
    ///         isHighlighted: true
    ///     )
    /// ```
    ///
    /// Example with a corner in a **Shape**.
    /// ```swift
    /// Rectangle()
    ///     .fill(.white)
    ///     .frame(width: 80, height: 30)
    ///     .sparkCornerRadius(
    ///         topLeading: 8,
    ///         topTrailing: 12,
    ///         bottomTrailing: 14,
    ///         bottomLeading: 16,
    ///         isScaled: false
    ///     )
    /// ```
    func sparkCornerRadius(
        topLeading: CGFloat,
        topTrailing: CGFloat,
        bottomTrailing: CGFloat,
        bottomLeading: CGFloat,
        isHighlighted: Bool = false,
        isScaled: Bool = true
    ) -> some View {
        self.modifier(ScaledCornerRadiusViewModifier(
            topLeadingRadius: topLeading,
            topTrailingRadius: topTrailing,
            bottomTrailingRadius: bottomTrailing,
            bottomLeadingRadius: bottomLeading,
            isHighlighted: isHighlighted,
            isScaled: isScaled
        ))
    }

    /// Add a **Spark** uneven corner radius to the current view.
    /// - Parameters:
    ///   - top:The radius to apply for the top corners.
    ///   - bottom: The radius to apply for the bottom corners.
    ///   - isHighlighted: Apply a custom style (no radius on bottom left).
    ///   Default is *false*.
    ///   - isScaled: Apply a scaled radius depending on current the
    ///   dynamic size. Default is *true*.
    /// - Returns: Current View.
    ///
    /// Example with a corner in a **Text**.
    /// ```swift
    /// Text("Text")
    ///     .padding(4)
    ///     .frame(width: 80, height: 30)
    ///     .background(.white)
    ///     .sparkCornerRadius(
    ///         top: 8,
    ///         bottom: 14,
    ///         isHighlighted: true
    ///     )
    /// ```
    ///
    /// Example with a corner in a **Shape**.
    /// ```swift
    /// Rectangle()
    ///     .fill(.white)
    ///     .frame(width: 80, height: 30)
    ///     .sparkCornerRadius(
    ///         top: 8,
    ///         bottom: 14,
    ///         isScaled: false
    ///     )
    /// ```
    func sparkCornerRadius(
        top: CGFloat,
        bottom: CGFloat,
        isHighlighted: Bool = false,
        isScaled: Bool = true
    ) -> some View {
        self.modifier(ScaledCornerRadiusViewModifier(
            topLeadingRadius: top,
            topTrailingRadius: top,
            bottomTrailingRadius: bottom,
            bottomLeadingRadius: bottom,
            isHighlighted: isHighlighted,
            isScaled: isScaled
        ))
    }

    /// Add a **Spark** uneven corner radius to the current view.
    /// - Parameters:
    ///   - leading:The radius to apply for the leader corners.
    ///   - trailing: The radius to apply for the trailing corners.
    ///   - isHighlighted: Apply a custom style (no radius on bottom left).
    ///   Default is *false*.
    ///   - isScaled: Apply a scaled radius depending on current the
    ///   dynamic size. Default is *true*.
    /// - Returns: Current View.
    ///
    /// Example with a corner in a **Text**.
    /// ```swift
    /// Text("Text")
    ///     .padding(4)
    ///     .frame(width: 80, height: 30)
    ///     .background(.white)
    ///     .sparkCornerRadius(
    ///         leading: 8,
    ///         trailing: 14,
    ///         isHighlighted: true
    ///     )
    /// ```
    ///
    /// Example with a corner in a **Shape**.
    /// ```swift
    /// Rectangle()
    ///     .fill(.white)
    ///     .frame(width: 80, height: 30)
    ///     .sparkCornerRadius(
    ///         leading: 8,
    ///         trailing: 14,
    ///         isScaled: false
    ///     )
    /// ```
    func sparkCornerRadius(
        leading: CGFloat,
        trailing: CGFloat,
        isHighlighted: Bool = false,
        isScaled: Bool = true
    ) -> some View {
        self.modifier(ScaledCornerRadiusViewModifier(
            topLeadingRadius: leading,
            topTrailingRadius: trailing,
            bottomTrailingRadius: trailing,
            bottomLeadingRadius: leading,
            isHighlighted: isHighlighted,
            isScaled: isScaled
        ))
    }
}
