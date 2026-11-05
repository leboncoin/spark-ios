//
//  FormFieldGetFormattedTitleUseCaseTests.swift
//  SparkComponentFormFieldTests
//
//  Created on 06/05/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import UIKit
import Testing
import SparkTheming
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkThemingTesting
@testable import SparkComponentFormField

@MainActor
@Suite("FormField Get Formatted Title UseCase Tests")
struct FormFieldGetFormattedTitleUseCaseTests {

    // MARK: - Properties

    private let sut: FormFieldGetFormattedTitleUseCase
    private let mockColors: FormFieldColors
    private let mockFonts: FormFieldFonts

    // MARK: - Setup
    init() {
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

    // MARK: - Tests - UIKit

    @Test("Execute with UIKit when title is nil should return nil")
    func executeWithUIKitWhenTitleIsNilShouldReturnNil() {
        // GIVEN / WHEN
        let result = self.sut.execute(
            for: .uiKit,
            title: nil,
            isRequired: false,
            colors: self.mockColors,
            fonts: self.mockFonts
        )

        // THEN
        #expect(result == nil)
    }

    @Test("Execute with UIKit when title is not nil and not required should return correct attributed string")
    func executeWithUIKitWhenTitleIsNotNilAndNotRequiredShouldReturnCorrectAttributedString() {
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
            #expect(attributedString.string == title)
        } else {
            Issue.record("Expected NSAttributedString but got AttributedString")
        }
    }

    @Test("Execute with UIKit when title is not nil and required should return correct attributed string")
    func executeWithUIKitWhenTitleIsNotNilAndRequiredShouldReturnCorrectAttributedString() {
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
            #expect(attributedString.string == title + " *")
        } else {
            Issue.record("Expected NSAttributedString but got AttributedString")
        }
    }

    // MARK: - Tests - SwiftUI

    @Test("Execute with SwiftUI when title is nil should return nil")
    func executeWithSwiftUIWhenTitleIsNilShouldReturnNil() {
        // GIVEN / WHEN
        let result = self.sut.execute(
            for: .swiftUI,
            title: nil,
            isRequired: false,
            colors: self.mockColors,
            fonts: self.mockFonts
        )

        // THEN
        #expect(result == nil)
    }
    @Test("Execute with SwiftUI when title is not nil and not required should return correct attributed string")
    func executeWithSwiftUIWhenTitleIsNotNilAndNotRequiredShouldReturnCorrectAttributedString() {
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
            #expect(String(attributedString.characters) == title)
        } else {
            Issue.record("Expected AttributedString but got NSAttributedString")
        }
    }

    @Test("Execute with SwiftUI when title is not nil and required should return correct attributed string")
    func executeWithSwiftUIWhenTitleIsNotNilAndRequiredShouldReturnCorrectAttributedString() {
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
            #expect(String(attributedString.characters) == title + " *")
        } else {
            Issue.record("Expected AttributedString but got NSAttributedString")
        }
    }
}
