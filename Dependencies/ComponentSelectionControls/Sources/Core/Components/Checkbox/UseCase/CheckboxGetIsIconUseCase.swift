//
//  CheckboxGetIsIconUseCase.swift
//  SparkComponentSelectionControls
//
//  Created by robin.lemaire on 02/07/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation

// sourcery: AutoMockable, AutoMockTest
protocol CheckboxGetIsIconUseCaseable {
    func execute(selectionState: CheckboxSelectionState) -> Bool
}

final class CheckboxGetIsIconUseCase: CheckboxGetIsIconUseCaseable {

    // MARK: - Methods

    func execute(selectionState: CheckboxSelectionState) -> Bool {
        switch selectionState {
        case .selected, .indeterminate: true
        case .unselected: false
        }
    }
}
