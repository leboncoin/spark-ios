//
//  TextLinkGetSpacingUseCase.swift
//  SparkComponentTextLink
//
//  Created by robin.lemaire on 20/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SparkTheming
import Foundation

// sourcery: AutoMockable, AutoMockTest
protocol TextLinkGetSpacingUseCaseable {

    // sourcery: theme = "Identical"
    func execute(theme: any Theme) -> CGFloat
}

struct TextLinkGetSpacingUseCase: TextLinkGetSpacingUseCaseable {

    // MARK: - Methods

    func execute(theme: any Theme) -> CGFloat {
        return theme.layout.spacing.medium
    }
}
