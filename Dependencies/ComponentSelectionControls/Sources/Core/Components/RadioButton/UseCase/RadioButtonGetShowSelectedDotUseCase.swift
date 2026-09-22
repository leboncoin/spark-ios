//
//  RadioButtonGetShowSelectedDotUseCase.swift
//  SparkComponentSelectionControls
//
//  Created by robin.lemaire on 30/07/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SparkTheming

// sourcery: AutoMockable, AutoMockTest
protocol RadioButtonGetShowSelectedDotUseCaseable {
    func execute(isSelected: Bool) -> Bool
}

struct RadioButtonGetShowSelectedDotUseCase: RadioButtonGetShowSelectedDotUseCaseable {

    // MARK: - Methods

    func execute(isSelected: Bool) -> Bool {
        return isSelected
    }
}
