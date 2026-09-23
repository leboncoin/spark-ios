//
//  View+FrameRangeSizeExtension.swift
//  SparkCommon
//
//  Created by robin.lemaire on 22/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

public extension View {

    /// Applies a frame to a view with minimum and maximum size constraints.
    ///
    /// - Parameters:
    ///   - minSize: Minimum width and height of the frame.
    ///   - maxSize: Maximum width and height of the frame.
    ///   - alignment: Alignment of the content within the frame (default: .center).
    /// - Returns: A modified view with the resizable frame applied.
    ///
    /// Example usage:
    /// ```swift
    /// Text("Hello World")
    /// .scaledFrame(
    ///     minSize: 10,
    ///     maxSize: 20
    /// )
    /// ```
    func frame(
        minSize: CGFloat,
        maxSize: CGFloat,
        alignment: Alignment = .center
    ) -> some View {
        self.frame(
            minWidth: minSize,
            maxWidth: maxSize,
            minHeight: minSize,
            maxHeight: maxSize,
            alignment: alignment
        )
    }

    /// Applies a frame to a view with minimum size constraints.
    ///
    /// - Parameters:
    ///   - minSize: Minimum width and height of the frame.
    ///   - alignment: Alignment of the content within the frame (default: .center).
    /// - Returns: A modified view with the resizable frame applied.
    ///
    /// Example usage:
    /// ```swift
    /// Text("Hello World")
    /// .scaledFrame(
    ///     minSize: 10
    /// )
    /// ```
    func frame(
        minSize: CGFloat,
        alignment: Alignment = .center
    ) -> some View {
        self.frame(
            minWidth: minSize,
            minHeight: minSize,
            alignment: alignment
        )
    }

    /// Applies a frame to a view with maximum size constraints.
    ///
    /// - Parameters:
    ///   - maxSize: Maximum width and height of the frame.
    ///   - alignment: Alignment of the content within the frame (default: .center).
    /// - Returns: A modified view with the resizable frame applied.
    ///
    /// Example usage:
    /// ```swift
    /// Text("Hello World")
    /// .scaledFrame(
    ///     maxSize: 20
    /// )
    /// ```
    func frame(
        maxSize: CGFloat,
        alignment: Alignment = .center
    ) -> some View {
        self.frame(
            maxWidth: maxSize,
            maxHeight: maxSize,
            alignment: alignment
        )
    }
}
