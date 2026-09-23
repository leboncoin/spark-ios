//
//  CommonGroupScenarioSnapshotTests.swift
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

enum CommonGroupScenarioSnapshotTests: String, CaseIterable {
    case test1
    case test2
    case test3
    case test4
    case test5
    case documentation

    // MARK: - Type Alias

    typealias Constants = ComponentSnapshotTestConstants

    // MARK: - Configurations

    func configuration() throws -> [CommonGroupConfigurationSnapshotTests] {
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
    /// Description: To test all status
    ///
    /// Content:
    /// - status : **all**
    /// - content resilience : short label
    /// - axis: default
    /// - intent: default
    /// - mode : light
    /// - a11y size : medium
    private func test1() -> [CommonGroupConfigurationSnapshotTests] {
        let statutes = CommonStatus.allCases

        return statutes.map { status in
            return .init(
                scenario: self,
                status: status,
                content: .shortLabel,
                axis: .default,
                intent: .default
            )
        }
    }

    /// Test 2
    ///
    /// Description: To test all intent
    ///
    /// Content:
    /// - status : enabled
    /// - content resilience : short label
    /// - axis: default
    /// - intent: **all**
    /// - mode : light
    /// - a11y size : medium
    private func test2() -> [CommonGroupConfigurationSnapshotTests] {
        let intents = CheckboxIntent.allCases

        return intents.map { intent in
            return .init(
                scenario: self,
                status: .enabled,
                content: .shortLabel,
                axis: .default,
                intent: intent
            )
        }
    }

    /// Test 3
    ///
    /// Description: To test different length of labels
    ///
    /// Content:
    /// - status : enabled
    /// - **content resilience : **all**
    /// - **axis**: **all**
    /// - intent: default
    /// - mode : light
    /// - a11y size : medium
    private func test3() -> [CommonGroupConfigurationSnapshotTests] {
        let contentResiliences = CommonGroupContentResilience.allCases
        let axises = CheckboxGroupAxis.allCases

        return contentResiliences.flatMap { contentResilience in
            axises.map { axis in
                return .init(
                    scenario: self,
                    status: .enabled,
                    content: contentResilience,
                    axis: axis,
                    intent: .default
                )
            }
        }
    }

    /// Test 4
    ///
    /// Description: To test dark and light mode
    ///
    /// Content:
    /// - status : enabled
    /// - content resilience : short label
    /// - axis: default
    /// - intent: default
    /// - **mode : **all**
    /// - a11y size : medium
    private func test4() -> [CommonGroupConfigurationSnapshotTests] {
        let modes = ComponentSnapshotTestConstants.Modes.all

        return modes.map { mode in
            return .init(
                scenario: self,
                status: .enabled,
                content: .shortLabel,
                axis: .default,
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
    /// - status : enabled
    /// - content resilience : short label
    /// - axis: default
    /// - intent: default
    /// - mode : light
    /// - **a11y size : **all**
    private func test5() -> [CommonGroupConfigurationSnapshotTests] {
        let sizes = ComponentSnapshotTestConstants.Sizes.all

        return sizes.map { size in
            return .init(
                scenario: self,
                status: .enabled,
                content: .shortLabel,
                axis: .default,
                intent: .default,
                sizes: [size]
            )
        }
    }

    // MARK: - Documentation

    // Used to generate screenshot for Documentation
    private func documentation() -> [CommonGroupConfigurationSnapshotTests] {
        let contentResiliences = CommonGroupContentResilience.allCases
        let statutes = CommonStatus.allCases

        return contentResiliences.flatMap { contentResilience in
            statutes.map { status in
                return .init(
                    scenario: self,
                    status: status,
                    content: contentResilience,
                    axis: .default,
                    intent: .default,
                    modes: Constants.Modes.all
                )
            }
        }
    }
}
