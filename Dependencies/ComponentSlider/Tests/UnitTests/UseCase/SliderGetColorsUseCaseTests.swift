//
//  SliderGetColorsUseCaseTests.swift
//  SparkComponentSliderTests
//
//  Created by robin.lemaire on 21/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentSlider
@_spi(SI_SPI) import SparkThemingTesting
import XCTest

final class SliderGetColorsUseCaseTests: XCTestCase {

    // MARK: - Private properties

    private var sut: SliderGetColorsUseCase!
    private var theme: ThemeGeneratedMock!

    // MARK: - Setup

    override func setUp() {
        super.setUp()

        self.sut = SliderGetColorsUseCase()
        self.theme = ThemeGeneratedMock.mocked()
    }

    // MARK: - Tests

    func test_execute_accent() {
        // GIVEN / WHEN
        let result = self.sut.execute(theme: self.theme, intent: .accent)

        // THEN
        XCTAssertTrue(result.tintColorToken.equals(self.theme.colors.accent.accent))
        XCTAssertTrue(result.titleColorToken.equals(self.theme.colors.base.onSurface))
        XCTAssertTrue(result.titleColorToken.equals(self.theme.colors.base.onSurface))
        XCTAssertTrue(result.valueColorToken.equals(self.theme.colors.base.onSurface))
        XCTAssertTrue(result.rangeValuesColorToken.equals(self.theme.colors.base.onSurface.opacity(self.theme.dims.dim1)))
    }

    func test_execute_main() {
        // GIVEN / WHEN
        let result = self.sut.execute(theme: self.theme, intent: .main)

        // THEN
        XCTAssertTrue(result.tintColorToken.equals(self.theme.colors.main.main))
        XCTAssertTrue(result.titleColorToken.equals(self.theme.colors.base.onSurface))
        XCTAssertTrue(result.valueColorToken.equals(self.theme.colors.base.onSurface))
        XCTAssertTrue(result.rangeValuesColorToken.equals(self.theme.colors.base.onSurface.opacity(self.theme.dims.dim1)))
    }

    // MARK: - Tests for deprecated intents

    func test_execute_info() {
        // GIVEN / WHEN
        let result = self.sut.execute(theme: self.theme, intent: .info)

        // THEN
        XCTAssertTrue(result.tintColorToken.equals(self.theme.colors.feedback.info))
        XCTAssertTrue(result.titleColorToken.equals(self.theme.colors.base.onSurface))
        XCTAssertTrue(result.valueColorToken.equals(self.theme.colors.base.onSurface))
        XCTAssertTrue(result.rangeValuesColorToken.equals(self.theme.colors.base.onSurface.opacity(self.theme.dims.dim1)))
    }

    func test_execute_neutral() {
        // GIVEN / WHEN
        let result = self.sut.execute(theme: self.theme, intent: .neutral)

        // THEN
        XCTAssertTrue(result.tintColorToken.equals(self.theme.colors.feedback.neutral))
        XCTAssertTrue(result.titleColorToken.equals(self.theme.colors.base.onSurface))
        XCTAssertTrue(result.valueColorToken.equals(self.theme.colors.base.onSurface))
        XCTAssertTrue(result.rangeValuesColorToken.equals(self.theme.colors.base.onSurface.opacity(self.theme.dims.dim1)))
    }

    func test_execute_support() {
        // GIVEN / WHEN
        let result = self.sut.execute(theme: self.theme, intent: .support)

        // THEN
        XCTAssertTrue(result.tintColorToken.equals(self.theme.colors.support.support))
        XCTAssertTrue(result.titleColorToken.equals(self.theme.colors.base.onSurface))
        XCTAssertTrue(result.valueColorToken.equals(self.theme.colors.base.onSurface))
        XCTAssertTrue(result.rangeValuesColorToken.equals(self.theme.colors.base.onSurface.opacity(self.theme.dims.dim1)))
    }

    func test_execute_alert() {
        // GIVEN / WHEN
        let result = self.sut.execute(theme: self.theme, intent: .alert)

        // THEN
        XCTAssertTrue(result.tintColorToken.equals(self.theme.colors.feedback.alert))
        XCTAssertTrue(result.titleColorToken.equals(self.theme.colors.base.onSurface))
        XCTAssertTrue(result.valueColorToken.equals(self.theme.colors.base.onSurface))
        XCTAssertTrue(result.rangeValuesColorToken.equals(self.theme.colors.base.onSurface.opacity(self.theme.dims.dim1)))
    }

    func test_execute_error() {
        // GIVEN / WHEN
        let result = self.sut.execute(theme: self.theme, intent: .error)

        // THEN
        XCTAssertTrue(result.tintColorToken.equals(self.theme.colors.feedback.error))
        XCTAssertTrue(result.titleColorToken.equals(self.theme.colors.base.onSurface))
        XCTAssertTrue(result.valueColorToken.equals(self.theme.colors.base.onSurface))
        XCTAssertTrue(result.rangeValuesColorToken.equals(self.theme.colors.base.onSurface.opacity(self.theme.dims.dim1)))
    }

    func test_execute_success() {
        // GIVEN / WHEN
        let result = self.sut.execute(theme: self.theme, intent: .success)

        // THEN
        XCTAssertTrue(result.tintColorToken.equals(self.theme.colors.feedback.success))
        XCTAssertTrue(result.titleColorToken.equals(self.theme.colors.base.onSurface))
        XCTAssertTrue(result.valueColorToken.equals(self.theme.colors.base.onSurface))
        XCTAssertTrue(result.rangeValuesColorToken.equals(self.theme.colors.base.onSurface.opacity(self.theme.dims.dim1)))
    }
}
