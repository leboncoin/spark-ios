//
//  ButtonColors.swift
//  SparkComponentButton
//
//  Created by robin.lemaire on 11/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@_spi(SI_SPI) import SparkTheming

/// Current Button Colors properties from a button colors and state
struct ButtonColors {

    // MARK: - Properties

    var tintColor: any ColorToken = ColorTokenClear()
    var iconColor: any ColorToken = ColorTokenClear()
    var backgroundColor: any ColorToken = ColorTokenClear()
    var borderColor: any ColorToken = ColorTokenClear()

    // MARK: - Initialization

    init() {
    }

    init(tintColor: any ColorToken, iconColor: any ColorToken, backgroundColor: any ColorToken, borderColor: any ColorToken) {
        self.tintColor = tintColor
        self.iconColor = iconColor
        self.backgroundColor = backgroundColor
        self.borderColor = borderColor
    }

    init(tintColor: any ColorToken, backgroundColor: any ColorToken, borderColor: any ColorToken) {
        self.tintColor = tintColor
        self.iconColor = tintColor
        self.backgroundColor = backgroundColor
        self.borderColor = borderColor
    }
}

// MARK: Hashable & Equatable

extension ButtonColors: Hashable, Equatable {

    func hash(into hasher: inout Hasher) {
        hasher.combine(self.tintColor)
        hasher.combine(self.iconColor)
        hasher.combine(self.backgroundColor)
        hasher.combine(self.borderColor)
    }

    static func == (lhs: ButtonColors, rhs: ButtonColors) -> Bool {
        return lhs.tintColor.equals(rhs.tintColor) &&
        lhs.iconColor.equals(rhs.iconColor) &&
        lhs.backgroundColor.equals(rhs.backgroundColor) &&
        lhs.borderColor.equals(rhs.borderColor)
    }
}
