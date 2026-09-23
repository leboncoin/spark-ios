//
//  TextLinkCommonViewModelTests.swift
//  SparkComponentTextLinkUnitTests
//
//  Created by robin.lemaire on 08/12/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentTextLink
@_spi(SI_SPI) @testable import SparkComponentTextLinkTesting
@_spi(SI_SPI) import SparkThemingTesting
@_spi(SI_SPI) import SparkCommon
import Combine

final class TextLinkViewModelDeprecatedTests: XCTestCase {

    // MARK: - Properties

    private var subscriptions = Set<AnyCancellable>()

    // MARK: - Setup

    override func tearDown() {
        super.tearDown()

        // Clear publishers
        self.subscriptions.removeAll()
    }

    // MARK: - Init & Load Tests

    func test_properties_on_init_when_frameworkType_is_UIKit() throws {
        try self.testAllOnInitOrLoad(
            givenFrameworkType: .uiKit,
            givenIsInit: true,
            expectedIsNumberOfSinksCalled: true,
            expectedIsSinksValues: false,
            expectedIsNumberOfCallsCalled: false
        )
    }

    func test_properties_on_init_when_frameworkType_is_SwiftUI() throws {
        try self.testAllOnInitOrLoad(
            givenFrameworkType: .swiftUI,
            givenIsInit: true,
            expectedIsNumberOfSinksCalled: true,
            expectedIsSinksValues: true,
            expectedIsNumberOfCallsCalled: true
        )
    }

    func test_published_properties_on_load_when_frameworkType_is_UIKit() throws {
        try self.testAllOnInitOrLoad(
            givenFrameworkType: .uiKit,
            givenIsInit: false,
            expectedIsNumberOfSinksCalled: true,
            expectedIsSinksValues: true,
            expectedIsNumberOfCallsCalled: true
        )
    }

    func test_published_properties_on_load_when_frameworkType_is_SwiftUI() throws {
        try self.testAllOnInitOrLoad(
            givenFrameworkType: .swiftUI,
            givenIsInit: false,
            expectedIsNumberOfSinksCalled: false,
            expectedIsSinksValues: false,
            expectedIsNumberOfCallsCalled: false
        )
    }

