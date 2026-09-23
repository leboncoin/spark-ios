//
//  RadioButtonScenario.swift
//  SparkComponentRadioButton
//
//  Created by louis.borlee on 21/10/2024.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import Foundation
@testable import SparkComponentRadioButton
@_spi(SI_SPI) @testable import SparkCommonSnapshotTesting

enum RadioButtonScenario: String {
    case test1
    case test2
    case test3
    case test4
    case test5

    var configurations: [RadioButtonScenarioConfiguration] {
        switch self {
        case .test1:
            return self.createTest1Configurations()
        case .test2:
            return self.createTest2Configurations()
        case .test3:
            return self.createTest3Configurations()
        case .test4:
            return self.createTest4Configurations()
        case .test5:
            return self.createTest5Configurations()
        }
    }

    private func createTest1Configurations() -> [RadioButtonScenarioConfiguration] {
        var configurations = [RadioButtonScenarioConfiguration]()
        let radioButtons = self.createRadioButtonConfigurations()
        for intent in RadioButtonIntent.allCases {
            configurations.append(
                .init(
                    description: "Test1",
                    intent: intent,
                    radioButtons: radioButtons,
                    groupLayout: .vertical,
                    labelAlignment: .trailing,
                    hasExpendedContainer: false,
                    showTapArea: false,
                    modes: [.light],
                    sizes: [.medium]
                )
            )
        }
        return configurations
    }

    private func createTest2Configurations() -> [RadioButtonScenarioConfiguration] {
        var configurations = [RadioButtonScenarioConfiguration]()
        let radioButtons = self.createRadioButtonConfigurations(highlightIsSelected: true)
        for groupLayout in [RadioButtonGroupLayout.horizontal, .vertical] {
            for labelAlignment in [RadioButtonLabelAlignment.leading, .trailing] {
                configurations.append(
                    .init(
                        description: "Test2",
                        intent: .main,
                        radioButtons: radioButtons,
                        groupLayout: groupLayout,
                        labelAlignment: labelAlignment,
                        hasExpendedContainer: false,
                        showTapArea: false,
                        modes: [.dark],
                        sizes: [.medium]
                    )
                )
            }
        }
        return configurations
    }

    private func createTest3Configurations() -> [RadioButtonScenarioConfiguration] {
        var configurations = [RadioButtonScenarioConfiguration]()
        let radioButtons = self.createRadioButtonConfigurations()
        for groupLayout in [RadioButtonGroupLayout.horizontal, .vertical] {
            configurations.append(
                .init(
                    description: "Test3",
                    intent: .danger,
                    radioButtons: radioButtons,
                    groupLayout: groupLayout,
                    labelAlignment: .trailing,
                    hasExpendedContainer: false,
                    showTapArea: false,
                    modes: [.light],
                    sizes: [.extraSmall, .extraExtraExtraLarge]
                )
            )
        }
        return configurations
    }

    private func createTest4Configurations() -> [RadioButtonScenarioConfiguration] {
        var configurations = [RadioButtonScenarioConfiguration]()
        let radioButtons = self.createRadioButtonConfigurations()
        for groupLayout in [RadioButtonGroupLayout.horizontal, .vertical] {
            configurations.append(
                .init(
                    description: "Test4",
                    intent: .main,
                    radioButtons: radioButtons,
                    groupLayout: groupLayout,
                    labelAlignment: .leading,
                    hasExpendedContainer: true,
                    showTapArea: false,
                    modes: [.light],
                    sizes: [.medium]
                )
            )
        }
        return configurations
    }

    private func createTest5Configurations() -> [RadioButtonScenarioConfiguration] {
        var configurations = [RadioButtonScenarioConfiguration]()
        let radioButtons = self.createRadioButtonConfigurations()
        for groupLayout in [RadioButtonGroupLayout.horizontal, .vertical] {
            for labelAlignment in [RadioButtonLabelAlignment.leading, .trailing] {
                configurations.append(
                    .init(
                        description: "Test5",
                        intent: .main,
                        radioButtons: radioButtons,
                        groupLayout: groupLayout,
                        labelAlignment: labelAlignment,
                        hasExpendedContainer: false,
                        showTapArea: true,
                        modes: [.light],
                        sizes: [.extraExtraExtraLarge]
                    )
                )
            }
        }
        return configurations
    }

    private func createRadioButtonConfigurations(highlightIsSelected: Bool = false) -> [RadioButtonScenarioConfiguration.SingleRadioButtonConfiguration] {
        return [
            .init(
                text: "Donec ut quam a lacus vehicula sagittis venenatis eu lacus.",
                isSelected: true,
                isEnabled: true,
                isHighlighted: highlightIsSelected
            ),
            .init(
                text: highlightIsSelected ? "Enabled" : "Enabled + Highlighted",
                isSelected: false,
                isEnabled: true,
                isHighlighted: highlightIsSelected != true
            ),
            .init(
                text: "Disabled",
                isSelected: false,
                isEnabled: false,
                isHighlighted: false
            ),
            .init(
                text: "",
                isSelected: false,
                isEnabled: false,
                isHighlighted: true
            ),
        ]
    }
}
