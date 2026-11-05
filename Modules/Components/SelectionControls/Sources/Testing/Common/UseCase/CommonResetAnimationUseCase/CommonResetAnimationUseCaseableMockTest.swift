//
//  CommonResetAnimationUseCaseableMockTest.swift
//  SparkComponentSelectionControls
//
//  Created by robin.lemaire on 08/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import UIKit
import Foundation
import Testing

import SparkTheming
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonTesting
@_spi(SI_SPI) import SparkThemingTesting

@testable import SparkComponentSelectionControls

@_spi(SI_SPI) public final class CommonResetAnimationUseCaseableMockTest {

    // MARK: - Initialization

    private init(){
    }

    // MARK: - Swift Testing

    public static func expectCallsCount(
        _ mock: CommonResetAnimationUseCaseableGeneratedMock,
        executeWithAnimationTypeAndCompletedAnimationsAndSelectedValueAnimatedAndIsReduceMotionEnabledNumberOfCalls numberOfCalls: Int,
        sourceLocation: Testing.SourceLocation = #_sourceLocation
    ) {
        #expect(
            mock.executeWithAnimationTypeAndCompletedAnimationsAndSelectedValueAnimatedAndIsReduceMotionEnabledCallsCount == numberOfCalls,
            "Wrong execute<CommonCompletedAnimationMock>(animationType: inout UIExecuteAnimationType, completedAnimations: inout [CommonCompletedAnimationMock], selectedValueAnimated: inout Bool, isReduceMotionEnabled: Bool) number of called on CommonResetAnimationUseCaseable",
            sourceLocation: sourceLocation
        )
    }

    public static func expectCalled(
        _ mock: CommonResetAnimationUseCaseableGeneratedMock,
        executeWithAnimationTypeAndCompletedAnimationsAndSelectedValueAnimatedAndIsReduceMotionEnabledCalled isCalled: Bool,
        sourceLocation: Testing.SourceLocation = #_sourceLocation
    ) {
        #expect(
            (mock.executeWithAnimationTypeAndCompletedAnimationsAndSelectedValueAnimatedAndIsReduceMotionEnabledCallsCount > 0) == isCalled,
            "Wrong execute<CommonCompletedAnimationMock>(animationType: inout UIExecuteAnimationType, completedAnimations: inout [CommonCompletedAnimationMock], selectedValueAnimated: inout Bool, isReduceMotionEnabled: Bool) called on CommonResetAnimationUseCaseable",
            sourceLocation: sourceLocation
        )
    }

    public static func expect(
        _ mock: CommonResetAnimationUseCaseableGeneratedMock,
        expectedNumberOfCalls: Int,
        givenAnimationType: UIExecuteAnimationType? = nil,
        givenCompletedAnimations: [CommonCompletedAnimationMock]? = nil,
        givenSelectedValueAnimated: Bool? = nil,
        givenIsReduceMotionEnabled: Bool? = nil,
        sourceLocation: Testing.SourceLocation = #_sourceLocation
    ) {
        // Count
        #expect(
            mock.executeWithAnimationTypeAndCompletedAnimationsAndSelectedValueAnimatedAndIsReduceMotionEnabledCallsCount == expectedNumberOfCalls,
            "Wrong execute<CommonCompletedAnimationMock>(animationType: inout UIExecuteAnimationType, completedAnimations: inout [CommonCompletedAnimationMock], selectedValueAnimated: inout Bool, isReduceMotionEnabled: Bool) number of called on CommonResetAnimationUseCaseable",
            sourceLocation: sourceLocation
        )

        // Parameters
        if expectedNumberOfCalls > 0 {
            let args = mock.executeWithAnimationTypeAndCompletedAnimationsAndSelectedValueAnimatedAndIsReduceMotionEnabledReceivedArguments

            // AnimationType
            if let givenAnimationType {
                #expect(
                    args?.animationType == givenAnimationType,
                    "Wrong execute<CommonCompletedAnimationMock>(animationType: inout UIExecuteAnimationType, completedAnimations: inout [CommonCompletedAnimationMock], selectedValueAnimated: inout Bool, isReduceMotionEnabled: Bool) animationType parameter on CommonResetAnimationUseCaseable",
                    sourceLocation: sourceLocation
                )
            } else {
                #expect(
                    args?.animationType == nil,
                    "Wrong execute<CommonCompletedAnimationMock>(animationType: inout UIExecuteAnimationType, completedAnimations: inout [CommonCompletedAnimationMock], selectedValueAnimated: inout Bool, isReduceMotionEnabled: Bool) animationType parameter value on CommonResetAnimationUseCaseable. Should be nil",
                    sourceLocation: sourceLocation
                )
            }

            // CompletedAnimations
            if let givenCompletedAnimations {
                #expect(
                    args?.completedAnimationsCount == givenCompletedAnimations.count,
                    "Wrong execute<CommonCompletedAnimationMock>(animationType: inout UIExecuteAnimationType, completedAnimations: inout [CommonCompletedAnimationMock], selectedValueAnimated: inout Bool, isReduceMotionEnabled: Bool) completedAnimations parameter on CommonResetAnimationUseCaseable",
                    sourceLocation: sourceLocation
                )
            } else {
                #expect(
                    args?.completedAnimationsCount == nil,
                    "Wrong execute<CommonCompletedAnimationMock>(animationType: inout UIExecuteAnimationType, completedAnimations: inout [CommonCompletedAnimationMock], selectedValueAnimated: inout Bool, isReduceMotionEnabled: Bool) completedAnimations parameter value on CommonResetAnimationUseCaseable. Should be nil",
                    sourceLocation: sourceLocation
                )
            }

            // SelectedValueAnimated
            if let givenSelectedValueAnimated {
                #expect(
                    args?.selectedValueAnimated == givenSelectedValueAnimated,
                    "Wrong execute<CommonCompletedAnimationMock>(animationType: inout UIExecuteAnimationType, completedAnimations: inout [CommonCompletedAnimationMock], selectedValueAnimated: inout Bool, isReduceMotionEnabled: Bool) selectedValueAnimated parameter on CommonResetAnimationUseCaseable",
                    sourceLocation: sourceLocation
                )
            } else {
                #expect(
                    args?.selectedValueAnimated == nil,
                    "Wrong execute<CommonCompletedAnimationMock>(animationType: inout UIExecuteAnimationType, completedAnimations: inout [CommonCompletedAnimationMock], selectedValueAnimated: inout Bool, isReduceMotionEnabled: Bool) selectedValueAnimated parameter value on CommonResetAnimationUseCaseable. Should be nil",
                    sourceLocation: sourceLocation
                )
            }

            // IsReduceMotionEnabled
            if let givenIsReduceMotionEnabled {
                #expect(
                    args?.isReduceMotionEnabled == givenIsReduceMotionEnabled,
                    "Wrong execute<CommonCompletedAnimationMock>(animationType: inout UIExecuteAnimationType, completedAnimations: inout [CommonCompletedAnimationMock], selectedValueAnimated: inout Bool, isReduceMotionEnabled: Bool) isReduceMotionEnabled parameter on CommonResetAnimationUseCaseable",
                    sourceLocation: sourceLocation
                )
            } else {
                #expect(
                    args?.isReduceMotionEnabled == nil,
                    "Wrong execute<CommonCompletedAnimationMock>(animationType: inout UIExecuteAnimationType, completedAnimations: inout [CommonCompletedAnimationMock], selectedValueAnimated: inout Bool, isReduceMotionEnabled: Bool) isReduceMotionEnabled parameter value on CommonResetAnimationUseCaseable. Should be nil",
                    sourceLocation: sourceLocation
                )
            }
        }
    }
}
