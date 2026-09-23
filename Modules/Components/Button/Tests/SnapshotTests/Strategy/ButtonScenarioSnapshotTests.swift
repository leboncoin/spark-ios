//
//  ButtonScenarioSnapshotTests.swift
//  SparkComponentButtonSnapshotTests
//
//  Created by robin.lemaire on 17/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentButton
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonSnapshotTesting
@_spi(SI_SPI) import SparkCommonTesting
import SparkTheme
import UIKit
import SwiftUI

enum ButtonScenarioSnapshotTests: String, CaseIterable {
    case testIntents
    case testVariants
    case testSizes
    case testAlignments
    case testContents
    case testContentVisibility
    case testInfiniteWidth
    case testDisabled
    case testNoStyle
    case testA11ySizes
    case testShapesA11ySizes
    case testAppearances
    case documentation

    // MARK: - Type Alias

    typealias Constants = ComponentSnapshotTestConstants

    // MARK: - Properties

    var isDocumentation: Bool {
        self == .documentation
    }

    // MARK: - Configurations

    func configuration() -> [ButtonConfigurationSnapshotTests] {
        return switch self {
        case .testIntents: self.testIntents()
        case .testVariants: self.testVariants()
        case .testSizes: self.testSizes()
        case .testAlignments: self.testAlignments()
        case .testContents: self.testContents()
        case .testContentVisibility: self.testContentVisibility()
        case .testInfiniteWidth: self.testInfiniteWidth()
        case .testDisabled: self.testDisabled()
        case .testNoStyle: self.testNoStyle()
        case .testA11ySizes: self.testA11ySizes()
        case .testShapesA11ySizes: self.testShapesA11ySizes()
        case .testAppearances: self.testAppearances()
        case .documentation: self.documentation()
        }
    }

    // MARK: - Scenarios

    /// Test intents
    ///
    /// Description: Tests all intents
    ///
    private func testIntents() -> [ButtonConfigurationSnapshotTests] {
        let intents = ButtonIntent.allCases

        return intents.map { intent in
            .init(
                scenario: self,
                intent: intent,
                modes: Constants.Modes.all
            )
        }
    }

    /// Test variants
    ///
    /// Description: Tests all variants
    ///
    private func testVariants() -> [ButtonConfigurationSnapshotTests] {
        let variants = ButtonVariant.allCases

        return variants.map { variant in
            .init(
                scenario: self,
                variant: variant
            )
        }
    }

    /// Test sizes
    ///
    /// Description: Tests all sizes
    ///
    private func testSizes() -> [ButtonConfigurationSnapshotTests] {
        let sizes = ButtonSize.allCases

        return sizes.map { size in
            .init(
                scenario: self,
                size: size
            )
        }
    }

    /// Test alignments
    ///
    /// Description: Tests all alignments
    ///
    private func testAlignments() -> [ButtonConfigurationSnapshotTests] {
        let alignments = ButtonAlignment.allCases

        return alignments.map { alignment in
            .init(
                scenario: self,
                alignment: alignment
            )
        }
    }

    /// Test contents
    ///
    /// Description: Tests all contents
    ///
    private func testContents() -> [ButtonConfigurationSnapshotTests] {
        let titleContentTypes = ButtonContentType.allCases
        let iconContentTypes = ButtonContentType.allCases

        return titleContentTypes.flatMap { titleContentType in
            iconContentTypes.compactMap { iconContentType in
                guard !(titleContentType == .none && iconContentType == .none) else {
                    return nil
                }

                return .init(
                    scenario: self,
                    titleType: titleContentType,
                    iconType: iconContentType
                )
            }
        }
    }

    /// Test content visibility
    ///
    /// Description: Tests all content visibility
    ///
    private func testContentVisibility() -> [ButtonConfigurationSnapshotTests] {
        let contentVisibilities = ButtonContentVisibility.allCases

        return contentVisibilities.map { contentVisibility in
            .init(
                scenario: self,
                contentVisibility: contentVisibility
            )
        }
    }

    /// Test infinite width
    ///
    /// Description: Tests infinite width
    ///
    private func testInfiniteWidth() -> [ButtonConfigurationSnapshotTests] {
        let isInfiniteWidths = Bool.allCases

        return isInfiniteWidths.map { isInfiniteWidth in
            .init(
                scenario: self,
                isInfiniteWidth: isInfiniteWidth
            )
        }
    }

    /// Test disabled
    ///
    /// Description: Tests disabled state
    ///
    private func testDisabled() -> [ButtonConfigurationSnapshotTests] {
        return [
            .init(
                scenario: self,
                isDisabled: true
            )
        ]
    }

    /// Test no style
    ///
    /// Description: Tests no style
    ///
    private func testNoStyle() -> [ButtonConfigurationSnapshotTests] {
        return [
            .init(
                scenario: self,
                removeStyles: true
            )
        ]
    }

    /// Test A11y sizes
    ///
    /// Description: Tests a11y sizes
    ///
    private func testA11ySizes() -> [ButtonConfigurationSnapshotTests] {
        return [
            .init(
                scenario: self,
                sizes: Constants.Sizes.all
            )
        ]
    }

    /// Test shapes A11y sizes
    ///
    /// Description: Tests all shapes for all a11y sizes
    ///
    private func testShapesA11ySizes() -> [ButtonConfigurationSnapshotTests] {
        let shapes = ButtonShape.allCases

        return shapes.map { shape -> ButtonConfigurationSnapshotTests in
                .init(
                    scenario: self,
                    shape: shape,
                    sizes: Constants.Sizes.all
                )
        }
    }

    /// Test appearances
    ///
    /// Description: Tests all appearances
    ///
    private func testAppearances() -> [ButtonConfigurationSnapshotTests] {
        let appearances = ButtonAppearance.allCases

        return appearances.map { appearance in
            .init(
                scenario: self,
                appearance: appearance,
                modes: Constants.Modes.all
            )
        }
    }

    // MARK: - Documentation

    // Used to generate screenshot for Documentation
    private func documentation() -> [ButtonConfigurationSnapshotTests] {
        var items: [ButtonConfigurationSnapshotTests] = []

        // Only icon
        items.append(.init(
            scenario: self,
            titleType: .none,
            documentationName: "icon"
        ))

        // Only title
        items.append(.init(
            scenario: self,
            iconType: .none,
            documentationName: "title"
        ))

        // All
        items.append(.init(
            scenario: self,
            documentationName: "all"
        ))

        return items
    }
}
