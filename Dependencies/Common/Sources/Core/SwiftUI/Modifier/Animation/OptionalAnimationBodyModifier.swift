//
//  OptionalAnimationBodyModifier.swift
//  SparkCommon
//
//  Created by robin.lemaire on 26/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

// MARK: - ViewModifier

@available(iOS 17.0, *)
private struct AccessibleAnimationModifier<Content: View, ModifiedContent: View>: View {

    // MARK: - Properties

    let animation: Animation?
    let container: Content
    let content: (PlaceholderContentView<Content>) -> ModifiedContent

    @Environment(\.isSnapshot) private var isSnapshot
    @Environment(\.accessibilityReduceMotion) private var reduceMotion

    // MARK: - View

    var body: some View {
        if self.reduceMotion || self.isSnapshot {
            self.container
        } else {
            self.container.animation(self.animation, body: self.content)
        }
    }
}

@available(iOS 17.0, *)
public extension View {

    /// Applies animation to specific modifiers within the body closure, respecting accessibility reduce motion settings.
    ///
    /// This modifier automatically checks `accessibilityReduceMotion` and only applies
    /// the animation when motion is allowed. When reduce motion is enabled, the modifiers
    /// are still applied but without animation.
    ///
    /// Example:
    /// ```swift
    /// Text("Hello")
    ///     .accessibleAnimation(.easeInOut) { content in
    ///         content
    ///             .opacity(isVisible ? 1 : 0)
    ///             .scaleEffect(isVisible ? 1 : 0.8)
    ///     }
    /// ```
    ///
    /// - Parameters:
    ///   - animation: The animation to apply when motion is allowed
    ///   - body: A closure that receives the content and returns the modified view
    /// - Returns: The modified view with animation applied only if reduce motion is disabled
    @ViewBuilder
    func optionalAnimation<V>(
        _ animation: Animation?,
        @ViewBuilder body: @escaping (PlaceholderContentView<Self>) -> V
    ) -> some View where V: View {
        AccessibleAnimationModifier(
            animation: animation,
            container: self,
            content: body
        )
    }
}
