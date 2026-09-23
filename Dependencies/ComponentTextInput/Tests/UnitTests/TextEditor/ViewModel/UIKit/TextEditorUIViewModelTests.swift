//
//  TextEditorUIViewModelTests.swift
//  SparkTextEditorUnitTests
//
//  Created by robin.lemaire on 13/11/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Foundation
import XCTest
@testable import SparkComponentTextInput
@_spi(SI_SPI) @testable import SparkComponentTextInputTesting
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonTesting
@_spi(SI_SPI) import SparkThemingTesting
import SparkTheming
import SparkTheme
import Combine

final class TextEditorUIViewModelTests: XCTestCase {

    // MARK: - Properties

    private var subscriptions = Set<AnyCancellable>()

    // MARK: - Setup

    override func tearDown() {
        super.tearDown()

        // Clear publishers
        self.subscriptions.removeAll()
    }

    // MARK: - Init Tests

    func test_properties_on_init() {
        // GIVEN / WHEN
        let stub = Stub()

        stub.subscribePublishers(on: &self.subscriptions)

        // THEN

        // **
        // Published properties

        // Should Update Vertical Spacing
        TextEditorUIViewModelPublisherTest.XCTAssert(
            updateVerticalSpacingCounter: stub.updateVerticalSpacingCounterPublisherMock,
            expectedNumberOfSinks: 1,
            expectedValue: 0
        )

        // Is Placeholder
        TextEditorUIViewModelPublisherTest.XCTAssert(
            shouldShowPlaceholder: stub.shouldShowPlaceholderPublisherMock,
            expectedNumberOfSinks: 1,
            expectedValue: true
        )
        // **

        // Use Cases
        TextEditorGetVerticalSpacingUseCaseableMockTest.XCTCallsCount(
            stub.getVerticalSpacingUseCaseMock,
            executeWithHeightAndFontNumberOfCalls: 0
        )
    }

    // MARK: - Update

    func test_contentChanged_without_content() {
        self.testContentChanged(content: nil, expectedShouldShowPlaceholder: true)
    }

    func test_contentChanged_with_empty_content() {
        self.testContentChanged(content: "", expectedShouldShowPlaceholder: true)
    }

    func test_contentChanged_with_content() {
        self.testContentChanged(content: "Hey", expectedShouldShowPlaceholder: false)
    }

    func testContentChanged(
        content: String?,
        expectedShouldShowPlaceholder: Bool
    ) {
        // GIVEN
        let stub = Stub()

        stub.subscribePublishers(on: &self.subscriptions)
        stub.resetMockedData()

        // WHEN
        stub.viewModel.contentChanged(with: content)

        // THEN

        // **
        // Published properties

        // Should Update Vertical Spacing
        TextEditorUIViewModelPublisherTest.XCTSinksCount(
            updateVerticalSpacingCounter: stub.updateVerticalSpacingCounterPublisherMock,
            expectedNumberOfSinks: 0
        )

        // Is Placeholder
        TextEditorUIViewModelPublisherTest.XCTAssert(
            shouldShowPlaceholder: stub.shouldShowPlaceholderPublisherMock,
            expectedNumberOfSinks: 1,
            expectedValue: expectedShouldShowPlaceholder
        )
        // **

        // Use Cases
        TextEditorGetVerticalSpacingUseCaseableMockTest.XCTCallsCount(
            stub.getVerticalSpacingUseCaseMock,
            executeWithHeightAndFontNumberOfCalls: 0
        )
    }

    // MARK: - Setter

    func test_setFont() {
        // GIVEN
        let stub = Stub()

        stub.subscribePublishers(on: &self.subscriptions)
        stub.resetMockedData()

        // WHEN
        stub.viewModel.setFont()

        // THEN

        // **
        // Published properties

        // Should Update Vertical Spacing
        TextEditorUIViewModelPublisherTest.XCTAssert(
            updateVerticalSpacingCounter: stub.updateVerticalSpacingCounterPublisherMock,
            expectedNumberOfSinks: 1,
            expectedValue: 1
        )

        // Is Placeholder
        TextEditorUIViewModelPublisherTest.XCTSinksCount(
            shouldShowPlaceholder: stub.shouldShowPlaceholderPublisherMock,
            expectedNumberOfSinks: 0
        )
        // **

        // Use Cases
        TextEditorGetVerticalSpacingUseCaseableMockTest.XCTCallsCount(
            stub.getVerticalSpacingUseCaseMock,
            executeWithHeightAndFontNumberOfCalls: 0
        )
    }

    // MARK: - Getter

    func test_getVerticalSpacing() {
        // GIVEN
        let stub = Stub()
        let height: CGFloat = 200

        stub.resetMockedData()

        // WHEN
        let verticalSpacing = stub.viewModel.getVerticalSpacing(from: height)

        // THEN
        XCTAssertEqual(
            verticalSpacing,
            stub.verticalSpacing,
            "Wrong VerticalSpacing value"
        )

        // **
        // Published properties

        // Should Update Vertical Spacing
        TextEditorUIViewModelPublisherTest.XCTSinksCount(
            updateVerticalSpacingCounter: stub.updateVerticalSpacingCounterPublisherMock,
            expectedNumberOfSinks: 0
        )

        // Is Placeholder
        TextEditorUIViewModelPublisherTest.XCTSinksCount(
            shouldShowPlaceholder: stub.shouldShowPlaceholderPublisherMock,
            expectedNumberOfSinks: 0
        )
        // **

        // Use Cases
        TextEditorGetVerticalSpacingUseCaseableMockTest.XCTAssert(
            stub.getVerticalSpacingUseCaseMock,
            expectedNumberOfCalls: 1,
            givenHeight: height,
            givenFont: stub.themeMock.typography.body1 as? TypographyFontTokenGeneratedMock,
            expectedReturnValue: stub.verticalSpacing
        )
    }
}

private final class Stub: TextEditorUIViewModelStub {

    // MARK: - Properties

    let verticalSpacing: CGFloat = 20

    let themeMock = ThemeGeneratedMock.mocked()

    // MARK: - Initialization

    init() {
        // **
        // Use Cases
        let getVerticalSpacingUseCaseMock = TextEditorGetVerticalSpacingUseCaseableGeneratedMock()
        getVerticalSpacingUseCaseMock.executeWithHeightAndFontReturnValue = self.verticalSpacing
        // **

        // **
        // View Model
        let viewModel = TextEditorUIViewModel(
            theme: self.themeMock,
            intent: .neutral,
            getVerticalSpacingUseCase: getVerticalSpacingUseCaseMock
        )
        // **

        super.init(
            viewModel: viewModel,
            getVerticalSpacingUseCaseMock: getVerticalSpacingUseCaseMock
        )
    }
}
