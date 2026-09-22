//
//  CardGetDimUseCase.swift
//  SparkComponentCard
//
//  Created by robin.lemaire on 01/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SparkTheming
import Foundation

// sourcery: AutoMockable, AutoMockTest
protocol CardGetDimUseCaseable {
    // sourcery: theme = "Identical"
    func execute(
        theme: any Theme,
        isEnabled: Bool
    ) -> CGFloat
}

final class CardGetDimUseCase: CardGetDimUseCaseable {

    // MARK: - Methods

    func execute(
        theme: any Theme,
        isEnabled: Bool
    ) -> CGFloat {
        return isEnabled ? theme.dims.none : theme.dims.dim3
    }
}
