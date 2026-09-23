//
//  OptionalAnimationValueModifier.swift
//  SparkCommon
//
//  Created by robin.lemaire on 26/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

@_spi(SI_SPI) public struct OptionalAnimationValueModifier<V>: ViewModifier where V: Equatable {

    // MARK: - Properties

    private let animation: Animation?
    private let value: V

    @Environment(\.isSnapshot) private var isSnapshot
    @Environment(\.accessibilityReduceMotion) private var reduceMotion

    // MARK: - Initialization

    public init(
        animation: Animation?,
        value: V
    ) {
        self.animation = animation
        self.value = value
    }

    // MARK: - View

    public func body(content: Content) -> some View {
        if self.reduceMotion || self.isSnapshot {
            content
        } else {
            content.animation(
                self.animation,
                value: self.value
            )
        }
    }
}

// MARK: - View Extension

public extension View {

    /// Applies the given animation to this view when the specified value
    /// changes IF the **isReduceMotionEnabled** is disabled.
    ///
    /// - Parameters:
    ///   - animation: The animation to apply. If `animation` is `nil`, the view
    ///     doesn't animate.
    ///   - value: A value to monitor for changes.
    ///
    /// - Returns: A view that applies `animation` to this view whenever `value`
    ///   changes.
    @ViewBuilder
    func optionalAnimation<V>(_ animation: Animation?, value: V) -> some View where V: Equatable {
        self.modifier(OptionalAnimationValueModifier(
            animation: animation,
            value: value
        ))
    }
}
