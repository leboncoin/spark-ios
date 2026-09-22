//
//  BadgeScenarioSnapshotTests.swift
//  SparkComponentBadgeSnapshotTests
//
//  Created by robin.lemaire on 24/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

@testable import SparkComponentBadge
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonSnapshotTesting
@_spi(SI_SPI) import SparkCommonTesting
import SparkTheme
import UIKit
import SwiftUI

enum BadgeScenarioSnapshotTests: String, CaseIterable {
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

    func configuration() -> [BadgeConfigurationSnapshotTests] {
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
    ///  - intents: all
    ///  - size: default
    ///  - content: default
    ///  - isBorder: default
    ///  - mode: all
    ///  - size: default
    private func test1() -> [BadgeConfigurationSnapshotTests] {
        let intents = BadgeIntent.allCases

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
    /// Description: To test all sizes + content + isBorder
    ///
    /// Content:
    ///  - intents: default
    ///  - size: all
    ///  - content: all
    ///  - isBorder: all
    ///  - mode: default
    ///  - size: default
    private func test2() -> [BadgeConfigurationSnapshotTests] {
        let sizes = BadgeSize.allCases
        let contents = BadgeContent.allCases
        let isBorders = Bool.allCases

        return sizes.flatMap { size in
            contents.flatMap { content in
                isBorders.map { isBorder in
                        .init(
                            scenario: self,
                            size: size,
                            content: content,
                            isBorder: isBorder
                        )
                }
            }
        }
    }

    /// Test 3
    ///
    /// Description: To test a11y sizes
    ///
    /// Content:
    ///  - intents: default
    ///  - size: all
    ///  - content: value + withoutValue
    ///  - isBorder: default
    ///  - mode: default
    ///  - size: all
    private func test3() -> [BadgeConfigurationSnapshotTests] {
        let sizes = BadgeSize.allCases

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
    /// Description: To test attach
    ///
    /// Content:
    ///  - attachPosition: all
    private func test4() -> [BadgeConfigurationSnapshotTests] {
        let positions = BadgePosition.allCases

        return positions.map { position in
                .init(
                    scenario: self,
                    attachPosition: position
                )
        }
    }

    // MARK: - Documentation

    // Used to generate screenshot for Documentation
    private func documentation() -> [BadgeConfigurationSnapshotTests] {
        var items: [BadgeConfigurationSnapshotTests] = []

        // Without Value
        for size in BadgeSize.allCases {
            let content: BadgeContent = .withoutValue
            items.append(.init(
                scenario: self,
                size: size,
                content: content,
                isBorder: false,
                documentationName: "\(content.documentationName)_\(size)"
            ))
        }

        // Value
        for size in BadgeSize.allCases {
            let content: BadgeContent = .value
            items.append(.init(
                scenario: self,
                size: size,
                content: .value,
                isBorder: false,
                documentationName: "\(content.documentationName)_\(size)"
            ))
        }

        // Value + Unit
        let valueUnitContent: BadgeContent = .valueAndUnit
        items.append(.init(
            scenario: self,
            content: valueUnitContent,
            isBorder: false,
            documentationName: "\(valueUnitContent.documentationName)"
        ))

        // Attach
        for position in BadgePosition.allCases {
            let content: BadgeContent = .value
            items.append(.init(
                scenario: self,
                content: content,
                isBorder: false,
                attachPosition: position,
                documentationName: "\(content.documentationName)_attach_\(position)"
            ))
        }

        return items
    }
}
