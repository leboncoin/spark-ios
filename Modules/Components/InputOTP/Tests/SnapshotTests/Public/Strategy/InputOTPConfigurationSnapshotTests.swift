//
//  InputOTPConfigurationSnapshotTests.swift
//  SparkComponentInputOTPSnapshotTests
//
//  Created by robin.lemaire on 04/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import UIKit
@testable import SparkComponentInputOTP
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonSnapshotTesting

struct InputOTPConfigurationSnapshotTests {

    // MARK: - Properties

    let scenario: InputOTPScenarioSnapshotTests

    var value: String = "23"
    var digits: InputOTPDigits = .default
    var codeType: InputOTPCodeType = .default
    var onError: Bool = false
    var isEnabled: Bool = true

    var modes: [ComponentSnapshotTestMode] = ComponentSnapshotTestConstants.Modes.default
    var sizes: [UIContentSizeCategory] = ComponentSnapshotTestConstants.Sizes.default

    // MARK: - Name

    var name: String {
        guard self.documentationName == nil else {
            return ""
        }

        let parts: [String] = [
            "value" + (self.value.isEmpty ? "Empty" : self.value.count.description),
            "\(self.digits)" + "Digits",
            "\(self.codeType)" + "CodeType",
            self.onError ? "onError" : nil,
            !self.isEnabled ? "disabled" : nil
        ].compactMap { $0 }

        return parts.joined(separator: "-")
    }

    var testName: String {
        return if let documentationName {
            "inputOTP_" + documentationName
        } else {
            self.scenario.rawValue
        }
    }

    var documentationName: String?
}

// MARK: - Extension

extension InputOTPDigits {

    var valueMocked: String {
        return switch self {
        case .four: "49"
        case .six: "40921"
        case .eight: "92301923"
        }
    }
}

extension InputOTPCodeType {

    var valueMocked: String {
        return switch self {
        case .number: "123"
        case .letter: "abc"
        case .alphanumeric: "1b3d"
        }
    }
}
