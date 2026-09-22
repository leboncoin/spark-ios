//
//  CheckboxGetNewSelectedValueUseCase.swift
//  SparkComponentSelectionControls
//
//  Created by robin.lemaire on 02/07/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation
import SwiftUI

// sourcery: AutoMockable, AutoMockTest
protocol CheckboxGetNewSelectedValueUseCaseable {
    func execute(selectionState: CheckboxSelectionState, isEnabled: Bool) -> CheckboxSelectionState?
}

final class CheckboxGetNewSelectedValueUseCase: CheckboxGetNewSelectedValueUseCaseable {

    // MARK: - Methods

    func execute(selectionState: CheckboxSelectionState, isEnabled: Bool) -> CheckboxSelectionState? {
        guard isEnabled else {
            return nil
        }

        return switch selectionState {
        case .selected: .unselected
        case .unselected, .indeterminate: .selected
        }
    }
}
