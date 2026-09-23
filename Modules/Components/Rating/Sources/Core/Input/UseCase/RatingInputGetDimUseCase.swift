//
//  RatingInputGetDimUseCase.swift
//  SparkComponentRating
//
//  Created by robin.lemaire on 07/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SparkTheming
import Foundation

// sourcery: AutoMockable, AutoMockTest
protocol RatingInputGetDimUseCaseable {
    // sourcery: theme = "Identical"
    func execute(
        theme: any Theme,
        isEnabled: Bool
    ) -> CGFloat
}

final class RatingInputGetDimUseCase: RatingInputGetDimUseCaseable {

    // MARK: - Methods

    func execute(
        theme: any Theme,
        isEnabled: Bool
    ) -> CGFloat {
        return isEnabled ? theme.dims.none : theme.dims.dim3
    }
}
