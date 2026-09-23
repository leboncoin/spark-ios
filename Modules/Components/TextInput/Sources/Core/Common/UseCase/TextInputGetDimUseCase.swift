//
//  TextInputGetDimUseCase.swift
//  SparkComponentTextInput
//
//  Created by robin.lemaire on 11/06/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

// sourcery: AutoMockable, AutoMockTest
protocol TextInputGetDimUseCaseable {
    // sourcery: theme = "Identical"
    func execute(theme: any Theme, isEnabled: Bool) -> CGFloat
}

final class TextInputGetDimUseCase: TextInputGetDimUseCaseable {

    // MARK: - Methods

    func execute(theme: any Theme, isEnabled: Bool) -> CGFloat {
        return isEnabled ? theme.dims.none : theme.dims.dim3
    }
}
