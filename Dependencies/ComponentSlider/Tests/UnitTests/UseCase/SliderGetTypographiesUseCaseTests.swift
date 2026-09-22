//
//  SliderGetTypographiesUseCaseTests.swift
//  SparkComponentSliderTests
//
//  Created by robin.lemaire on 21/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentSlider
@_spi(SI_SPI) import SparkThemingTesting
import XCTest

final class SliderGetTypographiesUseCaseTests: XCTestCase {

    // MARK: - Private properties

    private var sut: SliderGetTypographiesUseCase!
    private var theme: ThemeGeneratedMock!

    // MARK: - Setup

    override func setUp() {
        super.setUp()

        self.sut = SliderGetTypographiesUseCase()
        self.theme = ThemeGeneratedMock.mocked()
    }

    // MARK: - Tests

    func test_execute_when_isFloatingValueLabel_is_false() {
        // GIVEN / WHEN
        let result = self.sut.execute(theme: self.theme, isFloatingValueLabel: false)

        // THEN
        XCTAssertTrue(result.titleFontToken.equals(self.theme.typography.body1))
        XCTAssertTrue(result.valueFontToken.equals(self.theme.typography.body1Highlight))
        XCTAssertTrue(result.rangeValuesFontToken.equals(self.theme.typography.body2))
    }

    func test_execute_when_isFloatingValueLabel_is_true() {
        // GIVEN / WHEN
        let result = self.sut.execute(theme: self.theme, isFloatingValueLabel: true)

        // THEN
        XCTAssertTrue(result.titleFontToken.equals(self.theme.typography.body1Highlight))
        XCTAssertTrue(result.valueFontToken.equals(self.theme.typography.body2Highlight))
        XCTAssertTrue(result.rangeValuesFontToken.equals(self.theme.typography.body2))
    }
}