    private func testAllOnInitOrLoad(
        givenFrameworkType: FrameworkType,
        givenIsInit: Bool,
        expectedIsNumberOfSinksCalled: Bool,
        expectedIsSinksValues: Bool,
        expectedIsNumberOfCallsCalled: Bool
    ) throws {
        // GIVEN
        let textMock = "My Text"
        let textHighlightRangeMock = NSRange()
        let intentMock: TextLinkIntent = .accent
        let typographyMock: TextLinkTypography = .body1
        let variantMock: TextLinkVariant = .underline
        let alignmentMock: TextLinkAlignment = .leadingImage

        // WHEN
        let stub = Stub(
            frameworkType: givenFrameworkType,
            text: textMock,
            textHighlightRange: textHighlightRangeMock,
            intent: intentMock,
            typography: typographyMock,
            variant: variantMock,
            alignment: alignmentMock
        )
        let viewModel = stub.viewModel

        stub.subscribePublishers(on: &self.subscriptions)

        if !givenIsInit {
            // Reset all UseCase mock
            stub.resetMockedData()

            viewModel.load()
        }

        // THEN
        XCTAssertIdentical(
            viewModel.theme as? ThemeGeneratedMock,
            stub.themeMock,
            "Wrong theme value"
        )
        XCTAssertEqual(
            viewModel.text,
            textMock,
            "Wrong text value"
        )
        XCTAssertEqual(
            viewModel.intent,
            intentMock,
            "Wrong intent value"
        )
        XCTAssertFalse(
            viewModel.isHighlighted,
            "Wrong isHighlighted value"
        )
        XCTAssertEqual(
            viewModel.textHighlightRange,
            textHighlightRangeMock,
            "Wrong range value"
        )
        XCTAssertEqual(
            viewModel.typography,
            typographyMock,
            "Wrong typography value"
        )
        XCTAssertEqual(
            viewModel.variant,
            variantMock,
            "Wrong variant value"
        )
        XCTAssertEqual(
            viewModel.alignment,
            alignmentMock,
            "Wrong alignment value"
        )

        // **
        // Published count (the properties are already test on load and init tests)
        let expectedNumberOfSinks = expectedIsNumberOfSinksCalled ? 1 : 0
        TextLinkViewModelDeprecatedPublisherTest.XCTAssert(
            attributedText: stub.attributedTextPublisherMock,
            expectedNumberOfSinks: expectedNumberOfSinks,
            expectedValue: expectedIsSinksValues ? stub.attributedStringMock : nil
        )
        TextLinkViewModelDeprecatedPublisherTest.XCTAssert(
            spacing: stub.spacingPublisherMock,
            expectedNumberOfSinks: expectedNumberOfSinks,
            expectedValue: expectedIsSinksValues ? stub.spacingMock : .zero
        )
        TextLinkViewModelDeprecatedPublisherTest.XCTAssert(
            imageSize: stub.imageSizePublisherMock,
            expectedNumberOfSinks: expectedNumberOfSinks,
            expectedValue: expectedIsSinksValues ? stub.imageSizeMock : nil
        )
        if expectedIsSinksValues {
            TextLinkViewModelDeprecatedPublisherTest.XCTAssert(
                imageTintColor: stub.imageTintColorPublisherMock,
                expectedNumberOfSinks: expectedNumberOfSinks,
                expectedValue: stub.colorMock
            )
        } else {
            TextLinkViewModelDeprecatedPublisherTest.XCTSinksCount(
                imageTintColor: stub.imageTintColorPublisherMock,
                expectedNumberOfSinks: expectedNumberOfSinks
            )
        }

        TextLinkViewModelDeprecatedPublisherTest.XCTAssert(
            isTrailingImage: stub.isTrailingImagePublisherMock,
            expectedNumberOfSinks: expectedNumberOfSinks,
            expectedValue: expectedIsSinksValues ? stub.isTrailingImageMock : false
        )

        TextLinkViewModelDeprecatedPublisherTest.XCTAssert(
            dim: stub.dimPublisherMock,
            expectedNumberOfSinks: expectedNumberOfSinks,
            expectedValue: expectedIsSinksValues ? stub.dimMock : .zero
        )
        TextLinkViewModelDeprecatedPublisherTest.XCTAssert(
            hoverStyle: stub.hoverStylePublisherMock,
            expectedNumberOfSinks: expectedNumberOfSinks,
            expectedValue: expectedIsSinksValues ? stub.hoverStyleMock : .init()
        )
        // **

        // Use Cases count (the parameters and returns are already test on load and init tests)
        let expectedNumberOfCalls = expectedIsNumberOfCallsCalled ? 1 : 0
        TextLinkGetTypographiesUseCaseDeprecatedableMockTest.XCTAssert(
            stub.getTypographiesUseCaseMock,
            expectedNumberOfCalls: expectedNumberOfCalls,
            givenTextLinkTypography: typographyMock,
            givenTypography: stub.themeMock.typography as? TypographyGeneratedMock,
            expectedReturnValue: stub.typographiesMock
        )
        TextLinkGetAttributedStringUseCaseDeprecatedableMockTest.XCTAssert(
            stub.getAttributedStringUseCaseMock,
            expectedNumberOfCalls: expectedNumberOfCalls,
            givenFrameworkType: givenFrameworkType,
            givenText: textMock,
            givenTextColorToken: stub.colorMock,
            givenTextHighlightRange: textHighlightRangeMock,
            givenIsHighlighted: false,
            givenVariant: variantMock,
            givenTypographies: stub.typographiesMock,
            expectedReturnValue: stub.attributedStringMock
        )
        TextLinkGetImageSizeUseCaseDeprecatedableMockTest.XCTAssert(
            stub.getImageSizeUseCaseMock,
            expectedNumberOfCalls: expectedNumberOfCalls,
            givenTypographies: stub.typographiesMock,
            expectedReturnValue: stub.imageSizeMock
        )
        TextLinkGetColorUseCaseDeprecatedableMockTest.XCTAssert(
            stub.getColorUseCaseMock,
            expectedNumberOfCalls: expectedNumberOfCalls,
            givenIntent: intentMock,
            givenIsHighlighted: false,
            givenColors: stub.themeMock.colors as? ColorsGeneratedMock,
            expectedReturnValue: stub.colorMock
        )
        TextLinkGetDimUseCaseDeprecatedableMockTest.XCTAssert(
            stub.getDimUseCaseMock,
            expectedNumberOfCalls: expectedNumberOfCalls,
            givenIntent: intentMock,
            givenIsHighlighted: false,
            givenDims: stub.themeMock.dims as? DimsGeneratedMock,
            expectedReturnValue: stub.dimMock
        )
        TextLinkGetHoverStyleUseCaseDeprecatedableMockTest.XCTAssert(
            stub.getHoverStyleUseCaseMock,
            expectedNumberOfCalls: expectedNumberOfCalls,
            givenTheme: stub.themeMock,
            givenIntent: intentMock,
            expectedReturnValue: stub.hoverStyleMock
        )
    }

