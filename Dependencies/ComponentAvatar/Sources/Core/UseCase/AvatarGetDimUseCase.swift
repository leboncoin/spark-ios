//
//  AvatarGetDimUseCase.swift
//  SparkComponentAvatar
//
//  Created by robin.lemaire on 21/07/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

// sourcery: AutoMockable, AutoMockTest
protocol AvatarGetDimUseCaseable {
    // sourcery: theme = "Identical"
    func execute(theme: any Theme, isEnabled: Bool) -> CGFloat
}

struct AvatarGetDimUseCase: AvatarGetDimUseCaseable {

    // MARK: - Methods

    func execute(theme: any Theme, isEnabled: Bool) -> CGFloat {
        return isEnabled ? theme.dims.none : theme.dims.dim3
    }
}
