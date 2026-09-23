//
//  UIFontTextStyle+Extension.swift
//  SparkTheming
//
//  Created by robin.lemaire on 18/04/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import UIKit

@_spi(SI_SPI) public extension UIFont.TextStyle {

    // MARK: - Initialization

    init(from style: TypographyFontStyle) {
        switch style {
        case .largeTitle:
            self = .largeTitle
        case .title:
            self = .title1
        case .title2:
            self = .title2
        case .title3:
            self = .title3
        case .headline:
            self = .headline
        case .subheadline:
            self = .subheadline
        case .body:
            self = .body
        case .callout:
            self = .callout
        case .footnote:
            self = .footnote
        case .caption:
            self = .caption1
        case .caption2:
            self = .caption2
        }
    }
}
