//
//  CircularMeterGetLayoutUseCase.swift
//  SparkComponentCircularMeter
//
//  Created by robin.lemaire on 28/05/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SparkTheming

// sourcery: AutoMockable, AutoMockTest
protocol CircularMeterGetLayoutUseCaseable {
    // sourcery: theme = "Identical"
    func execute(theme: any Theme) -> CircularMeterLayout
}

struct CircularMeterGetLayoutUseCase: CircularMeterGetLayoutUseCaseable {

    // MARK: - Methods

    func execute(theme: any Theme) -> CircularMeterLayout {
        return .init(
            spacing: theme.layout.spacing.medium,
            padding: theme.layout.spacing.small
        )
    }
}
