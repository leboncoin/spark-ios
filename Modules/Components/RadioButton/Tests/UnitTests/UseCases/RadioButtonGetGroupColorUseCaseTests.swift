//
//  RadioButtonGetGroupColorUseCaseTests.swift
//  SparkComponentRadioButtonTests
//
//  Created by michael.zimmermann on 06.07.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

@testable import SparkComponentRadioButton
@_spi(SI_SPI) import SparkThemingTesting
import Testing

@Suite("Radio Button Get Group Color UseCase Tests")
struct RadioButtonGetGroupColorUseCaseTests {

    var sut: RadioButtonGetGroupColorUseCase!
    var colors: ColorsGeneratedMock!

    init() {
        self.sut = RadioButtonGetGroupColorUseCase()
        self.colors = ColorsGeneratedMock.mocked()
    }
    // MARK: - Tests

    @Test("Alert")
    func alert() {
        // When
        let colorToken = sut.execute(colors: colors, intent: .alert)

        // Then
        #expect(colorToken.uiColor == colors.feedback.alert.uiColor)
        #expect(colorToken.color == colors.feedback.alert.color)
    }

    @Test("Danger")
    func danger() {
        // When
        let colorToken = sut.execute(colors: colors, intent: .danger)

        // Then
        #expect(colorToken.uiColor == colors.feedback.error.uiColor)
        #expect(colorToken.color == colors.feedback.error.color)
    }

    @Test("Success")
    func success() {
        // When
        let colorToken = sut.execute(colors: colors, intent: .success)

        // Then
        #expect(colorToken.uiColor == colors.feedback.success.uiColor)
        #expect(colorToken.color == colors.feedback.success.color)
    }

    @Test("Accent")
    func accent() {
        // When
        let colorToken = sut.execute(colors: colors, intent: .accent)

        // Then
        #expect(colorToken.uiColor == colors.accent.accent.uiColor)
        #expect(colorToken.color == colors.accent.accent.color)
    }

    @Test("Main")
    func main() {
        // When
        let colorToken = sut.execute(colors: colors, intent: .main)

        // Then
        #expect(colorToken.uiColor == colors.main.main.uiColor)
        #expect(colorToken.color == colors.main.main.color)
    }

    @Test("Support")
    func support() {
        // When
        let colorToken = sut.execute(colors: colors, intent: .support)

        // Then
        #expect(colorToken.uiColor == colors.support.support.uiColor)
        #expect(colorToken.color == colors.support.support.color)
    }

    @Test("Info")
    func info() {
        // When
        let colorToken = sut.execute(colors: colors, intent: .info)

        // Then
        #expect(colorToken.uiColor == colors.feedback.info.uiColor)
        #expect(colorToken.color == colors.feedback.info.color)
    }

    @Test("Neutral")
    func neutral() {
        // When
        let colorToken = sut.execute(colors: colors, intent: .neutral)

        // Then
        #expect(colorToken.uiColor == colors.feedback.neutral.uiColor)
        #expect(colorToken.color == colors.feedback.neutral.color)
    }

}
