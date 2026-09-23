//
//  SliderGetSpacingUseCaseTests.swift
//  SparkComponentSliderTests
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentSlider
@_spi(SI_SPI) import SparkThemingTesting
import XCTest

final class SliderGetSpacingUseCaseTests: XCTestCase {

    // MARK: - Private properties

    private var sut: SliderGetSpacingUseCase!
    private var theme: ThemeGeneratedMock!

    // MARK: - Setup

    override func setUp() {
        super.setUp()

        self.sut = SliderGetSpacingUseCase()
        self.theme = ThemeGeneratedMock.mocked()
    }

    // MARK: - Tests

    func test_execute_returns_correct_spacing() {
        // GIVEN / WHEN
        let result = self.sut.execute(theme: self.theme)

        // THEN
        XCTAssertEqual(result, self.theme.layout.spacing.small)
    }
}
