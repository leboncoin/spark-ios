//
//  IconGetTintColorUseCase.swift
//  SparkComponentIcon
//
//  Created by robin.lemaire on 06/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

// sourcery: AutoMockable, AutoMockTest
protocol IconGetTintColorUseCaseable {
    // sourcery: theme = "Identical", return = "Identical"
    func execute(theme: any Theme, intent: IconIntent) -> any ColorToken
}

struct IconGetTintColorUseCase: IconGetTintColorUseCaseable {

    // MARK: - Methods

    func execute(
        theme: any Theme,
        intent: IconIntent
    ) -> any ColorToken {
        return theme.component.icon.colors.tint(intent: intent)
    }
}
