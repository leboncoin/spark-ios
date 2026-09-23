//
//  RatingGetFillingRatioUseCase.swift
//  SparkComponentRating
//
//  Created by robin.lemaire on 07/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

// sourcery: AutoMockable, AutoMockTest
protocol RatingGetFillingRatioUseCaseable {

    func execute(
        index: Int,
        count: Int,
        rating: Double
    ) -> CGFloat
}

final class RatingGetFillingRatioUseCase: RatingGetFillingRatioUseCaseable {

    // MARK: - Methods

    func execute(
        index: Int,
        count: Int,
        rating: Double
    ) -> CGFloat {
        let ratio: Double = if count == 1 { // One Star
            switch rating {
            case 0...1: 0
            case 4...: 1
            default: 0.5
            }
        } else if rating > 0 && rating >= Double(index + 1) {
            1
        } else {
            rating - Double(index)
        }

        let rounded = round(ratio * 2) / 2
        return min(max(rounded, 0), 1)
    }
}
