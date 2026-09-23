//
//  SegmentedControlGetItemLayoutUseCase.swift
//  SparkComponentSegmentedControl
//
//  Created by robin.lemaire on 24/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SparkTheming

// sourcery: AutoMockable, AutoMockTest
protocol SegmentedControlGetItemLayoutUseCaseable {
    // sourcery: theme = "Identical"
    func execute(theme: any Theme) -> SegmentedControlItemLayout
}

struct SegmentedControlGetItemLayoutUseCase: SegmentedControlGetItemLayoutUseCaseable {

    // MARK: - Methods

    func execute(theme: any Theme) -> SegmentedControlItemLayout {
        return .init(
            padding: theme.layout.spacing.medium,
            spacing: theme.layout.spacing.medium
        )
    }
}
