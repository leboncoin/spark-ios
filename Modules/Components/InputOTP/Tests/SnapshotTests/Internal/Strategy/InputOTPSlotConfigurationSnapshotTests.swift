//
//  InputOTPSlotConfigurationSnapshotTests.swift
//  SparkComponentInputOTPSnapshotTests
//
//  Created by robin.lemaire on 04/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import UIKit
@testable import SparkComponentInputOTP
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonSnapshotTesting

struct InputOTPSlotConfigurationSnapshotTests {

    // MARK: - Properties

    let scenario: InputOTPSlotScenarioSnapshotTests

    var content: InputOTPSlotContent = .default
    var isFocus: Bool = false

    var modes: [ComponentSnapshotTestMode] = ComponentSnapshotTestConstants.Modes.default
    var sizes: [UIContentSizeCategory] = ComponentSnapshotTestConstants.Sizes.default

    // MARK: - Name

    var name: String {
        guard self.documentationName == nil else {
            return ""
        }

        let parts: [String] = [
            "content" + self.content.rawValue.capitalized,
            self.isFocus ? "focus" : nil
        ].compactMap { $0 }

        return parts.joined(separator: "-")
    }

    var testName: String {
        return if let documentationName {
            "InputOTPSlot_" + documentationName
        } else {
            self.scenario.rawValue
        }
    }

    var documentationName: String?
}
