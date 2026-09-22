//
//  CommonGetTitleStyleUseCase.swift
//  SparkComponentSelectionControls
//
//  Created by robin.lemaire on 22/07/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming
import SwiftUI

// sourcery: AutoMockable, AutoMockTest
protocol CommonGetTitleStyleUseCaseable {

    // sourcery: theme = "Identical"
    func execute(theme: any Theme) -> CommonTitleStyle
}

final class CommonGetTitleStyleUseCase: CommonGetTitleStyleUseCaseable {

    // MARK: - Methods

    func execute(theme: any Theme) -> CommonTitleStyle {
        return .init(
            typography: theme.typography.body1,
            color: theme.colors.base.onSurface
        )
    }
}
