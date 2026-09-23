//
//  TextLinkUIViewModelTests.swift
//  SparkComponentTextLinkUnitTests
//
//  Created by robin.lemaire on 15/02/2024.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest

@testable import SparkComponentTextLink
@_spi(SI_SPI) @testable import SparkComponentTextLinkTesting
@_spi(SI_SPI) import SparkThemingTesting

final class TextLinkUIViewModelTests: XCTestCase {

    // MARK: - Initialization

    func test_initialization_shouldUseDefaultValues() {
        // GIVEN / WHEN
        let stub = Stub()

        // THEN
        XCTAssertEqualToExpected(
            on: stub,
            otherAttributedString: .init()
        )

        XCTAssertNotCalled(
            on: stub,
            getAttributedStringUseCase: true
        )
    }

    // MARK: - Setup

    func test_setup_shouldCallUseCaseAndSetAttributedString() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // WHEN
        viewModel.setup(stub: stub)

        // THEN
        XCTAssertEqualToExpected(on: stub)

        TextLinkGetAttributedStringUseCaseableMockTest.XCTAssert(
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

    func test_somePropertiesChanged_shouldUpdateAttributedString() {
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
        XCTAssertEqualToExpected(on: stub)

        TextLinkGetAttributedStringUseCaseableMockTest.XCTAssert(
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

    func test_propertiesChanged_beforeSetup_shouldNotCallUseCase() {
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
        XCTAssertEqualToExpected(
            on: stub,
            otherAttributedString: .init()
        )

        XCTAssertNotCalled(
            on: stub,
            getAttributedStringUseCase: true
        )
    }

    func test_propertiesChanged_withoutValueChange_shouldNotCallUseCase() {
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
        XCTAssertEqualToExpected(on: stub)

        XCTAssertNotCalled(
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

// MARK: - XCTAssert

private func XCTAssertNotCalled(
    on stub: Stub,
    getAttributedStringUseCase: Bool = false
) {
    TextLinkGetAttributedStringUseCaseableMockTest.XCTCalled(
        stub.getAttributedStringUseCaseMock,
        executeUIWithThemeAndIntentAndVariantAndTypographyAndTextAndTextHighlightRangeAndIsHighlightedCalled: !getAttributedStringUseCase
    )
}

private func XCTAssertEqualToExpected(
    on stub: Stub,
    otherAttributedString: NSAttributedString? = nil
) {
    let viewModel = stub.viewModel

    XCTAssertEqual(
        viewModel.attributedString,
        otherAttributedString ?? stub.expectedAttributedString,
        "Wrong attributedString value"
    )
}
