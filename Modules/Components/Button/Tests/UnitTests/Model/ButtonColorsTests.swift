//
//  ButtonColorsTests.swift
//  SparkComponentButtonTests
//
//  Created by robin.lemaire on 11/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
import Testing
@testable import SparkComponentButton
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

@Suite("Button Colors Tests")
struct ButtonColorsTests {

    // MARK: - Tests

    @Test("Default initialization")
    func defaultInitialization() {
        // GIVEN / WHEN
        let colors = ButtonColors()

        // THEN
        #expect(colors.tintColor.equals(ColorTokenClear()))
        #expect(colors.iconColor.equals(ColorTokenClear()))
        #expect(colors.backgroundColor.equals(ColorTokenClear()))
        #expect(colors.borderColor.equals(ColorTokenClear()))
    }

    @Test("Custom initialization with all properties")
    func customInitializationWithAllProperties() {
        // GIVEN
        let tintColor = ColorTokenGeneratedMock.random()
        let iconColor = ColorTokenGeneratedMock.random()
        let backgroundColor = ColorTokenGeneratedMock.random()
        let borderColor = ColorTokenGeneratedMock.random()

        // WHEN
        let colors = ButtonColors(
            tintColor: tintColor,
            iconColor: iconColor,
            backgroundColor: backgroundColor,
            borderColor: borderColor
        )

        // THEN
        #expect(colors.tintColor.equals(tintColor))
        #expect(colors.iconColor.equals(iconColor))
        #expect(colors.backgroundColor.equals(backgroundColor))
        #expect(colors.borderColor.equals(borderColor))
    }

    @Test("Initialization with tintColor")
    func initializationWithTintColor() {
        // GIVEN
        let tintColor = ColorTokenGeneratedMock.random()
        let backgroundColor = ColorTokenGeneratedMock.random()
        let borderColor = ColorTokenGeneratedMock.random()

        // WHEN
        let colors = ButtonColors(
            tintColor: tintColor,
            backgroundColor: backgroundColor,
            borderColor: borderColor
        )

        // THEN
        #expect(colors.tintColor.equals(tintColor))
        #expect(colors.iconColor.equals(tintColor))
        #expect(colors.backgroundColor.equals(backgroundColor))
        #expect(colors.borderColor.equals(borderColor))
    }

    @Test("Equality when same colors")
    func equalityWhenSameColors() {
        // GIVEN / WHEN
        let tintColor = ColorTokenGeneratedMock.random()
        let iconColor = ColorTokenGeneratedMock.random()
        let backgroundColor = ColorTokenGeneratedMock.random()
        let borderColor = ColorTokenGeneratedMock.random()

        let colors1 = ButtonColors(
            tintColor: tintColor,
            iconColor: iconColor,
            backgroundColor: backgroundColor,
            borderColor: borderColor
        )

        let colors2 = ButtonColors(
            tintColor: tintColor,
            iconColor: iconColor,
            backgroundColor: backgroundColor,
            borderColor: borderColor
        )

        // THEN
        #expect(colors1 == colors2)
    }

    @Test("Equality when using tintColor initializer")
    func equalityWhenUsingTintColorInitializer() {
        // GIVEN / WHEN
        let tintColor = ColorTokenGeneratedMock.random()
        let backgroundColor = ColorTokenGeneratedMock.random()
        let borderColor = ColorTokenGeneratedMock.random()

        let colors1 = ButtonColors(
            tintColor: tintColor,
            backgroundColor: backgroundColor,
            borderColor: borderColor
        )

        let colors2 = ButtonColors(
            tintColor: tintColor,
            backgroundColor: backgroundColor,
            borderColor: borderColor
        )

        // THEN
        #expect(colors1 == colors2)
    }

    @Test("Equality between tintColor and full initializers")
    func equalityBetweenTintColorAndFullInitializers() {
        // GIVEN / WHEN
        let tintColor = ColorTokenGeneratedMock.random()
        let backgroundColor = ColorTokenGeneratedMock.random()
        let borderColor = ColorTokenGeneratedMock.random()

        let colors1 = ButtonColors(
            tintColor: tintColor,
            backgroundColor: backgroundColor,
            borderColor: borderColor
        )

        let colors2 = ButtonColors(
            tintColor: tintColor,
            iconColor: tintColor,
            backgroundColor: backgroundColor,
            borderColor: borderColor
        )

        // THEN
        #expect(colors1 == colors2)
    }

