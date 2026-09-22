//
//  TextEditorScenarioSnapshotTests.swift
//  SparkTextEditorSnapshotTests
//
//  Created by robin.lemaire on 30/11/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

@testable import SparkComponentTextInput
@_spi(SI_SPI) import SparkCommonSnapshotTesting
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonTesting
import UIKit
import SwiftUI

enum TextEditorScenarioSnapshotTests: String, CaseIterable {
    case test1
    case test2
    case test3
    case test4
    case test5
    case test6
//        case documentation

    // MARK: - Type Alias

    typealias Constants = ComponentSnapshotTestConstants

    // MARK: - Configurations

    func configuration(isSwiftUIComponent: Bool) throws -> [TextEditorConfigurationSnapshotTests] {
        switch self {
        case .test1:
            return self.test1(isSwiftUIComponent: isSwiftUIComponent)
        case .test2:
            return self.test2()
        case .test3:
            return self.test3(isSwiftUIComponent: isSwiftUIComponent)
        case .test4:
            return self.test4(isSwiftUIComponent: isSwiftUIComponent)
        case .test5:
            return self.test5(isSwiftUIComponent: isSwiftUIComponent)
        case .test6:
            return self.test6()
//        case .documentation:
//            return self.documentation()
        }
    }

    // MARK: - Scenarios

    /// Test 1
    ///
    /// Description: To test all states with all lenght of text
    ///
    /// Content:
    /// - **states : all**
    /// - **content resilience : all**
    /// - a11y sizes : default
    /// - mode : default
    /// - height : flexible
    /// - placeholder: none
    /// - intent: neutral
    /// - focus: none
    private func test1(isSwiftUIComponent: Bool) -> [TextEditorConfigurationSnapshotTests] {
        let states = TextInputState.allCases
        let contentResiliences = TextInputContentResilience.allCases(isSwiftUIComponent: isSwiftUIComponent)

        return states.flatMap { state in
            contentResiliences.map { contentResilience in
                return .init(
                    scenario: self,
                    intent: .neutral,
                    state: state,
                    content: contentResilience,
                    placeholder: .empty,
                    height: .flexible,
                    isFocused: false
                )
            }
        }
    }

    /// Test 2
    ///
    /// Description: To test all a11y sizes for different height
    ///
    /// Content:
    /// - states : enabled
    /// - content resilience : filled with small
    /// - **a11y sizes : all**
    /// - mode : default
    /// - **height : all**
    /// - placeholder: none
    /// - intent: neutral
    /// - focus: none
    private func test2() -> [TextEditorConfigurationSnapshotTests] {
        let heights = TextEditorHeight.allCases

        return heights.map { height -> TextEditorConfigurationSnapshotTests in
                .init(
                    scenario: self,
                    intent: .neutral,
                    state: .enabled,
                    content: .smallText,
                    placeholder: .empty,
                    height: height,
                    isFocused: false,
                    sizes: Constants.Sizes.all
                )
        }
    }

    /// Test 3
    ///
    /// Description: To test dark mode for all states
    ///
    /// Content:
    /// - **states : all**
    /// - content resilience : filled with small text
    /// - a11y sizes : default
    /// - mode : dark
    /// - height : flexible
    /// - placeholder: none
    /// - intent: neutral
    /// - focus: none
    private func test3(isSwiftUIComponent: Bool) -> [TextEditorConfigurationSnapshotTests] {
        let states = TextInputState.allCases

        return states.map { state -> TextEditorConfigurationSnapshotTests in
                .init(
                    scenario: self,
                    intent: .neutral,
                    state: state,
                    content: .smallText,
                    placeholder: .empty,
                    height: .flexible,
                    isFocused: false,
                    modes: [.dark]
                )
        }
    }

    /// Test 4
    ///
    /// Description: To test different height for different content resilience
    ///
    /// Content:
    /// - states : enabled
    /// - **content resilience : all**
    /// - a11y sizes : default
    /// - mode : default
    /// - **height : all**
    /// - placeholder: none
    /// - intent: neutral
    /// - focus: none
    private func test4(isSwiftUIComponent: Bool) -> [TextEditorConfigurationSnapshotTests] {
        let contentResiliences = TextInputContentResilience.allCases(isSwiftUIComponent: isSwiftUIComponent)
        let heights = TextEditorHeight.allCases

        return contentResiliences.flatMap { contentResilience in
            heights.map { height in
                return .init(
                    scenario: self,
                    intent: .neutral,
                    state: .enabled,
                    content: contentResilience,
                    placeholder: .empty,
                    height: height,
                    isFocused: false
                )
            }
        }
    }

    /// Test 5
    ///
    /// Description: To test all states with all lenght of placeholder
    ///
    /// Content:
    /// - **states : all**
    /// - content resilience : none
    /// - a11y sizes : default
    /// - mode : default
    /// - height : flexible
    /// - **placeholder: all**
    /// - intent: neutral
    /// - focus: none
    private func test5(isSwiftUIComponent: Bool) -> [TextEditorConfigurationSnapshotTests] {
        let states = TextInputState.allCases
        let placeholders = TextInputPlaceholder.allCases(isSwiftUIComponent: isSwiftUIComponent)

        return states.flatMap { state in
            placeholders.map { placeholder in
                return .init(
                    scenario: self,
                    intent: .neutral,
                    state: state,
                    content: .empty,
                    placeholder: placeholder,
                    height: .flexible,
                    isFocused: false
                )
            }
        }
    }

    /// Test 6
    ///
    /// Description: To test all intents with focus state
    ///
    /// Content:
    /// - states : enabled
    /// - content resilience : small
    /// - a11y sizes : default
    /// - mode : default
    /// - height : flexible
    /// - placeholder: all
    /// - **intent: all**
    /// - **focus: enabled**
    private func test6() -> [TextEditorConfigurationSnapshotTests] {
        let intents = TextEditorIntent.allCases

        return intents.map { intent in
            return .init(
                scenario: self,
                intent: intent,
                state: .enabled,
                content: .smallText,
                placeholder: .empty,
                height: .flexible,
                isFocused: true
            )
        }
    }

    // MARK: - Documentation

    // Used to generate screenshot for Documentation
    private func documentation() -> [TextEditorConfigurationSnapshotTests] {
        let content = [TextInputContentResilience.smallText, .multilineText]

        return content.map { content in
            return .init(
                scenario: self,
                intent: .neutral,
                state: .enabled,
                content: content,
                placeholder: .empty,
                height: .flexible,
                isFocused: true,
                modes: Constants.Modes.all
            )
        }
    }
}
