//
//  SegmentedControlGetLayoutUseCase.swift
//  SparkComponentSegmentedControl
//
//  Created by robin.lemaire on 23/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SparkTheming

// sourcery: AutoMockable, AutoMockTest
protocol SegmentedControlGetLayoutUseCaseable {
    // sourcery: theme = "Identical"
    func execute(theme: any Theme) -> SegmentedControlLayout
}

struct SegmentedControlGetLayoutUseCase: SegmentedControlGetLayoutUseCaseable {

    // MARK: - Methods

    func execute(theme: any Theme) -> SegmentedControlLayout {
        return .init(
            padding: theme.layout.spacing.small,
            spacing: theme.layout.spacing.small,
            accessibilityHorizontalPadding: theme.layout.spacing.large,
            accessibilityVerticalPadding: theme.layout.spacing.medium
        )
    }
}
