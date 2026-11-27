//
//  DotsIndicatorScenarioSnapshotTests.swift
//  SparkComponentDotsIndicatorSnapshotTests
//
//  Created by Robin Lemaire on 24/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentDotsIndicator
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonSnapshotTesting
@_spi(SI_SPI) import SparkCommonTesting
import UIKit

enum DotsIndicatorScenarioSnapshotTests: String, CaseIterable {
    case testIntents
    case testCurrentPages
    case testNumberOfPages
    case testIsEnabled
    case testModes
    case testA11ySizes
    case documentation

    // MARK: - Type Alias

    typealias Constants = ComponentSnapshotTestConstants

    // MARK: - Properties

    var isDocumentation: Bool {
        self == .documentation
    }

    // MARK: - Configurations

    func configuration() -> [DotsIndicatorConfigurationSnapshotTests] {
        return switch self {
        case .testIntents: self.testIntents()
        case .testCurrentPages: self.testCurrentPages()
        case .testNumberOfPages: self.testNumberOfPages()
        case .testIsEnabled: self.testIsEnabled()
        case .testModes: self.testModes()
        case .testA11ySizes: self.testA11ySizes()
        case .documentation: self.documentation()
        }
    }

    // MARK: - Scenarios

    /// Test Intents
    ///
    /// Description: Test all sizes with all intents
    ///
    private func testIntents() -> [DotsIndicatorConfigurationSnapshotTests] {
        return DotsIndicatorSize.allCases.flatMap { size in
            DotsIndicatorIntent.allCases.map { intent in
                .init(
                    scenario: self,
                    size: size,
                    intent: intent
                )
            }
        }
    }

    /// Test Current Pages
    ///
    /// Description: Test all current pages (first, middle, last)
    ///
    private func testCurrentPages() -> [DotsIndicatorConfigurationSnapshotTests] {
        return [0, 2, 4].map { currentPage in
            .init(
                scenario: self,
                currentPage: currentPage
            )
        }
    }

    /// Test Number Of Pages
    ///
    /// Description: Test some number of pages (min and max recommended)
    ///
    private func testNumberOfPages() -> [DotsIndicatorConfigurationSnapshotTests] {
        return [3, 7].map { numberOfPages in
            .init(
                scenario: self,
                numberOfPages: numberOfPages,
                currentPage: 0
            )
        }
    }

    /// Test Is Enabled
    ///
    /// Description: Test enabled/disabled states
    ///
    private func testIsEnabled() -> [DotsIndicatorConfigurationSnapshotTests] {
        return [true, false].map { isEnabled in
            .init(
                scenario: self,
                isEnabled: isEnabled
            )
        }
    }

    /// Test Modes
    ///
    /// Description: Test all display modes
    ///
    private func testModes() -> [DotsIndicatorConfigurationSnapshotTests] {
        return [
            .init(
                scenario: self,
                modes: Constants.Modes.all
            )
        ]
    }

    /// Test A11y Sizes
    ///
    /// Description: Test all accessibility sizes
    ///
    private func testA11ySizes() -> [DotsIndicatorConfigurationSnapshotTests] {
        return [
            .init(
                scenario: self,
                size: .large,
                sizes: Constants.Sizes.all
            )
        ]
    }

    // MARK: - Documentation

    private func documentation() -> [DotsIndicatorConfigurationSnapshotTests] {
        // All the sizes
        var items: [DotsIndicatorConfigurationSnapshotTests] = DotsIndicatorSize.allCases.map { size in
            .init(
                scenario: self,
                size: size,
                documentationName: "size_\(size)"
            )
        }

        // All the intents
        items += DotsIndicatorIntent.allCases.map { intent in
            .init(
                scenario: self,
                intent: intent,
                documentationName: "intent_\(intent)"
            )
        }

        // The disabled state
        items.append(
            .init(
                scenario: self,
                isEnabled: false,
                documentationName: "isDisabled"
            )
        )

        return items
    }
}
