//
//  TextFieldScenarioSnapshotTests.swift
//  SparkTextFieldSnapshotTests
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

enum TextFieldScenarioSnapshotTests: String, CaseIterable {
    case test1
    case test2
    case test3
    case test4
    case test5
    case test6
    case test7
//    case documentation

    // MARK: - Type Alias

    typealias Constants = ComponentSnapshotTestConstants

    // MARK: - Configurations

    func configuration(isSwiftUIComponent: Bool) throws -> [TextFieldConfigurationSnapshotTests] {
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
            return self.test5()
        case .test6:
            return self.test6()
        case .test7:
            return self.test7()
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
    /// - intent: .neutral
    /// - **state: all**
    /// - **content: all**
    /// - placeholder: .small
    /// - leftContent: .button
    /// - leftAddonContent: .image
    /// - rightContent: .button
    /// - rightAddonContent: .image
    /// - isClearButton: false
    /// - isFocused: false
    /// - isSecureEntry: false
    /// - a11y sizes : default
    /// - mode : default
    private func test1(isSwiftUIComponent: Bool) -> [TextFieldConfigurationSnapshotTests] {
        let states = TextInputState.allCases
        let contentResiliences = TextInputContentResilience.allCases(isTextField: true)

        return states.flatMap { state in
            contentResiliences.map { contentResilience in

                return .init(
                    scenario: self,
                    intent: .neutral,
                    state: state,
                    content: contentResilience,
                    placeholder: .small,
                    leftContent: .button,
                    leftAddonContent: .image,
                    rightContent: .button,
                    rightAddonContent: .image,
                    isAddonsPadding: false,
                    isAddonsSeparator: false,
                    isClearButton: false,
                    isFocused: false,
                    isSecureEntry: false
                )
            }
        }
    }

    /// Test 2
    ///
    /// Description: To test all content side
    ///
    /// Content:
    /// - intent: .neutral
    /// - state: .enabled
    /// - content: .smallText
    /// - placeholder: .small
    /// - **leftContent: button & none**
    /// - **leftAddonContent: image & none**
    /// - **rightContent: image & none**
    /// - **rightAddonContent: button & none**
    /// - **isClearButton: all**
    /// - isFocused: false
    /// - isSecureEntry: false
    /// - a11y sizes : default
    /// - mode : default
    private func test2(isSwiftUIComponent: Bool) -> [TextFieldConfigurationSnapshotTests] {
        let contentStates = TextFieldSideViewState.allCases
        let isAddons = Bool.allCases
        let isClearButtons = isSwiftUIComponent ? Bool.allCases : [false]

        return contentStates.flatMap { contentState in
            isAddons.flatMap { isAddons in
                isClearButtons.map { isClearButton in

                    return .init(
                        scenario: self,
                        intent: .neutral,
                        state: .enabled,
                        content: .smallText,
                        placeholder: .small,
                        leftContent: contentState.isLeft ? .image : .empty,
                        leftAddonContent: isAddons ? .button : .empty,
                        rightContent: contentState.isRight ? .button : .empty,
                        rightAddonContent: isAddons ? .image : .empty,
                        isAddonsPadding: false,
                        isAddonsSeparator: false,
                        isClearButton: isClearButton,
                        isFocused: false,
                        isSecureEntry: false
                    )
                }
            }
        }
    }

    /// Test 3
    ///
    /// Description: To test all addons
    ///
    /// Content:
    /// - intent: .neutral
    /// - state: .enabled
    /// - content: .smallText
    /// - placeholder: .small
    /// - **leftContent: image & none**
    /// - **leftAddonContent: button & none**
    /// - **rightContent: button & none**
    /// - **rightAddonContent: image & none**
    /// - isClearButton: false
    /// - isFocused: false
    /// - isSecureEntry: false
    /// - a11y sizes : default
    /// - mode : default
    private func test3(isSwiftUIComponent: Bool) -> [TextFieldConfigurationSnapshotTests] {
        let addonsContentStates = TextFieldSideViewState.allCases
        let isSideView = Bool.allCases
        let isAddonsPaddings = Bool.allCases
        let isAddonsSeparators = isSwiftUIComponent ? Bool.allCases : [false]

        return addonsContentStates.flatMap { addonsContentState in
            isSideView.flatMap { isSideView in
                isAddonsPaddings.flatMap { isAddonsPadding in
                    isAddonsSeparators.map { isAddonsSeparator in

                        return .init(
                            scenario: self,
                            intent: .neutral,
                            state: .enabled,
                            content: .smallText,
                            placeholder: .small,
                            leftContent: isSideView ? .image : .empty,
                            leftAddonContent: addonsContentState.isLeft ? .button : .empty,
                            rightContent: isSideView ? .button : .empty,
                            rightAddonContent: addonsContentState.isRight ? .image : .empty,
                            isAddonsPadding: isAddonsPadding,
                            isAddonsSeparator: isAddonsSeparator,
                            isClearButton: false,
                            isFocused: false,
                            isSecureEntry: false
                        )
                    }
                }
            }
        }
    }

    /// Test 34
    ///
    /// Description: To test focus for all intent
    ///
    /// Content:
    /// - **intent: all**
    /// - state: .enabled
    /// - content: .smallText
    /// - placeholder: .small
    /// - leftContent: .button
    /// - leftAddonContent: .image
    /// - rightContent: .button
    /// - rightAddonContent: .image
    /// - isClearButton: false
    /// - **isFocused: true**
    /// - isSecureEntry: false
    /// - a11y sizes : default
    /// - mode : default
    private func test4(isSwiftUIComponent: Bool) -> [TextFieldConfigurationSnapshotTests] {
        guard !isSwiftUIComponent else {
            return []
        }

        let intents = TextInputIntent.allCases

        return intents.flatMap { intent in
            [
                .init(
                    scenario: self,
                    intent: intent,
                    state: .enabled,
                    content: .smallText,
                    placeholder: .small,
                    leftContent: .button,
                    leftAddonContent: .image,
                    rightContent: .empty,
                    rightAddonContent: .image,
                    isAddonsPadding: false,
                    isAddonsSeparator: false,
                    isClearButton: true,
                    isFocused: true,
                    isSecureEntry: false,
                    modes: [.dark]
                )
            ]
        }
    }

    /// Test 5
    ///
    /// Description: To test secure mode
    ///
    /// Content:
    /// - intent: .neutral
    /// - state: .enabled
    /// - content: .smallText
    /// - placeholder: .small
    /// - leftContent: .none
    /// - leftAddonContent: .none
    /// - rightContent: .none
    /// - rightAddonContent: .none
    /// - isClearButton: false
    /// - isFocused: false
    /// - **isSecureEntry: true**
    /// - a11y sizes : default
    /// - mode : default
    private func test5() -> [TextFieldConfigurationSnapshotTests] {
        return [
            .init(
                scenario: self,
                intent: .neutral,
                state: .enabled,
                content: .smallText,
                placeholder: .small,
                leftContent: .empty,
                leftAddonContent: .empty,
                rightContent: .empty,
                rightAddonContent: .empty,
                isAddonsPadding: false,
                isAddonsSeparator: false,
                isClearButton: true,
                isFocused: false,
                isSecureEntry: true
            )
        ]
    }

    /// Test 6
    ///
    /// Description: To test dark mode for all states
    ///
    /// Content:
    /// - intent: .neutral
    /// - state: .enabled
    /// - content: .smallText
    /// - placeholder: .small
    /// - leftContent: .button
    /// - leftAddonContent: .image
    /// - rightContent: .button
    /// - rightAddonContent: .image
    /// - isClearButton: false
    /// - isFocused: false
    /// - isSecureEntry: false
    /// - a11y sizes : default
    /// - **mode : dark**
    private func test6() -> [TextFieldConfigurationSnapshotTests] {
        return [
            .init(
                scenario: self,
                intent: .neutral,
                state: .enabled,
                content: .smallText,
                placeholder: .small,
                leftContent: .empty,
                leftAddonContent: .empty,
                rightContent: .empty,
                rightAddonContent: .empty,
                isAddonsPadding: false,
                isAddonsSeparator: false,
                isClearButton: true,
                isFocused: false,
                isSecureEntry: false,
                modes: [.dark]
            )
        ]
    }

    /// Test 7
    ///
    /// Description: To test all a11y size
    ///
    /// Content:
    /// - intent: .neutral
    /// - state: .enabled
    /// - content: .smallText
    /// - placeholder: .small
    /// - leftContent: .none
    /// - leftAddonContent: .none
    /// - rightContent: .none
    /// - rightAddonContent: .none
    /// - isClearButton: false
    /// - isFocused: false
    /// - isSecureEntry: false
    /// - **a11y sizes : all**
    /// - mode : default
    private func test7() -> [TextFieldConfigurationSnapshotTests] {
        return [
            .init(
                scenario: self,
                intent: .neutral,
                state: .enabled,
                content: .smallText,
                placeholder: .small,
                leftContent: .empty,
                leftAddonContent: .empty,
                rightContent: .empty,
                rightAddonContent: .empty,
                isAddonsPadding: false,
                isAddonsSeparator: false,
                isClearButton: true,
                isFocused: false,
                isSecureEntry: false,
                sizes: Constants.Sizes.all
            )
        ]
    }

    // MARK: - Documentation

    // Used to generate screenshot for Documentation
    private func documentation() -> [TextFieldConfigurationSnapshotTests] {
        let withSideViews = Bool.allCases
        let clearButtons = Bool.allCases
        let isSecureEntries = Bool.allCases

        return withSideViews.flatMap { withSideView in
            clearButtons.flatMap { clearButton in
                isSecureEntries.map { isSecureEntry in
                    return .init(
                        scenario: self,
                        intent: .neutral,
                        state: .enabled,
                        content: .smallText,
                        placeholder: .small,
                        leftContent: withSideView ? .image : .empty,
                        leftAddonContent: withSideView ? .button : .empty,
                        rightContent: withSideView ? .image : .empty,
                        rightAddonContent: withSideView ? .button : .empty,
                        isAddonsPadding: true,
                        isAddonsSeparator: true,
                        isClearButton: clearButton,
                        isFocused: false,
                        isSecureEntry: isSecureEntry,
                        modes: Constants.Modes.all
                    )
                }
            }
        }
    }
}