    // MARK: - Update State Properties Tests

    func test_set_themes() {
        // GIVEN
        let newTheme = ThemeGeneratedMock.mocked()

        let stub = Stub(frameworkType: .swiftUI)
        let viewModel = stub.viewModel

        stub.subscribePublishers(on: &self.subscriptions)

        // Reset all UseCase mock
        stub.resetMockedData()

        // WHEN
        viewModel.theme = newTheme

        // THEN
        XCTAssertIdentical(
            viewModel.theme as? ThemeGeneratedMock,
            newTheme,
            "Wrong theme value"
        )

        // **
        // Published count (the properties are already test on load and init tests)
        TextLinkViewModelDeprecatedPublisherTest.XCTSinksCount(
            attributedText: stub.attributedTextPublisherMock,
            expectedNumberOfSinks: 1
        )
        TextLinkViewModelDeprecatedPublisherTest.XCTSinksCount(
            spacing: stub.spacingPublisherMock,
            expectedNumberOfSinks: 1
        )
        TextLinkViewModelDeprecatedPublisherTest.XCTSinksCount(
            imageSize: stub.imageSizePublisherMock,
            expectedNumberOfSinks: 1
        )
        TextLinkViewModelDeprecatedPublisherTest.XCTSinksCount(
            imageTintColor: stub.imageTintColorPublisherMock,
            expectedNumberOfSinks: 1
        )
        TextLinkViewModelDeprecatedPublisherTest.XCTSinksCount(
            isTrailingImage: stub.isTrailingImagePublisherMock,
            expectedNumberOfSinks: 0
        )
        TextLinkViewModelDeprecatedPublisherTest.XCTSinksCount(
            dim: stub.dimPublisherMock,
            expectedNumberOfSinks: 1
        )
        TextLinkViewModelDeprecatedPublisherTest.XCTSinksCount(
            hoverStyle: stub.hoverStylePublisherMock,
            expectedNumberOfSinks: 1
        )
        TextLinkViewModelDeprecatedPublisherTest.XCTSinksCount(
            dim: stub.dimPublisherMock,
            expectedNumberOfSinks: 1
        )
        TextLinkViewModelDeprecatedPublisherTest.XCTSinksCount(
            hoverStyle: stub.hoverStylePublisherMock,
            expectedNumberOfSinks: 1
        )
        // **

        // Use Cases count (the parameters and returns are already test on load and init tests)
        TextLinkGetTypographiesUseCaseDeprecatedableMockTest.XCTCallsCount(
            stub.getTypographiesUseCaseMock,
            executeWithTextLinkTypographyAndTypographyNumberOfCalls: 1
        )
        TextLinkGetAttributedStringUseCaseDeprecatedableMockTest.XCTCallsCount(
            stub.getAttributedStringUseCaseMock,
            executeWithFrameworkTypeAndTextAndTextColorTokenAndTextHighlightRangeAndIsHighlightedAndVariantAndTypographiesNumberOfCalls: 1
        )
        TextLinkGetImageSizeUseCaseDeprecatedableMockTest.XCTCallsCount(
            stub.getImageSizeUseCaseMock,
            executeWithTypographiesNumberOfCalls: 1
        )
    }

    func test_set_text_with_different_new_value() {
        self.testSetText(
            givenIsDifferentNewValue: true
        )
    }

