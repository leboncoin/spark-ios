//
//  CommonResetAnimationUseCaseTests.swift
//  SparkComponentSelectionControlsTests
//
//  Created by robin.lemaire on 09/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
import UIKit
@testable import SparkComponentSelectionControls
@_spi(SI_SPI) @testable import SparkComponentSelectionControlsTesting
@_spi(SI_SPI) import SparkCommon

@MainActor
@Suite("Common Reset Animation UseCase Tests")
struct CommonResetAnimationUseCaseTests {

    // MARK: - Properties

    private let useCase: CommonResetAnimationUseCase

    // MARK: - Initialization

    init() {
        self.useCase = CommonResetAnimationUseCase()
    }

    // MARK: - Test execute when all animations completed

    @Test("Execute when all animations completed should reset values")
    func executeWhenAllAnimationsCompletedShouldResetValues() {
        // GIVEN
        var animationType: UIExecuteAnimationType = .animated(duration: 0.3)
        var completedAnimations: [CommonCompletedAnimationMock] = [.one, .two]
        var selectedValueAnimated = true
        let isReduceMotionEnabled = false

        // WHEN
        self.useCase.execute(
            animationType: &animationType,
            completedAnimations: &completedAnimations,
            selectedValueAnimated: &selectedValueAnimated,
            isReduceMotionEnabled: isReduceMotionEnabled
        )

        // THEN
        #expect(animationType == .unanimated)
        #expect(completedAnimations.isEmpty)
        #expect(!selectedValueAnimated)
    }

    @Test("Execute when all animations completed in different order should reset values")
    func executeWhenAllAnimationsCompletedInDifferentOrderShouldResetValues() {
        // GIVEN
        var animationType: UIExecuteAnimationType = .animated(duration: 0.5)
        var completedAnimations: [CommonCompletedAnimationMock] = [.two, .one] // Different order
        var selectedValueAnimated = true
        let isReduceMotionEnabled = true

        // WHEN
        self.useCase.execute(
            animationType: &animationType,
            completedAnimations: &completedAnimations,
            selectedValueAnimated: &selectedValueAnimated,
            isReduceMotionEnabled: isReduceMotionEnabled
        )

        // THEN
        #expect(animationType == .unanimated)
        #expect(completedAnimations.isEmpty)
        #expect(!selectedValueAnimated)
    }

    // MARK: - Test execute when not all animations completed

    @Test("Execute when not all animations completed should not reset values")
    func executeWhenNotAllAnimationsCompletedShouldNotResetValues() {
        // GIVEN
        var animationType: UIExecuteAnimationType = .animated(duration: 0.3)
        var completedAnimations: [CommonCompletedAnimationMock] = [.one] // Missing .two
        var selectedValueAnimated = true
        let isReduceMotionEnabled = false

        let originalAnimationType = animationType
        let originalCompletedAnimations = completedAnimations
        let originalSelectedValueAnimated = selectedValueAnimated

        // WHEN
        self.useCase.execute(
            animationType: &animationType,
            completedAnimations: &completedAnimations,
            selectedValueAnimated: &selectedValueAnimated,
            isReduceMotionEnabled: isReduceMotionEnabled
        )

        // THEN
        #expect(animationType == originalAnimationType)
        #expect(completedAnimations == originalCompletedAnimations)
        #expect(selectedValueAnimated == originalSelectedValueAnimated)
    }

    @Test("Execute when empty completed animations should not reset values")
    func executeWhenEmptyCompletedAnimationsShouldNotResetValues() {
        // GIVEN
        var animationType: UIExecuteAnimationType = .animated(duration: 0.3)
        var completedAnimations: [CommonCompletedAnimationMock] = []
        var selectedValueAnimated = true
        let isReduceMotionEnabled = false

        let originalAnimationType = animationType
        let originalCompletedAnimations = completedAnimations
        let originalSelectedValueAnimated = selectedValueAnimated

        // WHEN
        self.useCase.execute(
            animationType: &animationType,
            completedAnimations: &completedAnimations,
            selectedValueAnimated: &selectedValueAnimated,
            isReduceMotionEnabled: isReduceMotionEnabled
        )

        // THEN
        #expect(animationType == originalAnimationType)
        #expect(completedAnimations == originalCompletedAnimations)
        #expect(selectedValueAnimated == originalSelectedValueAnimated)
    }

    // MARK: - Test edge cases

    @Test("Execute when too many completed animations should still reset")
    func executeWhenTooManyCompletedAnimationsShouldStillReset() {
        // GIVEN
        var animationType: UIExecuteAnimationType = .animated(duration: 0.3)
        var completedAnimations: [CommonCompletedAnimationMock] = [.one, .two, .one, .two, .two] // Duplicate
        var selectedValueAnimated = true
        let isReduceMotionEnabled = false

        // WHEN
        self.useCase.execute(
            animationType: &animationType,
            completedAnimations: &completedAnimations,
            selectedValueAnimated: &selectedValueAnimated,
            isReduceMotionEnabled: isReduceMotionEnabled
        )

        // THEN
        #expect(animationType == .unanimated)
        #expect(completedAnimations.isEmpty)
        #expect(!selectedValueAnimated)
    }

    @Test("Execute when unanimated animation type and all animations completed should still reset")
    func executeWhenUnanimatedAnimationTypeAndAllAnimationsCompletedShouldStillReset() {
        // GIVEN
        var animationType: UIExecuteAnimationType = .unanimated
        var completedAnimations: [CommonCompletedAnimationMock] = [.one, .two]
        var selectedValueAnimated = false
        let isReduceMotionEnabled = true

        // WHEN
        self.useCase.execute(
            animationType: &animationType,
            completedAnimations: &completedAnimations,
            selectedValueAnimated: &selectedValueAnimated,
            isReduceMotionEnabled: isReduceMotionEnabled
        )

        // THEN
        #expect(animationType == .unanimated)
        #expect(completedAnimations.isEmpty)
        #expect(!selectedValueAnimated)
    }

    @Test("Execute when selected value animated false and all animations completed should still reset")
    func executeWhenSelectedValueAnimatedFalseAndAllAnimationsCompletedShouldStillReset() {
        // GIVEN
        var animationType: UIExecuteAnimationType = .animated(duration: 0.2)
        var completedAnimations: [CommonCompletedAnimationMock] = [.two, .one]
        var selectedValueAnimated = false
        let isReduceMotionEnabled = false

        // WHEN
        self.useCase.execute(
            animationType: &animationType,
            completedAnimations: &completedAnimations,
            selectedValueAnimated: &selectedValueAnimated,
            isReduceMotionEnabled: isReduceMotionEnabled
        )

        // THEN
        #expect(animationType == .unanimated)
        #expect(completedAnimations.isEmpty)
        #expect(!selectedValueAnimated)
    }
}
