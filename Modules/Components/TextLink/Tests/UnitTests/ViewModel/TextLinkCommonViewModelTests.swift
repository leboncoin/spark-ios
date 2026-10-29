//
//  TextLinkCommonViewModelTests.swift
//  SparkComponentTextLinkUnitTests
//
//  Created by robin.lemaire on 15/02/2024.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
import SwiftUI

@testable import SparkComponentTextLink
@_spi(SI_SPI) @testable import SparkComponentTextLinkTesting
@_spi(SI_SPI) import SparkThemingTesting
import SparkTheming

@MainActor
@Suite("TextLink Common ViewModel Tests")
struct TextLinkCommonViewModelTests {

    // MARK: - Initialization

    @Test("Initialization should use default values")
    func initializationShouldUseDefaultValues() {
        // GIVEN / WHEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // THEN
        #expect(viewModel.theme == nil)
        #expect(viewModel.intent == nil)
        #expect(!viewModel.isHighlighted)
        #expect(viewModel.text == nil)
        #expect(viewModel.textHighlightRange == nil)
        #expect(viewModel.typography == nil)
        #expect(viewModel.variant == nil)

        expectEqualToExpected(
            on: stub,
            otherSpacing: .zero,
            otherImageSize: TextLinkImageSize(),
            otherImageColor: ColorTokenDefault.clear,
            otherDim: .zero,
            otherHoverStyle: TextLinkHoverStyle()
        )

        #expect(!viewModel.setAttributedStringCalled)

        expectNotCalled(
            on: stub,
            getSpacingUseCase: true,
            getImageSizeUseCase: true,
            getColorUseCase: true,
            getDimUseCase: true,
            getHoverStyleUseCase: true
        )
    }

    // MARK: - Setup

    @Test("Setup should call all use cases")
    func setupShouldCallAllUseCases() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // WHEN
        viewModel.setup(stub: stub)

        // THEN
        expectEqualToExpected(on: stub)

        #expect(viewModel.setAttributedStringCallCount > 0)

