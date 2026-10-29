//
//  SliderTypographiesTests.swift
//  SparkComponentSliderTests
//
//  Created by robin.lemaire on 21/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
import Testing
@testable import SparkComponentSlider
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

@MainActor
@Suite("Slider Typographies Tests")
struct SliderTypographiesTests {

    // MARK: - Tests

    @Test("Default initialization")
    func defaultInitialization() {
        // GIVEN / WHEN
        let typographies = SliderTypographies()

        // THEN
        #expect(typographies.titleFontToken.equals(TypographyFontTokenClear()))
        #expect(typographies.valueFontToken.equals(TypographyFontTokenClear()))
        #expect(typographies.rangeValuesFontToken.equals(TypographyFontTokenClear()))
    }

    @Test("Equality when same typographies")
    func equalityWhenSameTypographies() {
        // GIVEN / WHEN
        let titleFontToken = TypographyFontTokenGeneratedMock.title()
        let valueFontToken = TypographyFontTokenGeneratedMock.body()
        let rangeValuesFontToken = TypographyFontTokenGeneratedMock.footnote()

        let typographies1 = SliderTypographies(
            titleFontToken: titleFontToken,
            valueFontToken: valueFontToken,
            rangeValuesFontToken: rangeValuesFontToken
        )

        let typographies2 = SliderTypographies(
            titleFontToken: titleFontToken,
            valueFontToken: valueFontToken,
            rangeValuesFontToken: rangeValuesFontToken
        )

        // THEN
        #expect(typographies1 == typographies2)
    }

    @Test("Inequality when different title font")
    func inequalityWhenDifferentTitleFont() {
        // GIVEN / WHEN
        let titleFontToken1 = TypographyFontTokenGeneratedMock.title()
        let titleFontToken2 = TypographyFontTokenGeneratedMock.headline()
        let valueFontToken = TypographyFontTokenGeneratedMock.body()
        let rangeValuesFontToken = TypographyFontTokenGeneratedMock.footnote()

        let typographies1 = SliderTypographies(
            titleFontToken: titleFontToken1,
            valueFontToken: valueFontToken,
            rangeValuesFontToken: rangeValuesFontToken
        )

        let typographies2 = SliderTypographies(
            titleFontToken: titleFontToken2,
            valueFontToken: valueFontToken,
            rangeValuesFontToken: rangeValuesFontToken
        )

        // THEN
        #expect(typographies1 != typographies2)
    }

    @Test("Inequality when different value font")
    func inequalityWhenDifferentValueFont() {
        // GIVEN / WHEN
        let titleFontToken = TypographyFontTokenGeneratedMock.title()
        let valueFontToken1 = TypographyFontTokenGeneratedMock.body()
        let valueFontToken2 = TypographyFontTokenGeneratedMock.footnote()
        let rangeValuesFontToken = TypographyFontTokenGeneratedMock.callout()

        let typographies1 = SliderTypographies(
            titleFontToken: titleFontToken,
            valueFontToken: valueFontToken1,
            rangeValuesFontToken: rangeValuesFontToken
        )

        let typographies2 = SliderTypographies(
            titleFontToken: titleFontToken,
            valueFontToken: valueFontToken2,
            rangeValuesFontToken: rangeValuesFontToken
        )

        // THEN
        #expect(typographies1 != typographies2)
    }

    @Test("Inequality when different range values font")
    func inequalityWhenDifferentRangeValuesFont() {
        // GIVEN / WHEN
        let titleFontToken = TypographyFontTokenGeneratedMock.title()
        let valueFontToken = TypographyFontTokenGeneratedMock.body()
        let rangeValuesFontToken1 = TypographyFontTokenGeneratedMock.footnote()
        let rangeValuesFontToken2 = TypographyFontTokenGeneratedMock.callout()

        let typographies1 = SliderTypographies(
            titleFontToken: titleFontToken,
            valueFontToken: valueFontToken,
            rangeValuesFontToken: rangeValuesFontToken1
        )

        let typographies2 = SliderTypographies(
            titleFontToken: titleFontToken,
            valueFontToken: valueFontToken,
            rangeValuesFontToken: rangeValuesFontToken2
        )

        // THEN
        #expect(typographies1 != typographies2)
    }

    @Test("Hash consistency")
    func hashConsistency() {
        // GIVEN / WHEN
        let titleFontToken = TypographyFontTokenGeneratedMock.title()
        let valueFontToken = TypographyFontTokenGeneratedMock.body()
        let rangeValuesFontToken = TypographyFontTokenGeneratedMock.footnote()

        let typographies = SliderTypographies(
            titleFontToken: titleFontToken,
            valueFontToken: valueFontToken,
            rangeValuesFontToken: rangeValuesFontToken
        )

        var hasher1 = Hasher()
        typographies.hash(into: &hasher1)
        let hash1 = hasher1.finalize()

        var hasher2 = Hasher()
        typographies.hash(into: &hasher2)
        let hash2 = hasher2.finalize()

        // THEN
        #expect(hash1 == hash2)
    }
}
