//
//  InputOTPSlotScenarioSnapshotTests.swift
//  SparkComponentInputOTPSnapshotTests
//
//  Created by robin.lemaire on 04/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentInputOTP
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonSnapshotTesting
@_spi(SI_SPI) import SparkCommonTesting
import SparkTheme
import UIKit
import SwiftUI

enum InputOTPSlotScenarioSnapshotTests: String, CaseIterable {
    case test1

    // MARK: - Type Alias

    typealias Constants = ComponentSnapshotTestConstants

    // MARK: - Properties

    var isDocumentation: Bool {
        return false
    }

    // MARK: - Configurations

    func configuration() -> [InputOTPSlotConfigurationSnapshotTests] {
        switch self {
        case .test1:
            return self.test1()
        }
    }

    // MARK: - Scenarios

    /// Test 1.
    ///
    /// Description: Test all content with all isFocus states
    ///
    private func test1() -> [InputOTPSlotConfigurationSnapshotTests] {
        let contents = InputOTPSlotContent.allCases
        let isFocusStates = [false, true]

        var configurations: [InputOTPSlotConfigurationSnapshotTests] = []

        for content in contents {
            for isFocus in isFocusStates {
                configurations.append(
                    .init(
                        scenario: self,
                        content: content,
                        isFocus: isFocus
                    )
                )
            }
        }

        return configurations
    }
}
