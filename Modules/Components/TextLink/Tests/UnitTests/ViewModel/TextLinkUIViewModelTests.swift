//
//  TextLinkUIViewModelTests.swift
//  SparkComponentTextLinkUnitTests
//
//  Created by robin.lemaire on 15/02/2024.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
import UIKit

@testable import SparkComponentTextLink
@_spi(SI_SPI) @testable import SparkComponentTextLinkTesting
@_spi(SI_SPI) import SparkThemingTesting

@MainActor
@Suite("TextLink UI ViewModel Tests")
struct TextLinkUIViewModelTests {

    // MARK: - Initialization

    @Test("Initialization should use default values")
    func initializationShouldUseDefaultValues() {
        // GIVEN / WHEN
        let stub = Stub()

        // THEN
        expectEqualToExpected(
            on: stub,
            otherAttributedString: .init()
        )

        expectNotCalled(
            on: stub,
            getAttributedStringUseCase: true
        )
    }

    // MARK: - Setup

    @Test("Setup should call use case and set attributed string")
    func setupShouldCallUseCaseAndSetAttributedString() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // WHEN
        viewModel.setup(stub: stub)

        // THEN
        expectEqualToExpected(on: stub)

        TextLinkGetAttributedStringUseCaseableMockTest.expect(
            stub.getAttributedStringUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: stub.givenIntent,
            givenVariant: stub.givenVariant,
            givenTypography: stub.givenTypography,
            givenText: stub.givenText,
            givenTextHighlightRange: stub.givenTextHighlightRange,
            givenIsHighlighted: stub.givenIsHighlighted,
            expectedReturnValue: stub.expectedAttributedString
        )
    }

    // MARK: - Property Changes

    @Test("Some properties changed should update attributed string")
    func somePropertiesChangedShouldUpdateAttributedString() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel
        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let newTheme = ThemeGeneratedMock.mocked()
        let newIntent: TextLinkIntent = .danger
        let newVariant: TextLinkVariant = .none

        // WHEN
        viewModel.theme = newTheme
        viewModel.intent = newIntent
        viewModel.variant = newVariant

        // THEN
        expectEqualToExpected(on: stub)

        TextLinkGetAttributedStringUseCaseableMockTest.expect(
            stub.getAttributedStringUseCaseMock,
            expectedNumberOfCalls: 3,
            givenTheme: newTheme,
            givenIntent: newIntent,
            givenVariant: newVariant,
            givenTypography: stub.givenTypography,
            givenText: stub.givenText,
            givenTextHighlightRange: stub.givenTextHighlightRange,
            givenIsHighlighted: stub.givenIsHighlighted,
            expectedReturnValue: stub.expectedAttributedString
        )
    }

    @Test("Properties changed before setup should not call use case")
    func propertiesChangedBeforeSetupShouldNotCallUseCase() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // WHEN
        viewModel.theme = ThemeGeneratedMock.mocked()
        viewModel.intent = .support
        viewModel.isHighlighted = true
        viewModel.text = "Hello"
        viewModel.textHighlightRange = NSRange(location: 0, length: 1)
        viewModel.typography = .body2
        viewModel.variant = TextLinkVariant.none

        // THEN
        expectEqualToExpected(
            on: stub,
            otherAttributedString: .init()
        )

        expectNotCalled(
            on: stub,
            getAttributedStringUseCase: true
        )
    }

    @Test("Properties changed without value change should not call use case")
    func propertiesChangedWithoutValueChangeShouldNotCallUseCase() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel
        viewModel.setup(stub: stub)
        stub.resetMockedData()

        // WHEN
        viewModel.theme = stub.givenTheme
        viewModel.intent = stub.givenIntent
        viewModel.isHighlighted = stub.givenIsHighlighted
        viewModel.text = stub.givenText
        viewModel.textHighlightRange = stub.givenTextHighlightRange
        viewModel.typography = stub.givenTypography
        viewModel.variant = stub.givenVariant

        // THEN
        expectEqualToExpected(on: stub)

        expectNotCalled(
            on: stub,
            getAttributedStringUseCase: true
        )
    }
}

// MARK: - Stub

private final class Stub: TextLinkViewModelStub {

    // MARK: - Expected

    let expectedAttributedString = NSAttributedString(
        string: "TextLink attributed string",
        attributes: [
            .underlineStyle: NSUnderlineStyle.single
        ]
    )

    // MARK: - Use Case Mocks

    let getAttributedStringUseCaseMock: TextLinkGetAttributedStringUseCaseableGeneratedMock

    // MARK: - ViewModel

    let viewModel: TextLinkUIViewModel

    // MARK: - Initialization

    override init() {
        let getAttributedStringUseCaseMock = TextLinkGetAttributedStringUseCaseableGeneratedMock()
        getAttributedStringUseCaseMock.executeUIWithThemeAndIntentAndVariantAndTypographyAndTextAndTextHighlightRangeAndIsHighlightedReturnValue = self.expectedAttributedString

        self.viewModel = TextLinkUIViewModel(
            getAttributedStringUseCase: getAttributedStringUseCaseMock
        )

        self.getAttributedStringUseCaseMock = getAttributedStringUseCaseMock

        super.init()
    }

    // MARK: - Helpers

    func resetMockedData() {
        self.getAttributedStringUseCaseMock.reset()
    }
}

// MARK: - Expectations

private func expectNotCalled(
    on stub: Stub,
    getAttributedStringUseCase: Bool = false,
    sourceLocation: Testing.SourceLocation = #_sourceLocation
) {
    TextLinkGetAttributedStringUseCaseableMockTest.expectCalled(
        stub.getAttributedStringUseCaseMock,
        executeUIWithThemeAndIntentAndVariantAndTypographyAndTextAndTextHighlightRangeAndIsHighlightedCalled: !getAttributedStringUseCase,
        sourceLocation: sourceLocation
    )
}

private func expectEqualToExpected(
    on stub: Stub,
    otherAttributedString: NSAttributedString? = nil,
    sourceLocation: Testing.SourceLocation = #_sourceLocation
) {
    let viewModel = stub.viewModel

    #expect(
        viewModel.attributedString == otherAttributedString ?? stub.expectedAttributedString,
        "Wrong attributedString value",
        sourceLocation: sourceLocation
    )
}
