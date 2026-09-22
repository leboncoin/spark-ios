//
//  ProgressBarGetCornerRadiusUseCase.swift
//  SparkComponentProgressBar
//
//  Created by robin.lemaire on 16/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

// sourcery: AutoMockable, AutoMockTest
protocol ProgressBarGetCornerRadiusUseCaseable {

    // sourcery: theme = "Identical"
    func execute(
        theme: any Theme,
        shape: ProgressBarShape
    ) -> CGFloat
}

struct ProgressBarGetCornerRadiusUseCase: ProgressBarGetCornerRadiusUseCaseable {

    // MARK: - Type alias

    private typealias Constants = ProgressBarConstants

    // MARK: - Methods

    func execute(
        theme: any Theme,
        shape: ProgressBarShape
    ) -> CGFloat {
        switch shape {
        case .rounded:
            return theme.border.radius.full
        case .square:
            return .zero
        }
    }
}
