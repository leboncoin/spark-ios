//
//  StepperScenarioSnapshotTests.swift
//  SparkComponentStepperSnapshotTests
//
//  Created by robin.lemaire on 05/03/2025.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

@testable import SparkComponentStepper
@_spi(SI_SPI) import SparkCommonSnapshotTesting
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonTesting
import UIKit
import SwiftUI

enum StepperScenarioSnapshotTests: String, CaseIterable {
    case test1
    case test2
    case test3
    case test4
    case test5

    // MARK: - Type Alias

    typealias Constants = ComponentSnapshotTestConstants

    // MARK: - Configurations

    func configuration() throws -> [StepperConfigurationSnapshotTests] {
        switch self {
        case .test1:
            return self.test1()
        case .test2:
            return self.test2()
        case .test3:
            return self.test3()
        case .test4:
            return self.test4()
        case .test5:
            return self.test5()
        }
    }

    // MARK: - Scenarios

    /// Test 1
    ///
    /// Description: To test all states
    ///
    /// Content:
    /// - **state : all**
    /// - content resilience : number only
    /// - largeWidth : false
    /// - mode : light
    /// - a11y size : medium
    private func test1() -> [StepperConfigurationSnapshotTests] {
        let states = StepperState.allCases

        return states.map { state -> StepperConfigurationSnapshotTests in
                .init(
                    scenario: self,
                    state: state,
                    contentResilience: .numberOnly,
                    isFullWidth: false
                )
        }
    }

    /// Test 2
    ///
    /// Description: To test content resilience
    ///
    /// Content:
    /// - state : enabled
    /// - **content resilience : all**
    /// - largeWidth : false
    /// - mode : light
    /// - a11y size : medium
    private func test2() -> [StepperConfigurationSnapshotTests] {
        let contentResiliences = StepperContentResilience.allCases

        return contentResiliences.map { contentResilience -> StepperConfigurationSnapshotTests in
                .init(
                    scenario: self,
                    state: .enabled,
                    contentResilience: contentResilience,
                    isFullWidth: false
                )
        }
    }

    /// Test 3
    ///
    /// Description: To test dark mode
    ///
    /// Content:
    /// - **state : enabled & disabled**
    /// - content resilience : number only
    /// - largeWidth : false
    /// - **mode : all**
    /// - a11y size : medium
    private func test3() -> [StepperConfigurationSnapshotTests] {
        let states: [StepperState] = [
            .enabled,
            .disabled
        ]

        return states.map { state -> StepperConfigurationSnapshotTests in
                .init(
                    scenario: self,
                    state: state,
                    contentResilience: .numberOnly,
                    isFullWidth: false,
                    modes: Constants.Modes.all
                )
        }
    }

    /// Test 4
    ///
    /// Description: To test large width
    ///
    /// Content:
    /// - state : enabled
    /// - content resilience : number only
    /// - **largeWidth : true**
    /// - mode : all
    /// - a11y size : medium
    private func test4() -> [StepperConfigurationSnapshotTests] {
        return [
            .init(
                scenario: self,
                state: .enabled,
                contentResilience: .numberOnly,
                isFullWidth: true
            )
        ]
    }

    /// Test 5
    ///
    /// Description: To test a11y sizes
    ///
    /// Content:
    /// - state : enabled
    /// - content resilience : number only
    /// - largeWidth : false
    /// - mode : light
    /// - **a11y size : xs & xxxl**
    private func test5() -> [StepperConfigurationSnapshotTests] {
        return [
            .init(
                scenario: self,
                state: .enabled,
                contentResilience: .numberOnly,
                isFullWidth: false,
                sizes: Constants.Sizes.all
            )
        ]
    }
}
