//
//  TextFieldGetAddonPaddingUseCaseTests.swift
//  SparkComponentTextInputTests
//
//  Created by robin.lemaire on 20/06/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
import SwiftUI
@testable import SparkComponentTextInput

final class TextFieldGetAddonPaddingUseCaseTests: XCTestCase {

    // MARK: - Properties

    private var spacings = TextInputSpacings(horizontal: 16)

    // MARK: - Tests - executeLeft

    func test_executeLeft_whenHasPaddingIsFalse_shouldReturnZeroInsets() {
        // GIVEN
        let useCase = TextFieldGetAddonPaddingUseCase()
        let configuration = TextFieldAddonConfiguration(
            hasPadding: false,
            hasSeparator: true
        )

        // WHEN
        let result = useCase.executeLeft(
            spacings: self.spacings,
            configuration: configuration
        )

        // THEN
        XCTAssertEqual(result, .zero)
    }

    func test_executeLeft_whenHasPaddingIsTrueAndHasSeparatorIsTrue_shouldReturnCorrectInsets() {
        // GIVEN
        let useCase = TextFieldGetAddonPaddingUseCase()
        let configuration = TextFieldAddonConfiguration(
            hasPadding: true,
            hasSeparator: true
        )

        // WHEN
        let result = useCase.executeLeft(
            spacings: self.spacings,
            configuration: configuration
        )

        // THEN
        XCTAssertEqual(result.top, 0, "Wrong top value")
        XCTAssertEqual(result.leading, self.spacings.horizontal, "Wrong top value")
        XCTAssertEqual(result.bottom, 0, "Wrong top value")
        XCTAssertEqual(result.trailing, self.spacings.horizontal, "Wrong trailing value")
    }

    func test_executeLeft_whenHasPaddingIsTrueAndHasSeparatorIsFalse_shouldReturnCorrectInsets() {
        // GIVEN
        let useCase = TextFieldGetAddonPaddingUseCase()
        let configuration = TextFieldAddonConfiguration(
            hasPadding: true,
            hasSeparator: false
        )

        // WHEN
        let result = useCase.executeLeft(
            spacings: self.spacings,
            configuration: configuration
        )

        // THEN
        XCTAssertEqual(result.top, 0, "Wrong top value")
        XCTAssertEqual(result.leading, self.spacings.horizontal, "Wrong top value")
        XCTAssertEqual(result.bottom, 0, "Wrong top value")
        XCTAssertEqual(result.trailing, 0, "Wrong trailing value")
    }

    // MARK: - Tests - executeRight

    func test_executeRight_whenHasPaddingIsFalse_shouldReturnZeroInsets() {
        // GIVEN
        let useCase = TextFieldGetAddonPaddingUseCase()
        let configuration = TextFieldAddonConfiguration(
            hasPadding: false,
            hasSeparator: true
        )

        // WHEN
        let result = useCase.executeRight(
            spacings: self.spacings,
            configuration: configuration
        )

        // THEN
        XCTAssertEqual(result, .zero)
    }

    func test_executeRight_whenHasPaddingIsTrueAndHasSeparatorIsTrue_shouldReturnCorrectInsets() {
        // GIVEN
        let useCase = TextFieldGetAddonPaddingUseCase()
        let configuration = TextFieldAddonConfiguration(
            hasPadding: true,
            hasSeparator: true
        )

        // WHEN
        let result = useCase.executeRight(
            spacings: self.spacings,
            configuration: configuration
        )

        // THEN
        XCTAssertEqual(result.top, 0, "Wrong top value")
        XCTAssertEqual(result.leading, self.spacings.horizontal, "Wrong top value")
        XCTAssertEqual(result.bottom, 0, "Wrong top value")
        XCTAssertEqual(result.trailing, self.spacings.horizontal, "Wrong trailing value")
    }

    func test_executeRight_whenHasPaddingIsTrueAndHasSeparatorIsFalse_shouldReturnCorrectInsets() {
        // GIVEN
        let useCase = TextFieldGetAddonPaddingUseCase()
        let configuration = TextFieldAddonConfiguration(
            hasPadding: true,
            hasSeparator: false
        )

        // WHEN
        let result = useCase.executeRight(
            spacings: self.spacings,
            configuration: configuration
        )

        // THEN
        XCTAssertEqual(result.top, 0, "Wrong top value")
        XCTAssertEqual(result.leading, 0, "Wrong top value")
        XCTAssertEqual(result.bottom, 0, "Wrong top value")
        XCTAssertEqual(result.trailing, self.spacings.horizontal, "Wrong trailing value")
    }
}

// MARK: - Extensions

private extension EdgeInsets {

    static var zero: Self {
        .init(top: 0, leading: 0, bottom: 0, trailing: 0)
    }
}
