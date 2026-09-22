//
//  DividerGetColorsUseCaseDeprecatedTests.swift
//  SparkComponentDividerTests
//
//  Created by louis.borlee on 17/07/2024.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import XCTest
import Combine
import SparkTheming

@_spi(SI_SPI) import SparkComponentDividerTesting
@_spi(SI_SPI) import SparkThemingTesting

@testable import SparkComponentDivider

final class DividerGetColorsUseCaseDeprecatedTests: XCTestCase {

    func test_execute_outline() {
        // GIVEN
        let useCase = DividerGetColorsUseCaseDeprecated()
        let colors = ColorsGeneratedMock.mocked()

        // WHEN
        let dividerColors = useCase.execute(colors: colors, intent: .outline)

        // THEN
        XCTAssertTrue(dividerColors.text.equals(colors.base.onSurface), "Wrong text color")
        XCTAssertTrue(dividerColors.separator.equals(colors.base.outline), "Wrong separator color")
    }

    func test_execute_outlineHigh() {
        // GIVEN
        let useCase = DividerGetColorsUseCaseDeprecated()
        let colors = ColorsGeneratedMock.mocked()

        // WHEN
        let dividerColors = useCase.execute(colors: colors, intent: .outlineHigh)

        // THEN
        XCTAssertTrue(dividerColors.text.equals(colors.base.onSurface), "Wrong text color")
        XCTAssertTrue(dividerColors.separator.equals(colors.base.outlineHigh), "Wrong separator color")
    }

    func test_execute_accent() {
        // GIVEN
        let useCase = DividerGetColorsUseCaseDeprecated()
        let colors = ColorsGeneratedMock.mocked()

        // WHEN
        let dividerColors = useCase.execute(colors: colors, intent: .accent)

        // THEN
        XCTAssertTrue(dividerColors.text.equals(colors.accent.onAccentContainer), "Wrong text color")
        XCTAssertTrue(dividerColors.separator.equals(colors.accent.onAccentContainer), "Wrong separator color")
    }

    func test_execute_success() {
        // GIVEN
        let useCase = DividerGetColorsUseCaseDeprecated()
        let colors = ColorsGeneratedMock.mocked()

        // WHEN
        let dividerColors = useCase.execute(colors: colors, intent: .success)

        // THEN
        XCTAssertTrue(dividerColors.text.equals(colors.feedback.onSuccessContainer), "Wrong text color")
        XCTAssertTrue(dividerColors.separator.equals(colors.feedback.onSuccessContainer), "Wrong separator color")
    }

    func test_execute_alert() {
        // GIVEN
        let useCase = DividerGetColorsUseCaseDeprecated()
        let colors = ColorsGeneratedMock.mocked()

        // WHEN
        let dividerColors = useCase.execute(colors: colors, intent: .alert)

        // THEN
        XCTAssertTrue(dividerColors.text.equals(colors.feedback.onAlertContainer), "Wrong text color")
        XCTAssertTrue(dividerColors.separator.equals(colors.feedback.onAlertContainer), "Wrong separator color")
    }

    func test_execute_error() {
        // GIVEN
        let useCase = DividerGetColorsUseCaseDeprecated()
        let colors = ColorsGeneratedMock.mocked()

        // WHEN
        let dividerColors = useCase.execute(colors: colors, intent: .error)

        // THEN
        XCTAssertTrue(dividerColors.text.equals(colors.feedback.onErrorContainer), "Wrong text color")
        XCTAssertTrue(dividerColors.separator.equals(colors.feedback.onErrorContainer), "Wrong separator color")
    }

    func test_execute_info() {
        // GIVEN
        let useCase = DividerGetColorsUseCaseDeprecated()
        let colors = ColorsGeneratedMock.mocked()

        // WHEN
        let dividerColors = useCase.execute(colors: colors, intent: .info)

        // THEN
        XCTAssertTrue(dividerColors.text.equals(colors.feedback.onInfoContainer), "Wrong text color")
        XCTAssertTrue(dividerColors.separator.equals(colors.feedback.onInfoContainer), "Wrong separator color")
    }

    func test_execute_neutral() {
        // GIVEN
        let useCase = DividerGetColorsUseCaseDeprecated()
        let colors = ColorsGeneratedMock.mocked()

        // WHEN
        let dividerColors = useCase.execute(colors: colors, intent: .neutral)

        // THEN
        XCTAssertTrue(dividerColors.text.equals(colors.feedback.onNeutralContainer), "Wrong text color")
        XCTAssertTrue(dividerColors.separator.equals(colors.feedback.onNeutralContainer), "Wrong separator color")
    }

    func test_execute_main() {
        // GIVEN
        let useCase = DividerGetColorsUseCaseDeprecated()
        let colors = ColorsGeneratedMock.mocked()

        // WHEN
        let dividerColors = useCase.execute(colors: colors, intent: .main)

        // THEN
        XCTAssertTrue(dividerColors.text.equals(colors.main.onMainContainer), "Wrong text color")
        XCTAssertTrue(dividerColors.separator.equals(colors.main.onMainContainer), "Wrong separator color")
    }

    func test_execute_support() {
        // GIVEN
        let useCase = DividerGetColorsUseCaseDeprecated()
        let colors = ColorsGeneratedMock.mocked()

        // WHEN
        let dividerColors = useCase.execute(colors: colors, intent: .support)

        // THEN
        XCTAssertTrue(dividerColors.text.equals(colors.support.onSupportContainer), "Wrong text color")
        XCTAssertTrue(dividerColors.separator.equals(colors.support.onSupportContainer), "Wrong separator color")
    }
}
