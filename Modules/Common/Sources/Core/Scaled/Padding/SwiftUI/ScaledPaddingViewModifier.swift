//
//  ScaledPaddingViewModifier.swift
//  SparkCommon
//
//  Created by robin.lemaire on 11/04/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

private struct ScaledPaddingViewModifier: ViewModifier {

    // MARK: - Properties

    @LimitedScaledMetric private var length: CGFloat
    private let edges: Edge.Set

    // MARK: - Initialization

    init(edges: Edge.Set = .all, length: CGFloat) {
        self._length = .init(
            value: length,
            minFactor: ScaledPaddingConstants.minValueFactor,
            maxFactor: ScaledPaddingConstants.maxValueFactor
        )
        self.edges = edges
    }

    // MARK: - View

    func body(content: Content) -> some View {
        content.padding(self.edges, self.length)
    }
}

// MARK: - Extension

public extension View {

    /// Applies a scalable padding with equal length on all edges of a view.
    /// This modifier creates padding that scales proportionally with the system's text size settings
    /// BUT a min and max range is applied to limit the increase and decrease length modification.
    ///
    /// - Parameter length: The base padding length that will be scaled according to the system's
    ///   accessibility settings.
    /// - Returns: A modified view with scalable padding applied to all edges.
    ///
    /// Example usage:
    /// ```swift
    /// Text("Hello World")
    /// .sparkPadding(10)
    /// ```
    func sparkPadding(_ length: CGFloat) -> some View {
        self.modifier(ScaledPaddingViewModifier(length: length))
    }

    /// Applies a scalable padding to specified edges of a view.
    /// This modifier creates padding that scales proportionally with the system's text size settings
    /// BUT a min and max range is applied to limit the increase and decrease length modification.
    ///
    /// - Parameters:
    ///   - edges: The edges to which the padding should be applied (default: .all).
    ///     Can be a combination of .top, .bottom, .leading, .trailing, or .all.
    ///   - length: The base padding length that will be scaled according to the system's
    ///     accessibility settings.
    /// - Returns: A modified view with scalable padding applied to the specified edges.
    ///
    /// Example usage:
    /// ```swift
    /// Text("Hello World")
    /// .sparkPadding(.leading, 10)
    /// ```
    func sparkPadding(_ edges: Edge.Set = .all, _ length: CGFloat) -> some View {
        self.modifier(ScaledPaddingViewModifier(edges: edges, length: length))
    }
}
