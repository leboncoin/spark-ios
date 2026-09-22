//
//  DividerScenarioSnapshotTests.swift
//  SparkComponentDividerSnapshotTests
//
//  Created by robin.lemaire on 18/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

@testable import SparkComponentDivider
@_spi(SI_SPI) import SparkComponentDividerTesting
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonSnapshotTesting
@_spi(SI_SPI) import SparkCommonTesting
import SparkTheme
import UIKit
import SwiftUI

enum DividerScenarioSnapshotTests: String, CaseIterable {
    case test1
    case test2
    case test3
    case test4
    case documentation

    // MARK: - Type Alias

    typealias Constants = ComponentSnapshotTestConstants

    // MARK: - Properties

    var isDocumentation: Bool {
        self == .documentation
    }

    // MARK: - Configurations

    func configuration() -> [DividerConfigurationSnapshotTests] {
        switch self {
        case .test1:
            return self.test1()
        case .test2:
            return self.test2()
        case .test3:
            return self.test3()
        case .test4:
            return self.test4()
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
    ///  - alignment: default
    ///  - axis: default
    ///  - intents: all
    ///  - content: default
    ///  - mode: all
    ///  - size: default
    private func test1() -> [DividerConfigurationSnapshotTests] {
        let intents = DividerIntent.allCases

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
    /// Description: To test all position
    ///
    /// Content:
    ///  - alignment: all
    ///  - axis: all
    ///  - intents: default
    ///  - content: default
    ///  - mode: default
    ///  - size: default
    private func test2() -> [DividerConfigurationSnapshotTests] {
        let alignments = DividerAlignment.allCases
        let axis = DividerAxis.allCases

        return alignments.flatMap { alignment in
            axis.map { axis in
                    .init(
                        scenario: self,
                        alignment: alignment,
                        axis: axis
                    )
            }
        }
    }

    /// Test 3
    ///
    /// Description: To test all contents
    ///
    /// Content:
    ///  - alignment: default
    ///  - axis: default
    ///  - intents: default
    ///  - content: all
    ///  - mode: default
    ///  - size: all
    private func test3() -> [DividerConfigurationSnapshotTests] {
        let contents = DividerContent.allCases

        return contents.map { content in
                .init(
                    scenario: self,
                    content: content,
                    modes: Constants.Modes.all
                )
        }
    }

    /// Test 4
    ///
    /// Description: To test all sizes
    ///
    /// Content:
    ///  - alignment: default
    ///  - axis: default
    ///  - intents: default
    ///  - content: default
    ///  - mode: default
    ///  - size: all
    private func test4() -> [DividerConfigurationSnapshotTests] {
        let contents = DividerContent.allCases

        return contents.map { content in
                .init(
                    scenario: self,
                    sizes: Constants.Sizes.all
                )
        }
    }

    // MARK: - Documentation

    // Used to generate screenshot for Documentation
    private func documentation() -> [DividerConfigurationSnapshotTests] {
        var items: [DividerConfigurationSnapshotTests] = []

        // Content
        items.append(contentsOf: DividerContent.allCases.map { content in
            DividerConfigurationSnapshotTests(
                scenario: self,
                content: content,
                documentationName: content.documentationName
            )
        })

        // Alignments
        let alignments: [(DividerAlignment, DividerAxis)] = [
            (.top, .vertical),
            (.trailing, .horizontal)
        ]
        items.append(contentsOf: alignments.map { alignment in
            DividerConfigurationSnapshotTests(
                scenario: self,
                alignment: alignment.0,
                axis: alignment.1,
                documentationName: "alignment_\(alignment.0)"
            )
        })

        // Axis
        items.append(contentsOf: DividerAxis.allCases.map { axis in
            DividerConfigurationSnapshotTests(
                scenario: self,
                alignment: .center,
                axis: axis,
                documentationName: "axis_\(axis)"
            )
        })

        // Intents
        items.append(contentsOf: DividerIntent.allCases.map { intent in
            DividerConfigurationSnapshotTests(
                scenario: self,
                intent: intent,
                documentationName: "intent_\(intent)"
            )
        })

        return items
    }
}
