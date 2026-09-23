//
//  RatingInputGetSpacingUseCase.swift
//  SparkComponentRating
//
//  Created by robin.lemaire on 07/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SparkTheming
import Foundation

// sourcery: AutoMockable, AutoMockTest
protocol RatingInputGetSpacingUseCaseable {
    // sourcery: theme = "Identical"
    func execute(theme: any Theme) -> CGFloat
}

final class RatingInputGetSpacingUseCase: RatingInputGetSpacingUseCaseable {

    // MARK: - Methods

    func execute(theme: any Theme) -> CGFloat {
        return theme.layout.spacing.medium
    }
}
