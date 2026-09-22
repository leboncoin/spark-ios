//
//  RatingInputGetNewValueUseCase.swift
//  SparkComponentRating
//
//  Created by robin.lemaire on 07/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SparkTheming
import Foundation

// sourcery: AutoMockable, AutoMockTest
protocol RatingInputGetNewValueUseCaseable {
    func execute(ratio: CGFloat) -> Double

    func executeIncrement(value valueToIncrement: Double, isEnabled: Bool) -> Double?
    func executeDecrement(value valueToDecrement: Double, isEnabled: Bool) -> Double?
}

final class RatingInputGetNewValueUseCase: RatingInputGetNewValueUseCaseable {

    // MARK: - Methods

    func execute(ratio: CGFloat) -> Double {
        let stars = RatingInputConstants.stars

        let intRatio = switch ratio {
        case ..<0: 1
        case 1...: stars
        default: Int(ratio * CGFloat(stars)) + 1
        }

        return Double(intRatio)
    }

    func executeIncrement(value: Double, isEnabled: Bool) -> Double? {
        guard isEnabled && value < Double(RatingInputConstants.stars) else {
            return nil
        }

        return Double(Int(value) + 1)
    }

    func executeDecrement(value: Double, isEnabled: Bool) -> Double? {
        guard isEnabled && value >= 1 else {
            return nil
        }

        return Double(Int(value) - 1)
    }
}
