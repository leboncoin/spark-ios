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
import Testing

@Suite("Progress Bar Colors Tests")
struct ProgressBarColorsTests {

    // MARK: - Tests

    @Test("Default initialization")
    func defaultInitialization() {
        // GIVEN / WHEN
        let colors = ProgressBarColors()

        // THEN
        #expect(colors.trackBackgroundColorToken is ColorTokenClear)
        #expect(colors.indicatorBackgroundColorToken is ColorTokenClear)
    }

    @Test("Mutable properties can be modified")
    func mutablePropertiesCanBeModified() {
        // GIVEN
        var colors = ProgressBarColors()
        let newTrackColor = ColorTokenClear()
        let newIndicatorColor = ColorTokenClear()

        // WHEN
        colors.trackBackgroundColorToken = newTrackColor
        colors.indicatorBackgroundColorToken = newIndicatorColor

        // THEN
        #expect(colors.trackBackgroundColorToken.equals(newTrackColor))
        #expect(colors.indicatorBackgroundColorToken.equals(newIndicatorColor))
    }

    @Test("Property modification affects equality")
    func propertyModificationAffectsEquality() {
        // GIVEN
        var colors1 = ProgressBarColors()
        let colors2 = ProgressBarColors()

        // Initial state - should be equal
        #expect(colors1 == colors2)

        // WHEN - modify one property
        colors1.trackBackgroundColorToken = ColorTokenClear()

        // THEN - still equal since both use ColorTokenClear
        #expect(colors1 == colors2)
    }

    @Test("Equatable")
    func equatable() {
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
        #expect(colors1 == colors2)
        #expect(colors1 != colors3)
        #expect(colors1 != colors4)
    }
}
