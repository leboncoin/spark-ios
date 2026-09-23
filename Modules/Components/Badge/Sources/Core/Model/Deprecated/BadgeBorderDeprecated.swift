//
//  BadgeBorderDeprecated.swift
//  SparkDemo
//
//  Created by alex.vecherov on 17.05.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

/// Structure that is used for configuring border of ``BadgeView``
///
/// List of properties:
/// - width
/// - radius
/// - color returned as ColorToken
@available(*, deprecated, message: "Not used anymore by the new SparkBadge or SparkUIBadge")
public struct BadgeBorderDeprecated {
    var width: CGFloat
    let radius: CGFloat
    var color: any ColorToken

    mutating func setWidth(_ width: CGFloat) {
        self.width = width
    }

    mutating func setColor(_ color: any ColorToken) {
        self.color = color
    }
}
