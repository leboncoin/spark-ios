//
//  SnackbarGetButtonTypeUseCaseDeprecatedTests.swift
//  SparkComponentSnackbar
//
//  Created by louis.borlee on 03/09/2024.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import XCTest
import SparkComponentButton
@testable import SparkComponentSnackbar
@_spi(SI_SPI) @testable import SparkComponentSnackbarTesting
@_spi(SI_SPI) import SparkThemingTesting

final class SnackbarGetButtonTypeUseCaseDeprecatedTests: XCTestCase {

    private let useCase = SnackbarGetButtonTypeUseCaseDeprecated()

    func test_success_filled() {
        // GIVEN - WHEN
        let buttonType = self.useCase.execute(
            intent: .success,
            variant: .filled
        )

        // THEN
        XCTAssertEqual(buttonType.variant, .tinted, "Wrong button variant")
        XCTAssertEqual(buttonType.intent, .success, "Wrong button intent")
    }

    func test_success_tinted() {
        // GIVEN - WHEN
        let buttonType = self.useCase.execute(
            intent: .success,
            variant: .tinted
        )

        // THEN
        XCTAssertEqual(buttonType.variant, .tinted, "Wrong button variant")
        XCTAssertEqual(buttonType.intent, .success, "Wrong button intent")
    }

    func test_alert_filled() {
        // GIVEN - WHEN
        let buttonType = self.useCase.execute(
            intent: .alert,
            variant: .filled
        )

        // THEN
        XCTAssertEqual(buttonType.variant, .tinted, "Wrong button variant")
        XCTAssertEqual(buttonType.intent, .alert, "Wrong button intent")
    }

    func test_alert_tinted() {
        // GIVEN - WHEN
        let buttonType = self.useCase.execute(
            intent: .alert,
            variant: .tinted
        )

        // THEN
        XCTAssertEqual(buttonType.variant, .tinted, "Wrong button variant")
        XCTAssertEqual(buttonType.intent, .alert, "Wrong button intent")
    }

    func test_error_filled() {
        // GIVEN - WHEN
        let buttonType = self.useCase.execute(
            intent: .error,
            variant: .filled
        )

        // THEN
        XCTAssertEqual(buttonType.variant, .tinted, "Wrong button variant")
        XCTAssertEqual(buttonType.intent, .danger, "Wrong button intent")
    }

    func test_error_tinted() {
        // GIVEN - WHEN
        let buttonType = self.useCase.execute(
            intent: .error,
            variant: .tinted
        )

        // THEN
        XCTAssertEqual(buttonType.variant, .tinted, "Wrong button variant")
        XCTAssertEqual(buttonType.intent, .danger, "Wrong button intent")
    }

    func test_info_filled() {
        // GIVEN - WHEN
        let buttonType = self.useCase.execute(
            intent: .info,
            variant: .filled
        )

        // THEN
        XCTAssertEqual(buttonType.variant, .tinted, "Wrong button variant")
        XCTAssertEqual(buttonType.intent, .info, "Wrong button intent")
    }

    func test_info_tinted() {
        // GIVEN - WHEN
        let buttonType = self.useCase.execute(
            intent: .info,
            variant: .tinted
        )

        // THEN
        XCTAssertEqual(buttonType.variant, .tinted, "Wrong button variant")
        XCTAssertEqual(buttonType.intent, .info, "Wrong button intent")
    }

    func test_neutral_filled() {
        // GIVEN - WHEN
        let buttonType = self.useCase.execute(
            intent: .neutral,
            variant: .filled
        )

        // THEN
        XCTAssertEqual(buttonType.variant, .tinted, "Wrong button variant")
        XCTAssertEqual(buttonType.intent, .neutral, "Wrong button intent")
    }

    func test_neutral_tinted() {
        // GIVEN - WHEN
        let buttonType = self.useCase.execute(
            intent: .neutral,
            variant: .tinted
        )

        // THEN
        XCTAssertEqual(buttonType.variant, .tinted, "Wrong button variant")
        XCTAssertEqual(buttonType.intent, .neutral, "Wrong button intent")
    }

    func test_main_filled() {
        // GIVEN - WHEN
        let buttonType = self.useCase.execute(
            intent: .main,
            variant: .filled
        )

        // THEN
        XCTAssertEqual(buttonType.variant, .tinted, "Wrong button variant")
        XCTAssertEqual(buttonType.intent, .main, "Wrong button intent")
    }

    func test_main_tinted() {
        // GIVEN - WHEN
        let buttonType = self.useCase.execute(
            intent: .main,
            variant: .tinted
        )

        // THEN
        XCTAssertEqual(buttonType.variant, .tinted, "Wrong button variant")
        XCTAssertEqual(buttonType.intent, .main, "Wrong button intent")
    }

    func test_support_filled() {
        // GIVEN - WHEN
        let buttonType = self.useCase.execute(
            intent: .support,
            variant: .filled
        )

        // THEN
        XCTAssertEqual(buttonType.variant, .tinted, "Wrong button variant")
        XCTAssertEqual(buttonType.intent, .support, "Wrong button intent")
    }

    func test_support_tinted() {
        // GIVEN - WHEN
        let buttonType = self.useCase.execute(
            intent: .support,
            variant: .tinted
        )

        // THEN
        XCTAssertEqual(buttonType.variant, .tinted, "Wrong button variant")
        XCTAssertEqual(buttonType.intent, .support, "Wrong button intent")
    }

    func test_accent_filled() {
        // GIVEN - WHEN
        let buttonType = self.useCase.execute(
            intent: .accent,
            variant: .filled
        )

        // THEN
        XCTAssertEqual(buttonType.variant, .tinted, "Wrong button variant")
        XCTAssertEqual(buttonType.intent, .accent, "Wrong button intent")
    }

    func test_accent_tinted() {
        // GIVEN - WHEN
        let buttonType = self.useCase.execute(
            intent: .accent,
            variant: .tinted
        )

        // THEN
        XCTAssertEqual(buttonType.variant, .tinted, "Wrong button variant")
        XCTAssertEqual(buttonType.intent, .accent, "Wrong button intent")
    }

    func test_surfaceInverse_filled() {
        // GIVEN - WHEN
        let buttonType = self.useCase.execute(
            intent: .surfaceInverse,
            variant: .filled
        )

        // THEN
        XCTAssertEqual(buttonType.variant, .ghost, "Wrong button variant")
        XCTAssertEqual(buttonType.intent, .surface, "Wrong button intent")
    }

    func test_surfaceInverse_tinted() {
        // GIVEN - WHEN
        let buttonType = self.useCase.execute(
            intent: .surfaceInverse,
            variant: .tinted
        )

        // THEN
        XCTAssertEqual(buttonType.variant, .ghost, "Wrong button variant")
        XCTAssertEqual(buttonType.intent, .surface, "Wrong button intent")
    }
}
