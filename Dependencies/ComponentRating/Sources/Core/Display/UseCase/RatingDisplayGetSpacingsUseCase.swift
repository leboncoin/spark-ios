//
//  RatingDisplayGetSpacingsUseCase.swift
//  SparkComponentRating
//
//  Created by robin.lemaire on 07/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SparkTheming
import Foundation

// sourcery: AutoMockable, AutoMockTest
protocol RatingDisplayGetSpacingsUseCaseable {
    // sourcery: theme = "Identical"
    func execute(theme: any Theme) -> RatingDisplaySpacings
}

final class RatingDisplayGetSpacingsUseCase: RatingDisplayGetSpacingsUseCaseable {

    // MARK: - Methods

    func execute(theme: any Theme) -> RatingDisplaySpacings {
        let spacing = theme.layout.spacing

        return .init(
            content: spacing.medium,
            stars: spacing.small
        )
    }
}
