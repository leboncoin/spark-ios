//
//  AwarenessCardTypographies.swift
//  SparkComponentCard
//
//  Created by robin.lemaire on 17/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
@_spi(SI_SPI) import SparkTheming
import SparkComponentTextLink

struct AwarenessCardTypographies: Equatable {

    // MARK: - Properties

    var titleFontToken: any TypographyFontToken = TypographyFontTokenClear()
    var descriptionFontToken: any TypographyFontToken = TypographyFontTokenClear()
}

// MARK: - Hashable & Equatable

extension AwarenessCardTypographies {

    static func == (lhs: AwarenessCardTypographies, rhs: AwarenessCardTypographies) -> Bool {
        return lhs.titleFontToken.equals(rhs.titleFontToken) &&
        lhs.descriptionFontToken.equals(rhs.descriptionFontToken)
    }
}
