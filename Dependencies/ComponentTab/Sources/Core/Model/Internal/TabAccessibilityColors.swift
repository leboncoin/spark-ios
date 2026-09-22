//
//  TabAccessibilityColors.swift
//  SparkComponentTab
//
//  Created by robin.lemaire on 23/02/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
@_spi(SI_SPI) import SparkTheming

struct TabAccessibilityColors: Equatable {

    // MARK: - Properties

    var selectedTintColorToken: any ColorToken = ColorTokenClear()
    var selectedBackgroundColorToken: any ColorToken = ColorTokenClear()
}

// MARK: Hashable & Equatable

extension TabAccessibilityColors {

    static func == (lhs: TabAccessibilityColors, rhs: TabAccessibilityColors) -> Bool {
        return lhs.selectedTintColorToken.equals(rhs.selectedTintColorToken) &&
        lhs.selectedBackgroundColorToken.equals(rhs.selectedBackgroundColorToken)
    }
}
