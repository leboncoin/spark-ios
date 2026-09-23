//
//  CommonGetAnimationTypeUseCase.swift
//  SparkComponentSelectionControls
//
//  Created by robin.lemaire on 22/07/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation
@_spi(SI_SPI) import SparkCommon

// sourcery: AutoMockable, AutoMockTest
protocol CommonGetAnimationTypeUseCaseable {
    func execute(isReduceMotionEnabled: Bool) -> UIExecuteAnimationType

    func execute(
        selectedValueAnimated: Bool,
        isReduceMotionEnabled: Bool
    ) -> UIExecuteAnimationType
}

final class CommonGetAnimationTypeUseCase: CommonGetAnimationTypeUseCaseable {

    // MARK: - Methods

    func execute(isReduceMotionEnabled: Bool) -> UIExecuteAnimationType {
        !isReduceMotionEnabled ? .animated(duration: CommonConstants.animationDuration) : .unanimated
    }

    func execute(
        selectedValueAnimated: Bool,
        isReduceMotionEnabled: Bool
    ) -> UIExecuteAnimationType {
        selectedValueAnimated && !isReduceMotionEnabled ? .animated(duration: CommonConstants.animationDuration) : .unanimated
    }
}
