//
//  GetDisplayedTextTypeUseCaseTests.swift
//  SparkCoreTests
//
//  Created by robin.lemaire on 12/07/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Testing
@_spi(SI_SPI) @testable import SparkCommon

@Suite("Get Displayed Text Type Use Case Tests")
struct GetDisplayedTextTypeUseCaseTests {

    // MARK: - Tests Execute with text and attributedText

    @Test("Execute with text and attributed text parameters")
    func executeWithTextAndAttributedTextParameters() {
        // GIVEN
        let useCase = GetDisplayedTextTypeUseCase()

        // WHEN
        let displayedTextType = useCase.execute(
            text: "Hello",
            attributedText: .left(.init(string: "Holà"))
        )

        // THEN
        #expect(displayedTextType == .attributedText)
    }

    @Test("Execute with text and nil attributed text parameters")
    func executeWithTextAndNilAttributedTextParameters() {
        // GIVEN
        let useCase = GetDisplayedTextTypeUseCase()

        // WHEN
        let displayedTextType = useCase.execute(
            text: "Hello",
            attributedText: nil
        )

        // THEN
        #expect(displayedTextType == .text)
    }

    @Test("Execute with nil text and attributed text parameters")
    func executeWithNilTextAndAttributedTextParameters() {
        // GIVEN
        let useCase = GetDisplayedTextTypeUseCase()

        // WHEN
        let displayedTextType = useCase.execute(
            text: nil,
            attributedText: .left(.init(string: "Holà"))
        )

        // THEN
        #expect(displayedTextType == .attributedText)
    }

    @Test("Execute with nil text and nil attributed text parameters")
    func executeWithNilTextAndNilAttributedTextParameters() {
        // GIVEN
        let useCase = GetDisplayedTextTypeUseCase()

        // WHEN
        let displayedTextType = useCase.execute(
            text: nil,
            attributedText: nil
        )

        // THEN
        #expect(displayedTextType == .none)
    }

    // MARK: - Tests Execute with only text

    @Test("Execute with text parameter")
    func executeWithTextParameter() {
        // GIVEN
        let useCase = GetDisplayedTextTypeUseCase()

        // WHEN
        let displayedTextType = useCase.execute(
            text: "Hello"
        )

        // THEN
        #expect(displayedTextType == .text)
    }

    @Test("Execute with nil text parameter")
    func executeWithNilTextParameter() {
        // GIVEN
        let useCase = GetDisplayedTextTypeUseCase()

        // WHEN
        let displayedTextType = useCase.execute(
            text: nil
        )

        // THEN
        #expect(displayedTextType == .none)
    }

    // MARK: - Tests Execute with only attributed text

    @Test("Execute with attributed text parameter")
    func executeWithAttributedTextParameter() {
        // GIVEN
        let useCase = GetDisplayedTextTypeUseCase()

        // WHEN
        let displayedTextType = useCase.execute(
            attributedText: .left(.init(string: "Holà"))
        )

        // THEN
        #expect(displayedTextType == .attributedText)
    }

    @Test("Execute with nil attributed text parameter")
    func executeWithNilAttributedTextParameter() {
        // GIVEN
        let useCase = GetDisplayedTextTypeUseCase()

        // WHEN
        let displayedTextType = useCase.execute(
            attributedText: nil
        )

        // THEN
        #expect(displayedTextType == .none)
    }
}
