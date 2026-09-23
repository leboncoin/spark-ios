//
//  ChipStateColorsDeprecated.swift
//  SparkComponentChip
//
//  Created by michael.zimmermann on 08.05.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

/// The colors definie a chip
@available(*, deprecated, message: "Not used anymore by SparkChip")
struct ChipStateColorsDeprecated {
    var background: any ColorToken
    let border: any ColorToken
    var foreground: any ColorToken
    var opacity: CGFloat

    init(background: any ColorToken = ColorTokenDefault.clear,
         border: any ColorToken,
         foreground: any ColorToken,
         opacity: CGFloat = 1.0) {
        self.background = background
        self.border = border
        self.foreground = foreground
        self.opacity = opacity
    }

}

extension ChipStateColorsDeprecated: Equatable {
    static func == (lhs: ChipStateColorsDeprecated, rhs: ChipStateColorsDeprecated) -> Bool {
        return lhs.background.equals(rhs.background) &&
        lhs.border.equals(rhs.border) &&
        lhs.foreground.equals(rhs.foreground) &&
        lhs.opacity == rhs.opacity
    }
}
