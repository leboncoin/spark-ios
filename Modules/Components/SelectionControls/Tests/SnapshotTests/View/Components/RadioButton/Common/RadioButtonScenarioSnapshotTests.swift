//
//  RadioButtonScenarioSnapshotTests.swift
//  SparkComponentSelectionControlsSnapshotTests
//
//  Created by robin.lemaire on 11/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

@testable import SparkComponentSelectionControls
@_spi(SI_SPI) import SparkCommonSnapshotTesting
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonTesting
import UIKit
import SwiftUI

enum RadioButtonScenarioSnapshotTests: String, CaseIterable {
    case test1
    case test2
    case test3
    case test4
    case test5
    case documentation

    // MARK: - Type Alias

    typealias Constants = ComponentSnapshotTestConstants

    // MARK: - Configurations

    func configuration() throws -> [RadioButtonConfigurationSnapshotTests] {
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
        case .documentation:
            return self.documentation()
        }
    }

    // MARK: - Case Iterable

    static func allCases(forDocumentation: Bool = false) -> [Self] {
        forDocumentation ? [.documentation] : Self.allCases.filter { $0 != .documentation }
    }

    // MARK: - Scenarios

    /// Test 1
    ///
    /// Description: To test both values with all status
    ///
    /// Content:
    /// - value : **all**
    /// - status : **all**
    /// - content resilience : short label
    /// - intent: default
    /// - mode : light
    /// - a11y size : medium
    private func test1() -> [RadioButtonConfigurationSnapshotTests] {
        let values = RadioButtonValue.allCases
        let statutes = CommonStatus.allCases

        return values.flatMap { value in
            statutes.map { status in
                return .init(
                    scenario: self,
                    value: value,
                    status: status,
                    content: .shortLabel,
                    intent: .default
                )
            }
        }
    }

    /// Test 2
    ///
    /// Description: To test all intent
    ///
    /// Content:
    /// - value : **all**
    /// - status : enabled
    /// - content resilience : short label
    /// - intent: **all**
    /// - mode : light
    /// - a11y size : medium
    private func test2() -> [RadioButtonConfigurationSnapshotTests] {
        let values = RadioButtonValue.allCases
        let intents = RadioButtonIntent.allCases

        return values.flatMap { value in
            intents.map { intent in
                return .init(
                    scenario: self,
                    value: value,
                    status: .enabled,
                    content: .shortLabel,
                    intent: intent
                )
            }
        }
    }

    /// Test 3
    ///
    /// Description: To test different length of labels
    ///
    /// Content:
    /// - value : selected
    /// - status : enabled
    /// - **content resilience : **all**
    /// - intent: default
    /// - mode : light
    /// - a11y size : medium
    private func test3() -> [RadioButtonConfigurationSnapshotTests] {
        let contentResiliences = CommonContentResilience.allCases

        return contentResiliences.map { contentResilience in
            return .init(
                scenario: self,
                value: .selected,
                status: .enabled,
                content: contentResilience,
                intent: .default
            )
        }
    }

    /// Test 4
    ///
    /// Description: To test dark and light mode
    ///
    /// Content:
    /// - value : selected
    /// - status : enabled
    /// - content resilience : short label
    /// - intent: default
    /// - **mode : **all**
    /// - a11y size : medium
    private func test4() -> [RadioButtonConfigurationSnapshotTests] {
        let modes = ComponentSnapshotTestConstants.Modes.all

        return modes.map { mode in
            return .init(
                scenario: self,
                value: .selected,
                status: .enabled,
                content: .shortLabel,
                intent: .default,
                modes: [mode]
            )
        }
    }

    /// Test 5
    ///
    /// Description: To test a11y sizes
    ///
    /// Content:
    /// - value : selected
    /// - status : enabled
    /// - content resilience : multiline label
    /// - intent: default
    /// - mode : light
    /// - **a11y size : **all**
    private func test5() -> [RadioButtonConfigurationSnapshotTests] {
        let sizes = ComponentSnapshotTestConstants.Sizes.all

        return sizes.map { size in
            return .init(
                scenario: self,
                value: .selected,
                status: .enabled,
                content: .multilineLabel,
                intent: .default,
                sizes: [size]
            )
        }
    }

    // MARK: - Documentation

    // Used to generate screenshot for Documentation
    private func documentation() -> [RadioButtonConfigurationSnapshotTests] {
        let contentResiliences = CommonContentResilience.allCases
        let values = RadioButtonValue.allCases
        let statutes = CommonStatus.allCases

        return contentResiliences.flatMap { contentResilience in
            values.flatMap { value in
                statutes.map { status in
                    return .init(
                        scenario: self,
                        value: value,
                        status: status,
                        content: contentResilience,
                        intent: .default,
                        modes: Constants.Modes.all
                    )
                }
            }
        }
    }
}
