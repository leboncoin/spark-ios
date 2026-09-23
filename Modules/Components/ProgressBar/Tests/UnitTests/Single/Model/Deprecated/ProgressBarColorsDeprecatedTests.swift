//
//  ProgressBarColorsDeprecatedTests.swift
//  SparkComponentProgressBarTests
//
//  Created by robin.lemaire on 20/09/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

@testable import SparkComponentProgressBar
import SparkTheme
import XCTest

@available(*, deprecated, message: "Not used anymore by the new SparkProgressBar or SparkUIProgressBar")
final class ProgressBarColorsDeprecatedTests: XCTestCase {

    // MARK: - Tests

    func testEqual() {
        let colors = SparkTheme.shared.colors

        let colors1 = ProgressBarColorsDeprecated(
            trackBackgroundColorToken: colors.base.background,
            indicatorBackgroundColorToken: colors.main.main
        )

        let colors2 = ProgressBarColorsDeprecated(
            trackBackgroundColorToken: colors.base.background,
            indicatorBackgroundColorToken: colors.main.main
        )

        XCTAssertEqual(colors1, colors2)
    }

    func testNotEqual() {
        let colors = SparkTheme.shared.colors

        let colors1 = ProgressBarColorsDeprecated(
            trackBackgroundColorToken: colors.base.background,
            indicatorBackgroundColorToken: colors.main.main
        )

        let colors2 = ProgressBarColorsDeprecated(
            trackBackgroundColorToken: colors.base.background,
            indicatorBackgroundColorToken: colors.main.onMain
        )

        XCTAssertNotEqual(colors1, colors2)
    }
}
