//
//  OptionalBlinkModifier.swift
//  SparkCommon
//
//  Created by robin.lemaire on 02/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

@_spi(SI_SPI) public struct OptionalBlinkModifier: ViewModifier {

    // MARK: - Properties

    private let isEnabled: Bool
    private let duration: TimeInterval

    @Environment(\.isSnapshot) private var isSnapshot
    @Environment(\.accessibilityReduceMotion) private var reduceMotion
    @State private var isVisible = true

    // MARK: - Initialization

    public init(
        isEnabled: Bool,
        duration: TimeInterval
    ) {
        self.isEnabled = isEnabled
        self.duration = duration
    }

    // MARK: - View

    public func body(content: Content) -> some View {
        content
            .opacity(self.isVisible ? 1 : 0)
            .animation(
                self.isBlinking ? .easeInOut(duration: self.duration).repeatForever() : nil,
                value: self.isVisible
            )
            .onAppear {
                self.updateVisibility()
            }
            .onChange(of: self.isBlinking) {
                self.updateVisibility()
            }
    }

    // MARK: - Getter

    private var isBlinking: Bool {
        self.isEnabled && !self.reduceMotion && !self.isSnapshot
    }

    // MARK: - Setter

    private func updateVisibility() {
        self.isVisible = !self.isBlinking
    }
}

// MARK: - View Extension

public extension View {

    /// Makes this view blink (opacity animated between 1 and 0) while `isEnabled` is true,
    /// only if the **accessibilityReduceMotion** is disabled
    /// and the view is not rendered for a snapshot (**isSnapshot**).
    ///
    /// Otherwise, the view is displayed fully opaque, without animation.
    ///
    /// ```swift
    /// struct MyView: View {
    ///     @State private var isFocused = true
    ///
    ///     var body: some View {
    ///         Text("|")
    ///             .optionalBlink(isEnabled: self.isFocused, duration: 0.5)
    ///     }
    /// }
    /// ```
    ///
    /// - Parameters:
    ///   - isEnabled: A Boolean value that indicates whether the view blinks.
    ///   - duration: The duration of one fade (in or out), in seconds.
    ///
    /// - Returns: A view that blinks while `isEnabled` is true.
    func optionalBlink(isEnabled: Bool, duration: TimeInterval) -> some View {
        self.modifier(OptionalBlinkModifier(
            isEnabled: isEnabled,
            duration: duration
        ))
    }
}
