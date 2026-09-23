//
//  PopoverGetSpacesUseCaseTests.swift
//  SparkComponentPopoverUnitTests
//
//  Created by louis.borlee on 25/06/2024.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentPopover
@_spi(SI_SPI) import SparkThemingTesting

final class PopoverGetSpacesUseCaseTests: XCTestCase {

    private let theme = ThemeGeneratedMock.mocked()
    private let useCase = PopoverGetSpacesUseCase()

    // MARK: - Tests

    func test_execute_when_isLiquidGlass_is_false() {
        // WHEN
        let spaces = self.useCase.execute(layoutSpacing: self.theme.layout.spacing, isLiquidGlass: false)

        // THEN
        XCTAssertEqual(spaces.horizontal, self.theme.layout.spacing.large, "Wrong horizontal spacing")
        XCTAssertEqual(spaces.vertical, self.theme.layout.spacing.large, "Wrong vertical spacing")
    }

    func test_execute_when_isLiquidGlass_is_true() {
        // WHEN
        let spaces = self.useCase.execute(layoutSpacing: self.theme.layout.spacing, isLiquidGlass: true)

        // THEN
        XCTAssertEqual(spaces.horizontal, self.theme.layout.spacing.xLarge, "Wrong horizontal spacing")
        XCTAssertEqual(spaces.vertical, self.theme.layout.spacing.large, "Wrong vertical spacing")
    }

}
