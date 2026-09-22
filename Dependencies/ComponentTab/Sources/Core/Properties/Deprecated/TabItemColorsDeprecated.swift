//
//  TabItemColorsDeprecated.swift
//  SparkComponentTab
//
//  Created by alican.aycil on 28.07.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Foundation
@_spi(SI_SPI) import SparkCommon
import SparkTheming

/// Colors of the tab item:
/// - label: defines the color of the text and the tint color of the icon
/// - line: The color of the base line
/// - background: The background color of the tab item.
struct TabItemColorsDeprecated: Equatable, Updateable {
    var icon: any ColorToken {
        return self.label
    }
    var label: any ColorToken
    var line: any ColorToken
    var background: any ColorToken
    var opacity: CGFloat

    init(label: any ColorToken,
         line: any ColorToken,
         background: any ColorToken,
         opacity: CGFloat = 1) {
        self.label = label
        self.line = line
        self.background = background
        self.opacity = opacity
    }

    static func == (lhs: TabItemColorsDeprecated, rhs: TabItemColorsDeprecated) -> Bool {
        return colorsEqual(lhs.label, rhs.label) && colorsEqual(lhs.line, rhs.line) && colorsEqual(lhs.background, rhs.background) && lhs.opacity == rhs.opacity
    }

    private static func colorsEqual(_ lhs: any ColorToken, _ rhs: any ColorToken) -> Bool {
        return lhs.color == rhs.color && lhs.uiColor == rhs.uiColor
    }
}
