//
//  TextLinkHoverStyle.swift
//  SparkComponentTextLink
//
//  Created by robin.lemaire on 25/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation
@_spi(SI_SPI) import SparkTheming

struct TextLinkHoverStyle: Equatable {

    // MARK: - Properties

    var horizontalPadding: CGFloat = 0
    var verticalPadding: CGFloat = 0
    var cornerRadius: CGFloat = 0
    var backgroundColor: any ColorToken = ColorTokenClear()
    var dim: CGFloat = 0

    // MARK: - Equatable

    static func == (lhs: TextLinkHoverStyle, rhs: TextLinkHoverStyle) -> Bool {
        return lhs.horizontalPadding == rhs.horizontalPadding &&
        lhs.verticalPadding == rhs.verticalPadding &&
        lhs.cornerRadius == rhs.cornerRadius &&
        lhs.backgroundColor.equals(rhs.backgroundColor) &&
        lhs.dim == rhs.dim
    }
}
