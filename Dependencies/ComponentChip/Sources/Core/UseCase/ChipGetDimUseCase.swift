//
//  ChipGetDimUseCase.swift
//  SparkComponentChip
//
//  Created by robin.lemaire on 02/07/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SparkTheming
import Foundation

// sourcery: AutoMockable, AutoMockTest
protocol ChipGetDimUseCaseable {
    // sourcery: theme = "Identical"
    func execute(
        theme: any Theme,
        isEnabled: Bool
    ) -> CGFloat
}

final class ChipGetDimUseCase: ChipGetDimUseCaseable {

    // MARK: - Methods

    func execute(
        theme: any Theme,
        isEnabled: Bool
    ) -> CGFloat {
        let token = ChipToken.Opacity(theme: theme)
        return isEnabled ? token.whenEnabled : token.whenDisabled
    }
}
