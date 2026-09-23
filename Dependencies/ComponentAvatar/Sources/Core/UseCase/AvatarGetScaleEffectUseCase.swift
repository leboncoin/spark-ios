//
//  AvatarGetScaleEffectUseCase.swift
//  SparkComponentAvatar
//
//  Created by robin.lemaire on 22/07/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

// sourcery: AutoMockable, AutoMockTest
protocol AvatarGetScaleEffectUseCaseable {
    func execute(size: AvatarSize, isPressed: Bool) -> CGFloat
}

struct AvatarGetScaleEffectUseCase: AvatarGetScaleEffectUseCaseable {

    // MARK: - Methods

    func execute(size: AvatarSize, isPressed: Bool) -> CGFloat {
        guard isPressed else {
            return 1.0
        }

        return switch size {
        case .xs: 1.1
        case .sm: 1.1
        case .md: 1.1
        case .lg: 1.1
        case .xl: 1.07
        case .xxl: 1.05
        case .xxxl: 1.05
        }
    }
}
