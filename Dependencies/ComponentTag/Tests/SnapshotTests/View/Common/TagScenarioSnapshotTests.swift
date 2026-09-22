//
//  TagScenarioSnapshotTests.swift
//  SparkComponentTagSnapshotTests
//
//  Created by robin.lemaire on 10/10/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

@testable import SparkComponentTag
import UIKit
import SwiftUI
@_spi(SI_SPI) import SparkCommonSnapshotTesting
@_spi(SI_SPI) import SparkCommonTesting

enum TagScenarioSnapshotTests: String, CaseIterable {
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

    func configuration(isSwiftUIComponent: Bool) -> [TagConfigurationSnapshotTests] {
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
    private func test1() -> [TagConfigurationSnapshotTests] {
        let intents = TagIntent.allCases

        return intents.map {
            .init(
                scenario: self,
                intent: $0,
                modes: Constants.Modes.all
            )
        }
    }

    /// Test 2
    ///
    /// Description: To test all size & isHighlighted
    ///
    private func test2() -> [TagConfigurationSnapshotTests] {
        let sizes = TagSize.allCases
        let isHighlighteds = Bool.allCases

        return sizes.flatMap { size in
            isHighlighteds.map { isHighlighted in
                    .init(
                        scenario: self,
                        size: size,
                        isHighlighted: isHighlighted,
                        isIcon: false,
                        modes: Constants.Modes.all
                    )
            }
        }
    }

    /// Test 2
    ///
    /// Description: To test all variants & isHighlighted
    ///
    private func test3() -> [TagConfigurationSnapshotTests] {
        let variants = TagVariant.allCases
        let isHighlighteds = Bool.allCases

        return variants.flatMap { variant in
            isHighlighteds.map { isHighlighted in
                    .init(
                        scenario: self,
                        size: .large,
                        variant: variant,
                        isHighlighted: isHighlighted,
                        content: .label,
                        modes: Constants.Modes.all
                    )
            }
        }
    }

    /// Test 3
    ///
    /// Description: To test all color for filled variant
    ///
    private func test4() -> [TagConfigurationSnapshotTests] {
        let intents = TagIntent.allCases

        return intents.map {
            .init(
                scenario: self,
                intent: $0,
                variant: .filled
            )
        }
    }

    /// Test 4
    ///
    /// Description: To test content resilience
    ///
    private func test5() -> [TagConfigurationSnapshotTests] {
        let contents = TagContentResilience.allCases
        let isIcons = Bool.allCases

        return contents.flatMap { content in
            isIcons.map { isIcon in
                guard isIcon || content.text != nil || content == .other else {
                    return nil
                }

                return .init(
                    scenario: self,
                    content: content,
                    isIcon: isIcon
                )
            }
            .compactMap { $0 }
        }
    }

    /// Test 6
    ///
    /// Description: To test a11y sizes
    ///
    private func test6() -> [TagConfigurationSnapshotTests] {
        return [
            .init(
                scenario: self,
                sizes: Constants.Sizes.all
            )
        ]
    }

    // MARK: - Documentation

    // Used to generate screenshot for Documentation
    private func documentation() -> [TagConfigurationSnapshotTests] {
        var items: [TagConfigurationSnapshotTests] = []

        // Icon only
        items.append(.init(
            scenario: self,
            content: .withoutLabel,
            isIcon: true,
            documentationName: "with_icon"
        ))

        // Is highlighted
        items.append(.init(
            scenario: self,
            size: .large,
            isHighlighted: true,
            documentationName: "with_is_highlighted"
        ))

        // Label
        items.append(.init(
            scenario: self,
            content: .other,
            isIcon: false,
            documentationName: "with_label"
        ))

        // Label and icon
        items.append(.init(
            scenario: self,
            content: .other,
            isIcon: true,
            documentationName: "with_label_and_icon"
        ))

        // Text
        items.append(.init(
            scenario: self,
            content: .label,
            isIcon: false,
            documentationName: "with_text"
        ))

        // Text and icon
        items.append(.init(
            scenario: self,
            content: .label,
            isIcon: true,
            documentationName: "with_text_and_icon"
        ))

        return items
    }
}
