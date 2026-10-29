//
//  TextFieldGetContentPaddingUseCaseTests.swift
//  SparkComponentTextInputTests
//
//  Created by robin.lemaire on 20/06/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation
import Testing
@testable import SparkComponentTextInput

@Suite("Text Field Get Content Padding UseCase Tests")
struct TextFieldGetContentPaddingUseCaseTests {

    // MARK: - Tests

    @Test("Execute with clear button should return correct padding")
    func executeWithClearButtonShouldReturnCorrectPadding() {
        // GIVEN
        let useCase = TextFieldGetContentPaddingUseCase()

        let expectedHorizontalSpacing: CGFloat = 10

        let spacings = TextInputSpacings(horizontal: expectedHorizontalSpacing)
        let isClearButton = true

        // WHEN
        let padding = useCase.execute(
            spacings: spacings,
            isClearButton: isClearButton
        )

        // THEN
        #expect(padding.top == 0)
        #expect(padding.leading == expectedHorizontalSpacing)
        #expect(padding.bottom == 0)
        #expect(padding.trailing == expectedHorizontalSpacing)
        #expect(padding.inputTrailing == 0)
    }

    @Test("Execute without clear button should return correct padding")
    func executeWithoutClearButtonShouldReturnCorrectPadding() {
        // GIVEN
        let useCase = TextFieldGetContentPaddingUseCase()

        let expectedHorizontalSpacing: CGFloat = 15

        let spacings = TextInputSpacings(horizontal: expectedHorizontalSpacing)
        let isClearButton = false

        // WHEN
        let padding = useCase.execute(
            spacings: spacings,
            isClearButton: isClearButton
        )

        // THEN
        #expect(padding.top == 0)
        #expect(padding.leading == expectedHorizontalSpacing)
        #expect(padding.bottom == 0)
        #expect(padding.trailing == expectedHorizontalSpacing)
        #expect(padding.inputTrailing == expectedHorizontalSpacing)
    }
}
