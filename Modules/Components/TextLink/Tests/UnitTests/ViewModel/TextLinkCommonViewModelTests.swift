//
//  TextLinkCommonViewModelTests.swift
//  SparkComponentTextLinkUnitTests
//
//  Created by robin.lemaire on 15/02/2024.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
import SwiftUI

@testable import SparkComponentTextLink
@_spi(SI_SPI) @testable import SparkComponentTextLinkTesting
@_spi(SI_SPI) import SparkThemingTesting
import SparkTheming

final class TextLinkCommonViewModelTests: XCTestCase {

    // MARK: - Initialization

    func test_initialization_shouldUseDefaultValues() {
        // GIVEN / WHEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // THEN
        XCTAssertNil(viewModel.theme)
        XCTAssertNil(viewModel.intent)
        XCTAssertFalse(viewModel.isHighlighted)
        XCTAssertNil(viewModel.text)
        XCTAssertNil(viewModel.textHighlightRange)
        XCTAssertNil(viewModel.typography)
        XCTAssertNil(viewModel.variant)

        XCTAssertEqualToExpected(
            on: stub,
            otherSpacing: .zero,
            otherImageSize: TextLinkImageSize(),
            otherImageColor: ColorTokenDefault.clear,
            otherDim: .zero,
            otherHoverStyle: TextLinkHoverStyle()
        )

        XCTAssertFalse(viewModel.setAttributedStringCalled)

        XCTAssertNotCalled(
            on: stub,
            getSpacingUseCase: true,
            getImageSizeUseCase: true,
            getColorUseCase: true,
            getDimUseCase: true,
            getHoverStyleUseCase: true
        )
    }

    // MARK: - Setup

    func test_setup_shouldCallAllUseCases() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // WHEN
        viewModel.setup(stub: stub)

        // THEN
        XCTAssertEqualToExpected(on: stub)

        XCTAssertGreaterThan(viewModel.setAttributedStringCallCount, 0)

