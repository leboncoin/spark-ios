//
//  TabFonts.swift
//  SparkComponentTab
//
//  Created by robin.lemaire on 23/02/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
@_spi(SI_SPI) import SparkTheming

struct TabFonts: Equatable {

    // MARK: - Properties

    var typographyFontToken: any TypographyFontToken = TypographyFontTokenClear()
}

// MARK: Hashable & Equatable

extension TabFonts {

    static func == (lhs: TabFonts, rhs: TabFonts) -> Bool {
        return lhs.typographyFontToken.equals(rhs.typographyFontToken)
    }
}
