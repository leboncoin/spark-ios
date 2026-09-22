//
//  SliderGetStepValuesInBoundsUseCaseDeprecated.swift
//  SparkComponentSlider
//
//  Created by louis.borlee on 19/12/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Foundation

@available(*, deprecated, message: "Not used anymore by SparkSlider or SparkUISlider")
protocol SliderGetStepValuesInBoundsUseCasableDeprecated {
    func execute<V>(bounds: ClosedRange<V>, step: V.Stride) -> [V] where V: BinaryFloatingPoint, V.Stride: BinaryFloatingPoint
}

@available(*, deprecated, message: "Not used anymore by SparkSlider or SparkUISlider")
final class SliderGetStepValuesInBoundsUseCaseDeprecated: SliderGetStepValuesInBoundsUseCasableDeprecated {
    func execute<V>(bounds: ClosedRange<V>, step: V.Stride) -> [V] where V: BinaryFloatingPoint, V.Stride: BinaryFloatingPoint {
        return stride(from: bounds.lowerBound, through: bounds.upperBound, by: step).sorted()
    }
}
