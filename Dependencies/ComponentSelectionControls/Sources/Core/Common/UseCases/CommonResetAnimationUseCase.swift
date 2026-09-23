//
//  CommonResetAnimationUseCase.swift
//  SparkComponentSelectionControls
//
//  Created by robin.lemaire on 08/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation
@_spi(SI_SPI) import SparkCommon

protocol CommonResetAnimationUseCaseable {
    func execute<CompletedAnimation>(
        animationType: inout UIExecuteAnimationType,
        completedAnimations: inout [CompletedAnimation],
        selectedValueAnimated: inout Bool,
        isReduceMotionEnabled: Bool
    ) where CompletedAnimation: CommonCompletedAnimation
}

final class CommonResetAnimationUseCase: CommonResetAnimationUseCaseable {

    // MARK: - Methods

    func execute<CompletedAnimation>(
        animationType: inout UIExecuteAnimationType,
        completedAnimations: inout [CompletedAnimation],
        selectedValueAnimated: inout Bool,
        isReduceMotionEnabled: Bool
    ) where CompletedAnimation: CommonCompletedAnimation {
        guard CompletedAnimation.allCases.sorted() == Set(completedAnimations).sorted() else {
            return
        }

        // Reset values
        animationType = .unanimated
        completedAnimations = []
        selectedValueAnimated = false
    }
}
