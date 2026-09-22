//
//  CommonResetAnimationUseCaseableGeneratedMock.swift
//  SparkComponentSelectionControls
//
//  Created by robin.lemaire on 08/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation
import XCTest

import SparkTheming
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonTesting
@_spi(SI_SPI) import SparkThemingTesting
@testable import SparkComponentSelectionControls

@_spi(SI_SPI) public final class CommonResetAnimationUseCaseableGeneratedMock: SparkComponentSelectionControls.CommonResetAnimationUseCaseable, ResetGeneratedMock {

    public typealias CompletedAnimation = ToggleCompletedAnimation

    // MARK: - Initialization

    public init() {}

    // MARK: - Execute

    public var executeWithAnimationTypeAndCompletedAnimationsAndSelectedValueAnimatedAndIsReduceMotionEnabledCallsCount = 0
    public var executeWithAnimationTypeAndCompletedAnimationsAndSelectedValueAnimatedAndIsReduceMotionEnabledCalled: Bool {
        return self.executeWithAnimationTypeAndCompletedAnimationsAndSelectedValueAnimatedAndIsReduceMotionEnabledCallsCount > 0
    }

    public var executeWithAnimationTypeAndCompletedAnimationsAndSelectedValueAnimatedAndIsReduceMotionEnabledReceivedArguments: (
        animationType: UIExecuteAnimationType,
        completedAnimationsCount: Int,
        selectedValueAnimated: Bool,
        isReduceMotionEnabled: Bool
    )?

    public var executeWithAnimationTypeAndCompletedAnimationsAndSelectedValueAnimatedAndIsReduceMotionEnabledReceivedInvocations: [(
        animationType: UIExecuteAnimationType,
        completedAnimationsCount: Int,
        selectedValueAnimated: Bool,
        isReduceMotionEnabled: Bool
    )] = []

    public var _executeWithAnimationTypeAndCompletedAnimationsAndSelectedValueAnimatedAndIsReduceMotionEnabled: ((
        UIExecuteAnimationType,
        Int,
        Bool,
        Bool
    ) -> Void )?

    public func execute<CompletedAnimation>(
        animationType: inout UIExecuteAnimationType,
        completedAnimations: inout [CompletedAnimation],
        selectedValueAnimated: inout Bool,
        isReduceMotionEnabled: Bool
    ) {
        self.executeWithAnimationTypeAndCompletedAnimationsAndSelectedValueAnimatedAndIsReduceMotionEnabledCallsCount += 1
        self.executeWithAnimationTypeAndCompletedAnimationsAndSelectedValueAnimatedAndIsReduceMotionEnabledReceivedArguments = (
            animationType: animationType,
            completedAnimationsCount: completedAnimations.count,
            selectedValueAnimated: selectedValueAnimated,
            isReduceMotionEnabled: isReduceMotionEnabled
        )
        self.executeWithAnimationTypeAndCompletedAnimationsAndSelectedValueAnimatedAndIsReduceMotionEnabledReceivedInvocations.append((
            animationType: animationType,
            completedAnimationsCount: completedAnimations.count,
            selectedValueAnimated: selectedValueAnimated,
            isReduceMotionEnabled: isReduceMotionEnabled
        ))
        self._executeWithAnimationTypeAndCompletedAnimationsAndSelectedValueAnimatedAndIsReduceMotionEnabled?(
            animationType,
            completedAnimations.count,
            selectedValueAnimated,
            isReduceMotionEnabled
        )
    }

    // MARK: Reset 

    public func reset() {
        self.executeWithAnimationTypeAndCompletedAnimationsAndSelectedValueAnimatedAndIsReduceMotionEnabledCallsCount = 0
        self.executeWithAnimationTypeAndCompletedAnimationsAndSelectedValueAnimatedAndIsReduceMotionEnabledReceivedArguments = nil
        self.executeWithAnimationTypeAndCompletedAnimationsAndSelectedValueAnimatedAndIsReduceMotionEnabledReceivedInvocations = []
    }
}
