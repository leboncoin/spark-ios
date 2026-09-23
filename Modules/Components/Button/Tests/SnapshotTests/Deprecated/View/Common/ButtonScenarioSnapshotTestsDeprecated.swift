//
//  ButtonScenarioSnapshotTestsDeprecated.swift
//  SparkComponentButtonSnapshotTests
//
//  Created by robin.lemaire on 30/11/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

// MARK: - Deprecated

/// This file is deprecated and should not be used for new tests.

@testable import SparkComponentButton
@_spi(SI_SPI) import SparkCommonSnapshotTesting
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonTesting
import UIKit
import SwiftUI

enum ButtonScenarioSnapshotTestsDeprecated: String, CaseIterable {
    case test1
    case test2
    case test3
    case test4
    case test5
    case test6
    case test7
    case test8

    // MARK: - Type Alias

    typealias Constants = ComponentSnapshotTestConstants

    // MARK: - Configurations

    func configuration(isSwiftUIComponent: Bool) throws -> [ButtonConfigurationSnapshotTestsDeprecated] {
        switch self {
        case .test1:
            return self.test1()
        case .test2:
            return self.test2(isSwiftUIComponent: isSwiftUIComponent)
        case .test3:
            return self.test3()
        case .test4:
            return self.test4()
        case .test5:
            return self.test5(isSwiftUIComponent: isSwiftUIComponent)
        case .test6:
            return self.test6(isSwiftUIComponent: isSwiftUIComponent)
        case .test7:
            return self.test7()
        case .test8:
            return self.test8()
        }
    }

    // MARK: - Scenarios

    /// Test 1
    ///
    /// Description: To test all intents
    ///
    /// Content:
    /// - **intents: all**
    /// - alignment: default
    /// - size: default
    /// - variant: default
    /// - content: default
    /// - state: default
    /// - mode: all
    /// - a11y: default
    private func test1() -> [ButtonConfigurationSnapshotTestsDeprecated] {
        let intents = ButtonIntent.allCases

        return intents.map { intent -> ButtonConfigurationSnapshotTestsDeprecated in
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
    /// - intent: default
    /// - **alignments: all**
    /// - size: default
    /// - variant: default
    /// - content: default
    /// - state: default
    /// - mode: default
    /// - a11y: default
    private func test2(isSwiftUIComponent: Bool) -> [ButtonConfigurationSnapshotTestsDeprecated] {
        let alignments = ButtonAlignment.allCases

        return alignments.map { alignment -> ButtonConfigurationSnapshotTestsDeprecated in
                .init(
                    scenario: self,
                    alignment: alignment,
                    content: .titleAndImage(
                        "My Title",
                        .mock(isSwiftUIComponent: isSwiftUIComponent)
                    )
                )
        }
    }

    /// Test 3
    ///
    /// Description: To test all sizes for all a11y sizes
    ///
    /// Content:
    /// - intent: default
    /// - alignment: default
    /// - **sizes: all**
    /// - variant: default
    /// - content: default
    /// - state: default
    /// - mode: default
    /// - **a11y: all**
    private func test3() -> [ButtonConfigurationSnapshotTestsDeprecated] {
        let sizes = ButtonSize.allCases

        return sizes.map { size -> ButtonConfigurationSnapshotTestsDeprecated in
                .init(
                    scenario: self,
                    size: size,
                    sizes: Constants.Sizes.all
                )
        }
    }

    /// Test 4
    ///
    /// Description: To test all variants
    ///
    /// Content:
    /// - intent: default
    /// - alignment: default
    /// - size: default
    /// - **variants: all**
    /// - content: default
    /// - state: default
    /// - mode: default
    /// - a11y: default
    private func test4() -> [ButtonConfigurationSnapshotTestsDeprecated] {
        let variants = ButtonVariant.allCases

        return variants.map { variant -> ButtonConfigurationSnapshotTestsDeprecated in
                .init(
                    scenario: self,
                    variant: variant
                )
        }
    }

    /// Test 5
    ///
    /// Description: To test all contents
    ///
    /// Content:
    /// - intent: default
    /// - alignment: default
    /// - size: default
    /// - variants: default
    /// - **contents: all**
    /// - state: default
    /// - mode: default
    /// - a11y: default
    private func test5(isSwiftUIComponent: Bool) -> [ButtonConfigurationSnapshotTestsDeprecated] {
        let contents = ButtonContentTypeDeprecated.allCases(isSwiftUIComponent: isSwiftUIComponent)

        return contents.map { content -> ButtonConfigurationSnapshotTestsDeprecated in
                .init(
                    scenario: self,
                    content: content
                )
        }
    }

    /// Test 6
    ///
    /// Description: To test all states
    ///
    /// Content:
    /// - intent: default
    /// - alignment: default
    /// - size: default
    /// - variant: default
    /// - content: default
    /// - **states: all**
    /// - mode: default
    /// - a11y: default
    private func test6(isSwiftUIComponent: Bool) -> [ButtonConfigurationSnapshotTestsDeprecated] {
        let states = ControlState.allCases

        return states.compactMap { state -> ButtonConfigurationSnapshotTestsDeprecated? in

            let title: String?
            switch state {
            case .normal:
                title = "Normal"
            case .highlighted:
                // We can't test highlighted for SwiftUI
                title = isSwiftUIComponent ? nil : "Highlighted"
            case .disabled:
                title = "Disabled"
            case .selected:
                title = "Selected"
            }

            guard let title else { return nil }

            return .init(
                scenario: self,
                content: .title(title),
                state: state
            )
        }
    }

    /// Test 7
    ///
    /// Description: To test all shapes for all a11y sizes
    ///
    /// Content:
    /// - intent: default
    /// - alignment: default
    /// - **shapes: all**
    /// - size: default
    /// - variant: default
    /// - content: default
    /// - state: default
    /// - mode: default
    /// - **a11y: all**
    private func test7() -> [ButtonConfigurationSnapshotTestsDeprecated] {
        let shapes = ButtonShape.allCases

        return shapes.map { shape -> ButtonConfigurationSnapshotTestsDeprecated in
                .init(
                    scenario: self,
                    shape: shape,
                    sizes: Constants.Sizes.all
                )
        }
    }

    /// Test 8
    ///
    /// Description: To test all appearances
    ///
    /// Content:
    /// - **appearance: all**
    /// - intent: default
    /// - alignment: default
    /// - size: default
    /// - variant: default
    /// - content: default
    /// - state: default
    /// - mode: all
    /// - a11y: default
    private func test8() -> [ButtonConfigurationSnapshotTestsDeprecated] {
        let appearances = ButtonAppearance.allCases

        return appearances.map { appearance -> ButtonConfigurationSnapshotTestsDeprecated in
                .init(
                    scenario: self,
                    appearance: appearance,
                    modes: Constants.Modes.all
                )
        }
    }
}

// MARK: - Extension

extension ButtonContentTypeDeprecated {

    static func allCases(isSwiftUIComponent: Bool) -> [Self] {
        let image = ImageEither.mock(isSwiftUIComponent: isSwiftUIComponent)
        let attributedString = AttributedStringEither.mock(isSwiftUIComponent: isSwiftUIComponent)

        return self.allCases(
            attributedTitle: attributedString,
            image: image
        )
    }
}
