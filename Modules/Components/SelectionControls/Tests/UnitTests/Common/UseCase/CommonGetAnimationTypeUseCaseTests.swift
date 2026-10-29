//
//  CommonGetAnimationTypeUseCaseTests.swift
//  SparkComponentSelectionControlsTests
//
//  Created by robin.lemaire on 10/07/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentSelectionControls
@_spi(SI_SPI) import SparkCommon

@Suite("Common Get Animation Type UseCase Tests")
struct CommonGetAnimationTypeUseCaseTests {

    // MARK: - Execute with isReduceMotionEnabled Tests

    @Test("Execute when reduce motion is false returns animated")
    func executeWhenReduceMotionIsFalseReturnsAnimated() {
        // GIVEN
        let useCase = CommonGetAnimationTypeUseCase()

        // WHEN
        let result = useCase.execute(
            isReduceMotionEnabled: false
        )

        // THEN
        #expect(result == .animated(duration: CommonConstants.animationDuration))
    }

    @Test("Execute when reduce motion is true returns unanimated")
    func executeWhenReduceMotionIsTrueReturnsUnanimated() {
        // GIVEN
        let useCase = CommonGetAnimationTypeUseCase()

        // WHEN
        let result = useCase.execute(
            isReduceMotionEnabled: true
        )

        // THEN
        #expect(result == .unanimated)
    }

    // MARK: - Execute with isReduceMotionEnabled & isReduceMotionEnabled Tests

    @Test("Execute when animated and not reduce motion returns animated")
    func executeWhenAnimatedAndNotReduceMotionReturnsAnimated() {
        // GIVEN
        let useCase = CommonGetAnimationTypeUseCase()

        // WHEN
        let result = useCase.execute(
            selectedValueAnimated: true,
            isReduceMotionEnabled: false
        )

        // THEN
        #expect(result == .animated(duration: CommonConstants.animationDuration))
    }

    @Test("Execute when not animated or reduce motion returns unanimated")
    func executeWhenNotAnimatedOrReduceMotionReturnsUnanimated() {
        // GIVEN
        let useCase = CommonGetAnimationTypeUseCase()

        // WHEN
        let result1 = useCase.execute(
            selectedValueAnimated: false,
            isReduceMotionEnabled: false
        )
        let result2 = useCase.execute(
            selectedValueAnimated: true,
            isReduceMotionEnabled: true
        )

        // THEN
        #expect(result1 == .unanimated)
        #expect(result2 == .unanimated)
    }
}
