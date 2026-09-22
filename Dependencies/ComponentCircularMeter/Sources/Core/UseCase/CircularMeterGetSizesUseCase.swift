//
//  CircularMeterGetSizesUseCase.swift
//  SparkComponentCircularMeter
//
//  Created by robin.lemaire on 28/05/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

// sourcery: AutoMockable, AutoMockTest
protocol CircularMeterGetSizesUseCaseable {
    func execute(size: CircularMeterSize) -> CircularMeterSizes
}

struct CircularMeterGetSizesUseCase: CircularMeterGetSizesUseCaseable {

    // MARK: - Methods

    func execute(size: CircularMeterSize) -> CircularMeterSizes {
        return switch size {
        case .small:
                .init(
                    gaugeDiameter: 24,
                    gaugeStroke: 3
                )

        case .medium:
                .init(
                    gaugeDiameter: 64,
                    gaugeStroke: 5,
                    icon: 24
                )

        case .large:
                .init(
                    gaugeDiameter: 96,
                    gaugeStroke: 8,
                    icon: 32
                )

        case .xLarge:
                .init(
                    gaugeDiameter: 128,
                    gaugeStroke: 10,
                    icon: 40
                )
        }
    }
}
