//
//  SliderColorsDeprecated.swift
//  SparkComponentSlider
//
//  Created by louis.borlee on 23/11/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

@available(*, deprecated, message: "Not used anymore by SparkSlider or SparkUISlider")
struct SliderColorsDeprecated: Equatable {
    let track: any ColorToken
    let indicator: any ColorToken
    let handle: any ColorToken
    let handleActiveIndicator: any ColorToken

    func withOpacity(_ opacity: CGFloat) -> SliderColorsDeprecated {
        return .init(
            track: self.track.opacity(opacity),
            indicator: self.indicator.opacity(opacity),
            handle: self.handle.opacity(opacity),
            handleActiveIndicator: self.handleActiveIndicator.opacity(opacity)
        )
    }

    static func == (lhs: SliderColorsDeprecated, rhs: SliderColorsDeprecated) -> Bool {
        return lhs.track.equals(rhs.track) &&
        lhs.indicator.equals(rhs.indicator) &&
        lhs.handle.equals(rhs.handle) &&
        lhs.handleActiveIndicator.equals(rhs.handleActiveIndicator)
    }
}
