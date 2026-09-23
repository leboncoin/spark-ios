//
//  CommonResetAnimationUseCaseTests.swift
//  SparkComponentSelectionControlsTests
//
//  Created by robin.lemaire on 09/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentSelectionControls
@_spi(SI_SPI) @testable import SparkComponentSelectionControlsTesting
@_spi(SI_SPI) import SparkCommon

final class CommonResetAnimationUseCaseTests: XCTestCase {

    // MARK: - Properties

    private var useCase: CommonResetAnimationUseCase!

    // MARK: - Setup

    override func setUp() {
        super.setUp()
        self.useCase = CommonResetAnimationUseCase()
    }

    override func tearDown() {
        self.useCase = nil
        super.tearDown()
    }

    // MARK: - Test execute when all animations completed

    func test_execute_whenAllAnimationsCompleted_shouldResetValues() {
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
        XCTAssertEqual(animationType, .unanimated)
        XCTAssertTrue(completedAnimations.isEmpty)
        XCTAssertFalse(selectedValueAnimated)
    }

    func test_execute_whenAllAnimationsCompletedInDifferentOrder_shouldResetValues() {
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
        XCTAssertEqual(animationType, .unanimated)
        XCTAssertTrue(completedAnimations.isEmpty)
        XCTAssertFalse(selectedValueAnimated)
    }

    // MARK: - Test execute when not all animations completed

    func test_execute_whenNotAllAnimationsCompleted_shouldNotResetValues() {
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
        XCTAssertEqual(animationType, originalAnimationType)
        XCTAssertEqual(completedAnimations, originalCompletedAnimations)
        XCTAssertEqual(selectedValueAnimated, originalSelectedValueAnimated)
    }

    func test_execute_whenEmptyCompletedAnimations_shouldNotResetValues() {
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
        XCTAssertEqual(animationType, originalAnimationType)
        XCTAssertEqual(completedAnimations, originalCompletedAnimations)
        XCTAssertEqual(selectedValueAnimated, originalSelectedValueAnimated)
    }

    // MARK: - Test edge cases

    func test_execute_whenTooManyCompletedAnimations_shouldStillReset() {
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
        XCTAssertEqual(animationType, .unanimated)
        XCTAssertTrue(completedAnimations.isEmpty)
        XCTAssertFalse(selectedValueAnimated)
    }

    func test_execute_whenUnanimatedAnimationTypeAndAllAnimationsCompleted_shouldStillReset() {
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
        XCTAssertEqual(animationType, .unanimated)
        XCTAssertTrue(completedAnimations.isEmpty)
        XCTAssertFalse(selectedValueAnimated)
    }

    func test_execute_whenSelectedValueAnimatedFalseAndAllAnimationsCompleted_shouldStillReset() {
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
        XCTAssertEqual(animationType, .unanimated)
        XCTAssertTrue(completedAnimations.isEmpty)
        XCTAssertFalse(selectedValueAnimated)
    }
}
