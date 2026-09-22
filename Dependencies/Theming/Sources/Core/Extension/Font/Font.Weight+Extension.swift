//
//  FontTextStyle+Extension.swift
//  SparkTheming
//
//  Created by robin.lemaire on 18/04/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import SwiftUI

@_spi(SI_SPI) public extension Font.Weight {

    // MARK: - Initialization

    init(from style: TypographyFontWeight) {
        self = switch style {
        case .regular: .regular
        case .medium: .medium
        case .semibold: .semibold
        case .bold: .bold
        }
    }
}
