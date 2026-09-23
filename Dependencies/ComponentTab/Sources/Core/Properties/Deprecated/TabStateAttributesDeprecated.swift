//
//  TabStateAttributesDeprecated.swift
//  SparkComponentTab
//
//  Created by alican.aycil on 21.07.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import SparkTheming

/// Attributes available for the states of the tab:
/// - spacings: Spacings of the tab item.
/// - colors: any Colors of the tab item.
/// - opacity: The opacity of the tab item.
/// - separatorLineHeight: The lineHeight of the tab item.
struct TabStateAttributesDeprecated: Equatable {

    let spacings: TabItemSpacingsDeprecated
    let colors: TabItemColorsDeprecated
    let heights: TabItemHeightsDeprecated
    let font: any TypographyFontToken

    static func == (lhs: TabStateAttributesDeprecated, rhs: TabStateAttributesDeprecated) -> Bool {
        return lhs.spacings == rhs.spacings &&
        lhs.colors == rhs.colors &&
        lhs.heights == rhs.heights &&
        lhs.font.font == rhs.font.font
    }
}
