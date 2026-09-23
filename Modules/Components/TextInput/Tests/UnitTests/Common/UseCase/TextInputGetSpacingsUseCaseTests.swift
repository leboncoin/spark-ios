//
//  TextInputGetSpacingsUseCaseTests.swift
//  SparkTextFieldTests
//
//  Created by robin.lemaire on 20/06/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
import SparkTheming
@testable import SparkComponentTextInput
@_spi(SI_SPI) import SparkThemingTesting

final class TextInputGetSpacingsUseCaseTests: XCTestCase {

    // MARK: - Properties

    private let themeMock = ThemeGeneratedMock.mocked()

    // MARK: - Tests

    func test_execute_withThemeAndNoneBorderStyle() {
        // GIVEN
        let useCase = TextInputGetSpacingsUseCase()

        // WHEN
        let result = useCase.execute(
            theme: self.themeMock,
            borderStyle: .none
        )

        // THEN
        XCTAssertEqual(
            result.horizontal,
            self.themeMock.layout.spacing.none,
            "Wrong horizontal value"
        )
        XCTAssertEqual(
            result.content,
            self.themeMock.layout.spacing.medium,
            "Wrong content value"
        )
    }

    func test_execute_withThemeAndRoundedRectBorderStyle() {
        // GIVEN
        let useCase = TextInputGetSpacingsUseCase()

        // WHEN
        let result = useCase.execute(
            theme: self.themeMock,
            borderStyle: .roundedRect
        )

        // THEN
        XCTAssertEqual(
            result.horizontal,
            self.themeMock.layout.spacing.large,
            "Wrong horizontal value"
        )
        XCTAssertEqual(
            result.content,
            self.themeMock.layout.spacing.medium,
            "Wrong content value"
        )
    }

    func test_execute_withThemeOnly() {
        // GIVEN
        let useCase = TextInputGetSpacingsUseCase()

        // WHEN
        let result = useCase.execute(
            theme: self.themeMock
        )

        // THEN
        XCTAssertEqual(
            result.horizontal,
            self.themeMock.layout.spacing.large,
            "Wrong horizontal value"
        )
        XCTAssertEqual(
            result.content,
            self.themeMock.layout.spacing.medium,
            "Wrong content value"
        )
    }
}
