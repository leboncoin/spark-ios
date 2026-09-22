//
//  IconButtonScenarioSnapshotTestsDeprecated.swift
//  SparkComponentButtonSnapshotTests
//
//  Created by robin.lemaire on 30/11/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

// MARK: - Deprecated

/// This file is deprecated and should not be used for new tests.

@testable import SparkComponentButton
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonSnapshotTesting
@_spi(SI_SPI) import SparkCommonTesting
import UIKit
import SwiftUI

enum IconButtonScenarioSnapshotTestsDeprecated: String, CaseIterable {
    case test1
    case test2
    case test3
    case test4
    case test5
    case test6

    // MARK: - Type Alias

    typealias Constants = ComponentSnapshotTestConstants

    // MARK: - Configurations

    func configuration(isSwiftUIComponent: Bool) throws -> [IconButtonConfigurationSnapshotTestsDeprecated] {
        switch self {
        case .test1:
            return self.test1(isSwiftUIComponent: isSwiftUIComponent)
        case .test2:
            return self.test2(isSwiftUIComponent: isSwiftUIComponent)
        case .test3:
            return self.test3(isSwiftUIComponent: isSwiftUIComponent)
        case .test4:
            return self.test4(isSwiftUIComponent: isSwiftUIComponent)
        case .test5:
            return self.test5(isSwiftUIComponent: isSwiftUIComponent)
        case .test6:
            return self.test6(isSwiftUIComponent: isSwiftUIComponent)
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
    private func test1(isSwiftUIComponent: Bool) -> [IconButtonConfigurationSnapshotTestsDeprecated] {
        let intents = ButtonIntent.allCases

        return intents.compactMap { intent -> IconButtonConfigurationSnapshotTestsDeprecated? in
            guard let image = ImageEither.mock(
                isSwiftUIComponent: isSwiftUIComponent,
                for: .normal
            ) else {
                return nil
            }

            return .init(
                scenario: self,
                intent: intent,
                image: image,
                modes: Constants.Modes.all
            )
        }
    }

    /// Test 2
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
    private func test2(isSwiftUIComponent: Bool) -> [IconButtonConfigurationSnapshotTestsDeprecated] {
        let sizes = ButtonSize.allCases

        return sizes.compactMap { size -> IconButtonConfigurationSnapshotTestsDeprecated? in
            guard let image = ImageEither.mock(
                isSwiftUIComponent: isSwiftUIComponent,
                for: .normal
            ) else {
                return nil
            }

            return .init(
                scenario: self,
                size: size,
                image: image,
                sizes: Constants.Sizes.all
            )
        }
    }

    /// Test 3
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
    private func test3(isSwiftUIComponent: Bool) -> [IconButtonConfigurationSnapshotTestsDeprecated] {
        let variants = ButtonVariant.allCases

        return variants.compactMap { variant -> IconButtonConfigurationSnapshotTestsDeprecated? in
            guard let image = ImageEither.mock(
                isSwiftUIComponent: isSwiftUIComponent,
                for: .normal
            ) else {
                return nil
            }

            return .init(
                scenario: self,
                variant: variant,
                image: image
            )
        }
    }

    /// Test 4
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
    private func test4(isSwiftUIComponent: Bool) -> [IconButtonConfigurationSnapshotTestsDeprecated] {
        let states = ControlState.allCases

        return states.compactMap { state -> IconButtonConfigurationSnapshotTestsDeprecated? in
            guard let image = ImageEither.mock(
                isSwiftUIComponent: isSwiftUIComponent,
                for: state
            ) else { return nil }

            return .init(
                scenario: self,
                image: image,
                state: state
            )
        }
    }

    /// Test 5
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
    private func test5(isSwiftUIComponent: Bool) -> [IconButtonConfigurationSnapshotTestsDeprecated] {
        let shapes = ButtonShape.allCases

        return shapes.compactMap { shape -> IconButtonConfigurationSnapshotTestsDeprecated? in
            guard let image = ImageEither.mock(
                isSwiftUIComponent: isSwiftUIComponent,
                for: .normal
            ) else {
                return nil
            }

            return .init(
                scenario: self,
                shape: shape,
                image: image,
                sizes: Constants.Sizes.all
            )
        }
    }

    /// Test 6
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
    private func test6(isSwiftUIComponent: Bool) -> [IconButtonConfigurationSnapshotTestsDeprecated] {
        let appearances = ButtonAppearance.allCases

        return appearances.compactMap { appearance -> IconButtonConfigurationSnapshotTestsDeprecated? in
            guard let image = ImageEither.mock(
                isSwiftUIComponent: isSwiftUIComponent,
                for: .normal
            ) else {
                return nil
            }

            return .init(
                scenario: self,
                appearance: appearance,
                image: image,
                modes: Constants.Modes.all
            )
        }
    }
}

// MARK: - Extension

extension ImageEither {

    static func mock(
        isSwiftUIComponent: Bool,
        for state: ControlState
    ) -> Self? {
        switch state {
        case .normal:
            return isSwiftUIComponent ? .right(.normalMock) : .left(.normalMock)
        case .highlighted:
            return isSwiftUIComponent ? nil : .left(.highlightedMock)
        case .disabled:
            return isSwiftUIComponent ? .right(.disabledMock) : .left(.disabledMock)
        case .selected:
            return isSwiftUIComponent ? .right(.selectedMock) : .left(.selectedMock)
        }
    }
}

private extension Image {
    static var normalMock = Image(systemName: "arrow.right")
    static let disabledMock = Image(systemName: "arrow.up")
    static let selectedMock = Image(systemName: "arrow.down")
}

private extension UIImage {
    static var normalMock = IconographyTests.shared.arrow
    static var highlightedMock = IconographyTests.shared.checkmark
    static var disabledMock = IconographyTests.shared.switchOn
    static var selectedMock = IconographyTests.shared.switchOff
}
