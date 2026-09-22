//
//  SliderGetSpacingUseCase.swift
//  SparkComponentSlider
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SparkTheming
import Foundation

// sourcery: AutoMockable, AutoMockTest
protocol SliderGetSpacingUseCaseable {
    // sourcery: theme = "Identical"
    func execute(theme: any Theme) -> CGFloat
}

struct SliderGetSpacingUseCase: SliderGetSpacingUseCaseable {

    // MARK: - Methods

    func execute(theme: any Theme) -> CGFloat {
        return theme.layout.spacing.small
    }
}
