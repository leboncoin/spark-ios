//
//  SliderGetCornerRadiiUseCaseDeprecated.swift
//  SparkComponentSlider
//
//  Created by louis.borlee on 23/11/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

// sourcery: AutoMockable
@available(*, deprecated, message: "Not used anymore by SparkSlider or SparkUISlider")
protocol SliderGetCornerRadiiUseCasableDeprecated {
    func execute(theme: any Theme,
                 shape: SliderShape) -> SliderRadiiDeprecated
}

@available(*, deprecated, message: "Not used anymore by SparkSlider or SparkUISlider")
final class SliderGetCornerRadiiUseCaseDeprecated: SliderGetCornerRadiiUseCasableDeprecated {
    func execute(theme: any Theme,
                 shape: SliderShape) -> SliderRadiiDeprecated {
        let radius: CGFloat
        switch shape {
        case .rounded:
            radius = theme.border.radius.small
        case .square:
            radius = theme.border.radius.none
        }
        return SliderRadiiDeprecated(trackRadius: radius, indicatorRadius: radius)
    }
}
