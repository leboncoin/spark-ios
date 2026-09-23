//
//  PressedButtonStyle.swift
//  SparkCommon
//
//  Created by Michael Zimmermann on 04.01.24.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import SwiftUI

/// A Button style which updates the passed binding when the button is pressed.
/// The change to the button will be animated by default. To deactivate the animation, set the animationDuration to 0.0
@_spi(SI_SPI) public struct PressedButtonStyle: ButtonStyle {
    @Binding public var isPressed: Bool
    public let duration: CGFloat

    // MARK: - Init
    public init(isPressed: Binding<Bool>, animationDuration duration: CGFloat = 0.2) {
        self._isPressed = isPressed
        self.duration = duration
    }

    public func makeBody(configuration: Configuration) -> some View {
        let animation: Animation? = self.duration <= 0 ? .none : .easeInOut(duration: self.duration)

        return configuration.label
            .onChange(of: configuration.isPressed) { isPressed in
                if isPressed != self.isPressed {
                    self.isPressed = isPressed
                }
            }
            .animation(animation, value: configuration.isPressed)
    }
}
