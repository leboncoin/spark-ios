//
//  SparkLazyHStack.swift
//  SparkCommon
//
//  Created by robin.lemaire on 30/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

// TODO: Snapshots

/// A view that arranges its subviews in a horizontal line.
///
/// Unlike ``SparkLazyHStack``, which only renders the views when your app needs to
/// display them onscreen, an `SparkHStack` renders the views all at once, regardless
/// of whether they are on- or offscreen. Use the regular `SparkHStack` when you have
/// a small number of subviews or don't want the delayed rendering behavior
/// of the "lazy" version.
///
/// The spacing is scaled automatically.
///
public struct SparkLazyHStack<Content>: View where Content: View {

    // MARK: - Properties

    private let alignment: VerticalAlignment
    @LimitedScaledMetric private var spacing: CGFloat
    private let content: () -> Content

    // MARK: - Initialization

    /// Creates a horizontal lazy stack with the given spacing which be scaled and vertical alignment.
    ///
    /// - Parameters:
    ///   - alignment: The guide for aligning the subviews in this stack. This
    ///     guide has the same vertical screen coordinate for every subview.
    ///   - spacing: The distance between adjacent subviews, This value will be scaled.
    ///   - content: A view builder that creates the content of this stack.
    public init(
        alignment: VerticalAlignment = .center,
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
        LazyHStack(
            alignment: self.alignment,
            spacing: self.spacing,
            content: self.content
        )
    }
}