    func test_set_text_with_same_new_value() {
        self.testSetText(
            givenIsDifferentNewValue: false
        )
    }

    private func testSetText(
        givenIsDifferentNewValue: Bool
    ) {
        // GIVEN
        let defaultValue = "Text"
        let newValue = givenIsDifferentNewValue ? "New Text" : defaultValue

        let stub = Stub(
            frameworkType: .swiftUI,
            text: defaultValue
        )
        let viewModel = stub.viewModel

        stub.subscribePublishers(on: &self.subscriptions)

        // Reset all UseCase mock
        stub.resetMockedData()

        // WHEN
        viewModel.text = newValue

        // THEN
        XCTAssertEqual(
            viewModel.text,
            newValue,
            "Wrong text value"
        )

        self.testPublishersAndUseCasesWhenContentChanged(
            stub: stub,
            givenIsContentDidUpdate: givenIsDifferentNewValue
        )
    }

    func test_set_textHighlightRange_with_different_new_value() {
        self.testSetTextHighlightRange(
            givenIsDifferentNewValue: true
        )
    }

    func test_set_textHighlightRange_with_same_new_value() {
        self.testSetTextHighlightRange(
            givenIsDifferentNewValue: false
        )
    }

    private func testSetTextHighlightRange(
        givenIsDifferentNewValue: Bool
    ) {
        // GIVEN
        let defaultValue = NSRange(location: 0, length: 1)
        let newValue = givenIsDifferentNewValue ? .init(location: 1, length: 2) : defaultValue

        let stub = Stub(
            frameworkType: .swiftUI,
            textHighlightRange: defaultValue
        )
        let viewModel = stub.viewModel

        stub.subscribePublishers(on: &self.subscriptions)

        // Reset all UseCase mock
        stub.resetMockedData()

        // WHEN
        viewModel.textHighlightRange = newValue

        // THEN
        XCTAssertEqual(
            viewModel.textHighlightRange,
            newValue,
            "Wrong range value"
        )

        self.testPublishersAndUseCasesWhenContentChanged(
            stub: stub,
            givenIsContentDidUpdate: givenIsDifferentNewValue
        )
    }

    func test_set_intent_with_different_new_value() {
        self.testSetIntent(
            givenIsDifferentNewValue: true
        )
    }

    func test_set_intent_with_same_new_value() {
        self.testSetIntent(
            givenIsDifferentNewValue: false
        )
    }

    func testSetIntent(
        givenIsDifferentNewValue: Bool
    ) {
        // GIVEN
        let defaultValue: TextLinkIntent = .main
        let newValue = givenIsDifferentNewValue ? .accent : defaultValue

        let stub = Stub(
            frameworkType: .swiftUI,
            intent: defaultValue
        )
        let viewModel = stub.viewModel

        stub.subscribePublishers(on: &self.subscriptions)

        // Reset all UseCase mock
        stub.resetMockedData()

        // WHEN
        viewModel.intent = newValue

        // THEN
        XCTAssertEqual(
            viewModel.intent,
            newValue,
            "Wrong intent value"
        )

        self.testPublishersAndUseCasesWhenContentChanged(
            stub: stub,
            givenIsContentDidUpdate: givenIsDifferentNewValue
        )
    }

    func test_set_isHighlighted_with_different_new_value() {
        self.testSetIsHighlighted(
            givenIsDifferentNewValue: true
        )
    }

    func test_set_isHighlighted_with_same_new_value() {
        self.testSetIsHighlighted(
            givenIsDifferentNewValue: false
        )
    }

    private func testSetIsHighlighted(
        givenIsDifferentNewValue: Bool
    ) {
        // GIVEN
        let newValue = givenIsDifferentNewValue ? true : false  // On init, the value is false

        let stub = Stub(
            frameworkType: .swiftUI
        )
        let viewModel = stub.viewModel

        stub.subscribePublishers(on: &self.subscriptions)

        // Reset all UseCase mock
        stub.resetMockedData()

        // WHEN
        viewModel.isHighlighted = newValue

        // THEN
        self.testPublishersAndUseCasesWhenContentChanged(
            stub: stub,
            givenIsContentDidUpdate: givenIsDifferentNewValue
        )
    }

