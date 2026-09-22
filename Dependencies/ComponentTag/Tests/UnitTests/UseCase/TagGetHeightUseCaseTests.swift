//
//  TagGetHeightUseCaseTests.swift
//  SparkComponentTagTests
//
//  Created by robin.lemaire on 06/08/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentTag
@_spi(SI_SPI) import SparkThemingTesting

struct TagGetHeightUseCaseTests {

    // MARK: - Tests

    @Test
    func test_execute_with_medium_size() {
        // GIVEN
        let useCase = TagGetHeightUseCase()

        // WHEN
        let height = useCase.execute(size: .medium)

        // THEN
        #expect(height == 20)
    }

    @Test
    func test_execute_with_large_size() {
        // GIVEN
        let useCase = TagGetHeightUseCase()

        // WHEN
        let height = useCase.execute(size: .large)

        // THEN
        #expect(height == 24)
    }
}
