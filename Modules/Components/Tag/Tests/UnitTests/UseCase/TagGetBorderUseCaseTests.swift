//
//  TagGetBorderUseCaseTests.swift
//  SparkComponentTagTests
//
//  Created by robin.lemaire on 06/08/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentTag
@_spi(SI_SPI) import SparkThemingTesting
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonTesting

struct TagGetBorderUseCaseTests {

    // MARK: - Properties

    private let theme = ThemeGeneratedMock.mocked()

    // MARK: - Tests

    @Test
    func test_execute_with_medium_size() {
        // GIVEN
        let useCase = TagGetBorderUseCase()

        // WHEN
        let border = useCase.execute(
            theme: self.theme,
            size: .medium
        )

        // THEN
        #expect(border.width == self.theme.border.width.small)
        #expect(border.radius == self.theme.border.radius.small)
    }

    @Test
    func test_execute_with_large_size() {
        // GIVEN
        let useCase = TagGetBorderUseCase()

        // WHEN
        let border = useCase.execute(
            theme: self.theme,
            size: .large
        )

        // THEN
        #expect(border.width == self.theme.border.width.small)
        #expect(border.radius == self.theme.border.radius.small)
    }
}