    @Test("Inequality when different title color")
    func inequalityWhenDifferentTintColor() {
        // GIVEN / WHEN
        let tintColor1 = ColorTokenGeneratedMock.random()
        let tintColor2 = ColorTokenGeneratedMock.random()
        let iconColor = ColorTokenGeneratedMock.random()
        let backgroundColor = ColorTokenGeneratedMock.random()
        let borderColor = ColorTokenGeneratedMock.random()

        let colors1 = ButtonColors(
            tintColor: tintColor1,
            iconColor: iconColor,
            backgroundColor: backgroundColor,
            borderColor: borderColor
        )

        let colors2 = ButtonColors(
            tintColor: tintColor2,
            iconColor: iconColor,
            backgroundColor: backgroundColor,
            borderColor: borderColor
        )

        // THEN
        #expect(colors1 != colors2)
    }

    @Test("Inequality when different icon color")
    func inequalityWhenDifferentIconColor() {
        // GIVEN / WHEN
        let tintColor = ColorTokenGeneratedMock.random()
        let iconColor1 = ColorTokenGeneratedMock.random()
        let iconColor2 = ColorTokenGeneratedMock.random()
        let backgroundColor = ColorTokenGeneratedMock.random()
        let borderColor = ColorTokenGeneratedMock.random()

        let colors1 = ButtonColors(
            tintColor: tintColor,
            iconColor: iconColor1,
            backgroundColor: backgroundColor,
            borderColor: borderColor
        )

        let colors2 = ButtonColors(
            tintColor: tintColor,
            iconColor: iconColor2,
            backgroundColor: backgroundColor,
            borderColor: borderColor
        )

        // THEN
        #expect(colors1 != colors2)
    }

    @Test("Inequality when different background color")
    func inequalityWhenDifferentBackgroundColor() {
        // GIVEN / WHEN
        let tintColor = ColorTokenGeneratedMock.random()
        let iconColor = ColorTokenGeneratedMock.random()
        let backgroundColor1 = ColorTokenGeneratedMock.random()
        let backgroundColor2 = ColorTokenGeneratedMock.random()
        let borderColor = ColorTokenGeneratedMock.random()

        let colors1 = ButtonColors(
            tintColor: tintColor,
            iconColor: iconColor,
            backgroundColor: backgroundColor1,
            borderColor: borderColor
        )

        let colors2 = ButtonColors(
            tintColor: tintColor,
            iconColor: iconColor,
            backgroundColor: backgroundColor2,
            borderColor: borderColor
        )

        // THEN
        #expect(colors1 != colors2)
    }

    @Test("Inequality when different border color")
    func inequalityWhenDifferentBorderColor() {
        // GIVEN / WHEN
        let tintColor = ColorTokenGeneratedMock.random()
        let iconColor = ColorTokenGeneratedMock.random()
        let backgroundColor = ColorTokenGeneratedMock.random()
        let borderColor1 = ColorTokenGeneratedMock.random()
        let borderColor2 = ColorTokenGeneratedMock.random()

        let colors1 = ButtonColors(
            tintColor: tintColor,
            iconColor: iconColor,
            backgroundColor: backgroundColor,
            borderColor: borderColor1
        )

        let colors2 = ButtonColors(
            tintColor: tintColor,
            iconColor: iconColor,
            backgroundColor: backgroundColor,
            borderColor: borderColor2
        )

        // THEN
        #expect(colors1 != colors2)
    }

    @Test("Inequality when all colors are different")
    func inequalityWhenAllColorsAreDifferent() {
        // GIVEN / WHEN
        let colors1 = ButtonColors(
            tintColor: ColorTokenGeneratedMock.random(),
            iconColor: ColorTokenGeneratedMock.random(),
            backgroundColor: ColorTokenGeneratedMock.random(),
            borderColor: ColorTokenGeneratedMock.random()
        )

        let colors2 = ButtonColors(
            tintColor: ColorTokenGeneratedMock.random(),
            iconColor: ColorTokenGeneratedMock.random(),
            backgroundColor: ColorTokenGeneratedMock.random(),
            borderColor: ColorTokenGeneratedMock.random()
        )

        // THEN
        #expect(colors1 != colors2)
    }

    @Test("Hash consistency")
    func hashConsistency() {
        // GIVEN / WHEN
        let tintColor = ColorTokenGeneratedMock.random()
        let iconColor = ColorTokenGeneratedMock.random()
        let backgroundColor = ColorTokenGeneratedMock.random()
        let borderColor = ColorTokenGeneratedMock.random()

        let colors1 = ButtonColors(
            tintColor: tintColor,
            iconColor: iconColor,
            backgroundColor: backgroundColor,
            borderColor: borderColor
        )

        let colors2 = ButtonColors(
            tintColor: tintColor,
            iconColor: iconColor,
            backgroundColor: backgroundColor,
            borderColor: borderColor
        )

        // THEN
        #expect(colors1.hashValue == colors2.hashValue)
    }
}
