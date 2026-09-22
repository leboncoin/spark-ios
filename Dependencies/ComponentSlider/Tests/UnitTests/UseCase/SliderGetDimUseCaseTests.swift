//
//  SliderGetDimUseCaseTests.swift
//  SparkComponentSliderTests
//
//  Created by robin.lemaire on 21/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import XCTest
@testable import SparkComponentSlider
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

final class SliderGetDimUseCaseTests: XCTestCase {

    // MARK: - Properties

    var sut: SliderGetDimUseCase!
    var theme: ThemeGeneratedMock!

    // MARK: - Setup

    override func setUp() {
        super.setUp()

        self.theme = ThemeGeneratedMock.mocked()
        self.sut = SliderGetDimUseCase()
    }

    // MARK: - Tests

    func test_execute_when_enabled_returns_none_dim() {
        // GIVEN
        let expectedDim = self.theme.dims.none

        // WHEN
        let result = self.sut.execute(
            theme: self.theme,
            isEnabled: true
        )

        // THEN
        XCTAssertEqual(result, expectedDim)
    }

    func test_execute_when_disabled_returns_dim3() {
        // GIVEN
        let expectedDim = self.theme.dims.dim3

        // WHEN
        let result = self.sut.execute(
            theme: self.theme,
            isEnabled: false
        )

        // THEN
        XCTAssertEqual(result, expectedDim)
    }
}
