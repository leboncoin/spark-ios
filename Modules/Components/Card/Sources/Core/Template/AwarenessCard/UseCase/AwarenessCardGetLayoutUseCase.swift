//
//  AwarenessCardGetLayoutUseCase.swift
//  SparkComponentCard
//
//  Created by robin.lemaire on 17/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SparkTheming
import Foundation

// sourcery: AutoMockable, AutoMockTest
protocol AwarenessCardGetLayoutUseCaseable {
    // sourcery: theme = "Identical"
    func execute(
        theme: any Theme
    ) -> AwarenessCardLayout
}

final class AwarenessCardGetLayoutUseCase: AwarenessCardGetLayoutUseCaseable {

    // MARK: - Methods

    func execute(
        theme: any Theme
    ) -> AwarenessCardLayout {
        let spacing = theme.layout.spacing

        return .init(
            horizontalSpacing: spacing.medium,
            verticalSpacing: spacing.small
        )
    }
}
