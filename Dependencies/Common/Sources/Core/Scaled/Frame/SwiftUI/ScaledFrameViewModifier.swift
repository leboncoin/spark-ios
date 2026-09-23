//
//  ScaledFrameViewModifier.swift
//  SparkCommon
//
//  Created by robin.lemaire on 11/04/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

private struct ScaledFrameViewModifier: ViewModifier {

    // MARK: - Properties

    @ScaledFrame private var width: CGFloat?
    @ScaledFrame private var height: CGFloat?

    private let alignment: Alignment

    // MARK: - Initialization

    init(
        width: CGFloat?,
        height: CGFloat?,
        relativeTo: Font.TextStyle?,
        alignment: Alignment
    ) {
        self._width = .init(value: width, relativeTo: relativeTo)
        self._height = .init(value: height, relativeTo: relativeTo)

        self.alignment = alignment
    }

    // MARK: - View

    func body(content: Content) -> some View {
        content
            .frame(
                width: self.width,
                height: self.height,
                alignment: self.alignment
            )
    }
}

// MARK: - Extension

public extension View {

    /// Applies a fixed-dimension scalable frame to a view.
    /// This modifier creates a frame with specified dimensions that scale relative to a text style,
    /// making it responsive to the user's accessibility settings BUT a min and max range is
    /// to limit the increase and decrease values modification.
    ///
    /// - Parameters:
    ///   - width: Optional fixed width that will scale according to the text style.
    ///   - height: Optional fixed height that will scale according to the text style.
    ///   - relativeTo: Reference text style used for scaling calculations (default: .largeTitle).
    ///     The frame dimensions will scale proportionally to how this text style scales with
    ///     the user's accessibility settings.
    ///   - alignment: Alignment of the content within the frame (default: .center).
    /// - Returns: A modified view with the scalable frame applied.
    ///
    /// Example usage:
    /// ```swift
    /// Text("Hello World")
    /// .scaledFrame(
    ///     width: 10,
    ///     height: 20
    /// )
    /// ```
    func sparkFrame(
        width: CGFloat? = nil,
        height: CGFloat? = nil,
        relativeTo: Font.TextStyle? = .largeTitle,
        alignment: Alignment = .center
    ) -> some View {
        self.modifier(ScaledFrameViewModifier(
            width: width,
            height: height,
            relativeTo: relativeTo,
            alignment: alignment
        ))
    }

    /// Applies a fixed-dimension scalable frame to a view.
    /// This modifier creates a frame with specified dimensions that scale relative to a text style,
    /// making it responsive to the user's accessibility settings BUT a min and max range is
    /// to limit the increase and decrease values modification.
    ///
    /// - Parameters:
    ///   - width: Optional fixed width that will scale according to the text style.
    ///   - height: Optional fixed height that will scale according to the text style.
    ///   - relativeTo: Reference text style used for scaling calculations (default: .largeTitle).
    ///     The frame dimensions will scale proportionally to how this text style scales with
    ///     the user's accessibility settings.
    ///   - alignment: Alignment of the content within the frame (default: .center).
    /// - Returns: A modified view with the scalable frame applied.
    ///
    /// Example usage:
    /// ```swift
    /// Text("Hello World")
    /// .scaledFrame(
    ///     width: 10,
    ///     height: 20
    /// )
    /// ```
    @available(*, deprecated, message: "Use sparkFrame instead.")
    func scaledFrame(
        width: CGFloat? = nil,
        height: CGFloat? = nil,
        relativeTo: Font.TextStyle? = .largeTitle,
        alignment: Alignment = .center
    ) -> some View {
        self.modifier(ScaledFrameViewModifier(
            width: width,
            height: height,
            relativeTo: relativeTo,
            alignment: alignment
        ))
    }

    /// Applies a fixed size scalable frame to a view.
    /// This modifier creates a frame with specified dimensions that scale relative to a text style,
    /// making it responsive to the user's accessibility settings BUT a min and max range is
    /// to limit the increase and decrease values modification.
    ///
    /// - Parameters:
    ///   - size: Optional fixed width and height that will scale according to the text style.
    ///   - relativeTo: Reference text style used for scaling calculations (default: .largeTitle).
    ///     The frame dimensions will scale proportionally to how this text style scales with
    ///     the user's accessibility settings.
    ///   - alignment: Alignment of the content within the frame (default: .center).
    /// - Returns: A modified view with the scalable frame applied.
    ///
    /// Example usage:
    /// ```swift
    /// Text("Hello World")
    /// .scaledFrame(size: 10)
    /// ```
    func sparkFrame(
        size: CGFloat,
        relativeTo: Font.TextStyle? = .largeTitle,
        alignment: Alignment = .center
    ) -> some View {
        self.modifier(ScaledFrameViewModifier(
            width: size,
            height: size,
            relativeTo: relativeTo,
            alignment: alignment
        ))
    }
}