    func test_set_typography_with_different_new_value() {
        self.testSetTypography(
            givenIsDifferentNewValue: true
        )
    }

    func test_set_typography_with_same_new_value() {
        self.testSetTypography(
            givenIsDifferentNewValue: false
        )
    }

    private func testSetTypography(
        givenIsDifferentNewValue: Bool
    ) {
        // GIVEN
        let defaultValue: TextLinkTypography = .body1
        let newValue = givenIsDifferentNewValue ? .body2 : defaultValue

        let stub = Stub(
            frameworkType: .swiftUI,
            typography: defaultValue
        )
        let viewModel = stub.viewModel

        stub.subscribePublishers(on: &self.subscriptions)

        // Reset all UseCase mock
        stub.resetMockedData()

        // WHEN
        viewModel.typography = newValue

        // THEN
        XCTAssertEqual(
            viewModel.typography,
            newValue,
            "Wrong typography value"
        )

        self.testPublishersAndUseCasesWhenContentChanged(
            stub: stub,
            givenIsContentDidUpdate: givenIsDifferentNewValue,
            givenIsImageSizeDidUpdate: givenIsDifferentNewValue
        )
    }

    func test_set_variant_with_different_new_value() {
        self.testSetVariant(
            givenIsDifferentNewValue: true
        )
    }

    func test_set_variant_with_same_new_value() {
        self.testSetVariant(
            givenIsDifferentNewValue: false
        )
    }

    private func testSetVariant(
        givenIsDifferentNewValue: Bool
    ) {
        // GIVEN
        let defaultValue: TextLinkVariant = .underline
        let newValue = givenIsDifferentNewValue ? .none : defaultValue

        let stub = Stub(
            frameworkType: .swiftUI,
            variant: defaultValue
        )
        let viewModel = stub.viewModel

        stub.subscribePublishers(on: &self.subscriptions)

        // Reset all UseCase mock
        stub.resetMockedData()

        // WHEN
        viewModel.variant = newValue

        // THEN
        XCTAssertEqual(
            viewModel.variant,
            newValue,
            "Wrong variant value"
        )

        self.testPublishersAndUseCasesWhenContentChanged(
            stub: stub,
            givenIsContentDidUpdate: givenIsDifferentNewValue
        )
    }

    func test_set_alignment_with_different_new_value() {
        self.testSetAlignment(
            givenIsDifferentNewValue: true
        )
    }

    func test_set_alignment_with_same_new_value() {
        self.testSetAlignment(
            givenIsDifferentNewValue: false
        )
    }

    private func testSetAlignment(
        givenIsDifferentNewValue: Bool
    ) {
        // GIVEN
        let defaultValue: TextLinkAlignment = .leadingImage
        let newValue = givenIsDifferentNewValue ? .trailingImage : defaultValue

        let stub = Stub(
            frameworkType: .swiftUI,
            alignment: defaultValue
        )
        let viewModel = stub.viewModel

        stub.subscribePublishers(on: &self.subscriptions)

        // Reset all UseCase mock
        stub.resetMockedData()

        // WHEN
        viewModel.alignment = newValue

        // THEN
        XCTAssertEqual(
            viewModel.alignment,
            newValue,
            "Wrong alignment value"
        )

        // **
        // Published count (the properties are already test on load and init tests)
        TextLinkViewModelDeprecatedPublisherTest.XCTSinksCount(
            attributedText: stub.attributedTextPublisherMock,
            expectedNumberOfSinks: 0
        )
        TextLinkViewModelDeprecatedPublisherTest.XCTSinksCount(
            spacing: stub.spacingPublisherMock,
            expectedNumberOfSinks: 0
        )
        TextLinkViewModelDeprecatedPublisherTest.XCTSinksCount(
            imageSize: stub.imageSizePublisherMock,
            expectedNumberOfSinks: 0
        )
        TextLinkViewModelDeprecatedPublisherTest.XCTSinksCount(
            imageTintColor: stub.imageTintColorPublisherMock,
            expectedNumberOfSinks: 0
        )
        TextLinkViewModelDeprecatedPublisherTest.XCTSinksCount(
            isTrailingImage: stub.isTrailingImagePublisherMock,
            expectedNumberOfSinks: givenIsDifferentNewValue ? 1 : 0
        )
        TextLinkViewModelDeprecatedPublisherTest.XCTSinksCount(
            dim: stub.dimPublisherMock,
            expectedNumberOfSinks: 0
        )
        TextLinkViewModelDeprecatedPublisherTest.XCTSinksCount(
            hoverStyle: stub.hoverStylePublisherMock,
            expectedNumberOfSinks: 0
        )
        // **

        // Use Cases count (the parameters and returns are already test on load and init tests)
        TextLinkGetTypographiesUseCaseDeprecatedableMockTest.XCTCallsCount(
            stub.getTypographiesUseCaseMock,
            executeWithTextLinkTypographyAndTypographyNumberOfCalls: 0
        )
        TextLinkGetAttributedStringUseCaseDeprecatedableMockTest.XCTCallsCount(
            stub.getAttributedStringUseCaseMock,
            executeWithFrameworkTypeAndTextAndTextColorTokenAndTextHighlightRangeAndIsHighlightedAndVariantAndTypographiesNumberOfCalls: 0
        )
        TextLinkGetImageSizeUseCaseDeprecatedableMockTest.XCTCallsCount(
            stub.getImageSizeUseCaseMock,
            executeWithTypographiesNumberOfCalls: 0
        )
    }

