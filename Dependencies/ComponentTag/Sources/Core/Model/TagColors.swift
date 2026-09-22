//
//  TagColors.swift
//  SparkComponentTag
//
//  Created by robin.lemaire on 28/03/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

@_spi(SI_SPI) import SparkTheming

struct TagColors {

    // MARK: - Properties

    var backgroundColor: any ColorToken = ColorTokenClear()
    var borderColor: any ColorToken = ColorTokenClear()
    var iconColor: any ColorToken = ColorTokenClear()
    var textColor: any ColorToken = ColorTokenClear()

    // MARK: - Initialization

    init() {
    }

    init(
        backgroundColor: any ColorToken,
        borderColor: any ColorToken,
        iconColor: any ColorToken,
        textColor: any ColorToken
    ) {
        self.backgroundColor = backgroundColor
        self.borderColor = borderColor
        self.iconColor = iconColor
        self.textColor = textColor
    }

    init(
        backgroundColor: any ColorToken,
        borderColor: any ColorToken,
        tintColor: any ColorToken
    ) {
        self.backgroundColor = backgroundColor
        self.borderColor = borderColor
        self.iconColor = tintColor
        self.textColor = tintColor
    }
}

// MARK: Hashable & Equatable

extension TagColors: Hashable, Equatable {

    func hash(into hasher: inout Hasher) {
        hasher.combine(self.backgroundColor)
        hasher.combine(self.borderColor)
        hasher.combine(self.iconColor)
        hasher.combine(self.textColor)
    }

    static func == (lhs: TagColors, rhs: TagColors) -> Bool {
        return lhs.backgroundColor.equals(rhs.backgroundColor) &&
        lhs.borderColor.equals(rhs.borderColor) &&
        lhs.iconColor.equals(rhs.iconColor) &&
        lhs.textColor.equals(rhs.textColor)
    }
}
