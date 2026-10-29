//
//  GetDidDisplayedTextChangeUseCaseTests.swift
//  SparkCoreTests
//
//  Created by robin.lemaire on 12/07/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Foundation
import Testing
@_spi(SI_SPI) @testable import SparkCommon

@Suite("Get Did Displayed Text Change Use Case Tests")
struct GetDidDisplayedTextChangeUseCaseTests {

    // MARK: - Tests Execute with text

    @Test("Execute when current text is equal to new text and displayed text type is none")
    func executeWhenCurrentTextIsEqualToNewTextAndDisplayedTextTypeIsNone() {
        // GIVEN
        let useCase = GetDidDisplayedTextChangeUseCase()

        // WHEN
        let isChanged = useCase.execute(
            currentText: "Hello",
            newText: "Hello",
            displayedTextType: .none
        )

        // THEN
        #expect(isChanged)
    }

    @Test("Execute when current text is equal to new text and displayed text type is text")
    func executeWhenCurrentTextIsEqualToNewTextAndDisplayedTextTypeIsText() {
        // GIVEN
        let useCase = GetDidDisplayedTextChangeUseCase()

        // WHEN
        let isChanged = useCase.execute(
            currentText: "Hello",
            newText: "Hello",
            displayedTextType: .text
        )

        // THEN
        #expect(!isChanged)
    }

    @Test("Execute when current text is equal to new text and displayed text type is attributed text")
    func executeWhenCurrentTextIsEqualToNewTextAndDisplayedTextTypeIsAttributedText() {
        // GIVEN
        let useCase = GetDidDisplayedTextChangeUseCase()

        // WHEN
        let isChanged = useCase.execute(
            currentText: "Hello",
            newText: "Hello",
            displayedTextType: .attributedText
        )

        // THEN
        #expect(isChanged)
    }

    @Test("Execute when current text is not equal to new text and displayed text type is none")
    func executeWhenCurrentTextIsNotEqualToNewTextAndDisplayedTextTypeIsNone() {
        // GIVEN
        let useCase = GetDidDisplayedTextChangeUseCase()

        // WHEN
        let isChanged = useCase.execute(
            currentText: "Hello",
            newText: "Bye",
            displayedTextType: .none
        )

        // THEN
        #expect(isChanged)
    }

    @Test("Execute when current text is not equal to new text and displayed text type is text")
    func executeWhenCurrentTextIsNotEqualToNewTextAndDisplayedTextTypeIsText() {
        // GIVEN
        let useCase = GetDidDisplayedTextChangeUseCase()

        // WHEN
        let isChanged = useCase.execute(
            currentText: "Hello",
            newText: "Bye",
            displayedTextType: .text
        )

        // THEN
        #expect(isChanged)
    }

    @Test("Execute when current text is not equal to new text and displayed text type is attributed text")
    func executeWhenCurrentTextIsNotEqualToNewTextAndDisplayedTextTypeIsAttributedText() {
        // GIVEN
        let useCase = GetDidDisplayedTextChangeUseCase()

        // WHEN
        let isChanged = useCase.execute(
            currentText: "Hello",
            newText: "Bye",
            displayedTextType: .attributedText
        )

        // THEN
        #expect(isChanged)
    }

    @Test("Execute when current text and new text are nil and displayed text type is none")
    func executeWhenCurrentTextAndNewTextAreNilAndDisplayedTextTypeIsNone() {
        // GIVEN
        let useCase = GetDidDisplayedTextChangeUseCase()

        // WHEN
        let isChanged = useCase.execute(
            currentText: nil,
            newText: nil,
            displayedTextType: .none
        )

        // THEN
        #expect(!isChanged)
    }

    @Test("Execute when current text and new text are nil and displayed text type is text")
    func executeWhenCurrentTextAndNewTextAreNilAndDisplayedTextTypeIsText() {
        // GIVEN
        let useCase = GetDidDisplayedTextChangeUseCase()

        // WHEN
        let isChanged = useCase.execute(
            currentText: nil,
            newText: nil,
            displayedTextType: .text
        )

        // THEN
        #expect(isChanged)
    }

    @Test("Execute when current text and new text are nil and displayed text type is attributed text")
    func executeWhenCurrentTextAndNewTextAreNilAndDisplayedTextTypeIsAttributedText() {
        // GIVEN
        let useCase = GetDidDisplayedTextChangeUseCase()

        // WHEN
        let isChanged = useCase.execute(
            currentText: nil,
            newText: nil,
            displayedTextType: .attributedText
        )

        // THEN
        #expect(!isChanged)
    }

    // MARK: - Tests Execute with attributed text

