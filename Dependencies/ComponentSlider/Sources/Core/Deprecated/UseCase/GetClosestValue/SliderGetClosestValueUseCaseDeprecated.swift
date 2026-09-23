//
//  SliderGetClosestValueUseCaseDeprecated.swift
//  SparkComponentSlider
//
//  Created by louis.borlee on 19/12/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Foundation

@available(*, deprecated, message: "Not used anymore by SparkSlider or SparkUISlider")
protocol SliderGetClosestValueUseCasableDeprecated {
    func execute<V>(value: V, in values: [V]) -> V where V: BinaryFloatingPoint
}

@available(*, deprecated, message: "Not used anymore by SparkSlider or SparkUISlider")
final class SliderGetClosestValueUseCaseDeprecated: SliderGetClosestValueUseCasableDeprecated {
    func execute<V>(value: V, in values: [V]) -> V where V: BinaryFloatingPoint {
        guard let closestValue = values.min(by: {
            return abs($0 - value) <= abs($1 - value)
        }) else { return value }
        return closestValue
    }
}
