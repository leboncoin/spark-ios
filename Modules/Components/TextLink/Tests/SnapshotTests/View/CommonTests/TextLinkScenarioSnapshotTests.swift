//
//  TextLinkScenarioSnapshotTests.swift
//  SparkComponentTextLinkSnapshotTests
//
//  Created by robin.lemaire on 28/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

@testable import SparkComponentTextLink
@_spi(SI_SPI) import SparkComponentTextLinkTesting
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonSnapshotTesting
@_spi(SI_SPI) import SparkCommonTesting
import SparkTheme
import UIKit
import SwiftUI

enum TextLinkScenarioSnapshotTests: String, CaseIterable {
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

    func configuration() -> [TextLinkConfigurationSnapshotTests] {
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
    /// Description: To test all intents
    ///
    /// Content:
    ///  - intent: all
    ///  - alignment: default
    ///  - typography: default
    ///  - variant: default
    ///  - text: default
    ///  - isImage: default
    ///  - highlightRange: default
    ///  - numberOfLine: default
    ///  - textAlignment: default
    ///  - mode: default
    ///  - size: all
    private func test1() -> [TextLinkConfigurationSnapshotTests] {
        let intents = TextLinkTestingIntent.allCases

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
    /// Description: To test all alignments
    ///
    /// Content:
    ///  - intent: default
    ///  - alignment: all
    ///  - typography: default
    ///  - variant: default
    ///  - text: default
    ///  - isImage: default
    ///  - highlightRange: default
    ///  - numberOfLine: default
    ///  - textAlignment: default
    ///  - mode: default
    ///  - size: default
    private func test2() -> [TextLinkConfigurationSnapshotTests] {
        let alignments = TextLinkAlignment.allCases

        return alignments.map { alignment in
                .init(
                    scenario: self,
                    alignment: alignment
                )
        }
    }

    /// Test 3
    ///
    /// Description: To test all typographies
    ///
    /// Content:
    ///  - intent: default
    ///  - alignment: default
    ///  - typography: all
    ///  - variant: default
    ///  - text: default
    ///  - isImage: default
    ///  - highlightRange: default
    ///  - numberOfLine: default
    ///  - textAlignment: default
    ///  - mode: default
    ///  - size: default
    private func test3() -> [TextLinkConfigurationSnapshotTests] {
        let typographies = TextLinkTypography.allCases

        return typographies.map { typography in
                .init(
                    scenario: self,
                    typography: typography
                )
        }
    }

    /// Test 4
    ///
    /// Description: To test all variants for all texts
    ///
    /// Content:
    ///  - intent: default
    ///  - alignment: default
    ///  - typography: default
    ///  - variant: all
    ///  - text: all
    ///  - isImage: default
    ///  - highlightRange: all
    ///  - numberOfLine: default
    ///  - textAlignment: default
    ///  - mode: default
    ///  - size: default
    private func test4() -> [TextLinkConfigurationSnapshotTests] {
        let variants = TextLinkVariant.allCases
        let texts = TextLinkText.allCases
        let isRanges = Bool.allCases

        return variants.flatMap { variant in
            texts.flatMap { text in
                isRanges.map { isRange in
                        .init(
                            scenario: self,
                            variant: variant,
                            text: text,
                            isRange: isRange
                        )
                }
            }
        }
    }

    /// Test 5
    ///
    /// Description: To test images
    ///
    /// Content:
    ///  - intent: default
    ///  - alignment: default
    ///  - typography: default
    ///  - variant: default
    ///  - text: all
    ///  - isImage: all
    ///  - highlightRange: default
    ///  - numberOfLine: default
    ///  - textAlignment: default
    ///  - mode: default
    ///  - size: default
    private func test5() -> [TextLinkConfigurationSnapshotTests] {
        let isImages = Bool.allCases
        let texts = TextLinkText.allCases

        return isImages.flatMap { isImage in
            texts.map { text in
                    .init(
                        scenario: self,
                        text: text,
                        isImage: isImage
                    )
            }
        }
    }

    /// Test 6
    ///
    /// Description: To test text style
    ///
    /// Content:
    ///  - intent: default
    ///  - alignment: default
    ///  - typography: default
    ///  - variant: default
    ///  - text: all
    ///  - isImage: all
    ///  - highlightRange: default
    ///  - numberOfLine: 0 & 1
    ///  - textAlignment: all
    ///  - mode: default
    ///  - size: default
    private func test6() -> [TextLinkConfigurationSnapshotTests] {
        var items = [TextLinkConfigurationSnapshotTests]()

        let lines = Bool.allCases
        items.append(contentsOf: lines.map { line in
                .init(
                    scenario: self,
                    text: .sentence,
                    singleLine: line
                )
        })

        let textAlignments = TextLinkTextAlignment.allCases
        items.append(contentsOf: textAlignments.map { textAlignment in
                .init(
                    scenario: self,
                    text: .sentence,
                    textAlignment: textAlignment
                )
        })

        return items
    }

    // MARK: - Documentation

    // Used to generate screenshot for Documentation
    private func documentation() -> [TextLinkConfigurationSnapshotTests] {
        var items: [TextLinkConfigurationSnapshotTests] = []

        // Images
        let isImages = Bool.allCases
        items.append(contentsOf: isImages.map { isImage in
                .init(
                    scenario: self,
                    isImage: isImage,
                    documentationName: "_\(isImage ? "with" : "without")_image"
                )
        })

        // Long Text
        items.append(
            .init(
                scenario: self,
                text: .sentence,
                singleLine: false,
                textAlignment: .leading,
                documentationName: "_with_long_text"
            )
        )

        return items
    }
}
