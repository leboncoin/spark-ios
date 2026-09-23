//
//  ChipScenarioSnapshotTests.swift
//  SparkComponentChipSnapshotTests
//
//  Created by robin.lemaire on 02/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

@testable import SparkComponentChip
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonSnapshotTesting
@_spi(SI_SPI) import SparkCommonTesting
import SparkTheme
import UIKit
import SwiftUI

enum ChipScenarioSnapshotTests: String, CaseIterable {
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

    func configuration() -> [ChipConfigurationSnapshotTests] {
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
    /// Description: To test all intents & variants & isSelected
    ///
    private func test1() -> [ChipConfigurationSnapshotTests] {
        let intents = ChipIntent.allCases
        let variants = ChipVariant.allCases
        let areSelected = Bool.allCases

        return intents.flatMap { intent in
            variants.flatMap { variant in
                areSelected.map { isSelected in
                        .init(
                            scenario: self,
                            intent: intent,
                            variant: variant,
                            isIcon: true,
                            isSelected: isSelected,
                            modes: Constants.Modes.all
                        )
                }
            }
        }
    }

    /// Test 2
    ///
    /// Description: To test all alignments & badge
    ///
    private func test2() -> [ChipConfigurationSnapshotTests] {
        let alignments = ChipAlignment.allCases
        let areBadge = Bool.allCases

        return alignments.flatMap { alignment in
            areBadge.map { isBadge in
                    .init(
                        scenario: self,
                        alignment: alignment,
                        isIcon: true,
                        isBadge: isBadge
                    )
            }
        }
    }

    /// Test 3
    ///
    /// Description: To test content
    ///
    private func test3() -> [ChipConfigurationSnapshotTests] {
        let labels = ChipLabel.allCases
        let areIcon = Bool.allCases
        let areBadge = Bool.allCases

        return labels.flatMap { label in
            areIcon.flatMap { isIcon in
                areBadge.compactMap { isBadge in

                    if label == .withoutText && !isIcon && !isBadge {
                        nil
                    } else {
                        .init(
                            scenario: self,
                            label: label,
                            isIcon: isIcon,
                            isBadge: isBadge
                        )
                    }
                }
            }
        }
    }

    /// Test 4
    ///
    /// Description: To test is disabled
    ///
    private func test4() -> [ChipConfigurationSnapshotTests] {
        return [
            .init(
                scenario: self,
                isIcon: true,
                isBadge: true,
                isDisabled: true
            )
        ]
    }

    /// Test 5
    ///
    /// Description: To test a11y sizes
    ///
    private func test5() -> [ChipConfigurationSnapshotTests] {
        return [
            .init(
                scenario: self,
                isIcon: true,
                sizes: Constants.Sizes.all
            )
        ]
    }

    /// Test 6
    ///
    /// Description: To test all chip sizes
    ///
    private func test6() -> [ChipConfigurationSnapshotTests] {
        let sizes = ChipSize.allCases

        return sizes.map { size in
            .init(
                scenario: self,
                size: size,
                isIcon: true
            )
        }
    }

    // MARK: - Documentation

    // Used to generate screenshot for Documentation
    private func documentation() -> [ChipConfigurationSnapshotTests] {
        var items: [ChipConfigurationSnapshotTests] = []

        // Text only
        let labels = ChipLabel.allCases.filter { $0 != .withoutText }
        items.append(contentsOf: labels.map { label in
            ChipConfigurationSnapshotTests(
                scenario: self,
                label: label,
                documentationName: "with_\(label.documentationName)"
            )
        })

        // Icon
        items.append(.init(
            scenario: self,
            label: .withoutText,
            isIcon: true,
            documentationName: "with_icon"
        ))

        // Icon & Badge
        items.append(.init(
            scenario: self,
            label: .withoutText,
            isIcon: true,
            isBadge: true,
            documentationName: "with_icon_and_extra_content"
        ))

        // Text & Icons
        items.append(.init(
            scenario: self,
            label: .text,
            isIcon: true,
            documentationName: "with_text_and_icon"
        ))

        // All contents
        items.append(.init(
            scenario: self,
            isIcon: true,
            isBadge: true,
            documentationName: "with_text_and_icon_and_extra_content"
        ))

        // Selected
        items.append(.init(
            scenario: self,
            isIcon: true,
            isBadge: true,
            isSelected: true,
            documentationName: "selected"
        ))

        // Disabled
        items.append(.init(
            scenario: self,
            isIcon: true,
            isBadge: true,
            isDisabled: true,
            documentationName: "disabled"
        ))

        // Sizes
        let sizes = ChipSize.allCases
        items.append(contentsOf: sizes.map { size in
            ChipConfigurationSnapshotTests(
                scenario: self,
                size: size,
                isIcon: true,
                documentationName: "with_size_\(size)"
            )
        })

        return items
    }
}
