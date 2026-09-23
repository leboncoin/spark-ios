//
//  TabItemHeightsDeprecated.swift
//  SparkComponentTab
//
//  Created by michael.zimmermann on 08.08.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Foundation
@_spi(SI_SPI) import SparkCommon

/// Heights of a tab item.
/// - separatorLineHeight: The height of the bottom line.
/// - itemHeight: The height of the item
/// - iconHeight: The height of the icon
struct TabItemHeightsDeprecated: Equatable, Updateable {
    var separatorLineHeight: CGFloat
    var itemHeight: CGFloat
    var iconHeight: CGFloat
}
