//
//  SparkVStack.swift
//  SparkCommon
//
//  Created by robin.lemaire on 19/06/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

@available(*, deprecated, message: "Use SparkVStack instead.")
public typealias ScaledVStack = SparkVStack

/// A view that arranges its subviews in a vertical line with a scaled spacing.
public struct SparkVStack<Content>: View where Content: View {

    // MARK: - Properties

    private let alignment: HorizontalAlignment
    @LimitedScaledMetric private var spacing: CGFloat
    private let content: () -> Content

    // MARK: - Initialization

    /// Creates a vertical stack with the given spacing which be scaled and vertical alignment.
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
        VStack(
            alignment: self.alignment,
            spacing: self.spacing,
            content: self.content
        )
    }
}
