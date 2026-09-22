//
//  DividerGetColorsUseCaseTests.swift
//  SparkComponentDividerTests
//
//  Created by robin.lemaire on 12/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
import SparkTheming

@_spi(SI_SPI) import SparkComponentDividerTesting
@_spi(SI_SPI) import SparkThemingTesting

@testable import SparkComponentDivider

final class DividerGetColorsUseCaseTests: XCTestCase {

    // MARK: - Properties

    private var theme: ThemeGeneratedMock!
    private var useCase: DividerGetColorsUseCase!

    // MARK: - Setup

    override func setUp() {
        super.setUp()
        self.theme = ThemeGeneratedMock.mocked()
        self.useCase = DividerGetColorsUseCase()
    }

    override func tearDown() {
        self.theme = nil
        self.useCase = nil
        super.tearDown()
    }

    // MARK: - Active Intent Tests

    func test_execute_outline() {
        // GIVEN
        let intent: DividerIntent = .outline

        // WHEN
        let dividerColors = self.useCase.execute(
            theme: self.theme,
            intent: intent
        )

        // THEN
        XCTAssertTrue(
            dividerColors.text.equals(theme.colors.base.onSurface),
            "Text color should be onSurface for outline intent"
        )
        XCTAssertTrue(
            dividerColors.separator.equals(theme.colors.base.outline),
            "Separator color should be outline for outline intent"
        )
    }

    func test_execute_outlineHigh() {
        // GIVEN
        let intent: DividerIntent = .outlineHigh

        // WHEN
        let dividerColors = self.useCase.execute(
            theme: self.theme,
            intent: intent
        )

        // THEN
        XCTAssertTrue(
            dividerColors.text.equals(theme.colors.base.onSurface),
            "Text color should be onSurface for outlineHigh intent"
        )
        XCTAssertTrue(
            dividerColors.separator.equals(theme.colors.base.outlineHigh),
            "Separator color should be outlineHigh for outlineHigh intent"
        )
    }

    // MARK: - Deprecated Intent Tests (Default Fallback)

    func test_execute_deprecated_accent_fallsback_to_outline() {
        // GIVEN
        let intent: DividerIntent = .accent

        // WHEN
        let dividerColors = self.useCase.execute(
            theme: self.theme,
            intent: intent
        )

        // THEN
        XCTAssertTrue(
            dividerColors.text.equals(theme.colors.base.onSurface),
            "Text color should be onSurface for deprecated intent"
        )
        XCTAssertTrue(
            dividerColors.separator.equals(theme.colors.base.outline),
            "Separator color should fallback to outline for deprecated intent"
        )
    }

    func test_execute_deprecated_support_fallsback_to_outline() {
        // GIVEN
        let intent: DividerIntent = .support

        // WHEN
        let dividerColors = self.useCase.execute(
            theme: self.theme,
            intent: intent
        )

        // THEN
        XCTAssertTrue(
            dividerColors.text.equals(theme.colors.base.onSurface),
            "Text color should be onSurface for deprecated intent"
        )
        XCTAssertTrue(
            dividerColors.separator.equals(theme.colors.base.outline),
            "Separator color should fallback to outline for deprecated intent"
        )
    }

    func test_execute_deprecated_success_fallsback_to_outline() {
        // GIVEN
        let intent: DividerIntent = .success

        // WHEN
        let dividerColors = self.useCase.execute(
            theme: self.theme,
            intent: intent
        )

        // THEN
        XCTAssertTrue(
            dividerColors.text.equals(theme.colors.base.onSurface),
            "Text color should be onSurface for deprecated intent"
        )
        XCTAssertTrue(
            dividerColors.separator.equals(theme.colors.base.outline),
            "Separator color should fallback to outline for deprecated intent"
        )
    }

    func test_execute_deprecated_alert_fallsback_to_outline() {
        // GIVEN
        let intent: DividerIntent = .alert

        // WHEN
        let dividerColors = self.useCase.execute(
            theme: self.theme,
            intent: intent
        )

        // THEN
        XCTAssertTrue(
            dividerColors.text.equals(theme.colors.base.onSurface),
            "Text color should be onSurface for deprecated intent"
        )
        XCTAssertTrue(
            dividerColors.separator.equals(theme.colors.base.outline),
            "Separator color should fallback to outline for deprecated intent"
        )
    }

    func test_execute_deprecated_error_fallsback_to_outline() {
        // GIVEN
        let intent: DividerIntent = .error

        // WHEN
        let dividerColors = self.useCase.execute(
            theme: self.theme,
            intent: intent
        )

        // THEN
        XCTAssertTrue(
            dividerColors.text.equals(theme.colors.base.onSurface),
            "Text color should be onSurface for deprecated intent"
        )
        XCTAssertTrue(
            dividerColors.separator.equals(theme.colors.base.outline),
            "Separator color should fallback to outline for deprecated intent"
        )
    }

    func test_execute_deprecated_info_fallsback_to_outline() {
        // GIVEN
        let intent: DividerIntent = .info

        // WHEN
        let dividerColors = self.useCase.execute(
            theme: self.theme,
            intent: intent
        )

        // THEN
        XCTAssertTrue(
            dividerColors.text.equals(theme.colors.base.onSurface),
            "Text color should be onSurface for deprecated intent"
        )
        XCTAssertTrue(
            dividerColors.separator.equals(theme.colors.base.outline),
            "Separator color should fallback to outline for deprecated intent"
        )
    }

    func test_execute_deprecated_neutral_fallsback_to_outline() {
        // GIVEN
        let intent: DividerIntent = .neutral

        // WHEN
        let dividerColors = self.useCase.execute(
            theme: self.theme,
            intent: intent
        )

        // THEN
        XCTAssertTrue(
            dividerColors.text.equals(theme.colors.base.onSurface),
            "Text color should be onSurface for deprecated intent"
        )
        XCTAssertTrue(
            dividerColors.separator.equals(theme.colors.base.outline),
            "Separator color should fallback to outline for deprecated intent"
        )
    }

    func test_execute_deprecated_main_fallsback_to_outline() {
        // GIVEN
        let intent: DividerIntent = .main

        // WHEN
        let dividerColors = self.useCase.execute(
            theme: self.theme,
            intent: intent
        )

        // THEN
        XCTAssertTrue(
            dividerColors.text.equals(theme.colors.base.onSurface),
            "Text color should be onSurface for deprecated intent"
        )
        XCTAssertTrue(
            dividerColors.separator.equals(theme.colors.base.outline),
            "Separator color should fallback to outline for deprecated intent"
        )
    }
}
