//
//  SwitchScenarioSnapshotTests.swift
//  SparkComponentSwitchSnapshotTests
//
//  Created by robin.lemaire on 09/10/2024.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

@testable import SparkComponentSwitch
@_spi(SI_SPI) import SparkCommonSnapshotTesting
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonTesting
import UIKit
import SwiftUI

enum SwitchScenarioSnapshotTests: String, CaseIterable {
    case test1
    case test2
    case test3
    case test4
    case test5

    // MARK: - Type Alias

    typealias Constants = ComponentSnapshotTestConstants

    // MARK: - Configurations

    func configuration() throws -> [SwitchConfigurationSnapshotTests] {
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
    /// Description: To test all intents
    ///
    /// **Content:
    /// - intents : all**
    /// - value : activated
    /// - status : enabled
    /// - label alignement : right
    /// - is Icon : true
    /// - content resilience : short label
    /// - mode : light
    /// - a11y size : medium
    private func test1() -> [SwitchConfigurationSnapshotTests] {
        let intents = SwitchIntent.allCases

        return intents.map { intent in
            return .init(
                scenario: self,
                intent: intent,
                value: .activated,
                status: .enabled,
                alignment: .right,
                isIcon: true,
                content: .shortLabel
            )
        }
    }

    /// Test 2
    ///
    /// Description: To test both values with all status
    ///
    /// Content:
    /// - intents : **support
    /// - value : **all**
    /// - status : all**
    /// - label alignement : right
    /// - is Icon : true
    /// - content resilience : short label
    /// - mode : light
    /// - a11y size : medium
    private func test2() -> [SwitchConfigurationSnapshotTests] {
        let values = SwitchValue.allCases
        let statutes = SwitchStatus.allCases

        return values.flatMap { value in
            statutes.map { status in
                return .init(
                    scenario: self,
                    intent: .support,
                    value: value,
                    status: status,
                    alignment: .right,
                    isIcon: true,
                    content: .shortLabel
                )
            }
        }
    }

    /// Test 3
    ///
    /// Description: To test label alignement for different length of labels
    ///
    /// Content:
    /// - intents : support
    /// - value : activated
    /// - status : enabled
    /// - **label alignement : all**
    /// - is Icon : true
    /// - **content resilience : all**
    /// - mode : light
    /// - a11y size : medium
    private func test3() -> [SwitchConfigurationSnapshotTests] {
        let alignments = SwitchAlignment.allCases
        let contentResiliences = SwitchContentResilience.allCases

        return alignments.flatMap { alignment in
            contentResiliences.map { contentResilience in
                return .init(
                    scenario: self,
                    intent: .support,
                    value: .activated,
                    status: .enabled,
                    alignment: alignment,
                    isIcon: true,
                    content: contentResilience
                )
            }
        }
    }

    /// Test 4
    ///
    /// Description: To test with and without icons for dark and light mode
    ///
    /// Content:
    /// - intents : support
    /// - value : activated
    /// - status : enabled
    /// - label alignement : right
    /// - **is Icon : all**
    /// - content resilience : short label
    /// - **mode : all**
    /// - a11y size : medium
    private func test4() -> [SwitchConfigurationSnapshotTests] {
        let isIcons = Bool.allCases
        let modes = Constants.Modes.all

        return isIcons.flatMap { isIcon in
            modes.map { mode in
                return .init(
                    scenario: self,
                    intent: .support,
                    value: .activated,
                    status: .enabled,
                    alignment: .right,
                    isIcon: isIcon,
                    content: .shortLabel,
                    modes: [mode]
                )
            }
        }
    }

    /// Test 5
    ///
    /// Description: To test a11y sizes for different alignements
    ///
    /// Content:
    /// - intents : support
    /// - value : activated
    /// - status : enabled
    /// - **label alignement : all**
    /// - is Icon : true
    /// - content resilience : multiline label
    /// - mode : light
    /// - **a11y size : all**
    private func test5() -> [SwitchConfigurationSnapshotTests] {
        let alignments = SwitchAlignment.allCases
        let sizes = Constants.Sizes.all

        return alignments.flatMap { alignment in
            sizes.map { size in
                return .init(
                    scenario: self,
                    intent: .support,
                    value: .activated,
                    status: .enabled,
                    alignment: alignment,
                    isIcon: true,
                    content: .multilineLabel,
                    sizes: [size]
                )
            }
        }
    }
}