    private func testPublishersAndUseCasesWhenContentChanged(
        stub: Stub,
        givenIsContentDidUpdate: Bool,
        givenIsImageSizeDidUpdate: Bool = false
    ) {
        // **
        // Published count (the properties are already test on load and init tests)
        TextLinkViewModelDeprecatedPublisherTest.XCTSinksCount(
            attributedText: stub.attributedTextPublisherMock,
            expectedNumberOfSinks: givenIsContentDidUpdate ? 1 : 0
        )
        TextLinkViewModelDeprecatedPublisherTest.XCTSinksCount(
            spacing: stub.spacingPublisherMock,
            expectedNumberOfSinks: givenIsContentDidUpdate ? 1 : 0
        )
        TextLinkViewModelDeprecatedPublisherTest.XCTSinksCount(
            imageSize: stub.imageSizePublisherMock,
            expectedNumberOfSinks: givenIsImageSizeDidUpdate ? 1 : 0
        )
        TextLinkViewModelDeprecatedPublisherTest.XCTSinksCount(
            imageTintColor: stub.imageTintColorPublisherMock,
            expectedNumberOfSinks: givenIsContentDidUpdate ? 1 : 0
        )
        TextLinkViewModelDeprecatedPublisherTest.XCTSinksCount(
            isTrailingImage: stub.isTrailingImagePublisherMock,
            expectedNumberOfSinks: givenIsImageSizeDidUpdate ? 1 : 0
        )
        TextLinkViewModelDeprecatedPublisherTest.XCTSinksCount(
            dim: stub.dimPublisherMock,
            expectedNumberOfSinks: givenIsContentDidUpdate ? 1 : 0
        )
        TextLinkViewModelDeprecatedPublisherTest.XCTSinksCount(
            hoverStyle: stub.hoverStylePublisherMock,
            expectedNumberOfSinks: givenIsContentDidUpdate ? 1 : 0
        )
        // **

        // Use Cases count (the parameters and returns are already test on load and init tests)
        TextLinkGetTypographiesUseCaseDeprecatedableMockTest.XCTCallsCount(
            stub.getTypographiesUseCaseMock,
            executeWithTextLinkTypographyAndTypographyNumberOfCalls: givenIsContentDidUpdate ? 1 : 0
        )
        TextLinkGetAttributedStringUseCaseDeprecatedableMockTest.XCTCallsCount(
            stub.getAttributedStringUseCaseMock,
            executeWithFrameworkTypeAndTextAndTextColorTokenAndTextHighlightRangeAndIsHighlightedAndVariantAndTypographiesNumberOfCalls: givenIsContentDidUpdate ? 1 : 0
        )
        TextLinkGetImageSizeUseCaseDeprecatedableMockTest.XCTCallsCount(
            stub.getImageSizeUseCaseMock,
            executeWithTypographiesNumberOfCalls: givenIsImageSizeDidUpdate ? 1 : 0
        )
        TextLinkGetColorUseCaseDeprecatedableMockTest.XCTCallsCount(
            stub.getColorUseCaseMock,
            executeWithIntentAndIsHighlightedAndColorsNumberOfCalls: givenIsContentDidUpdate ? 1 : 0
        )
        TextLinkGetDimUseCaseDeprecatedableMockTest.XCTCallsCount(
            stub.getDimUseCaseMock,
            executeWithIntentAndIsHighlightedAndDimsNumberOfCalls: givenIsContentDidUpdate ? 1 : 0
        )
        TextLinkGetHoverStyleUseCaseDeprecatedableMockTest.XCTCallsCount(
            stub.getHoverStyleUseCaseMock,
            executeWithThemeAndIntentNumberOfCalls: givenIsContentDidUpdate ? 1 : 0
        )
    }

