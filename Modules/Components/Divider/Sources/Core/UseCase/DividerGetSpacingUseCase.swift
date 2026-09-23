//
//
//  DividerGetSpacingUseCase.swift
//  SparkComponentDivider
//
//  Created by robin.lemaire on 12/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

// sourcery: AutoMockable, AutoMockTest
protocol DividerGetSpacingUseCaseable {

    // sourcery: theme = "Identical"
    func execute(theme: any Theme) -> CGFloat
}

struct DividerGetSpacingUseCase: DividerGetSpacingUseCaseable {

    // MARK: - Methods

    // sourcery: theme = "Identical"
    func execute(theme: any Theme) -> CGFloat {
        return theme.layout.spacing.large
    }
}
