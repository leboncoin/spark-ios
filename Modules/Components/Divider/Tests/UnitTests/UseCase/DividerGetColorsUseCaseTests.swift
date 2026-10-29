//
//  DividerGetColorsUseCaseTests.swift
//  SparkComponentDividerTests
//
//  Created by robin.lemaire on 12/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
import SparkTheming

@_spi(SI_SPI) import SparkComponentDividerTesting
@_spi(SI_SPI) import SparkThemingTesting

@testable import SparkComponentDivider

@Suite("Divider Get Colors UseCase Tests")
struct DividerGetColorsUseCaseTests {

    // MARK: - Properties

    private let theme: ThemeGeneratedMock
    private let useCase: DividerGetColorsUseCase

    // MARK: - Setup

    init() {
        self.theme = ThemeGeneratedMock.mocked()
        self.useCase = DividerGetColorsUseCase()
    }

    // MARK: - Active Intent Tests

    @Test("Execute outline")
    func executeOutline() {
        // GIVEN
        let intent: DividerIntent = .outline

        // WHEN
        let dividerColors = self.useCase.execute(
            theme: self.theme,
            intent: intent
        )

        // THEN
        #expect(
            dividerColors.text.equals(theme.colors.base.onSurface),
            "Text color should be onSurface for outline intent"
        )
        #expect(
            dividerColors.separator.equals(theme.colors.base.outline),
            "Separator color should be outline for outline intent"
        )
    }

    @Test("Execute outline high")
    func executeOutlineHigh() {
        // GIVEN
        let intent: DividerIntent = .outlineHigh

        // WHEN
        let dividerColors = self.useCase.execute(
            theme: self.theme,
            intent: intent
        )

        // THEN
        #expect(
            dividerColors.text.equals(theme.colors.base.onSurface),
            "Text color should be onSurface for outlineHigh intent"
        )
        #expect(
            dividerColors.separator.equals(theme.colors.base.outlineHigh),
            "Separator color should be outlineHigh for outlineHigh intent"
        )
    }

    // MARK: - Deprecated Intent Tests (Default Fallback)

    @Test("Execute deprecated accent fallsback to outline")
    func executeDeprecatedAccentFallsbackToOutline() {
        // GIVEN
        let intent: DividerIntent = .accent

        // WHEN
        let dividerColors = self.useCase.execute(
            theme: self.theme,
            intent: intent
        )

        // THEN
        #expect(
            dividerColors.text.equals(theme.colors.base.onSurface),
            "Text color should be onSurface for deprecated intent"
        )
        #expect(
            dividerColors.separator.equals(theme.colors.base.outline),
            "Separator color should fallback to outline for deprecated intent"
        )
    }

    @Test("Execute deprecated support fallsback to outline")
    func executeDeprecatedSupportFallsbackToOutline() {
        // GIVEN
        let intent: DividerIntent = .support

        // WHEN
        let dividerColors = self.useCase.execute(
            theme: self.theme,
            intent: intent
        )

        // THEN
        #expect(
            dividerColors.text.equals(theme.colors.base.onSurface),
            "Text color should be onSurface for deprecated intent"
        )
        #expect(
            dividerColors.separator.equals(theme.colors.base.outline),
            "Separator color should fallback to outline for deprecated intent"
        )
    }

    @Test("Execute deprecated success fallsback to outline")
    func executeDeprecatedSuccessFallsbackToOutline() {
        // GIVEN
        let intent: DividerIntent = .success

        // WHEN
        let dividerColors = self.useCase.execute(
            theme: self.theme,
            intent: intent
        )

        // THEN
        #expect(
            dividerColors.text.equals(theme.colors.base.onSurface),
            "Text color should be onSurface for deprecated intent"
        )
        #expect(
            dividerColors.separator.equals(theme.colors.base.outline),
            "Separator color should fallback to outline for deprecated intent"
        )
    }

    @Test("Execute deprecated alert fallsback to outline")
    func executeDeprecatedAlertFallsbackToOutline() {
        // GIVEN
        let intent: DividerIntent = .alert

        // WHEN
        let dividerColors = self.useCase.execute(
            theme: self.theme,
            intent: intent
        )

        // THEN
        #expect(
            dividerColors.text.equals(theme.colors.base.onSurface),
            "Text color should be onSurface for deprecated intent"
        )
        #expect(
            dividerColors.separator.equals(theme.colors.base.outline),
            "Separator color should fallback to outline for deprecated intent"
        )
    }

    @Test("Execute deprecated error fallsback to outline")
    func executeDeprecatedErrorFallsbackToOutline() {
        // GIVEN
        let intent: DividerIntent = .error

        // WHEN
        let dividerColors = self.useCase.execute(
            theme: self.theme,
            intent: intent
        )

        // THEN
        #expect(
            dividerColors.text.equals(theme.colors.base.onSurface),
            "Text color should be onSurface for deprecated intent"
        )
        #expect(
            dividerColors.separator.equals(theme.colors.base.outline),
            "Separator color should fallback to outline for deprecated intent"
        )
    }

    @Test("Execute deprecated info fallsback to outline")
    func executeDeprecatedInfoFallsbackToOutline() {
        // GIVEN
        let intent: DividerIntent = .info

        // WHEN
        let dividerColors = self.useCase.execute(
            theme: self.theme,
            intent: intent
        )

        // THEN
        #expect(
            dividerColors.text.equals(theme.colors.base.onSurface),
            "Text color should be onSurface for deprecated intent"
        )
        #expect(
            dividerColors.separator.equals(theme.colors.base.outline),
            "Separator color should fallback to outline for deprecated intent"
        )
    }

    @Test("Execute deprecated neutral fallsback to outline")
    func executeDeprecatedNeutralFallsbackToOutline() {
        // GIVEN
        let intent: DividerIntent = .neutral

        // WHEN
        let dividerColors = self.useCase.execute(
            theme: self.theme,
            intent: intent
        )

        // THEN
        #expect(
            dividerColors.text.equals(theme.colors.base.onSurface),
            "Text color should be onSurface for deprecated intent"
        )
        #expect(
            dividerColors.separator.equals(theme.colors.base.outline),
            "Separator color should fallback to outline for deprecated intent"
        )
    }

    @Test("Execute deprecated main fallsback to outline")
    func executeDeprecatedMainFallsbackToOutline() {
        // GIVEN
        let intent: DividerIntent = .main

        // WHEN
        let dividerColors = self.useCase.execute(
            theme: self.theme,
            intent: intent
        )

        // THEN
        #expect(
            dividerColors.text.equals(theme.colors.base.onSurface),
            "Text color should be onSurface for deprecated intent"
        )
        #expect(
            dividerColors.separator.equals(theme.colors.base.outline),
            "Separator color should fallback to outline for deprecated intent"
        )
    }
}
