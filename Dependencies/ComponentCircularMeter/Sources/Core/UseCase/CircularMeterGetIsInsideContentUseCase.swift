//
//  CircularMeterGetIsInsideContentUseCase.swift
//  SparkComponentCircularMeter
//
//  Created by robin.lemaire on 29/05/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

// sourcery: AutoMockable, AutoMockTest
protocol CircularMeterGetIsInsideContentUseCaseable {
    func execute(size: CircularMeterSize) -> Bool
}

struct CircularMeterGetIsInsideContentUseCase: CircularMeterGetIsInsideContentUseCaseable {

    // MARK: - Methods

    func execute(size: CircularMeterSize) -> Bool {
        return switch size {
        case .small: false
        default: true
        }
    }
}