    // MARK: - DidUpdate Tests

    func test_contentSizeCategoryDidUpdate() {
        // GIVEN
        let stub = Stub(frameworkType: .swiftUI)
        let viewModel = stub.viewModel

        stub.subscribePublishers(on: &self.subscriptions)

        // Reset all UseCase mock
        stub.resetMockedData()

        // WHEN
        viewModel.contentSizeCategoryDidUpdate()

        // THEN

        // **
        // Published properties
        TextLinkViewModelDeprecatedPublisherTest.XCTSinksCount(
            attributedText: stub.attributedTextPublisherMock,
            expectedNumberOfSinks: 0
        )
        TextLinkViewModelDeprecatedPublisherTest.XCTSinksCount(
            spacing: stub.spacingPublisherMock,
            expectedNumberOfSinks: 0
        )
        TextLinkViewModelDeprecatedPublisherTest.XCTSinksCount(
            imageSize: stub.imageSizePublisherMock,
            expectedNumberOfSinks: 1
        )
        TextLinkViewModelDeprecatedPublisherTest.XCTSinksCount(
            imageTintColor: stub.imageTintColorPublisherMock,
            expectedNumberOfSinks: 0
        )
        TextLinkViewModelDeprecatedPublisherTest.XCTSinksCount(
            isTrailingImage: stub.isTrailingImagePublisherMock,
            expectedNumberOfSinks: 0
        )
        TextLinkViewModelDeprecatedPublisherTest.XCTSinksCount(
            dim: stub.dimPublisherMock,
            expectedNumberOfSinks: 0
        )
        TextLinkViewModelDeprecatedPublisherTest.XCTSinksCount(
            hoverStyle: stub.hoverStylePublisherMock,
            expectedNumberOfSinks: 0
        )
        // **

        // Use Cases
        TextLinkGetTypographiesUseCaseDeprecatedableMockTest.XCTCallsCount(
            stub.getTypographiesUseCaseMock,
            executeWithTextLinkTypographyAndTypographyNumberOfCalls: 0
        )
        TextLinkGetAttributedStringUseCaseDeprecatedableMockTest.XCTCallsCount(
            stub.getAttributedStringUseCaseMock,
            executeWithFrameworkTypeAndTextAndTextColorTokenAndTextHighlightRangeAndIsHighlightedAndVariantAndTypographiesNumberOfCalls: 0
        )
        TextLinkGetImageSizeUseCaseDeprecatedableMockTest.XCTCallsCount(
            stub.getImageSizeUseCaseMock,
            executeWithTypographiesNumberOfCalls: 1
        )
        TextLinkGetColorUseCaseDeprecatedableMockTest.XCTCallsCount(
            stub.getColorUseCaseMock,
            executeWithIntentAndIsHighlightedAndColorsNumberOfCalls: 0
        )
        TextLinkGetDimUseCaseDeprecatedableMockTest.XCTCallsCount(
            stub.getDimUseCaseMock,
            executeWithIntentAndIsHighlightedAndDimsNumberOfCalls: 0
        )
        TextLinkGetHoverStyleUseCaseDeprecatedableMockTest.XCTCallsCount(
            stub.getHoverStyleUseCaseMock,
            executeWithThemeAndIntentNumberOfCalls: 0
        )
    }
}

