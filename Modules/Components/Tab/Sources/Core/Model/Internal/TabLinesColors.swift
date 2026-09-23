//
//  TabLinesColors.swift
//  SparkComponentTab
//
//  Created by robin.lemaire on 23/02/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
@_spi(SI_SPI) import SparkTheming

struct TabLinesColors: Equatable {

    // MARK: - Properties

    var colorToken: any ColorToken = ColorTokenClear()
    var selectedColorToken: any ColorToken = ColorTokenClear()
}

// MARK: Hashable & Equatable

extension TabLinesColors {

    static func == (lhs: TabLinesColors, rhs: TabLinesColors) -> Bool {
        return lhs.colorToken.equals(rhs.colorToken) &&
        lhs.selectedColorToken.equals(rhs.selectedColorToken)
    }
}
