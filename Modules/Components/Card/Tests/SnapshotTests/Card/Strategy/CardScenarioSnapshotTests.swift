//
//  CardScenarioSnapshotTests.swift
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

enum CardScenarioSnapshotTests: String, CaseIterable {
    case test1
    case test2
    case test3
    case test4
    case test5
    case test6
    case test7
    case test8
    case documentation

    // MARK: - Type Alias

    typealias Constants = ComponentSnapshotTestConstants

    // MARK: - Properties

    static var uiKitAllCases: [Self] = Self.allCases.filter { $0 != .test6 }

    var isDocumentation: Bool {
        self == .documentation
    }

    // MARK: - Configurations

    func configuration() -> [CardConfigurationSnapshotTests] {
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
        case .test7:
            return self.test7()
        case .test8:
            return self.test8()
        case .documentation:
            return self.documentation()
        }
    }

    // MARK: - Scenarios

    /// Test 1
    ///
    /// Description: Test all intent
    ///
    private func test1() -> [CardConfigurationSnapshotTests] {
        let intents = CardIntent.allCases

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
    /// Description: Test all variant
    ///
    private func test2() -> [CardConfigurationSnapshotTests] {
        let variants = CardVariant.allCases

        return variants.map { variant in
            .init(
                scenario: self,
                intent: .main,
                variant: variant
            )
        }
    }

    /// Test 3
    ///
    /// Description: Test all padding for all header position.
    ///
    private func test3() -> [CardConfigurationSnapshotTests] {
        let paddings = CardPadding.allCases
        let headerPositions = CardHeaderPosition.allCases

        return paddings.flatMap { padding in
            headerPositions.map { headerPosition in
                    .init(
                        scenario: self,
                        padding: padding,
                        headerPosition: headerPosition,
                        headerContentType: .native
                    )
            }
        }
    }

    /// Test 4
    ///
    /// Description: Test all isHighlighted
    ///
    private func test4() -> [CardConfigurationSnapshotTests] {
        let variants = CardVariant.allCases
        let isHighlighted = Bool.allCases

        return variants.flatMap { variant in
            isHighlighted.map { isHighlighted in
                    .init(
                        scenario: self,
                        isHighlighted: isHighlighted,
                        variant: variant
                    )
            }
        }
    }

    /// Test 5
    ///
    /// Description: Test with isDisabled
    ///
    private func test5() -> [CardConfigurationSnapshotTests] {
        let isDisabled = Bool.allCases

        return isDisabled.map { isDisabled in
                .init(
                    scenario: self,
                    intent: .main,
                    isDisabled: isDisabled
                )
        }
    }

    /// Test 6
    ///
    /// Description: Test with elevation
    ///
    private func test6() -> [CardConfigurationSnapshotTests] {
        let isElevation = Bool.allCases

        return isElevation.map { isElevation in
                .init(
                    scenario: self,
                    isElevation: isElevation
                )
        }
    }

    /// Test 7
    ///
    /// Description: Test headers. **SwiftUI only**
    ///
    private func test7() -> [CardConfigurationSnapshotTests] {
        let positions = CardHeaderPosition.allCases
        let types = CardHeaderContentType.allCases
        let variants = CardVariant.allCases

        return positions.flatMap { position in
            types.flatMap { type in
                variants.map { variant in
                        .init(
                            scenario: self,
                            padding: .allAndBottomHeader,
                            variant: variant,
                            headerPosition: position,
                            headerContentType: type
                        )
                }
            }
        }
    }

    /// Test 8
    ///
    /// Description: Test all A11Y size
    ///
    private func test8() -> [CardConfigurationSnapshotTests] {
        return [
            .init(
                scenario: self,
                sizes: Constants.Sizes.all
            )
        ]
    }

    // MARK: - Documentation

    // Used to generate screenshot for Documentation
    private func documentation() -> [CardConfigurationSnapshotTests] {
        var items: [CardConfigurationSnapshotTests] = []

        // Classic
        items.append(.init(
            scenario: self,
            documentationName: "classic"
        ))

        // Highlighted
        items.append(.init(
            scenario: self,
            isHighlighted: true,
            documentationName: "with_highlight"
        ))

        // Headers
        let positions = CardHeaderPosition.allCases
        items.append(contentsOf: positions.map { position in
                .init(
                scenario: self,
                headerPosition: position,
                headerContentType: .native,
                documentationName: "with_\(position)_header"
            )
        })

        return items
    }
}
