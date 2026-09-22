//
//  AwarenessCardScenarioSnapshotTests.swift
//  SparkComponentCardSnapshotTests
//
//  Created by robin.lemaire on 01/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

@testable import SparkComponentCard
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonSnapshotTesting
@_spi(SI_SPI) import SparkCommonTesting
import SparkTheme
import UIKit
import SwiftUI

enum AwarenessCardScenarioSnapshotTests: String, CaseIterable {
    case test1
    case test2
    case test3
    case test4
    case test5
    case documentation

    // MARK: - Type Alias

    typealias Constants = ComponentSnapshotTestConstants

    // MARK: - Properties

    var isDocumentation: Bool {
        self == .documentation
    }

    // MARK: - Configurations

    func configuration() -> [AwarenessCardConfigurationSnapshotTests] {
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

    // MARK: - Scenarios

    /// Test 1
    ///
    /// Description: Test all intent
    ///
    private func test1() -> [AwarenessCardConfigurationSnapshotTests] {
        let intents = CardIntent.allCases

        return intents.map { intent in
                .init(
                    scenario: self,
                    intent: intent
                )
        }
    }

    /// Test 2
    ///
    /// Description: Test subviews
    ///
    private func test2() -> [AwarenessCardConfigurationSnapshotTests] {
        let contents = AwarenessCardCardContent.allCases
        let areIcons = Bool.allCases
        let areActions = Bool.allCases

        return contents.flatMap { content in
            areIcons.flatMap { isIcon in
                areActions.map { isAction in
                        .init(
                            scenario: self,
                            content: content,
                            isIcon: isIcon,
                            isAction: isAction
                        )
                }
            }
        }
    }

    /// Test 3
    ///
    /// Description: Test all content types
    ///
    private func test3() -> [AwarenessCardConfigurationSnapshotTests] {
        let contentTypes = AwarenessCardCardContentType.allCases

        return contentTypes.map { contentType in
                .init(
                    scenario: self,
                    content: .all,
                    contentType: contentType
                )
        }
    }

    /// Test 4
    ///
    /// Description: Test sizes with all subviews
    ///
    private func test4() -> [AwarenessCardConfigurationSnapshotTests] {
        return [
            .init(
                scenario: self,
                content: .all,
                isIcon: true,
                isAction: true,
                sizes: Constants.Sizes.all
            )
        ]
    }

    /// Test 5
    ///
    /// Description: Test all modes
    ///
    private func test5() -> [AwarenessCardConfigurationSnapshotTests] {
        return [
            .init(
                scenario: self,
                content: .all,
                modes: Constants.Modes.all
            )
        ]
    }

    // MARK: - Documentation

    // Used to generate screenshot for Documentation
    private func documentation() -> [AwarenessCardConfigurationSnapshotTests] {
        return [
            .init(
                scenario: self,
                content: .all,
                isAction: true,
                documentationName: "classic"
            )
        ]
    }
}