        TextLinkGetSpacingUseCaseableMockTest.XCTAssert(
            stub.getSpacingUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            expectedReturnValue: stub.expectedSpacing
        )
        TextLinkGetImageSizeUseCaseableMockTest.XCTAssert(
            stub.getImageSizeUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenTypography: stub.givenTypography,
            expectedReturnValue: stub.expectedImageSize
        )
        TextLinkGetColorUseCaseableMockTest.XCTAssert(
            stub.getColorUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: stub.givenIntent,
            givenIsHighlighted: stub.givenIsHighlighted,
            expectedReturnValue: stub.expectedImageColor
        )
        TextLinkGetDimUseCaseableMockTest.XCTAssert(
            stub.getDimUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: stub.givenIntent,
            givenIsHighlighted: stub.givenIsHighlighted,
            expectedReturnValue: stub.expectedDim
        )
        TextLinkGetHoverStyleUseCaseableMockTest.XCTAssert(
            stub.getHoverStyleUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: stub.givenIntent,
            expectedReturnValue: stub.expectedHoverStyle
        )
    }

    // MARK: - Property Changes

    func test_themeChanged_shouldUpdateDependentProperties() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let newTheme = ThemeGeneratedMock.mocked()

        // WHEN
        viewModel.theme = newTheme

        // THEN
        XCTAssertEqualToExpected(on: stub)

        XCTAssertEqual(viewModel.setAttributedStringCallCount, 1)

        TextLinkGetSpacingUseCaseableMockTest.XCTAssert(
            stub.getSpacingUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: newTheme,
            expectedReturnValue: stub.expectedSpacing
        )
        TextLinkGetImageSizeUseCaseableMockTest.XCTAssert(
            stub.getImageSizeUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: newTheme,
            givenTypography: stub.givenTypography,
            expectedReturnValue: stub.expectedImageSize
        )
        TextLinkGetColorUseCaseableMockTest.XCTAssert(
            stub.getColorUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: newTheme,
            givenIntent: stub.givenIntent,
            givenIsHighlighted: stub.givenIsHighlighted,
            expectedReturnValue: stub.expectedImageColor
        )
        TextLinkGetDimUseCaseableMockTest.XCTAssert(
            stub.getDimUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: newTheme,
            givenIntent: stub.givenIntent,
            givenIsHighlighted: stub.givenIsHighlighted,
            expectedReturnValue: stub.expectedDim
        )
        TextLinkGetHoverStyleUseCaseableMockTest.XCTAssert(
            stub.getHoverStyleUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: newTheme,
            givenIntent: stub.givenIntent,
            expectedReturnValue: stub.expectedHoverStyle
        )
    }

    func test_intentChanged_shouldUpdateDependentProperties() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let newIntent: TextLinkIntent = .danger

        // WHEN
        viewModel.intent = newIntent

        // THEN
        XCTAssertEqualToExpected(on: stub)

        XCTAssertEqual(viewModel.setAttributedStringCallCount, 1)

        TextLinkGetColorUseCaseableMockTest.XCTAssert(
            stub.getColorUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: newIntent,
            givenIsHighlighted: stub.givenIsHighlighted,
            expectedReturnValue: stub.expectedImageColor
        )
        TextLinkGetDimUseCaseableMockTest.XCTAssert(
            stub.getDimUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: newIntent,
            givenIsHighlighted: stub.givenIsHighlighted,
            expectedReturnValue: stub.expectedDim
        )
        TextLinkGetHoverStyleUseCaseableMockTest.XCTAssert(
            stub.getHoverStyleUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: newIntent,
            expectedReturnValue: stub.expectedHoverStyle
        )

        XCTAssertNotCalled(
            on: stub,
            getSpacingUseCase: true,
            getImageSizeUseCase: true
        )
    }

    func test_isHighlightedChanged_shouldUpdateDependentProperties() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let newIsHighlighted = !stub.givenIsHighlighted

        // WHEN
        viewModel.isHighlighted = newIsHighlighted

        // THEN
        XCTAssertEqualToExpected(on: stub)

        XCTAssertEqual(viewModel.setAttributedStringCallCount, 1)

        TextLinkGetColorUseCaseableMockTest.XCTAssert(
            stub.getColorUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: stub.givenIntent,
            givenIsHighlighted: newIsHighlighted,
            expectedReturnValue: stub.expectedImageColor
        )
        TextLinkGetDimUseCaseableMockTest.XCTAssert(
            stub.getDimUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: stub.givenIntent,
            givenIsHighlighted: newIsHighlighted,
            expectedReturnValue: stub.expectedDim
        )

        XCTAssertNotCalled(
            on: stub,
            getSpacingUseCase: true,
            getImageSizeUseCase: true,
            getHoverStyleUseCase: true
        )
    }

    func test_typographyChanged_shouldUpdateDependentProperties() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let newTypography: TextLinkTypography = .body2

        // WHEN
        viewModel.typography = newTypography

        // THEN
        XCTAssertEqualToExpected(on: stub)
        XCTAssertEqual(viewModel.setAttributedStringCallCount, 1)

        TextLinkGetImageSizeUseCaseableMockTest.XCTAssert(
            stub.getImageSizeUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenTypography: newTypography,
            expectedReturnValue: stub.expectedImageSize
        )

        XCTAssertNotCalled(
            on: stub,
            getSpacingUseCase: true,
            getColorUseCase: true,
            getDimUseCase: true,
            getHoverStyleUseCase: true
        )
    }

    func test_variantChanged_shouldUpdateAttributedStringOnly() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let newVariant: TextLinkVariant = .none

        // WHEN
        viewModel.variant = newVariant

        // THEN
        XCTAssertEqualToExpected(on: stub)
        XCTAssertEqual(viewModel.setAttributedStringCallCount, 1)

        XCTAssertNotCalled(
            on: stub,
            getSpacingUseCase: true,
            getImageSizeUseCase: true,
            getColorUseCase: true,
            getDimUseCase: true,
            getHoverStyleUseCase: true
        )
    }

    func test_textChanged_shouldUpdateAttributedStringOnly() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let newText = stub.givenText + " updated"

        // WHEN
        viewModel.text = newText

        // THEN
        XCTAssertEqualToExpected(on: stub)
        XCTAssertEqual(viewModel.setAttributedStringCallCount, 1)

        XCTAssertNotCalled(
            on: stub,
            getSpacingUseCase: true,
            getImageSizeUseCase: true,
            getColorUseCase: true,
            getDimUseCase: true,
            getHoverStyleUseCase: true
        )
    }

    func test_textHighlightRangeChanged_shouldUpdateAttributedStringOnly() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let newRanges = [NSRange(location: 1, length: 2), nil]

        for newRange in newRanges {
            viewModel.resetSetAttributedStringCallCount()

            // WHEN
            viewModel.textHighlightRange = newRange

            // THEN
            XCTAssertEqualToExpected(on: stub)
            XCTAssertEqual(viewModel.setAttributedStringCallCount, 1)

            XCTAssertNotCalled(
                on: stub,
                getSpacingUseCase: true,
                getImageSizeUseCase: true,
                getColorUseCase: true,
                getDimUseCase: true,
                getHoverStyleUseCase: true
            )
        }
    }

    func test_propertiesChanged_beforeSetup_shouldNotCallUseCases() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // WHEN
        viewModel.theme = ThemeGeneratedMock.mocked()
        viewModel.intent = .danger
        viewModel.isHighlighted = true
        viewModel.text = "Hello"
        viewModel.textHighlightRange = NSRange(location: 0, length: 1)
        viewModel.typography = .body2
        viewModel.variant = TextLinkVariant.none

        // THEN
        XCTAssertEqualToExpected(
            on: stub,
            otherSpacing: .zero,
            otherImageSize: TextLinkImageSize(),
            otherImageColor: ColorTokenDefault.clear,
            otherDim: .zero,
            otherHoverStyle: TextLinkHoverStyle()
        )
        XCTAssertFalse(viewModel.setAttributedStringCalled)

        XCTAssertNotCalled(
            on: stub,
            getSpacingUseCase: true,
            getImageSizeUseCase: true,
            getColorUseCase: true,
            getDimUseCase: true,
            getHoverStyleUseCase: true
        )
    }

    func test_propertiesChanged_withoutValueChange_shouldNotCallUseCases() {
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

        XCTAssertFalse(viewModel.setAttributedStringCalled)

        XCTAssertNotCalled(
            on: stub,
            getSpacingUseCase: true,
            getImageSizeUseCase: true,
            getColorUseCase: true,
            getDimUseCase: true,
            getHoverStyleUseCase: true
        )
    }

    func test_propertiesChanged_for_nil_shouldNotCallAllUseCases() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        // WHEN
        viewModel.theme = nil
        viewModel.intent = nil
        viewModel.text = nil
        viewModel.textHighlightRange = nil
        viewModel.typography = nil
        viewModel.variant = nil

        // THEN
        XCTAssertEqualToExpected(on: stub)

        XCTAssertTrue(viewModel.setAttributedStringCalled)

        XCTAssertNotCalled(
            on: stub,
            getSpacingUseCase: true,
            getImageSizeUseCase: true,
            getColorUseCase: true,
            getDimUseCase: true,
            getHoverStyleUseCase: true
        )
    }

    func test_contentSizeCategoryDidUpdate() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        // WHEN
        viewModel.contentSizeCategoryDidUpdate()

        // THEN
        XCTAssertEqualToExpected(on: stub)

        TextLinkGetImageSizeUseCaseableMockTest.XCTAssert(
            stub.getImageSizeUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenTypography: stub.givenTypography,
            expectedReturnValue: stub.expectedImageSize
        )

        XCTAssertNotCalled(
            on: stub,
            getSpacingUseCase: true,
            getColorUseCase: true,
            getDimUseCase: true,
            getHoverStyleUseCase: true
        )
    }
}

