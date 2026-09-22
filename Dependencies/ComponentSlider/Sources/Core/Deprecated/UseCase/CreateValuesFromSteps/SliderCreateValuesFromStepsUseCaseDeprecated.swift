//
//  SliderCreateValuesFromStepsUseCaseDeprecated.swift
//  SparkComponentSlider
//
//  Created by louis.borlee on 23/11/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Foundation

enum SliderCreateValuesFromStepsUseCasableDeprecatedError: Error {
    case invalidRange
    case invalidStep
}

// sourcery: AutoMockable
@available(*, deprecated, message: "Not used anymore by SparkSlider or SparkUISlider")
protocol SliderCreateValuesFromStepsUseCasableDeprecated {
    func execute(from: Float,
                 to: Float,
                 steps: Float) throws -> [Float]
}

@available(*, deprecated, message: "Not used anymore by SparkSlider or SparkUISlider")
final class SliderCreateValuesFromStepsUseCaseDeprecated: SliderCreateValuesFromStepsUseCasableDeprecated {
    func execute(from: Float, to: Float, steps: Float) throws -> [Float] {
        guard from < to else { throw SliderCreateValuesFromStepsUseCasableDeprecatedError.invalidRange }
        guard steps > .zero,
              steps <= (to - from) else { throw SliderCreateValuesFromStepsUseCasableDeprecatedError.invalidStep }

        var values = Array(stride(from: from, through: to, by: steps))
        // Last value should be added when `to` % `step` is > 0
        if values.contains(to) == false {
            values.append(to)
        }
        return values
    }
}
