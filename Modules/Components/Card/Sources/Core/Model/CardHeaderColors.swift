//
//  CardHeaderColors.swift
//  SparkComponentCard
//
//  Created by robin.lemaire on 11/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
@_spi(SI_SPI) import SparkTheming

struct CardHeaderColors: Equatable {

    // MARK: - Properties

    var background: any ColorToken = ColorTokenClear()
    var foreground: any ColorToken = ColorTokenClear()

    // MARK: - Equatable

    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.background.equals(rhs.background) &&
        lhs.foreground.equals(rhs.foreground)
    }
}
