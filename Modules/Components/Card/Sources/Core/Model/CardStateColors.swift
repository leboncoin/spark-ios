//
//  CardStateColors.swift
//  SparkComponentCard
//
//  Created by robin.lemaire on 01/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation
@_spi(SI_SPI) import SparkTheming

struct CardStateColors: Equatable {

    // MARK: - Properties

    var border: any ColorToken = ColorTokenClear()
    var pressedBorder: any ColorToken = ColorTokenClear()
    var background: any ColorToken = ColorTokenClear()
    var pressedBackground: any ColorToken = ColorTokenClear()
    var foreground: any ColorToken = ColorTokenClear()

    // MARK: - Initialization

    init() {
    }

    init(
        border: any ColorToken,
        pressedBorder: any ColorToken,
        background: any ColorToken,
        pressedBackground: any ColorToken,
        foreground: any ColorToken
    ) {
        self.border = border
        self.pressedBorder = pressedBorder
        self.background = background
        self.pressedBackground = pressedBackground
        self.foreground = foreground
    }

    init(
        background: any ColorToken,
        pressed: any ColorToken,
        foreground: any ColorToken,
    ) {
        self.border = background
        self.pressedBorder = pressed
        self.background = background
        self.pressedBackground = pressed
        self.foreground = foreground
    }

    // MARK: - Equatable

    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.border.equals(rhs.border) &&
        lhs.pressedBorder.equals(rhs.pressedBorder) &&
        lhs.background.equals(rhs.background) &&
        lhs.pressedBackground.equals(rhs.pressedBackground) &&
        lhs.foreground.equals(rhs.foreground)
    }
}
