//
//  BadgeGetCornerRadiusUseCase.swift
//  SparkComponentBadge
//
//  Created by robin.lemaire on 10/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

// sourcery: AutoMockable, AutoMockTest
protocol BadgeGetCornerRadiusUseCaseable {
    // sourcery: theme = "Identical"
    func execute(theme: any Theme) -> CGFloat
}

final class BadgeGetCornerRadiusUseCase: BadgeGetCornerRadiusUseCaseable {

    // MARK: - Methods

    func execute(theme: any Theme) -> CGFloat {
        theme.border.radius.full
    }
}
