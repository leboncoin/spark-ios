//
//  CommonGroupGetSpacingUseCase.swift
//  SparkComponentSelectionControls
//
//  Created by robin.lemaire on 22/07/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming
import SwiftUI

// sourcery: AutoMockable, AutoMockTest
protocol CommonGroupGetSpacingUseCaseable {
    // sourcery: theme = "Identical"
    func execute(theme: any Theme, axis: SelectionControlsAxis, isAccessibilitySize: Bool) -> CGFloat
}

final class CommonGroupGetSpacingUseCase: CommonGroupGetSpacingUseCaseable {

    // MARK: - Methods

    func execute(
        theme: any Theme,
        axis: SelectionControlsAxis,
        isAccessibilitySize: Bool
    ) -> CGFloat {
        let axis = isAccessibilitySize ? .vertical : axis

        return switch axis {
        case .vertical: theme.layout.spacing.large
        case .horizontal: theme.layout.spacing.xLarge
        }
    }
}
