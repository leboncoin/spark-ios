//
//  InputOTPScenarioSnapshotTests.swift
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

enum InputOTPScenarioSnapshotTests: String, CaseIterable {
    case test1
    case test2
    case test3
    case test4
    case test5
    case test6
    case test7
    case documentation

    // MARK: - Type Alias

    typealias Constants = ComponentSnapshotTestConstants

    // MARK: - Properties

    var isDocumentation: Bool {
        self == .documentation
    }

    // MARK: - Configurations

    func configuration() -> [InputOTPConfigurationSnapshotTests] {
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
        case .documentation:
            return self.documentation()
        }
    }

    // MARK: - Scenarios

    /// Test 1.
    ///
    /// Description: Test all value variations from empty to full
    ///
    private func test1() -> [InputOTPConfigurationSnapshotTests] {
        let values = ["", "1", "12", "123", "1234", "12345", "123456"]

        return values.map { value in
            .init(
                scenario: self,
                value: value
            )
        }
    }

    /// Test 2
    ///
    /// Description: Test all digit configurations with mocked values
    ///
    private func test2() -> [InputOTPConfigurationSnapshotTests] {
        let digits = InputOTPDigits.allCases

        return digits.map { digit in
            .init(
                scenario: self,
                value: digit.valueMocked,
                digits: digit
            )
        }
    }

    /// Test 3
    ///
    /// Description: Test all code type configurations with mocked values
    ///
    private func test3() -> [InputOTPConfigurationSnapshotTests] {
        let codeTypes = InputOTPCodeType.allCases

        return codeTypes.map { codeType in
            .init(
                scenario: self,
                value: codeType.valueMocked,
                codeType: codeType
            )
        }
    }

    /// Test 4
    ///
    /// Description: Test error state
    ///
    private func test4() -> [InputOTPConfigurationSnapshotTests] {
        let onErrorStates = [false, true]

        return onErrorStates.map { onError in
            .init(
                scenario: self,
                onError: onError
            )
        }
    }

    /// Test 5
    ///
    /// Description: Test enabled/disabled states
    ///
    private func test5() -> [InputOTPConfigurationSnapshotTests] {
        let isEnabledStates = [true, false]

        return isEnabledStates.map { isEnabled in
            .init(
                scenario: self,
                isEnabled: isEnabled
            )
        }
    }

    /// Test 6
    ///
    /// Description: Test all display modes
    ///
    private func test6() -> [InputOTPConfigurationSnapshotTests] {
        return [
            .init(
                scenario: self,
                modes: Constants.Modes.all
            )
        ]
    }

    /// Test 7
    ///
    /// Description: Test all accessibility sizes
    ///
    private func test7() -> [InputOTPConfigurationSnapshotTests] {
        return [
            .init(
                scenario: self,
                sizes: Constants.Sizes.all
            )
        ]
    }

    // MARK: - Documentation

    private func documentation() -> [InputOTPConfigurationSnapshotTests] {
        var items: [InputOTPConfigurationSnapshotTests] = []

        // All digits with mocked values
        for digits in InputOTPDigits.allCases {
            items.append(
                .init(
                    scenario: self,
                    value: digits.valueMocked,
                    digits: digits,
                    documentationName: "digits_\(digits)"
                )
            )
        }

        // All code types with mocked values
        for codeType in InputOTPCodeType.allCases {
            items.append(
                .init(
                    scenario: self,
                    value: codeType.valueMocked,
                    codeType: codeType,
                    documentationName: "codetypes_\(codeType)"
                )
            )
        }

        // OnError state
        items.append(
            .init(
                scenario: self,
                value: "12",
                onError: true,
                documentationName: "onError"
            )
        )

        // Disabled state
        items.append(
            .init(
                scenario: self,
                value: "2349",
                isEnabled: false,
                documentationName: "isDisabled"
            )
        )

        return items
    }
}