    @Test("Execute when current attributed text is equal to new attributed text and displayed text type is none")
    func executeWhenCurrentAttributedTextIsEqualToNewAttributedTextAndDisplayedTextTypeIsNone() {
        // GIVEN
        let useCase = GetDidDisplayedTextChangeUseCase()

        // WHEN
        let isChanged = useCase.execute(
            currentAttributedText: .left(NSAttributedString(string: "Hello")),
            newAttributedText: .left(NSAttributedString(string: "Hello")),
            displayedTextType: .none
        )

        // THEN
        #expect(isChanged)
    }

    @Test("Execute when current attributed text is equal to new attributed text and displayed text type is text")
    func executeWhenCurrentAttributedTextIsEqualToNewAttributedTextAndDisplayedTextTypeIsText() {
        // GIVEN
        let useCase = GetDidDisplayedTextChangeUseCase()

        // WHEN
        let isChanged = useCase.execute(
            currentAttributedText: .left(NSAttributedString(string: "Hello")),
            newAttributedText: .left(NSAttributedString(string: "Hello")),
            displayedTextType: .text
        )

        // THEN
        #expect(isChanged)
    }

    @Test("Execute when current attributed text is equal to new attributed text and displayed text type is attributed text")
    func executeWhenCurrentAttributedTextIsEqualToNewAttributedTextAndDisplayedTextTypeIsAttributedText() {
        // GIVEN
        let useCase = GetDidDisplayedTextChangeUseCase()

        // WHEN
        let isChanged = useCase.execute(
            currentAttributedText: .left(NSAttributedString(string: "Hello")),
            newAttributedText: .left(NSAttributedString(string: "Hello")),
            displayedTextType: .attributedText
        )

        // THEN
        #expect(!isChanged)
    }

    @Test("Execute when current attributed text is not equal to new attributed text and displayed text type is none")
    func executeWhenCurrentAttributedTextIsNotEqualToNewAttributedTextAndDisplayedTextTypeIsNone() {
        // GIVEN
        let useCase = GetDidDisplayedTextChangeUseCase()

        // WHEN
        let isChanged = useCase.execute(
            currentAttributedText: .left(NSAttributedString(string: "Hello")),
            newAttributedText: .left(NSAttributedString(string: "Bye")),
            displayedTextType: .none
        )

        // THEN
        #expect(isChanged)
    }

    @Test("Execute when current attributed text is not equal to new attributed text and displayed text type is text")
    func executeWhenCurrentAttributedTextIsNotEqualToNewAttributedTextAndDisplayedTextTypeIsText() {
        // GIVEN
        let useCase = GetDidDisplayedTextChangeUseCase()

        // WHEN
        let isChanged = useCase.execute(
            currentAttributedText: .left(NSAttributedString(string: "Hello")),
            newAttributedText: .left(NSAttributedString(string: "Bye")),
            displayedTextType: .text
        )

        // THEN
        #expect(isChanged)
    }

    @Test("Execute when current attributed text is not equal to new attributed text and displayed text type is attributed text")
    func executeWhenCurrentAttributedTextIsNotEqualToNewAttributedTextAndDisplayedTextTypeIsAttributedText() {
        // GIVEN
        let useCase = GetDidDisplayedTextChangeUseCase()

        // WHEN
        let isChanged = useCase.execute(
            currentAttributedText: .left(NSAttributedString(string: "Hello")),
            newAttributedText: .left(NSAttributedString(string: "Bye")),
            displayedTextType: .attributedText
        )

        // THEN
        #expect(isChanged)
    }

    @Test("Execute when current attributed text and new attributed text are nil and displayed text type is none")
    func executeWhenCurrentAttributedTextAndNewAttributedTextAreNilAndDisplayedTextTypeIsNone() {
        // GIVEN
        let useCase = GetDidDisplayedTextChangeUseCase()

        // WHEN
        let isChanged = useCase.execute(
            currentAttributedText: nil,
            newAttributedText: nil,
            displayedTextType: .none
        )

        // THEN
        #expect(!isChanged)
    }

    @Test("Execute when current attributed text and new attributed text are nil and displayed text type is text")
    func executeWhenCurrentAttributedTextAndNewAttributedTextAreNilAndDisplayedTextTypeIsText() {
        // GIVEN
        let useCase = GetDidDisplayedTextChangeUseCase()

        // WHEN
        let isChanged = useCase.execute(
            currentAttributedText: nil,
            newAttributedText: nil,
            displayedTextType: .text
        )

        // THEN
        #expect(!isChanged)
    }

    @Test("Execute when current attributed text and new attributed text are nil and displayed text type is attributed text")
    func executeWhenCurrentAttributedTextAndNewAttributedTextAreNilAndDisplayedTextTypeIsAttributedText() {
        // GIVEN
        let useCase = GetDidDisplayedTextChangeUseCase()

        // WHEN
        let isChanged = useCase.execute(
            currentAttributedText: nil,
            newAttributedText: nil,
            displayedTextType: .attributedText
        )

        // THEN
        #expect(isChanged)
    }
}
