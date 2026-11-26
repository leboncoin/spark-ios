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
    case test1
    case test2
    case test3
    case test4
    case test5
    case test6
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
        case .test1: self.test1()
        case .test2: self.test2()
        case .test3: self.test3()
        case .test4: self.test4()
        case .test5: self.test5()
        case .test6: self.test6()
        case .documentation: self.documentation()
        }
    }

    // MARK: - Scenarios

    /// Test 1
    ///
    /// Description: Test all sizes with all intents
    ///
    private func test1() -> [DotsIndicatorConfigurationSnapshotTests] {
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

    /// Test 2
    ///
    /// Description: Test all current pages (first, middle, last)
    ///
    private func test2() -> [DotsIndicatorConfigurationSnapshotTests] {
        return [0, 2, 4].map { currentPage in
            .init(
                scenario: self,
                currentPage: currentPage
            )
        }
    }

    /// Test 3
    ///
    /// Description: Test some number of pages (min and max recommended)
    ///
    private func test3() -> [DotsIndicatorConfigurationSnapshotTests] {
        return [3, 7].map { numberOfPages in
            .init(
                scenario: self,
                numberOfPages: numberOfPages,
                currentPage: 0
            )
        }
    }

    /// Test 4
    ///
    /// Description: Test enabled/disabled states
    ///
    private func test4() -> [DotsIndicatorConfigurationSnapshotTests] {
        return [true, false].map { isEnabled in
            .init(
                scenario: self,
                isEnabled: isEnabled
            )
        }
    }

    /// Test 5
    ///
    /// Description: Test all display modes
    ///
    private func test5() -> [DotsIndicatorConfigurationSnapshotTests] {
        return [
            .init(
                scenario: self,
                modes: Constants.Modes.all
            )
        ]
    }

    /// Test 6
    ///
    /// Description: Test all accessibility sizes
    ///
    private func test6() -> [DotsIndicatorConfigurationSnapshotTests] {
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
        var items: [DotsIndicatorConfigurationSnapshotTests] = DotsIndicatorSize.allCases.map { size in
            .init(
                scenario: self,
                size: size,
                documentationName: "size_\(size)"
            )
        }

        items += DotsIndicatorIntent.allCases.map { intent in
            .init(
                scenario: self,
                intent: intent,
                documentationName: "intent_\(intent)"
            )
        }

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
