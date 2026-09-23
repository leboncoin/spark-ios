//
//  SnackbarScenario.swift
//  SparkComponentSnackbarSnapshotTests
//
//  Created by robin.lemaire on 18/05/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentSnackbar
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonSnapshotTesting
@_spi(SI_SPI) import SparkCommonTesting
import SparkTheme
import UIKit
import SwiftUI

enum SnackbarScenario: String, CaseIterable {
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

    func configuration() -> [SnackbarScenarioConfiguration] {
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

    /// **Test 1**
    ///
    /// Description: To test all intents for all modes.
    ///
    private func test1() -> [SnackbarScenarioConfiguration] {
        let intents = SnackbarIntent.allCases

        return intents.map { intent in
            .init(
                scenario: self,
                intent: intent,
                hasButton: true,
                hasIcon: true,
                modes: Constants.Modes.all
            )
        }
    }

    /// **Test 2**
    ///
    /// Description: To test all alignments for all sizes.
    ///
    private func test2() -> [SnackbarScenarioConfiguration] {
        let alignments = SnackbarAlignment.allCases

        return alignments.map { alignment in
            .init(
                scenario: self,
                alignment: alignment,
                hasButton: true,
                hasIcon: true,
                sizes: Constants.Sizes.all
            )
        }
    }

    /// **Test 3**
    ///
    /// Description: To test all title content types.
    ///
    private func test3() -> [SnackbarScenarioConfiguration] {
        let titleContents = SnackbarTitleContent.allCases

        return titleContents.map { titleContent in
            .init(
                scenario: self,
                titleContent: titleContent
            )
        }
    }

    /// **Test 4**
    ///
    /// Description: To test all description content types.
    ///
    private func test4() -> [SnackbarScenarioConfiguration] {
        let descriptionContents = SnackbarDescriptionContent.allCases

        return descriptionContents.map { descriptionContent in
            .init(
                scenario: self,
                descriptionContent: descriptionContent
            )
        }
    }

    /// **Test 5**
    ///
    /// Description: To test with and without button.
    ///
    private func test5() -> [SnackbarScenarioConfiguration] {
        let hasButtons = Bool.allCases

        return hasButtons.map { hasButton in
            .init(
                scenario: self,
                hasButton: hasButton,
                hasIcon: true
            )
        }
    }

    /// **Test 6**
    ///
    /// Description: To test with and without icon.
    ///
    private func test6() -> [SnackbarScenarioConfiguration] {
        let hasIcons = Bool.allCases

        return hasIcons.map { hasIcon in
            .init(
                scenario: self,
                hasButton: true,
                hasIcon: hasIcon
            )
        }
    }

    // MARK: - Documentation

    // Used to generate screenshot for Documentation
    private func documentation() -> [SnackbarScenarioConfiguration] {
        return [
            SnackbarScenarioConfiguration(
                scenario: self,
                intent: .info,
                alignment: .vertical,
                hasButton: true,
                hasIcon: true,
                documentationName: "full"
            )
        ]
    }
}
