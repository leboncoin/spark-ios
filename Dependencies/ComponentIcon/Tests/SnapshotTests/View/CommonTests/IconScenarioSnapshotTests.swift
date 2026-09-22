//
//  IconScenarioSnapshotTests.swift
//  SparkComponentIconSnapshotTests
//
//  Created by robin.lemaire on 02/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

@testable import SparkComponentIcon
@_spi(SI_SPI) import SparkComponentIconTesting
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonSnapshotTesting
@_spi(SI_SPI) import SparkCommonTesting
import SparkTheme
import UIKit
import SwiftUI

enum IconScenarioSnapshotTests: String, CaseIterable {
    case test1
    case test2
    case documentation

    // MARK: - Type Alias

    typealias Constants = ComponentSnapshotTestConstants

    // MARK: - Properties

    var isDocumentation: Bool {
        self == .documentation
    }

    // MARK: - Configurations

    func configuration() -> [IconConfigurationSnapshotTests] {
        switch self {
        case .test1:
            return self.test1()
        case .test2:
            return self.test2()
        case .documentation:
            return self.documentation()
        }
    }

    // MARK: - Scenarios

    /// Test 1
    ///
    /// Description: To test all intents
    ///
    /// Content:
    ///  - intents: all
    ///  - sizes: default
    ///  - mode: all
    ///  - size: default
    private func test1() -> [IconConfigurationSnapshotTests] {
        let intents = IconTestingIntent.allCases

        return intents.map { intent in
                .init(
                    scenario: self,
                    intent: intent,
                    modes: Constants.Modes.all
                )
        }
    }

    /// Test 2
    ///
    /// Description: To test all sizes
    ///
    /// Content:
    ///  - intents: default
    ///  - sizes: all
    ///  - mode: default
    ///  - size: all
    private func test2() -> [IconConfigurationSnapshotTests] {
        let sizes = IconTestingSize.allCases

        return sizes.map { size in
                .init(
                    scenario: self,
                    size: size,
                    sizes: Constants.Sizes.all
                )
        }
    }

    // MARK: - Documentation

    // Used to generate screenshot for Documentation
    private func documentation() -> [IconConfigurationSnapshotTests] {
        var items: [IconConfigurationSnapshotTests] = []

        // Icon
        items.append(.init(
            scenario: self,
            intent: .default,
            size: .default,
            documentationName: "defaults"
        ))

        // Intents
        let intents: [IconTestingIntent] = [
            .default,
            .main
        ]
        items.append(contentsOf: intents.map { intent in
            IconConfigurationSnapshotTests(
                scenario: self,
                intent: intent,
                documentationName: "intent_\(intent)"
            )
        })

        // Sizes
        let sizes: [IconTestingSize] = [
            .default,
            .medium
        ]
        items.append(contentsOf: sizes.map { size in
            IconConfigurationSnapshotTests(
                scenario: self,
                size: size,
                documentationName: "size_\(size)"
            )
        })

        return items
    }
}
