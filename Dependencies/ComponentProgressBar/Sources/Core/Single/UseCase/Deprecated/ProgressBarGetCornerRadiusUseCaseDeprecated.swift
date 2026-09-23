//
//  ProgressBarGetCornerRadiusUseCaseDeprecated.swift
//  SparkComponentProgressBar
//
//  Created by robin.lemaire on 06/10/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

// sourcery: AutoMockable, AutoMockTest
@available(*, deprecated, message: "Not used anymore by the new SparkProgressBar or SparkUIProgressBar")
protocol ProgressBarGetCornerRadiusUseCaseDeprecatedable {

    // sourcery: border = "Identical"
    func execute(
        shape: ProgressBarShape,
        border: any Border
    ) -> CGFloat
}

@available(*, deprecated, message: "Not used anymore by the new SparkProgressBar or SparkUIProgressBar")
struct ProgressBarGetCornerRadiusUseCaseDeprecated: ProgressBarGetCornerRadiusUseCaseDeprecatedable {

    // MARK: - Type alias

    private typealias Constants = ProgressBarConstants

    // MARK: - Methods

    func execute(
        shape: ProgressBarShape,
        border: any Border
    ) -> CGFloat {
        switch shape {
        case .rounded:
            return border.radius.full
        case .square:
            return .zero
        }
    }
}
