//
//  TagGetSpacingsUseCaseTests.swift
//  SparkComponentTagTests
//
//  Created by robin.lemaire on 06/08/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentTag
@_spi(SI_SPI) import SparkThemingTesting

struct TagGetSpacingsUseCaseTests {

    // MARK: - Tests

    @Test
    func test_execute() {
        // GIVEN
        let theme = ThemeGeneratedMock.mocked()
        let useCase = TagGetSpacingsUseCase()

        // WHEN
        let spacings = useCase.execute(theme: theme)

        // THEN
        #expect(spacings.horizontalPadding == theme.layout.spacing.medium)
        #expect(spacings.horizontalSpacing == theme.layout.spacing.small)
    }
}
