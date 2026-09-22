//
//  CheckboxGetToggleOpacitiesUseCase.swift
//  SparkComponentSelectionControls
//
//  Created by robin.lemaire on 02/07/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation

// sourcery: AutoMockable, AutoMockTest
protocol CheckboxGetToggleOpacitiesUseCaseable {
    func execute(selectionState: CheckboxSelectionState) -> CheckboxToggleOpacities
}

final class CheckboxGetToggleOpacitiesUseCase: CheckboxGetToggleOpacitiesUseCaseable {

    // MARK: - Methods

    func execute(selectionState: CheckboxSelectionState) -> CheckboxToggleOpacities {
        let isSelected = switch selectionState {
        case .selected, .indeterminate: true
        case .unselected: false
        }

        return .init(
            background: isSelected ? 1 : 0,
            border: isSelected ? 0 : 1
        )
    }
}
