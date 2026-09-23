//
//  FrameSizeViewModifier.swift
//  SparkCommon
//
//  Created by robin.lemaire on 22/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

public extension View {

    /// Applies a fixed size frame to a view.
    ///
    /// - Parameters:
    ///   - size: Optional fixed width and height that will scale according to the text style.
    ///   - alignment: Alignment of the content within the frame (default: .center).
    /// - Returns: A modified view with the scalable frame applied.
    ///
    /// Example usage:
    /// ```swift
    /// Text("Hello World")
    /// .frame(size: 10)
    /// ```
    func frame(
        size: CGFloat,
        alignment: Alignment = .center
    ) -> some View {
        self.frame(width: size, height: size, alignment: alignment)
    }
}