// MARK: - Stub

private final class Stub: TextLinkViewModelDeprecatedStub {

    // MARK: - Data Properties

    let frameworkType: FrameworkType

    let themeMock = ThemeGeneratedMock.mocked()

    let colorMock = ColorTokenGeneratedMock.random()
    let dimMock = 0.8

    let typographiesMock = TextLinkTypographies.mocked()
    let attributedStringMock: AttributedStringEither = .left(.init(string: "AS"))
    var spacingMock: CGFloat {
        return self.themeMock.layout.spacing.medium
    }
    let imageSizeMock = TextLinkImageSize.mocked()
    var isTrailingImageMock: Bool {
        return self.viewModel.alignment.isTrailingImage
    }

    let hoverStyleMock = TextLinkHoverStyle(
        horizontalPadding: 2,
        verticalPadding: 3,
        cornerRadius: 4,
        backgroundColor: ColorTokenGeneratedMock.blue(),
        dim: 0.1
    )

    // MARK: - Initialization

    init(
        frameworkType: FrameworkType,
        text: String = "My Text",
        textHighlightRange: NSRange? = nil,
        intent: TextLinkIntent = .main,
        typography: TextLinkTypography = .body1,
        variant: TextLinkVariant = .underline,
        alignment: TextLinkAlignment = .leadingImage
    ) {
        // Data properties
        self.frameworkType = frameworkType

        // **
        // Use Cases
        let getColorUseCaseMock = TextLinkGetColorUseCaseDeprecatedableGeneratedMock()
        getColorUseCaseMock.executeWithIntentAndIsHighlightedAndColorsReturnValue = self.colorMock

        let getDimUseCaseMock = TextLinkGetDimUseCaseDeprecatedableGeneratedMock()
        getDimUseCaseMock.executeWithIntentAndIsHighlightedAndDimsReturnValue = self.dimMock

        let getHoverStyleUseCaseMock = TextLinkGetHoverStyleUseCaseDeprecatedableGeneratedMock()
        getHoverStyleUseCaseMock.executeWithThemeAndIntentReturnValue = self.hoverStyleMock

        let getTypographiesUseCaseMock = TextLinkGetTypographiesUseCaseDeprecatedableGeneratedMock()
        getTypographiesUseCaseMock.executeWithTextLinkTypographyAndTypographyReturnValue = self.typographiesMock

        let getAttributedStringUseCaseMock = TextLinkGetAttributedStringUseCaseDeprecatedableGeneratedMock()
        getAttributedStringUseCaseMock.executeWithFrameworkTypeAndTextAndTextColorTokenAndTextHighlightRangeAndIsHighlightedAndVariantAndTypographiesReturnValue = self.attributedStringMock

        let getImageSizeUseCaseMock = TextLinkGetImageSizeUseCaseDeprecatedableGeneratedMock()
        getImageSizeUseCaseMock.executeWithTypographiesReturnValue = self.imageSizeMock
        // **

        // View Model
        let viewModel = TextLinkViewModelDeprecated(
            for: frameworkType,
            theme: self.themeMock,
            text: text,
            textHighlightRange: textHighlightRange,
            intent: intent,
            typography: typography,
            variant: variant,
            alignment: alignment,
            getColorUseCase: getColorUseCaseMock,
            getDimUseCase: getDimUseCaseMock,
            getHoverStyleUseCase: getHoverStyleUseCaseMock,
            getTypographiesUseCase: getTypographiesUseCaseMock,
            getAttributedStringUseCase: getAttributedStringUseCaseMock,
            getImageSizeUseCase: getImageSizeUseCaseMock
        )

        super.init(
            viewModel: viewModel,
            getColorUseCaseMock: getColorUseCaseMock,
            getDimUseCaseMock: getDimUseCaseMock,
            getHoverStyleUseCaseMock: getHoverStyleUseCaseMock,
            getTypographiesUseCaseMock: getTypographiesUseCaseMock,
            getAttributedStringUseCaseMock: getAttributedStringUseCaseMock,
            getImageSizeUseCaseMock: getImageSizeUseCaseMock
        )
    }
}
