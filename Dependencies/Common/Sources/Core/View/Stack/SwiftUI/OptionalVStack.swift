//
//  OptionalVStack.swift
//  SparkCommon
//
//  Created by robin.lemaire on 28/05/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

/// An optional HStack view. If the `onStack` parameter is false, the content will be displayed without a HStack.
///
/// Implementation example :
/// ```swift
/// struct MyView: View {
///     var body: some View {
///         SparkOptionalVStack(
///             alignment: .center,
///             spacing: 8,
///             onStack: true,
///         ) {
///             Text("Hello")
///             Text("Bye")
///         }
///     }
/// }
/// ```
public struct SparkOptionalVStack<Content: View>: View {

    // MARK: - Properties

    private let alignment: HorizontalAlignment
    private let spacing: CGFloat?
    private let onStack: Bool
    @ViewBuilder private let content: () -> Content

    // MARK: - Initialization

    /// Creates a horizontal stack with the given spacing and vertical alignment.
    ///
    /// - Parameters:
    ///   - alignment: The guide for aligning the subviews in this stack. This
    ///     guide has the same vertical screen coordinate for every subview. Default is **center**.
    ///   - spacing: The distance between adjacent subviews, or `nil` if you
    ///     want the stack to choose a default distance for each pair of
    ///     subviews. Default is **nil**.
    ///   - onStack: Display the content on stack or not. Default is **true**.
    ///   - content: A view builder that creates the content of this stack.
    ///
    /// Implementation example :
    /// ```swift
    /// struct MyView: View {
    ///     var body: some View {
    ///         SparkOptionalVStack(
    ///             alignment: .center,
    ///             spacing: 8,
    ///             onStack: false,
    ///         ) {
    ///             Text("Hello")
    ///             Text("Bye")
    ///         }
    ///     }
    /// }
    /// ```
    public init(
        alignment: HorizontalAlignment = .center,
        spacing: CGFloat? = nil,
        onStack: Bool = true,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.alignment = alignment
        self.spacing = spacing
        self.onStack = onStack
        self.content = content
    }

    // MARK: - View

    public var body: some View {
        if self.onStack {
            VStack(
                alignment: self.alignment,
                spacing: self.spacing,
                content: self.content
            )
        } else {
            self.content()
        }
    }
}
