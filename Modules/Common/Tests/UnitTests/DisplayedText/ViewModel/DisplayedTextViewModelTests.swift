//
//  DisplayedTextViewModelTests.swift
//  SparkCoreTests
//
//  Created by robin.lemaire on 12/07/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Testing
import Foundation
@_spi(SI_SPI) @testable import SparkCommon
@_spi(SI_SPI) @testable import SparkCommonTesting

@MainActor
@Suite("Displayed Text ViewModel Tests")
struct DisplayedTextViewModelTests {

    // MARK: - Tests Init

    @Test("Properties after init")
    func propertiesAfterInit() {
        // GIVEN
        let textMock = "Hello"
        let attributedTextMock: AttributedStringEither = .left(.init(string: "Holà"))
        let displayedTextTypeMock: DisplayedTextType = .text

        let getDisplayedTextTypeUseCaseMock = GetDisplayedTextTypeUseCaseableGeneratedMock()
        getDisplayedTextTypeUseCaseMock.executeWithTextAndAttributedTextReturnValue = displayedTextTypeMock

        // WHEN
        let viewModel = DisplayedTextViewModelDefault(
            text: textMock,
            attributedText: attributedTextMock,
            getDisplayedTextTypeUseCase: getDisplayedTextTypeUseCaseMock
        )

        // THEN
        #expect(
            viewModel.displayedTextType == displayedTextTypeMock,
            "Wrong displayedTextType value"
        )
        #expect(
            viewModel.displayedText?.text == textMock,
            "Wrong displayedTextType text value"
        )
        #expect(
            viewModel.displayedText?.attributedText == attributedTextMock,
            "Wrong displayedTextType attributedText value"
        )
        #expect(
            viewModel.containsText == displayedTextTypeMock.containsText,
            "Wrong containsText value"
        )

        // **
        // GetDisplayedTextTypeUseCase
        #expect(
            getDisplayedTextTypeUseCaseMock.executeWithTextAndAttributedTextCallsCount == 1,
            "Wrong call number on execute with text and attributedText parameters on getDisplayedTextTypeUseCase"
        )

        let getDisplayedTextTypeUseCaseArgs = getDisplayedTextTypeUseCaseMock.executeWithTextAndAttributedTextReceivedArguments
        #expect(
            getDisplayedTextTypeUseCaseArgs?.text == textMock,
            "Wrong text parameter on execute on getDisplayedTextTypeUseCase"
        )
        #expect(
            getDisplayedTextTypeUseCaseArgs?.attributedText == attributedTextMock,
            "Wrong attributedText parameter on execute on getDisplayedTextTypeUseCase"
        )
        // **
    }

    // MARK: - Tests TextChanged

    @Test("Text changed when get did displayed text change use case return true")
    func textChangedWhenGetDidDisplayedTextChangeUseCaseReturnTrue() {
        self.testTextChanged(givenGetDidDisplayedTextChange: true)
    }

    @Test("Text changed when get did displayed text change use case return false")
    func textChangedWhenGetDidDisplayedTextChangeUseCaseReturnFalse() {
        self.testTextChanged(givenGetDidDisplayedTextChange: false)
    }

    func testTextChanged(
        givenGetDidDisplayedTextChange: Bool
    ) {
        // GIVEN
        let displayedTextTypeMock: DisplayedTextType = .text
        let newText = "Hey"
        let textMock = "Hello"

        let getDisplayedTextTypeUseCaseMock = GetDisplayedTextTypeUseCaseableGeneratedMock()
        getDisplayedTextTypeUseCaseMock.executeWithTextAndAttributedTextReturnValue = displayedTextTypeMock
        getDisplayedTextTypeUseCaseMock.executeWithTextReturnValue = DisplayedTextType.none

        let getDidDisplayedTextChangeUseCaseMock = GetDidDisplayedTextChangeUseCaseableGeneratedMock()
        getDidDisplayedTextChangeUseCaseMock.executeWithCurrentTextAndNewTextAndDisplayedTextTypeReturnValue = givenGetDidDisplayedTextChange

        let viewModel = DisplayedTextViewModelDefault(
            text: textMock,
            attributedText: nil,
            getDisplayedTextTypeUseCase: getDisplayedTextTypeUseCaseMock,
            getDidDisplayedTextChangeUseCase: getDidDisplayedTextChangeUseCaseMock
        )

        // WHEN
        let textChanged = viewModel.textChanged(newText)

        // THEN
        #expect(
            textChanged == givenGetDidDisplayedTextChange,
            "Wrong textChanged value"
        )

        #expect(
            viewModel.displayedText == (.init(text: givenGetDidDisplayedTextChange ? newText : textMock)),
            "Wrong displayedText value"
        )
        #expect(
            viewModel.displayedTextType == (givenGetDidDisplayedTextChange ? .none : displayedTextTypeMock),
            "Wrong displayedTextType value"
        )
        #expect(
            viewModel.containsText == (givenGetDidDisplayedTextChange ? DisplayedTextType.none.containsText : displayedTextTypeMock.containsText),
            "Wrong containsText value"
        )

        // **
        // GetDidDisplayedTextChangeUseCase
        #expect(
            getDidDisplayedTextChangeUseCaseMock.executeWithCurrentTextAndNewTextAndDisplayedTextTypeCallsCount == 1,
            "Wrong call number on execute parameters on getDidDisplayedTextChangeUseCase"
        )

        let getDidDisplayedTextChangeUseCaseMockArgs = getDidDisplayedTextChangeUseCaseMock.executeWithCurrentTextAndNewTextAndDisplayedTextTypeReceivedArguments

        #expect(
            getDidDisplayedTextChangeUseCaseMockArgs?.currentText == textMock,
            "Wrong currentText parameter on execute on getDidDisplayedTextChangeUseCase"
        )
        #expect(
            getDidDisplayedTextChangeUseCaseMockArgs?.newText == newText,
            "Wrong newText parameter on execute on getDidDisplayedTextChangeUseCase"
        )
        #expect(
            getDidDisplayedTextChangeUseCaseMockArgs?.displayedTextType == displayedTextTypeMock,
            "Wrong displayedTextType parameter on execute on getDidDisplayedTextChangeUseCase"
        )
        // **

        // **
        // GetDisplayedTextTypeUseCase
        #expect(
            getDisplayedTextTypeUseCaseMock.executeWithTextCallsCount == (givenGetDidDisplayedTextChange ? 1 : 0),
            "Wrong call number on execute on getDisplayedTextTypeUseCase"
        )

        if givenGetDidDisplayedTextChange {
            #expect(
                getDisplayedTextTypeUseCaseMock.executeWithTextReceivedText == newText,
                "Wrong text parameter on execute on getDisplayedTextTypeUseCase"
            )
        }
        // **
    }

    // MARK: - Tests AttributedTextChanged

    @Test("Attributed text changed when get is displayed attributed text changed use case return true")
    func attributedTextChangedWhenGetIsDisplayedAttributedTextChangedUseCaseReturnTrue() {
        self.testAttributedTextChanged(givenGetIsDisplayedAttributedTextChanged: true)
    }

    @Test("Attributed text changed when get is displayed attributed text changed use case return false")
    func attributedTextChangedWhenGetIsDisplayedAttributedTextChangedUseCaseReturnFalse() {
        self.testAttributedTextChanged(givenGetIsDisplayedAttributedTextChanged: false)
    }

    func testAttributedTextChanged(
        givenGetIsDisplayedAttributedTextChanged: Bool
    ) {
        // GIVEN
        let displayedTextTypeMock: DisplayedTextType = .attributedText
        let newAttributedTextMock: AttributedStringEither = .left(.init(string: "Hey"))
        let attributedTextMock: AttributedStringEither = .left(.init(string: "Hello"))

        let getDisplayedTextTypeUseCaseMock = GetDisplayedTextTypeUseCaseableGeneratedMock()
        getDisplayedTextTypeUseCaseMock.executeWithTextAndAttributedTextReturnValue = displayedTextTypeMock
        getDisplayedTextTypeUseCaseMock.executeWithAttributedTextReturnValue = DisplayedTextType.none

        let getDidDisplayedTextChangeUseCaseMock = GetDidDisplayedTextChangeUseCaseableGeneratedMock()
        getDidDisplayedTextChangeUseCaseMock.executeWithCurrentAttributedTextAndNewAttributedTextAndDisplayedTextTypeReturnValue = givenGetIsDisplayedAttributedTextChanged

        let viewModel = DisplayedTextViewModelDefault(
            text: nil,
            attributedText: attributedTextMock,
            getDisplayedTextTypeUseCase: getDisplayedTextTypeUseCaseMock,
            getDidDisplayedTextChangeUseCase: getDidDisplayedTextChangeUseCaseMock
        )

        // WHEN
        let attributedTextChanged = viewModel.attributedTextChanged(newAttributedTextMock)

        // THEN
        #expect(
            attributedTextChanged == givenGetIsDisplayedAttributedTextChanged,
            "Wrong attributedTextChanged value"
        )

        #expect(
            viewModel.displayedText == (.init(attributedText: givenGetIsDisplayedAttributedTextChanged ? newAttributedTextMock : attributedTextMock)),
            "Wrong displayedText value"
        )
        #expect(
            viewModel.displayedTextType == (givenGetIsDisplayedAttributedTextChanged ? .none : displayedTextTypeMock),
            "Wrong displayedTextType value"
        )
        #expect(
            viewModel.containsText == (givenGetIsDisplayedAttributedTextChanged ? DisplayedTextType.none.containsText : displayedTextTypeMock.containsText),
            "Wrong containsText value"
        )

        // **
        // GetDidDisplayedTextChangeUseCase
        #expect(
            getDidDisplayedTextChangeUseCaseMock.executeWithCurrentAttributedTextAndNewAttributedTextAndDisplayedTextTypeCallsCount == 1,
            "Wrong call number on execute parameters on getDidDisplayedTextChangeUseCase"
        )

        let getDidDisplayedTextChangeUseCaseMockArgs = getDidDisplayedTextChangeUseCaseMock.executeWithCurrentAttributedTextAndNewAttributedTextAndDisplayedTextTypeReceivedArguments
        #expect(
            getDidDisplayedTextChangeUseCaseMockArgs?.currentAttributedText == attributedTextMock,
            "Wrong currentAttributedText parameter on execute on getDidDisplayedTextChangeUseCase"
        )
        #expect(
            getDidDisplayedTextChangeUseCaseMockArgs?.newAttributedText == newAttributedTextMock,
            "Wrong newAttributedText parameter on execute on getDidDisplayedTextChangeUseCase"
        )
        #expect(
            getDidDisplayedTextChangeUseCaseMockArgs?.displayedTextType == displayedTextTypeMock,
            "Wrong displayedTextType parameter on execute on getDidDisplayedTextChangeUseCase"
        )
        // **

        // **
        // GetDisplayedTextTypeUseCase
        #expect(
            getDisplayedTextTypeUseCaseMock.executeWithAttributedTextCallsCount == (givenGetIsDisplayedAttributedTextChanged ? 1 : 0),
            "Wrong call number on execute on getDisplayedTextTypeUseCase"
        )

        if givenGetIsDisplayedAttributedTextChanged {
            #expect(
                getDisplayedTextTypeUseCaseMock.executeWithAttributedTextReceivedAttributedText == newAttributedTextMock,
                "Wrong attributedText parameter on execute on getDisplayedTextTypeUseCase"
            )
        }
        // **
    }
}