        TextLinkGetSpacingUseCaseableMockTest.expect(
            stub.getSpacingUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            expectedReturnValue: stub.expectedSpacing
        )
        TextLinkGetImageSizeUseCaseableMockTest.expect(
            stub.getImageSizeUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenTypography: stub.givenTypography,
            expectedReturnValue: stub.expectedImageSize
        )
        TextLinkGetColorUseCaseableMockTest.expect(
            stub.getColorUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: stub.givenIntent,
            givenIsHighlighted: stub.givenIsHighlighted,
            expectedReturnValue: stub.expectedImageColor
        )
        TextLinkGetDimUseCaseableMockTest.expect(
            stub.getDimUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: stub.givenIntent,
            givenIsHighlighted: stub.givenIsHighlighted,
            expectedReturnValue: stub.expectedDim
        )
        TextLinkGetHoverStyleUseCaseableMockTest.expect(
            stub.getHoverStyleUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: stub.givenIntent,
            expectedReturnValue: stub.expectedHoverStyle
        )
    }

    // MARK: - Property Changes

    @Test("Theme changed should update dependent properties")
    func themeChangedShouldUpdateDependentProperties() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let newTheme = ThemeGeneratedMock.mocked()

        // WHEN
        viewModel.theme = newTheme

        // THEN
        expectEqualToExpected(on: stub)

        #expect(viewModel.setAttributedStringCallCount == 1)

        TextLinkGetSpacingUseCaseableMockTest.expect(
            stub.getSpacingUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: newTheme,
            expectedReturnValue: stub.expectedSpacing
        )
        TextLinkGetImageSizeUseCaseableMockTest.expect(
            stub.getImageSizeUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: newTheme,
            givenTypography: stub.givenTypography,
            expectedReturnValue: stub.expectedImageSize
        )
        TextLinkGetColorUseCaseableMockTest.expect(
            stub.getColorUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: newTheme,
            givenIntent: stub.givenIntent,
            givenIsHighlighted: stub.givenIsHighlighted,
            expectedReturnValue: stub.expectedImageColor
        )
        TextLinkGetDimUseCaseableMockTest.expect(
            stub.getDimUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: newTheme,
            givenIntent: stub.givenIntent,
            givenIsHighlighted: stub.givenIsHighlighted,
            expectedReturnValue: stub.expectedDim
        )
        TextLinkGetHoverStyleUseCaseableMockTest.expect(
            stub.getHoverStyleUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: newTheme,
            givenIntent: stub.givenIntent,
            expectedReturnValue: stub.expectedHoverStyle
        )
    }

    @Test("Intent changed should update dependent properties")
    func intentChangedShouldUpdateDependentProperties() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let newIntent: TextLinkIntent = .danger

        // WHEN
        viewModel.intent = newIntent

        // THEN
        expectEqualToExpected(on: stub)

        #expect(viewModel.setAttributedStringCallCount == 1)

        TextLinkGetColorUseCaseableMockTest.expect(
            stub.getColorUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: newIntent,
            givenIsHighlighted: stub.givenIsHighlighted,
            expectedReturnValue: stub.expectedImageColor
        )
        TextLinkGetDimUseCaseableMockTest.expect(
            stub.getDimUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: newIntent,
            givenIsHighlighted: stub.givenIsHighlighted,
            expectedReturnValue: stub.expectedDim
        )
        TextLinkGetHoverStyleUseCaseableMockTest.expect(
            stub.getHoverStyleUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: newIntent,
            expectedReturnValue: stub.expectedHoverStyle
        )

        expectNotCalled(
            on: stub,
            getSpacingUseCase: true,
            getImageSizeUseCase: true
        )
    }

    @Test("Is highlighted changed should update dependent properties")
    func isHighlightedChangedShouldUpdateDependentProperties() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let newIsHighlighted = !stub.givenIsHighlighted

        // WHEN
        viewModel.isHighlighted = newIsHighlighted

        // THEN
        expectEqualToExpected(on: stub)

        #expect(viewModel.setAttributedStringCallCount == 1)

        TextLinkGetColorUseCaseableMockTest.expect(
            stub.getColorUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: stub.givenIntent,
            givenIsHighlighted: newIsHighlighted,
            expectedReturnValue: stub.expectedImageColor
        )
        TextLinkGetDimUseCaseableMockTest.expect(
            stub.getDimUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: stub.givenIntent,
            givenIsHighlighted: newIsHighlighted,
            expectedReturnValue: stub.expectedDim
        )

        expectNotCalled(
            on: stub,
            getSpacingUseCase: true,
            getImageSizeUseCase: true,
            getHoverStyleUseCase: true
        )
    }

    @Test("Typography changed should update dependent properties")
    func typographyChangedShouldUpdateDependentProperties() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let newTypography: TextLinkTypography = .body2

        // WHEN
        viewModel.typography = newTypography

        // THEN
        expectEqualToExpected(on: stub)
        #expect(viewModel.setAttributedStringCallCount == 1)

        TextLinkGetImageSizeUseCaseableMockTest.expect(
            stub.getImageSizeUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenTypography: newTypography,
            expectedReturnValue: stub.expectedImageSize
        )

        expectNotCalled(
            on: stub,
            getSpacingUseCase: true,
            getColorUseCase: true,
            getDimUseCase: true,
            getHoverStyleUseCase: true
        )
    }

    @Test("Variant changed should update attributed string only")
    func variantChangedShouldUpdateAttributedStringOnly() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let newVariant: TextLinkVariant = .none

        // WHEN
        viewModel.variant = newVariant

        // THEN
        expectEqualToExpected(on: stub)
        #expect(viewModel.setAttributedStringCallCount == 1)

        expectNotCalled(
            on: stub,
            getSpacingUseCase: true,
            getImageSizeUseCase: true,
            getColorUseCase: true,
            getDimUseCase: true,
            getHoverStyleUseCase: true
        )
    }

    @Test("Text changed should update attributed string only")
    func textChangedShouldUpdateAttributedStringOnly() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let newText = stub.givenText + " updated"

        // WHEN
        viewModel.text = newText

        // THEN
        expectEqualToExpected(on: stub)
        #expect(viewModel.setAttributedStringCallCount == 1)

        expectNotCalled(
            on: stub,
            getSpacingUseCase: true,
            getImageSizeUseCase: true,
            getColorUseCase: true,
            getDimUseCase: true,
            getHoverStyleUseCase: true
        )
    }

    @Test("Text highlight range changed should update attributed string only")
    func textHighlightRangeChangedShouldUpdateAttributedStringOnly() {
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
            expectEqualToExpected(on: stub)
            #expect(viewModel.setAttributedStringCallCount == 1)

            expectNotCalled(
                on: stub,
                getSpacingUseCase: true,
                getImageSizeUseCase: true,
                getColorUseCase: true,
                getDimUseCase: true,
                getHoverStyleUseCase: true
            )
        }
    }

    @Test("Properties changed before setup should not call use cases")
    func propertiesChangedBeforeSetupShouldNotCallUseCases() {
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
        expectEqualToExpected(
            on: stub,
            otherSpacing: .zero,
            otherImageSize: TextLinkImageSize(),
            otherImageColor: ColorTokenDefault.clear,
            otherDim: .zero,
            otherHoverStyle: TextLinkHoverStyle()
        )
        #expect(!viewModel.setAttributedStringCalled)

        expectNotCalled(
            on: stub,
            getSpacingUseCase: true,
            getImageSizeUseCase: true,
            getColorUseCase: true,
            getDimUseCase: true,
            getHoverStyleUseCase: true
        )
    }

    @Test("Properties changed without value change should not call use cases")
    func propertiesChangedWithoutValueChangeShouldNotCallUseCases() {
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

        #expect(!viewModel.setAttributedStringCalled)

        expectNotCalled(
            on: stub,
            getSpacingUseCase: true,
            getImageSizeUseCase: true,
            getColorUseCase: true,
            getDimUseCase: true,
            getHoverStyleUseCase: true
        )
    }

    @Test("Properties changed for nil should not call all use cases")
    func propertiesChangedForNilShouldNotCallAllUseCases() {
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
        expectEqualToExpected(on: stub)

        #expect(viewModel.setAttributedStringCalled)

        expectNotCalled(
            on: stub,
            getSpacingUseCase: true,
            getImageSizeUseCase: true,
            getColorUseCase: true,
            getDimUseCase: true,
            getHoverStyleUseCase: true
        )
    }

    @Test("Content size category did update")
    func contentSizeCategoryDidUpdate() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        // WHEN
        viewModel.contentSizeCategoryDidUpdate()

        // THEN
        expectEqualToExpected(on: stub)

        TextLinkGetImageSizeUseCaseableMockTest.expect(
            stub.getImageSizeUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenTypography: stub.givenTypography,
            expectedReturnValue: stub.expectedImageSize
        )

        expectNotCalled(
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

// MARK: - Expectations

private func expectNotCalled(
    on stub: Stub,
    getSpacingUseCase: Bool = false,
    getImageSizeUseCase: Bool = false,
    getColorUseCase: Bool = false,
    getDimUseCase: Bool = false,
    getHoverStyleUseCase: Bool = false,
    sourceLocation: Testing.SourceLocation = #_sourceLocation
) {
    TextLinkGetSpacingUseCaseableMockTest.expectCalled(
        stub.getSpacingUseCaseMock,
        executeWithThemeCalled: !getSpacingUseCase,
        sourceLocation: sourceLocation
    )
    TextLinkGetImageSizeUseCaseableMockTest.expectCalled(
        stub.getImageSizeUseCaseMock,
        executeWithThemeAndTypographyCalled: !getImageSizeUseCase,
        sourceLocation: sourceLocation
    )
    TextLinkGetColorUseCaseableMockTest.expectCalled(
        stub.getColorUseCaseMock,
        executeWithThemeAndIntentAndIsHighlightedCalled: !getColorUseCase,
        sourceLocation: sourceLocation
    )
    TextLinkGetDimUseCaseableMockTest.expectCalled(
        stub.getDimUseCaseMock,
        executeWithThemeAndIntentAndIsHighlightedCalled: !getDimUseCase,
        sourceLocation: sourceLocation
    )
    TextLinkGetHoverStyleUseCaseableMockTest.expectCalled(
        stub.getHoverStyleUseCaseMock,
        executeWithThemeAndIntentCalled: !getHoverStyleUseCase,
        sourceLocation: sourceLocation
    )
}

private func expectEqualToExpected(
    on stub: Stub,
    otherSpacing: CGFloat? = nil,
    otherImageSize: TextLinkImageSize? = nil,
    otherImageColor: (any ColorToken)? = nil,
    otherDim: CGFloat? = nil,
    otherHoverStyle: TextLinkHoverStyle? = nil,
    sourceLocation: Testing.SourceLocation = #_sourceLocation
) {
    let viewModel = stub.viewModel

    #expect(
        viewModel.spacing == otherSpacing ?? stub.expectedSpacing,
        "Wrong spacing value",
        sourceLocation: sourceLocation
    )

    #expect(
        viewModel.imageSize == otherImageSize ?? stub.expectedImageSize,
        "Wrong imageSize value",
        sourceLocation: sourceLocation
    )
    #expect(
        viewModel.imageColor.equals(otherImageColor ?? stub.expectedImageColor),
        "Wrong imageColor value",
        sourceLocation: sourceLocation
    )

    #expect(
        viewModel.dim == otherDim ?? stub.expectedDim,
        "Wrong dim value",
        sourceLocation: sourceLocation
    )
    #expect(
        viewModel.hoverStyle == otherHoverStyle ?? stub.expectedHoverStyle,
        "Wrong hoverStyle value",
        sourceLocation: sourceLocation
    )
}
