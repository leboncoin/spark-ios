//
//  ProgressTrackerGetColorsUseCaseTests.swift
//  SparkComponentProgressTrackerUnitTests
//
//  Created by Michael Zimmermann on 18.01.24.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import Foundation
import Testing
@testable import SparkComponentProgressTracker
@_spi(SI_SPI) @testable import SparkComponentProgressTrackerTesting
@_spi(SI_SPI) import SparkThemingTesting

@Suite("ProgressTracker Get Colors UseCase Tests")
struct ProgressTrackerGetColorsUseCaseTests {

    // MARK: - Properties

    let sut: ProgressTrackerGetColorsUseCase
    let theme: ThemeGeneratedMock
    let outlinedUseCase: ProgressTrackerGetVariantColorsUseCaseableGeneratedMock
    let tintedUseCase: ProgressTrackerGetVariantColorsUseCaseableGeneratedMock

    // MARK: - Setup

    init() {
        self.theme = ThemeGeneratedMock.mocked()
        self.outlinedUseCase = ProgressTrackerGetVariantColorsUseCaseableGeneratedMock()
        self.tintedUseCase = ProgressTrackerGetVariantColorsUseCaseableGeneratedMock()
        self.sut = ProgressTrackerGetColorsUseCase(
            getTintedColorsUseCase: self.tintedUseCase,
            getOutlinedColorsUseCase: self.outlinedUseCase
        )
    }

    // MARK: - Tests

    @Test("Tinted variant should return the tinted colors")
    func tintedColors() {
        // GIVEN
        let colors = self.theme.colors
        let expectedColors = ProgressTrackerColors(
            background: colors.main.mainContainer,
            outline: colors.main.mainContainer,
            content: colors.main.onMainContainer)

        self.tintedUseCase.executeWithColorsAndIntentAndStateReturnValue = expectedColors

        // WHEN
        let tabColors = self.sut.execute(
            colors: colors,
            intent: .support,
            variant: .tinted,
            state: .normal)

        // THEN
        #expect(tabColors == expectedColors)
    }

    @Test("Outlined variant should return the outlined colors")
    func outlinedColors() {
        // GIVEN
        let colors = self.theme.colors
        let expectedColors = ProgressTrackerColors(
            background: colors.main.mainContainer,
            outline: colors.main.main,
            content: colors.main.main)

        self.outlinedUseCase.executeWithColorsAndIntentAndStateReturnValue = expectedColors

        // WHEN
        let tabColors = self.sut.execute(
            colors: colors,
            intent: .support,
            variant: .outlined,
            state: .normal)

        // THEN
        #expect(tabColors == expectedColors)
    }
}
