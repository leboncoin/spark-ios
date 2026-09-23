//
//  TabGetLayoutUseCase.swift
//  SparkComponentTab
//
//  Created by robin.lemaire on 23/02/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

// sourcery: AutoMockable, AutoMockTest
protocol TabGetLayoutUseCaseable {
    // sourcery: theme = "Identical"
    func execute(theme: any Theme) -> TabLayout
}

struct TabGetLayoutUseCase: TabGetLayoutUseCaseable {

    // MARK: - Methods

    func execute(theme: any Theme) -> TabLayout {
        let spacing = theme.layout.spacing

        return TabLayout(
            verticalPadding: spacing.medium,
            horizontalPadding: spacing.large,
            spacing: spacing.medium
        )
    }
}
