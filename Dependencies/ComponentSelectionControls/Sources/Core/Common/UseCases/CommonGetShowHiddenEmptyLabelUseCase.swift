//
//  CommonGetShowHiddenEmptyLabelUseCase.swift
//  SparkComponentSelectionControls
//
//  Created by robin.lemaire on 22/07/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation

// sourcery: AutoMockable, AutoMockTest
protocol CommonGetShowHiddenEmptyLabelUseCaseable {
    func execute(isCustomLabel: Bool) -> Bool
}

final class CommonGetShowHiddenEmptyLabelUseCase: CommonGetShowHiddenEmptyLabelUseCaseable {

    // MARK: - Methods

    func execute(isCustomLabel: Bool) -> Bool {
        return isCustomLabel
    }
}
