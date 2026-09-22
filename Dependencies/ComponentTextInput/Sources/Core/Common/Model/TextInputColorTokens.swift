//
//  TextInputColors.swift
//  SparkTextField
//
//  Created by Quentin.richard on 22/09/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Foundation
@_spi(SI_SPI) import SparkTheming

struct TextInputColors: Equatable {

    // MARK: - Properties

    var text: any ColorToken = ColorTokenClear()
    var placeholder: any ColorToken = ColorTokenClear()
    var border: any ColorToken = ColorTokenClear()
    var background: any ColorToken = ColorTokenClear()

    // MARK: - Equatable

    static func == (lhs: TextInputColors, rhs: TextInputColors) -> Bool {
        return lhs.text.equals(rhs.text) &&
        lhs.placeholder.equals(rhs.placeholder) &&
        lhs.border.equals(rhs.border) &&
        lhs.background.equals(rhs.background)
    }
}
