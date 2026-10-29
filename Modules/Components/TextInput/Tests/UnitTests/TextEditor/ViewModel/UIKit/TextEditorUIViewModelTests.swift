//
//  TextEditorUIViewModelTests.swift
//  SparkTextEditorUnitTests
//
//  Created by robin.lemaire on 13/11/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Foundation
import Testing
@testable import SparkComponentTextInput
@_spi(SI_SPI) @testable import SparkComponentTextInputTesting
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonTesting
@_spi(SI_SPI) import SparkThemingTesting
import SparkTheming
import SparkTheme
import Combine

@MainActor
@Suite("TextEditor UI ViewModel Tests")
final class TextEditorUIViewModelTests {

    // MARK: - Properties

    private var subscriptions = Set<AnyCancellable>()

    // MARK: - Init Tests

    @Test("Properties on init")
    func propertiesOnInit() {
        // GIVEN / WHEN
        let stub = Stub()

        stub.subscribePublishers(on: &self.subscriptions)

        // THEN

        // **
        // Published properties

        // Should Update Vertical Spacing
        TextEditorUIViewModelPublisherTest.expect(
            updateVerticalSpacingCounter: stub.updateVerticalSpacingCounterPublisherMock,
            expectedNumberOfSinks: 1,
            expectedValue: 0
        )

        // Is Placeholder
        TextEditorUIViewModelPublisherTest.expect(
            shouldShowPlaceholder: stub.shouldShowPlaceholderPublisherMock,
            expectedNumberOfSinks: 1,
            expectedValue: true
        )
        // **

        // Use Cases
        TextEditorGetVerticalSpacingUseCaseableMockTest.expectCallsCount(
            stub.getVerticalSpacingUseCaseMock,
            executeWithHeightAndFontNumberOfCalls: 0
        )
    }

    // MARK: - Update

    @Test("Content changed without content")
    func contentChangedWithoutContent() {
        self.testContentChanged(content: nil, expectedShouldShowPlaceholder: true)
    }

    @Test("Content changed with empty content")
    func contentChangedWithEmptyContent() {
        self.testContentChanged(content: "", expectedShouldShowPlaceholder: true)
    }

    @Test("Content changed with content")
    func contentChangedWithContent() {
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
        TextEditorUIViewModelPublisherTest.expectSinksCount(
            updateVerticalSpacingCounter: stub.updateVerticalSpacingCounterPublisherMock,
            expectedNumberOfSinks: 0
        )

        // Is Placeholder
        TextEditorUIViewModelPublisherTest.expect(
            shouldShowPlaceholder: stub.shouldShowPlaceholderPublisherMock,
            expectedNumberOfSinks: 1,
            expectedValue: expectedShouldShowPlaceholder
        )
        // **

        // Use Cases
        TextEditorGetVerticalSpacingUseCaseableMockTest.expectCallsCount(
            stub.getVerticalSpacingUseCaseMock,
            executeWithHeightAndFontNumberOfCalls: 0
        )
    }

    // MARK: - Setter

    @Test("Set font")
    func setFont() {
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
        TextEditorUIViewModelPublisherTest.expect(
            updateVerticalSpacingCounter: stub.updateVerticalSpacingCounterPublisherMock,
            expectedNumberOfSinks: 1,
            expectedValue: 1
        )

        // Is Placeholder
        TextEditorUIViewModelPublisherTest.expectSinksCount(
            shouldShowPlaceholder: stub.shouldShowPlaceholderPublisherMock,
            expectedNumberOfSinks: 0
        )
        // **

        // Use Cases
        TextEditorGetVerticalSpacingUseCaseableMockTest.expectCallsCount(
            stub.getVerticalSpacingUseCaseMock,
            executeWithHeightAndFontNumberOfCalls: 0
        )
    }

    // MARK: - Getter

    @Test("Get vertical spacing")
    func getVerticalSpacing() {
        // GIVEN
        let stub = Stub()
        let height: CGFloat = 200

        stub.resetMockedData()

        // WHEN
        let verticalSpacing = stub.viewModel.getVerticalSpacing(from: height)

        // THEN
        #expect(
            verticalSpacing == stub.verticalSpacing,
            "Wrong VerticalSpacing value"
        )

        // **
        // Published properties

        // Should Update Vertical Spacing
        TextEditorUIViewModelPublisherTest.expectSinksCount(
            updateVerticalSpacingCounter: stub.updateVerticalSpacingCounterPublisherMock,
            expectedNumberOfSinks: 0
        )

        // Is Placeholder
        TextEditorUIViewModelPublisherTest.expectSinksCount(
            shouldShowPlaceholder: stub.shouldShowPlaceholderPublisherMock,
            expectedNumberOfSinks: 0
        )
        // **

        // Use Cases
        TextEditorGetVerticalSpacingUseCaseableMockTest.expect(
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
