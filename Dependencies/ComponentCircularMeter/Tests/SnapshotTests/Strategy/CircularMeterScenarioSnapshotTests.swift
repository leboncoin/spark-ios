//
//  CircularMeterScenarioSnapshotTests.swift
//  SparkComponentCircularMeterSnapshotTests
//
//  Created by robin.lemaire on 27/05/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentCircularMeter
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonSnapshotTesting
@_spi(SI_SPI) import SparkCommonTesting
import SparkTheme
import UIKit
import SwiftUI

enum CircularMeterScenarioSnapshotTests: String, CaseIterable {
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

    func configuration() -> [CircularMeterConfigurationSnapshotTests] {
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
        case .test6:
            return self.test6()
        case .documentation:
            return self.documentation()
        }
    }

    // MARK: - Scenarios

    /// Test 1
    ///
    /// Description: To test all intents.
    ///
    private func test1() -> [CircularMeterConfigurationSnapshotTests] {
        let intents = CircularMeterIntent.allCases

        return intents.map { intent in
                .init(
                    scenario: self,
                    intent: intent
                )
        }
    }

    /// Test 2
    ///
    /// Description: To some values
    ///
    private func test2() -> [CircularMeterConfigurationSnapshotTests] {
        let values: [Double] = [
            -0.2,
             0,
             0.1,
             0.25,
             0.5,
             0.75,
             0.9,
             1,
             1.1
        ]

        return values.map { value in
                .init(
                    scenario: self,
                    value: value,
                    isText: false,
                    isContent: false
                )
        }
    }

    /// Test 3
    ///
    /// Description: To test all some sizes for all dynamic sizes
    ///
    private func test3() -> [CircularMeterConfigurationSnapshotTests] {
        let sizes: [CircularMeterSize] = [
            .small,
            .xLarge
        ]

        return sizes.map { size in
                .init(
                    scenario: self,
                    size: size,
                    sizes: Constants.Sizes.all
                )
        }
    }

    /// Test 4
    ///
    /// Description: To test all size and all displayType
    ///
    private func test4() -> [CircularMeterConfigurationSnapshotTests] {
        let sizes = CircularMeterSize.allCases
        let displayTypes = CircularMeterDisplayType.allCases

        return sizes.flatMap { size in
            displayTypes.map { displayType in
                    .init(
                        scenario: self,
                        size: size,
                        displayType: displayType
                    )
            }
        }
    }

    /// Test 5
    ///
    /// Description: To test all size and all displayType where isContent is true.
    ///
    private func test5() -> [CircularMeterConfigurationSnapshotTests] {
        let sizes = CircularMeterSize.allCases
        let displayTypes = CircularMeterDisplayType.allCases.filter { $0.isContent }
        let isTexts = Bool.allCases
        let isContents = Bool.allCases

        return sizes.flatMap { size in
            displayTypes.flatMap { displayType in
                isContents.flatMap { isContent in
                    isTexts.map { isText in
                            .init(
                                scenario: self,
                                size: size,
                                displayType: displayType,
                                isText: isText,
                                isContent: isContent
                            )
                    }
                }
            }
        }
    }

    /// Test 6
    ///
    /// Description: To test all modes for all displayType where isContent is true.
    ///
    private func test6() -> [CircularMeterConfigurationSnapshotTests] {
        let displayTypes = CircularMeterDisplayType.allCases.filter { $0.isContent }

        return displayTypes.map { type in
                .init(
                    scenario: self,
                    displayType: type,
                    modes: Constants.Modes.all
                )
        }
    }

    // MARK: - Documentation

    // Used to generate screenshot for Documentation
    private func documentation() -> [CircularMeterConfigurationSnapshotTests] {
        var items: [CircularMeterConfigurationSnapshotTests] = []

        // Small size
        let sizes = CircularMeterSize.allCases
        items.append(contentsOf: sizes.map { size in
            CircularMeterConfigurationSnapshotTests(
                scenario: self,
                size: size,
                documentationName: "\(size)"
            )
        })

        // All displayTypes
        let displayTypes = CircularMeterDisplayType.allCases
        items.append(contentsOf: displayTypes.map { displayType in
            CircularMeterConfigurationSnapshotTests(
                scenario: self,
                displayType: displayType,
                documentationName: "\(displayType)"
            )
        })

        // Only value
        items.append(
            CircularMeterConfigurationSnapshotTests(
                scenario: self,
                displayType: .text,
                isText: false,
                isContent: false,
                documentationName: "value"
            )
        )

        return items
    }
}
