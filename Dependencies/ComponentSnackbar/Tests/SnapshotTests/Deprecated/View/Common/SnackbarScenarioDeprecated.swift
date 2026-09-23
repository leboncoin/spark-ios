//
//  SnackbarScenarioDeprecated.swift
//  SparkComponentSnackbarTests
//
//  Created by louis.borlee on 01/10/2024.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import Foundation
@testable import SparkComponentSnackbar
@_spi(SI_SPI) @testable import SparkCommonSnapshotTesting

@available(*, deprecated, message: "This scenario is deprecated and will be removed in a future version.")
enum SnackbarScenarioDeprecated: String {
    case test1
    case test2
    case test3

    var configurations: [SnackbarScenarioConfigurationDeprecated] {
        switch self {
        case .test1:
            return self.createTest1Configurations()
        case .test2:
            return self.createTest2Configurations()
        case .test3:
            return self.createTest3Configurations()
        }
    }

    private func createTest1Configurations() -> [SnackbarScenarioConfigurationDeprecated] {
        var configurations = [SnackbarScenarioConfigurationDeprecated]()
        for intent in SnackbarIntent.allCases {
            for variant in SnackbarVariant.allCases {
                configurations.append(
                    .init(
                        description: self.rawValue,
                        intent: intent,
                        variant: variant,
                        type: .horizontal,
                        textConfiguration: .shortText("Text"),
                        isTextMultiline: false,
                        buttonConfiguration: .none,
                        withImage: true,
                        modes: [.light],
                        sizes: [.medium]
                    )
                )
            }
        }
        return configurations
    }

    private func createTest2Configurations() -> [SnackbarScenarioConfigurationDeprecated] {
        var configurations = [SnackbarScenarioConfigurationDeprecated]()
        let buttonConfigurations: [SnackbarScenarioConfigurationDeprecated.ButtonConfiguration] = [
            .none,
            .shortText("Button"),
            .longText("Very long button text.")
        ]
        var i = 0
        buttonConfigurations.forEach {
            for isTextMultiline in [true, false] {
                for type in SnackbarType.allCases {
                    configurations.append(
                        .init(
                            description: self.rawValue,
                            intent: .success,
                            variant: .filled,
                            type: type,
                            textConfiguration: .longText("This is a very long text. It could be multiline.\nNew line."),
                            isTextMultiline: isTextMultiline,
                            buttonConfiguration: $0,
                            withImage: i % 2 != 0 ? true : false,
                            modes: [.dark],
                            sizes: [.medium]
                        )
                    )
                    i += 1
                }
            }
        }
        return configurations
    }

    private func createTest3Configurations() -> [SnackbarScenarioConfigurationDeprecated] {
        var configurations = [SnackbarScenarioConfigurationDeprecated]()
        for type in SnackbarType.allCases {
            configurations.append(
                .init(
                    description: self.rawValue,
                    intent: .neutral,
                    variant: .filled,
                    type: type,
                    textConfiguration: .longText("This is a very long text. It could be multiline.\nNew line."),
                    isTextMultiline: false,
                    buttonConfiguration: .shortText("Button"),
                    withImage: true,
                    modes: [.light],
                    sizes: [.extraSmall, .medium, .extraExtraExtraLarge]
                )
            )
        }
        return configurations
    }
}
