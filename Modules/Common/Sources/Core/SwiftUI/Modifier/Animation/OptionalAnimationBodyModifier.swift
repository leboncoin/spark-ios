//
//  OptionalAnimationBodyModifier.swift
//  SparkCommon
//
//  Created by robin.lemaire on 26/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

// MARK: - ViewModifier

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

public extension View {

    /// Applies the given animation to the modifiers within the body closure,
    /// only if the **accessibilityReduceMotion** is disabled
    /// and the view is not rendered for a snapshot (**isSnapshot**).
    ///
    /// Otherwise, the view is displayed without animation.
    ///
    /// ```swift
    /// struct MyView: View {
    ///     @State private var isVisible = true
    ///
    ///     var body: some View {
    ///         Text("Hello")
    ///             .optionalAnimation(.easeInOut) { content in
    ///                 content
    ///                     .opacity(self.isVisible ? 1 : 0)
    ///                     .scaleEffect(self.isVisible ? 1 : 0.8)
    ///             }
    ///     }
    /// }
    /// ```
    ///
    /// - Parameters:
    ///   - animation: The animation to apply. If `animation` is `nil`, the view
    ///     doesn't animate.
    ///   - body: A closure that receives the content and returns the modified view.
    ///
    /// - Returns: A view that applies `animation` to the modifiers of the `body` closure.
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
