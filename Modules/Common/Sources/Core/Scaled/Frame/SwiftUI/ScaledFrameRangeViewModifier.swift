//
//  ScaledFrameRangeViewModifier.swift
//  SparkCommon
//
//  Created by robin.lemaire on 11/04/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

private struct ScaledFrameRangeViewModifier: ViewModifier {

    // MARK: - Properties

    @ScaledFrame private var minWidth: CGFloat?
    @ScaledFrame private var maxWidth: CGFloat?

    @ScaledFrame private var minHeight: CGFloat?
    @ScaledFrame private var maxHeight: CGFloat?

    private let alignment: Alignment

    // MARK: - Initialization

    init(
        minWidth: CGFloat?,
        maxWidth: CGFloat?,
        minHeight: CGFloat?,
        maxHeight: CGFloat?,
        relativeTo: Font.TextStyle?,
        alignment: Alignment
    ) {
        self._minWidth = .init(value: minWidth, relativeTo: relativeTo)
        self._maxWidth = .init(value: maxWidth, relativeTo: relativeTo)

        self._minHeight = .init(value: minHeight, relativeTo: relativeTo)
        self._maxHeight = .init(value: maxHeight, relativeTo: relativeTo)

        self.alignment = alignment
    }

    // MARK: - View

    func body(content: Content) -> some View {
        content
            .frame(
                minWidth: self.minWidth,
                maxWidth: self.maxWidth,
                minHeight: self.minHeight,
                maxHeight: self.maxHeight,
                alignment: self.alignment
            )
    }
}

// MARK: - Extension

public extension View {

    /// Applies a scaled resizable frame to a view with minimum and maximum size constraints.
    /// This modifier allows automatically adapting the size of a view based on the text size
    /// defined in the system's accessibility settings BUT a min and max range is applied
    /// to limit the increase and decrease values modification.
    ///
    /// - Parameters:
    ///   - minWidth: Optional minimum width of the frame.
    ///   - maxWidth: Optional maximum width of the frame.
    ///   - minHeight: Optional minimum height of the frame.
    ///   - maxHeight: Optional maximum height of the frame.
    ///   - relativeTo: Reference text style for sizing (default: .largeTitle).
    ///   - alignment: Alignment of the content within the frame (default: .center).
    /// - Returns: A modified view with the resizable frame applied.
    ///
    /// Example usage:
    /// ```swift
    /// Text("Hello World")
    /// .scaledFrame(
    ///     minWidth: 10,
    ///     maxWidth: 20,
    ///     minHeight: 10,
    ///     maxHeight: 20
    /// )
    /// ```
    func sparkFrame(
        minWidth: CGFloat? = nil,
        maxWidth: CGFloat? = nil,
        minHeight: CGFloat? = nil,
        maxHeight: CGFloat? = nil,
        relativeTo: Font.TextStyle? = .largeTitle,
        alignment: Alignment = .center
    ) -> some View {
        self.modifier(ScaledFrameRangeViewModifier(
            minWidth: minWidth,
            maxWidth: maxWidth,
            minHeight: minHeight,
            maxHeight: maxHeight,
            relativeTo: relativeTo,
            alignment: alignment
        ))
    }

    /// Applies a scaled resizable frame to a view with minimum and maximum size constraints.
    /// This modifier allows automatically adapting the size of a view based on the text size
    /// defined in the system's accessibility settings BUT a min and max range is applied
    /// to limit the increase and decrease values modification.
    ///
    /// - Parameters:
    ///   - minWidth: Optional minimum width of the frame.
    ///   - maxWidth: Optional maximum width of the frame.
    ///   - minHeight: Optional minimum height of the frame.
    ///   - maxHeight: Optional maximum height of the frame.
    ///   - relativeTo: Reference text style for sizing (default: .largeTitle).
    ///   - alignment: Alignment of the content within the frame (default: .center).
    /// - Returns: A modified view with the resizable frame applied.
    ///
    /// Example usage:
    /// ```swift
    /// Text("Hello World")
    /// .scaledFrame(
    ///     minWidth: 10,
    ///     maxWidth: 20,
    ///     minHeight: 10,
    ///     maxHeight: 20
    /// )
    /// ```
    @available(*, deprecated, message: "Use sparkFrame instead.")
    func scaledFrame(
        minWidth: CGFloat? = nil,
        maxWidth: CGFloat? = nil,
        minHeight: CGFloat? = nil,
        maxHeight: CGFloat? = nil,
        relativeTo: Font.TextStyle? = .largeTitle,
        alignment: Alignment = .center
    ) -> some View {
        self.modifier(ScaledFrameRangeViewModifier(
            minWidth: minWidth,
            maxWidth: maxWidth,
            minHeight: minHeight,
            maxHeight: maxHeight,
            relativeTo: relativeTo,
            alignment: alignment
        ))
    }

    /// Applies a scaled resizable frame to a view with minimum and maximum size constraints.
    /// This modifier allows automatically adapting the size of a view based on the text size
    /// defined in the system's accessibility settings BUT a min and max range is applied
    /// to limit the increase and decrease values modification.
    ///
    /// - Parameters:
    ///   - minSize: Optional minimum width and height of the frame.
    ///   - maxSize: Optional maximum width and height of the frame.
    ///   - relativeTo: Reference text style for sizing (default: .largeTitle).
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
    func sparkFrame(
        minSize: CGFloat? = nil,
        maxSize: CGFloat? = nil,
        relativeTo: Font.TextStyle? = .largeTitle,
        alignment: Alignment = .center
    ) -> some View {
        self.modifier(ScaledFrameRangeViewModifier(
            minWidth: minSize,
            maxWidth: maxSize,
            minHeight: minSize,
            maxHeight: maxSize,
            relativeTo: relativeTo,
            alignment: alignment
        ))
    }
}
