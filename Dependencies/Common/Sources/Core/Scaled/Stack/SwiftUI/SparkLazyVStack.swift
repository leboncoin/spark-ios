//
//  SparkLazyVStack.swift
//  SparkCommon
//
//  Created by robin.lemaire on 30/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

// TODO: Snapshots

/// A view that arranges its children in a line that grows vertically,
/// creating items only as needed.
///
/// The spacing is scaled automatically.
///
/// The stack is "lazy," in that the stack view doesn't create items until
/// it needs to render them onscreen.
public struct SparkLazyVStack<Content>: View where Content: View {

    // MARK: - Properties

    private let alignment: HorizontalAlignment
    @LimitedScaledMetric private var spacing: CGFloat
    private let content: () -> Content

    // MARK: - Initialization

    /// Creates a vertical lazy stack with the given spacing which be scaled and vertical alignment.
    ///
    /// - Parameters:
    ///   - alignment: The guide for aligning the subviews in this stack. This
    ///     guide has the same vertical screen coordinate for every subview.
    ///   - spacing: The distance between adjacent subviews. This value will be scaled.
    ///   - content: A view builder that creates the content of this stack.
    public init(
        alignment: HorizontalAlignment = .center,
        spacing: CGFloat,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.alignment = alignment
        self._spacing = .init(
            value: spacing,
            minFactor: ScaledPaddingConstants.minValueFactor,
            maxFactor: ScaledPaddingConstants.maxValueFactor
        )
        self.content = content
    }

    // MARK: - View

    public var body: some View {
        LazyVStack(
            alignment: self.alignment,
            spacing: self.spacing,
            content: self.content
        )
    }
}
