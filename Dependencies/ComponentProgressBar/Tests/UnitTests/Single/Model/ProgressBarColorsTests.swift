//
//  ProgressBarColorsTests.swift
//  SparkComponentProgressBarTests
//
//  Created by robin.lemaire on 16/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

@testable import SparkComponentProgressBar
@_spi(SI_SPI) import SparkThemingTesting
@_spi(SI_SPI) import SparkTheming
import XCTest

final class ProgressBarColorsTests: XCTestCase {

    // MARK: - Tests

    func test_default_initialization() {
        // GIVEN / WHEN
        let colors = ProgressBarColors()

        // THEN
        XCTAssertTrue(colors.trackBackgroundColorToken is ColorTokenClear)
        XCTAssertTrue(colors.indicatorBackgroundColorToken is ColorTokenClear)
    }

    func test_mutable_properties_can_be_modified() {
        // GIVEN
        var colors = ProgressBarColors()
        let newTrackColor = ColorTokenClear()
        let newIndicatorColor = ColorTokenClear()

        // WHEN
        colors.trackBackgroundColorToken = newTrackColor
        colors.indicatorBackgroundColorToken = newIndicatorColor

        // THEN
        XCTAssertTrue(colors.trackBackgroundColorToken.equals(newTrackColor))
        XCTAssertTrue(colors.indicatorBackgroundColorToken.equals(newIndicatorColor))
    }

    func test_property_modification_affects_equality() {
        // GIVEN
        var colors1 = ProgressBarColors()
        let colors2 = ProgressBarColors()

        // Initial state - should be equal
        XCTAssertEqual(colors1, colors2)

        // WHEN - modify one property
        colors1.trackBackgroundColorToken = ColorTokenClear()

        // THEN - still equal since both use ColorTokenClear
        XCTAssertEqual(colors1, colors2)
    }

    func test_equatable() {
        // GIVEN
        let trackBackgroundColorTokenToken1 = ColorTokenGeneratedMock.red()
        let indicatorBackgroundColorTokenToken1 = ColorTokenGeneratedMock.purple()

        let trackBackgroundColorTokenToken2 = ColorTokenGeneratedMock.red()
        let indicatorBackgroundColorTokenToken2 = ColorTokenGeneratedMock.purple()

        let differentTrackBackgroundColorTokenToken = ColorTokenGeneratedMock.green()
        let differentIndicatorBackgroundColorTokenToken = ColorTokenGeneratedMock.yellow()

        let colors1 = ProgressBarColors(trackBackgroundColorToken: trackBackgroundColorTokenToken1, indicatorBackgroundColorToken: indicatorBackgroundColorTokenToken1)
        let colors2 = ProgressBarColors(trackBackgroundColorToken: trackBackgroundColorTokenToken2, indicatorBackgroundColorToken: indicatorBackgroundColorTokenToken2)

        let colors3 = ProgressBarColors(trackBackgroundColorToken: differentTrackBackgroundColorTokenToken, indicatorBackgroundColorToken: indicatorBackgroundColorTokenToken1)
        let colors4 = ProgressBarColors(trackBackgroundColorToken: trackBackgroundColorTokenToken1, indicatorBackgroundColorToken: differentIndicatorBackgroundColorTokenToken)

        // WHEN / THEN
        XCTAssertEqual(colors1, colors2)
        XCTAssertNotEqual(colors1, colors3)
        XCTAssertNotEqual(colors1, colors4)
    }
}
