//
//  AvatarGetLayoutUseCase.swift
//  SparkComponentAvatar
//
//  Created by robin.lemaire on 02/07/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

// sourcery: AutoMockable, AutoMockTest
protocol AvatarGetLayoutUseCaseable {
    // sourcery: theme = "Identical"
    func execute(theme: any Theme) -> AvatarLayout
}

final class AvatarGetLayoutUseCase: AvatarGetLayoutUseCaseable {

    // MARK: - Methods

    func execute(theme: any Theme) -> AvatarLayout {
        return .init(
            actionPadding: theme.layout.spacing.medium
        )
    }
}
