//
//  FormFieldScenarioSnapshotTests.swift
//  SparkComponentFormFieldSnapshotTests
//
//  Created by alican.aycil on 08.04.24.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import UIKit
@testable import SparkComponentFormField
@_spi(SI_SPI) import SparkCommonSnapshotTesting

enum FormFieldScenarioSnapshotTests: String, CaseIterable {
    case test1
    case test2
    case test3
    case test4
    case test5
    case test6
    case test7
    case test8
    // case documentation

    // MARK: - Type Alias

    private typealias Constants = ComponentSnapshotTestConstants

    // MARK: - Configurations

    func configuration() -> [FormFieldConfigurationSnapshotTests] {
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
        // case .documentation:
        //     return self.documentation()
        }
    }

    // MARK: - Scenarios

    /// Test 1
    ///
    /// Description: To test all feedback states
    ///
    /// Content:
    ///  - feedbackState: all
    ///  - titleType: short
    ///  - clearButton: nil
    ///  - helperType: short
    ///  - helperImage: nil
    ///  - isCounter: false
    ///  - isRequired: false,
    ///  - isEnabled: true
    ///  - modes: light
    ///  - sizes (accessibility): default
    private func test1() -> [FormFieldConfigurationSnapshotTests] {
        let feedbackStates = FormFieldFeedbackState.allCases

        return feedbackStates.map { feedbackState in
            return .init(
                scenario: self,
                feedbackState: feedbackState,
                titleType: .short,
                clearButtonImageName: nil,
                helperType: .short,
                helperImageName: nil,
                isCounter: false,
                isRequired: false,
                isEnabled: true,
                modes: Constants.Modes.default,
                sizes: Constants.Sizes.default
            )
        }
    }

    /// Test 2
    ///
    /// Description: To test title's content resilience
    ///
    /// Content:
    ///  - feedbackState: 'default'
    ///  - titleType: all
    ///  - clearButton: nil
    ///  - helperType: short
    ///  - helperImage: nil
    ///  - isCounter: true
    ///  - isRequired: false,
    ///  - isEnabled: true
    ///  - modes: light
    ///  - sizes (accessibility): default
    private func test2() -> [FormFieldConfigurationSnapshotTests] {
        let titleTypes = TextType.allCases

        return titleTypes.map { titleType in
            return .init(
                scenario: self,
                feedbackState: .default,
                titleType: titleType,
                clearButtonImageName: nil,
                helperType: .short,
                helperImageName: nil,
                isCounter: true,
                isRequired: false,
                isEnabled: true,
                modes: Constants.Modes.default,
                sizes: Constants.Sizes.default
            )
        }
    }

    /// Test 3
    ///
    /// Description: To test required option
    ///
    /// Content:
    ///  - feedbackState: 'default'
    ///  - titleType: all
    ///  - clearButton: nil
    ///  - helperType: short
    ///  - helperImage: nil
    ///  - isCounter: false
    ///  - isRequired: false,
    ///  - isEnabled: true
    ///  - modes: light
    ///  - sizes (accessibility): default
    private func test3() -> [FormFieldConfigurationSnapshotTests] {
        return [.init(
            scenario: self,
            feedbackState: .default,
            titleType: .long,
            clearButtonImageName: nil,
            helperType: .short,
            helperImageName: nil,
            isCounter: false,
            isRequired: true,
            isEnabled: true,
            modes: Constants.Modes.default,
            sizes: Constants.Sizes.default
        )]
    }

    /// Test 4
    ///
    /// Description: To test helper text's content resilience
    ///
    /// Content:
    ///  - feedbackState: error
    ///  - titleType: short
    ///  - clearButton: nil
    ///  - helperType: all
    ///  - helperImage: all
    ///  - isCounter: all
    ///  - isRequired: false,
    ///  - isEnabled: true
    ///  - modes: light
    ///  - sizes (accessibility): default
    private func test4() -> [FormFieldConfigurationSnapshotTests] {
        let helperTypes = TextType.allCases

        let imagesNames: [String?] = [
            "infinity.circle",
            nil
        ]

        let isCounters: [Bool] = [true, false]

        return helperTypes.flatMap { helperType in
            imagesNames.flatMap { imageName in
                isCounters.map { isCounter in
                    return .init(
                        scenario: self,
                        feedbackState: .error,
                        titleType: .short,
                        clearButtonImageName: nil,
                        helperType: helperType,
                        helperImageName: imageName,
                        isCounter: isCounter,
                        isRequired: false,
                        isEnabled: true,
                        modes: Constants.Modes.default,
                        sizes: Constants.Sizes.default
                    )
                }
            }
        }
    }

    /// Test 5
    ///
    /// Description: To test disabled state
    ///
    /// Content:
    ///  - feedbackState: 'default'
    ///  - titleType: short
    ///  - clearButton: nil
    ///  - helperType: short
    ///  - helperImage: true,
    ///  - isCounter: false
    ///  - isRequired: false,
    ///  - isEnabled: true
    ///  - modes: light
    ///  - sizes (accessibility): default
    private func test5() -> [FormFieldConfigurationSnapshotTests] {
        let feedbackStates = FormFieldFeedbackState.allCases

        return feedbackStates.map { feedbackState in
            return .init(
                scenario: self,
                feedbackState: feedbackState,
                titleType: .long,
                clearButtonImageName: nil,
                helperType: .long,
                helperImageName: "infinity.circle",
                isCounter: false,
                isRequired: false,
                isEnabled: false,
                modes: Constants.Modes.default,
                sizes: Constants.Sizes.default
            )
        }
    }

    /// Test 6
    ///
    /// Description: To test clear button
    ///
    /// Content:
    ///  - feedbackState: error
    ///  - titleType: all
    ///  - clearButton: visible
    ///  - helperType: none
    ///  - helperImage: none
    ///  - isCounter: none
    ///  - isRequired: false,
    ///  - isEnabled: true
    ///  - modes: light
    ///  - sizes (accessibility): default
    private func test6() -> [FormFieldConfigurationSnapshotTests] {
        let titleTypes = TextType.allCases

        let imagesNames: [String?] = [
            "multiply.circle"
        ]

        return titleTypes.flatMap { titleType in
            imagesNames.map { imageName in
                return .init(
                    scenario: self,
                    feedbackState: .error,
                    titleType: titleType,
                    clearButtonImageName: imageName,
                    helperType: .none,
                    helperImageName: nil,
                    isCounter: false,
                    isRequired: false,
                    isEnabled: true,
                    modes: Constants.Modes.default,
                    sizes: Constants.Sizes.default
                )
            }
        }
    }

    /// Test 7
    ///
    /// Description: To test dark & light mode
    ///
    /// Content:
    ///  - feedbackState: all
    ///  - titleType: short
    ///  - clearButton: nil
    ///  - helperType: short
    ///  - helperImage: nil
    ///  - isCounter: false
    ///  - isRequired: false,
    ///  - isEnabled: false
    ///  - modes: dark
    ///  - sizes (accessibility): default
    private func test7() -> [FormFieldConfigurationSnapshotTests] {
        let feedbackStates = FormFieldFeedbackState.allCases

        return feedbackStates.map { feedbackState in
            return .init(
                scenario: self,
                feedbackState: feedbackState,
                titleType: .short,
                clearButtonImageName: nil,
                helperType: .short,
                helperImageName: nil,
                isCounter: false,
                isRequired: false,
                isEnabled: true,
                modes: [.dark],
                sizes: Constants.Sizes.default
            )
        }
    }

    /// Test 8
    ///
    /// Description: To test a11y sizes
    ///
    /// Content:
    ///  - feedbackState: error
    ///  - titleType: short
    ///  - clearButton: all
    ///  - helperType: short
    ///  - helperImage: true
    ///  - isCounter: all
    ///  - isRequired: false,
    ///  - isEnabled: false
    ///  - modes: light
    ///  - sizes (accessibility): all
    private func test8() -> [FormFieldConfigurationSnapshotTests] {
        let textTypes = TextType.allCases.filter { $0 != .none }

        let imageName = "multiply.circle"

        let isCounters: [Bool] = [true, false]

        return textTypes.flatMap { textType in
            isCounters.map { isCounter in
                return .init(
                    scenario: self,
                    feedbackState: .error,
                    titleType: textType,
                    clearButtonImageName: imageName,
                    helperType: textType,
                    helperImageName: imageName,
                    isCounter: isCounter,
                    isRequired: true,
                    isEnabled: true,
                    modes: Constants.Modes.default,
                    sizes: Constants.Sizes.all
                )
            }
        }
    }

    // MARK: - Documentation

    // Used to generate screenshot for Documentation
//    private func documentation() -> [FormFieldConfigurationSnapshotTests] {
//        let titles: [String?] = [
//            "Email (exemple@mail.fr)",
//            nil
//        ]
//
//        let clearButtons: [String?] = [
//            "multiply.circle",
//            nil
//        ]
//
//        let helpers: [String?] = [
//            "Please provide a valid email (exemple@mail.fr).",
//            nil
//        ]
//
//        let helperImageNames = [
//            "exclamationmark.circle",
//            nil
//        ]
//
//        let isCounters: [Bool] = [true, false]
//
//        return titles.flatMap { title in
//            clearButtons.flatMap { clearButton in
//                helpers.flatMap { helper in
//                    helperImageNames.flatMap { helperImageName in
//                        isCounters.map { isCounter in
//                            return .init(
//                                scenario: self,
//                                feedbackState: .default,
//                                titleType: title,
//                                clearButtonImageName: clearButton,
//                                helperType: helper,
//                                helperImageName: helperImageName,
//                                isCounter: isCounter,
//                                isRequired: true,
//                                isEnabled: true,
//                                modes: Constants.Modes.all,
//                                sizes: Constants.Sizes.all
//                            )
//                        }
//                    }
//                }
//            }
//        }
//    }
}
