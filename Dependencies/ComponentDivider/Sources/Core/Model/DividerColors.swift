//
//  DividerColors.swift
//  SparkComponentDivider
//
//  Created by robin.lemaire on 12/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

@_spi(SI_SPI) import SparkTheming

struct DividerColors: Equatable {

    // MARK: - Properties

    var text: any ColorToken = ColorTokenClear()
    var separator: any ColorToken = ColorTokenClear()

    // MARK: - Equatable

    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.text.equals(rhs.text) &&
        lhs.separator.equals(rhs.separator)
    }
}
