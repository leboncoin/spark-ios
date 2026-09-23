//
//  ReversibleHStack.swift
//  SparkCommon
//
//  Created by robin.lemaire on 29/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

/// A reversible horizontal stack with two contents.
@_spi(SI_SPI) public struct ReversibleHStack<Content1, Content2>: View where Content1: View, Content2: View {

    // MARK: - Properties

    private let alignment: VerticalAlignment
    private let spacing: CGFloat
    private var isReversed: Bool = false
    private let content1: () -> Content1
    private let content2: () -> Content2

    // MARK: - Initialization

    /// Creates a reversible horizontal stack with two contents.
    ///
    /// If the value is true, the content2 will be displayed on first
    /// otherwise the content1 will be displayed on first.
    ///
    /// - Parameters:
    ///   - alignment: The guide for aligning the subviews in this stack. This
    ///     guide has the same vertical screen coordinate for every subview.
    ///   - spacing: The distance between adjacent subviews, This value will be scaled.
    ///   - isReversed: The reserved status.
    ///   - content1: A view builder that creates the first item content on the Stack.
    ///   - content2: A view builder that creates the second item content on the Stack.
    public init(
        alignment: VerticalAlignment = .center,
        spacing: CGFloat = 0,
        content1: @escaping () -> Content1,
        content2: @escaping () -> Content2
    ) {
        self.alignment = alignment
        self.spacing = spacing
        self.content1 = content1
        self.content2 = content2
    }

    public var body: some View {
        SparkHStack(
            alignment: self.alignment,
            spacing: self.spacing,
            content: {
                if self.isReversed {
                    self.content2()
                    self.content1()
                } else {
                    self.content1()
                    self.content2()
                }
            }
        )
    }

    // MARK: - Modifier

    /// The reserved status.
    ///
    /// If the value is true, the content2 will be displayed on first
    /// otherwise the content1 will be displayed on first.
    public func isReversed(_ isReversed: Bool) -> Self {
        var copy = self
        copy.isReversed = isReversed
        return copy
    }
}
