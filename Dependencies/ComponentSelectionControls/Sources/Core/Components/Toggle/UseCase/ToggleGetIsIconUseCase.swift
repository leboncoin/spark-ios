//
//  ToggleGetIsIconUseCase.swift
//  SparkComponentSelectionControls
//
//  Created by robin.lemaire on 02/07/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation
import SwiftUI

// sourcery: AutoMockable, AutoMockTest
protocol ToggleGetIsIconUseCaseable {
    func execute(isOnOffSwitchLabelsEnabled: Bool, contrast: ColorSchemeContrast) -> Bool
    func executeUI(isOnOffSwitchLabelsEnabled: Bool, contrast: UIAccessibilityContrast) -> Bool
}

final class ToggleGetIsIconUseCase: ToggleGetIsIconUseCaseable {

    // MARK: - Methods

    func execute(isOnOffSwitchLabelsEnabled: Bool, contrast: ColorSchemeContrast) -> Bool {
        self.execute(
            isOnOffSwitchLabelsEnabled: isOnOffSwitchLabelsEnabled,
            isHighContrast: contrast == .increased
        )
    }

    func executeUI(isOnOffSwitchLabelsEnabled: Bool, contrast: UIAccessibilityContrast) -> Bool {
        self.execute(
            isOnOffSwitchLabelsEnabled: isOnOffSwitchLabelsEnabled,
            isHighContrast: contrast == .high
        )
    }

    // MARK: - Private Methods

    private func execute(isOnOffSwitchLabelsEnabled: Bool, isHighContrast: Bool) -> Bool {
        isOnOffSwitchLabelsEnabled || isHighContrast
    }
}
