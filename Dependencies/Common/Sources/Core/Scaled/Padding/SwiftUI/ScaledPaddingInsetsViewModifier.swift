//
//  ScaledPaddingViewModifier.swift
//  SparkCommon
//
//  Created by robin.lemaire on 11/04/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

private struct ScaledPaddingInsetsViewModifier: ViewModifier {

    // MARK: - Properties

    @LimitedScaledMetric private var top: CGFloat
    @LimitedScaledMetric private var leading: CGFloat
    @LimitedScaledMetric private var bottom: CGFloat
    @LimitedScaledMetric private var trailing: CGFloat

    // MARK: - Initialization

    init(_ insets: EdgeInsets) {
        self._top = .init(value: insets.top)
        self._leading = .init(value: insets.leading)
        self._bottom = .init(value: insets.bottom)
        self._trailing = .init(value: insets.trailing)
    }

    // MARK: - View

    func body(content: Content) -> some View {
        content
            .padding(.top, self.top)
            .padding(.leading, self.leading)
            .padding(.bottom, self.bottom)
            .padding(.trailing, self.trailing)
    }
}

// MARK: - Extension

public extension View {

    /// Applies a scalable padding to specified edges of a view.
    /// This modifier creates padding that scales proportionally with the system's text size settings
    /// BUT a min and max range is applied to limit the increase and decrease length modification.
    ///
    /// - Parameters:
    ///   - insets: The edges insets to which the padding should be applied.
    /// - Returns: A modified view with scalable padding applied to the specified edges.
    ///
    /// Example usage:
    /// ```swift
    /// Text("Hello World")
    /// .sparkPadding(.init(
    ///     top: 4,
    ///     leading: 4,
    ///     bottom: 4,
    ///     trailing: 4
    /// ))
    /// ```
    func sparkPadding(_ insets: EdgeInsets) -> some View {
        self.modifier(ScaledPaddingInsetsViewModifier(insets))
    }
}

// MARK: - Private Extension

private extension LimitedScaledMetric {

    // MARK: - Initialization

    init(value: CGFloat) {
        self.init(
            value: value,
            minFactor: ScaledPaddingConstants.minValueFactor,
            maxFactor: ScaledPaddingConstants.maxValueFactor
        )
    }
}
