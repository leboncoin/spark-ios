//
//  SliderGetCornerRadiiUseCaseTests.swift
//  SparkComponentSliderUnitTests
//
//  Created by louis.borlee on 23/11/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentSlider
import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

final class SliderGetCornerRadiiUseCaseDeprecatedTests: XCTestCase {

    private let theme: any Theme = ThemeGeneratedMock.mocked()

    func test_execute_shape_rounded() {
        // GIVEN
        let sut = SliderGetCornerRadiiUseCaseDeprecated()
        let expectedRadii = SliderRadiiDeprecated(
            trackRadius: self.theme.border.radius.small,
            indicatorRadius: self.theme.border.radius.small
        )

        // WHEN
        let radii = sut.execute(theme: self.theme, shape: .rounded)

        // THEN
        XCTAssertEqual(radii, expectedRadii)
    }

    func test_execute_shape_square() {
        // GIVEN
        let sut = SliderGetCornerRadiiUseCaseDeprecated()
        let expectedRadii = SliderRadiiDeprecated(
            trackRadius: self.theme.border.radius.none,
            indicatorRadius: self.theme.border.radius.none
        )

        // WHEN
        let radii = sut.execute(theme: self.theme, shape: .square)

        // THEN
        XCTAssertEqual(radii, expectedRadii)
    }
}
