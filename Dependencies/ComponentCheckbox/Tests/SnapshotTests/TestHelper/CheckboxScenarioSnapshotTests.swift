//
//  CheckboxScenarioSnapshotTests.swift
//  SparkComponentCheckbox
//
//  Created by alican.aycil on 12.01.24.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import UIKit
@testable import SparkComponentCheckbox
@_spi(SI_SPI) import SparkCommonSnapshotTesting

enum CheckboxScenarioSnapshotTests: String, CaseIterable {
    case test1
    case test2
    case test3
    case test4

    // MARK: - Type Alias

    typealias Constants = ComponentSnapshotTestConstants

    // MARK: - Configurations

    func configuration(isSwiftUIComponent: Bool = false) -> [CheckboxConfigurationSnapshotTests] {
        switch self {
        case .test1:
            return self.test1()
        case .test2:
            return self.test2(isSwiftUIComponent: isSwiftUIComponent)
        case .test3:
            return self.test3()
        case .test4:
            return self.test4()
        }
    }

    // MARK: - Scenarios

    /// Test 1
    ///
    /// Description: To test all intents
    ///
    /// Content:
    ///  - intent: all
    ///  - selectionState: selected
    ///  - state: enabled
    ///  - alignment: left
    ///  - text: normal text
    ///  - modes: all
    ///  - sizes (accessibility): default
    private func test1() -> [CheckboxConfigurationSnapshotTests] {
        let intents = CheckboxIntent.allCases

        return intents.map { intent in
            return .init(
                scenario: self,
                intent: intent,
                selectionState: .selected,
                state: .enabled,
                alignment: .left,
                textType: .normal,
                image: UIImage.mock,
                modes: Constants.Modes.all,
                sizes: Constants.Sizes.default
            )
        }
    }

    /// Test 2
    ///
    /// Description: To test all states (content and component)
    ///
    /// Content:
    ///  - intent: all
    ///  - selectionState: selected
    ///  - state: enabled
    ///  - alignment: left
    ///  - text: normal text
    ///  - modes: all
    ///  - sizes (accessibility): default
    private func test2(isSwiftUIComponent: Bool) -> [CheckboxConfigurationSnapshotTests] {
        let selectionStates = CheckboxSelectionState.allCases
        let states = isSwiftUIComponent ? [.enabled, .disabled] : CheckboxState.allCases

        return selectionStates.flatMap { selectionState in
            states.map { state in
                return CheckboxConfigurationSnapshotTests.init(
                    scenario: self,
                    intent: .main,
                    selectionState: selectionState,
                    state: state,
                    alignment: .left,
                    textType: .normal,
                    image: UIImage.mock,
                    modes: Constants.Modes.all,
                    sizes: Constants.Sizes.default
                )
            }
        }
    }

    /// Test 3
    ///
    /// Description: To test label resilience
    ///
    /// Content:
    ///  - intent: all
    ///  - selectionState: selected
    ///  - state: enabled
    ///  - alignment: left
    ///  - text: normal text
    ///  - modes: all
    ///  - sizes (accessibility): default
    private func test3() -> [CheckboxConfigurationSnapshotTests] {
        let texts = TextType.allCases
        let alignments = CheckboxAlignment.allCases

        return texts.flatMap { text in
            alignments.map { alignment in
                return CheckboxConfigurationSnapshotTests.init(
                    scenario: self,
                    intent: .main,
                    selectionState: .selected,
                    state: .enabled,
                    alignment: alignment,
                    textType: text,
                    image: UIImage.mock,
                    modes: Constants.Modes.default,
                    sizes: Constants.Sizes.default
                )
            }
        }
    }

    /// Test 4
    ///
    /// Description: To test a11y sizes
    ///
    /// Content:
    ///  - intent: all
    ///  - selectionState: selected
    ///  - state: enabled
    ///  - alignment: left
    ///  - text: normal text
    ///  - modes: all
    ///  - sizes (accessibility): default
    private func test4() -> [CheckboxConfigurationSnapshotTests] {
        return [.init(
            scenario: self,
            intent: .main,
            selectionState: .unselected,
            state: .enabled,
            alignment: .right,
            textType: .long,
            image: UIImage.mock,
            modes: Constants.Modes.default,
            sizes: Constants.Sizes.all
        )]
    }
}

private extension UIImage {
    static let mock: UIImage = UIImage(systemName: "checkmark")?.withRenderingMode(.alwaysTemplate) ?? UIImage()
}
