//
//  PopoverGetSpacesUseCaseTests.swift
//  SparkComponentPopoverUnitTests
//
//  Created by louis.borlee on 25/06/2024.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentPopover
@_spi(SI_SPI) import SparkThemingTesting

@Suite("Popover Get Spaces UseCase Tests")
struct PopoverGetSpacesUseCaseTests {

    private let theme = ThemeGeneratedMock.mocked()
    private let useCase = PopoverGetSpacesUseCase()

    // MARK: - Tests

    @Test("Execute when is liquid glass is false")
    func executeWhenIsLiquidGlassIsFalse() {
        // WHEN
        let spaces = self.useCase.execute(layoutSpacing: self.theme.layout.spacing, isLiquidGlass: false)

        // THEN
        #expect(spaces.horizontal == self.theme.layout.spacing.large, "Wrong horizontal spacing")
        #expect(spaces.vertical == self.theme.layout.spacing.large, "Wrong vertical spacing")
    }

    @Test("Execute when is liquid glass is true")
    func executeWhenIsLiquidGlassIsTrue() {
        // WHEN
        let spaces = self.useCase.execute(layoutSpacing: self.theme.layout.spacing, isLiquidGlass: true)

        // THEN
        #expect(spaces.horizontal == self.theme.layout.spacing.xLarge, "Wrong horizontal spacing")
        #expect(spaces.vertical == self.theme.layout.spacing.large, "Wrong vertical spacing")
    }

}