// MARK: - Stub

private final class Stub: TextLinkViewModelStub {

    // MARK: - Expected

    let expectedSpacing: CGFloat = 8
    let expectedImageSize = TextLinkImageSize(size: 12, padding: 4)
    let expectedImageColor = ColorTokenGeneratedMock.blue()
    let expectedDim: CGFloat = 0.4
    let expectedHoverStyle = TextLinkHoverStyle(
        horizontalPadding: 2,
        verticalPadding: 1,
        cornerRadius: 4,
        backgroundColor: ColorTokenGeneratedMock.red(),
        dim: 0.2
    )

    // MARK: - Use Case Mocks

    let getSpacingUseCaseMock: TextLinkGetSpacingUseCaseableGeneratedMock
    let getImageSizeUseCaseMock: TextLinkGetImageSizeUseCaseableGeneratedMock
    let getColorUseCaseMock: TextLinkGetColorUseCaseableGeneratedMock
    let getDimUseCaseMock: TextLinkGetDimUseCaseableGeneratedMock
    let getHoverStyleUseCaseMock: TextLinkGetHoverStyleUseCaseableGeneratedMock

    // MARK: - ViewModel

    let viewModel: TextLinkCommonViewModelTestDouble

    // MARK: - Initialization

    override init() {
        let getSpacingUseCaseMock = TextLinkGetSpacingUseCaseableGeneratedMock()
        getSpacingUseCaseMock.executeWithThemeReturnValue = self.expectedSpacing

        let getImageSizeUseCaseMock = TextLinkGetImageSizeUseCaseableGeneratedMock()
        getImageSizeUseCaseMock.executeWithThemeAndTypographyReturnValue = self.expectedImageSize

        let getColorUseCaseMock = TextLinkGetColorUseCaseableGeneratedMock()
        getColorUseCaseMock.executeWithThemeAndIntentAndIsHighlightedReturnValue = self.expectedImageColor

        let getDimUseCaseMock = TextLinkGetDimUseCaseableGeneratedMock()
        getDimUseCaseMock.executeWithThemeAndIntentAndIsHighlightedReturnValue = self.expectedDim

        let getHoverStyleUseCaseMock = TextLinkGetHoverStyleUseCaseableGeneratedMock()
        getHoverStyleUseCaseMock.executeWithThemeAndIntentReturnValue = self.expectedHoverStyle

        self.viewModel = TextLinkCommonViewModelTestDouble(
            getColorUseCase: getColorUseCaseMock,
            getDimUseCase: getDimUseCaseMock,
            getHoverStyleUseCase: getHoverStyleUseCaseMock,
            getImageSizeUseCase: getImageSizeUseCaseMock,
            getSpacingUseCase: getSpacingUseCaseMock,
            getTypographiesUseCase: TextLinkGetTypographiesUseCaseableGeneratedMock(),
            getUnderlineStyleUseCase: TextLinkGetUnderlineStyleUseCaseableGeneratedMock()
        )

        self.getSpacingUseCaseMock = getSpacingUseCaseMock
        self.getImageSizeUseCaseMock = getImageSizeUseCaseMock
        self.getColorUseCaseMock = getColorUseCaseMock
        self.getDimUseCaseMock = getDimUseCaseMock
        self.getHoverStyleUseCaseMock = getHoverStyleUseCaseMock

        super.init()
    }

