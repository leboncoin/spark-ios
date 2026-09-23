//
//  SnackbarScenarioConfigurationDeprecated.swift
//  SparkComponentSnackbarTests
//
//  Created by louis.borlee on 01/10/2024.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import UIKit
@testable import SparkComponentSnackbar
@_spi(SI_SPI) @testable import SparkCommon
@_spi(SI_SPI) @testable import SparkCommonSnapshotTesting

@available(*, deprecated, message: "This configuration is deprecated and will be removed in a future version.")
struct SnackbarScenarioConfigurationDeprecated: CustomStringConvertible {
    let description: String
    let intent: SnackbarIntent
    let variant: SnackbarVariant
    let type: SnackbarType
    let textConfiguration: TextConfiguration
    let isTextMultiline: Bool
    let buttonConfiguration: ButtonConfiguration
    let withImage: Bool
    let modes: [ComponentSnapshotTestMode]
    let sizes: [UIContentSizeCategory]

    var testName: String {
        return "\(self)-\(self.intent)-\(self.variant)-\(self.type)-\(self.textConfiguration)-\(isTextMultiline ? "multiline" : "oneline")-\(self.buttonConfiguration)-\(withImage ? "withImage" : "withoutImage")"
    }

    enum TextConfiguration: CustomStringConvertible {
        case shortText(String)
        case longText(String)

        var description: String {
            switch self {
            case .shortText(_): return "shortText"
            case .longText(_): return "longText"
            }
        }

        var text: String {
            switch self {
            case .longText(let text), .shortText(let text):
                return text
            }
        }
    }

    enum ButtonConfiguration: CustomStringConvertible {
        case none
        case shortText(String)
        case longText(String)

        var text: String? {
            switch self {
            case .none:
                return nil
            case .longText(let text), .shortText(let text):
                return text
            }
        }

        var description: String {
            switch self {
            case .none: return "noButton"
            case .shortText(_): return "shortButtonText"
            case .longText(_): return "longButtonText"
            }
        }
    }
}
