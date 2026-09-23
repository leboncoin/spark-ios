//
//  SparkButtonStyle.swift
//  SparkComponentButton
//
//  Created by robin.lemaire on 20/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

/// A protocol that defines the visual appearance of a ``SparkButton``.
///
/// Conform to this protocol to create custom button styles that modify only the design
/// and visual presentation of Spark buttons without altering their behavior or functionality.
///
/// Use the `sparkButtonStyle(_:)` modifier to apply your custom style to a button:
///
/// ```swift
/// SparkButton("Submit") {
///     // Your action
/// }
/// .sparkButtonStyle(MyCustomButtonStyle())
/// ```
///
/// - Note: This protocol extends `ViewModifier`, allowing you to apply custom visual transformations
///   to the button's content while preserving its interactive behavior.
@MainActor @preconcurrency public protocol SparkButtonStyle: ViewModifier {

    /// Gets the current body of the caller.
    ///
    /// `content` is a proxy for the view that will have the modifier
    /// represented by `Self` applied to it.
    @ViewBuilder @MainActor @preconcurrency func body(content: Self.Content) -> Self.Body
}

public extension View {

    /// Sets the style for spark buttons within this view to a button style with a
    /// custom appearance.
    ///
    /// Use this modifier to set a specific style for button instances
    /// within a view:
    ///
    /// ```swift
    /// SparkButton("Upload") {
    ///     // Your action
    /// }
    /// .buttonStyle(.myCustomButtonStyle)
    /// ```
    ///
    nonisolated func sparkButtonStyle<S>(_ style: S) -> some View where S: SparkButtonStyle {
        self.modifier(style)
    }
}
