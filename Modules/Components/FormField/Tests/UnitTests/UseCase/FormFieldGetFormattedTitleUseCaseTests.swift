//
//  FormFieldGetFormattedTitleUseCaseTests.swift
//  SparkComponentFormFieldTests
//
//  Created on 06/05/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
import SparkTheming
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkThemingTesting
@testable import SparkComponentFormField

final class FormFieldGetFormattedTitleUseCaseTests: XCTestCase {

    // MARK: - Properties

    private var sut: FormFieldGetFormattedTitleUseCase!
    private var mockColors: FormFieldColors!
    private var mockFonts: FormFieldFonts!

    // MARK: - Setup
    override func setUp() {
        super.setUp()

        self.sut = FormFieldGetFormattedTitleUseCase()

        // Setup mock colors and fonts
        self.mockColors = FormFieldColors(
            title: ColorTokenGeneratedMock(),
            clearButton: ColorTokenGeneratedMock(),
            require: ColorTokenGeneratedMock(),
            helper: ColorTokenGeneratedMock(),
            secondaryHelper: ColorTokenGeneratedMock()
        )
        self.mockFonts = FormFieldFonts(
            title: TypographyFontTokenGeneratedMock(),
            clearButton: TypographyFontTokenGeneratedMock(),
            require: TypographyFontTokenGeneratedMock(),
            helper: TypographyFontTokenGeneratedMock(),
            secondaryHelper: TypographyFontTokenGeneratedMock()
        )
    }

    override func tearDown() {
        self.sut = nil
        self.mockColors = nil
        self.mockFonts = nil
        super.tearDown()
    }

    // MARK: - Tests - UIKit

    func test_execute_withUIKit_whenTitleIsNil_shouldReturnNil() {
        // GIVEN / WHEN
        let result = self.sut.execute(
            for: .uiKit,
            title: nil,
            isRequired: false,
            colors: self.mockColors,
            fonts: self.mockFonts
        )

        // THEN
        XCTAssertNil(result)
    }

    func test_execute_withUIKit_whenTitleIsNotNilAndNotRequired_shouldReturnCorrectAttributedString() {
        // GIVEN
        let title = "Test Title"

        // WHEN
        let result = self.sut.execute(
            for: .uiKit,
            title: title,
            isRequired: false,
            colors: self.mockColors,
            fonts: self.mockFonts
        )

        // THEN
        if case let .left(attributedString) = result {
            XCTAssertEqual(attributedString.string, title)
        } else {
            XCTFail("Expected NSAttributedString but got AttributedString")
        }
    }

    func test_execute_withUIKit_whenTitleIsNotNilAndRequired_shouldReturnCorrectAttributedString() {
        // GIVEN
        let title = "Test Title"

        // WHEN
        let result = self.sut.execute(
            for: .uiKit,
            title: title,
            isRequired: true,
            colors: self.mockColors,
            fonts: self.mockFonts
        )

        // THEN
        if case let .left(attributedString) = result {
            XCTAssertEqual(attributedString.string, title + " *")
        } else {
            XCTFail("Expected NSAttributedString but got AttributedString")
        }
    }

    // MARK: - Tests - SwiftUI

    func test_execute_withSwiftUI_whenTitleIsNil_shouldReturnNil() {
        // GIVEN / WHEN
        let result = self.sut.execute(
            for: .swiftUI,
            title: nil,
            isRequired: false,
            colors: self.mockColors,
            fonts: self.mockFonts
        )

        // THEN
        XCTAssertNil(result)
    }
    func test_execute_withSwiftUI_whenTitleIsNotNilAndNotRequired_shouldReturnCorrectAttributedString() {
        // GIVEN
        let title = "Test Title"

        // WHEN
        let result = self.sut.execute(
            for: .swiftUI,
            title: title,
            isRequired: false,
            colors: self.mockColors,
            fonts: self.mockFonts
        )

        // THEN
        if case .right(let attributedString) = result {
            XCTAssertEqual(String(attributedString.characters), title)
        } else {
            XCTFail("Expected AttributedString but got NSAttributedString")
        }
    }

    func test_execute_withSwiftUI_whenTitleIsNotNilAndRequired_shouldReturnCorrectAttributedString() {
        // GIVEN
        let title = "Test Title"

        // WHEN
        let result = self.sut.execute(
            for: .swiftUI,
            title: title,
            isRequired: true,
            colors: self.mockColors,
            fonts: self.mockFonts
        )

        if case .right(let attributedString) = result {
            XCTAssertEqual(String(attributedString.characters), title + " *")
        } else {
            XCTFail("Expected AttributedString but got NSAttributedString")
        }
    }
}