    // MARK: - Helpers

    func resetMockedData() {
        self.getSpacingUseCaseMock.reset()
        self.getImageSizeUseCaseMock.reset()
        self.getColorUseCaseMock.reset()
        self.getDimUseCaseMock.reset()
        self.getHoverStyleUseCaseMock.reset()
        self.viewModel.resetSetAttributedStringCallCount()
    }
}

// MARK: - Test Double

private final class TextLinkCommonViewModelTestDouble: TextLinkCommonViewModel {

    // MARK: - Properties

    private(set) var setAttributedStringCallCount = 0
    var setAttributedStringCalled: Bool {
        return self.setAttributedStringCallCount > 0
    }

    // MARK: - Methods

    override func setAttributedString() {
        super.setAttributedString()

        self.setAttributedStringCallCount += 1
    }

    func resetSetAttributedStringCallCount() {
        self.setAttributedStringCallCount = 0
    }
}

// MARK: - XCTAssert

private func XCTAssertNotCalled(
    on stub: Stub,
    getSpacingUseCase: Bool = false,
    getImageSizeUseCase: Bool = false,
    getColorUseCase: Bool = false,
    getDimUseCase: Bool = false,
    getHoverStyleUseCase: Bool = false
) {
    TextLinkGetSpacingUseCaseableMockTest.XCTCalled(
        stub.getSpacingUseCaseMock,
        executeWithThemeCalled: !getSpacingUseCase
    )
    TextLinkGetImageSizeUseCaseableMockTest.XCTCalled(
        stub.getImageSizeUseCaseMock,
        executeWithThemeAndTypographyCalled: !getImageSizeUseCase
    )
    TextLinkGetColorUseCaseableMockTest.XCTCalled(
        stub.getColorUseCaseMock,
        executeWithThemeAndIntentAndIsHighlightedCalled: !getColorUseCase
    )
    TextLinkGetDimUseCaseableMockTest.XCTCalled(
        stub.getDimUseCaseMock,
        executeWithThemeAndIntentAndIsHighlightedCalled: !getDimUseCase
    )
    TextLinkGetHoverStyleUseCaseableMockTest.XCTCalled(
        stub.getHoverStyleUseCaseMock,
        executeWithThemeAndIntentCalled: !getHoverStyleUseCase
    )
}

private func XCTAssertEqualToExpected(
    on stub: Stub,
    otherSpacing: CGFloat? = nil,
    otherImageSize: TextLinkImageSize? = nil,
    otherImageColor: (any ColorToken)? = nil,
    otherDim: CGFloat? = nil,
    otherHoverStyle: TextLinkHoverStyle? = nil
) {
    let viewModel = stub.viewModel

    XCTAssertEqual(
        viewModel.spacing,
        otherSpacing ?? stub.expectedSpacing,
        "Wrong spacing value"
    )

    XCTAssertEqual(
        viewModel.imageSize,
        otherImageSize ?? stub.expectedImageSize,
        "Wrong imageSize value"
    )
    XCTAssertTrue(
        viewModel.imageColor.equals(otherImageColor ?? stub.expectedImageColor),
        "Wrong imageColor value"
    )

    XCTAssertEqual(
        viewModel.dim,
        otherDim ?? stub.expectedDim,
        "Wrong dim value"
    )
    XCTAssertEqual(
        viewModel.hoverStyle,
        otherHoverStyle ?? stub.expectedHoverStyle,
        "Wrong hoverStyle value"
    )
}
