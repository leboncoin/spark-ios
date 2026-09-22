//
//  ButtonViewModelDeprecatedTests.swift
//  SparkComponentButtonUnitTests
//
//  Created by robin.lemaire on 13/11/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Foundation
import XCTest
@testable import SparkComponentButton
@_spi(SI_SPI) @testable import SparkComponentButtonTesting
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonTesting
@_spi(SI_SPI) import SparkThemingTesting
import SparkTheming
import SparkTheme
import Combine

final class ButtonViewModelDeprecatedTests: XCTestCase {

    // MARK: - Properties

    private var subscriptions = Set<AnyCancellable>()

    // MARK: - Setup

    override func tearDown() {
        super.tearDown()

        // Clear publishers
        self.subscriptions.removeAll()
    }

    // MARK: - Init Tests

    func test_properties_on_init_when_frameworkType_is_UIKit() {
        self.testPropertiesOnInit(givenFrameworkType: .uiKit)
    }

    func test_properties_on_init_when_frameworkType_is_SwiftUI() {
        self.testPropertiesOnInit(givenFrameworkType: .swiftUI)
    }

    private func testPropertiesOnInit(
        givenFrameworkType: FrameworkType
    ) {
        // GIVEN
        let givenAlignment: ButtonAlignment = .trailingImage

        let isUIKit = givenFrameworkType == .uiKit

        // WHEN
        let stub = Stub(
            frameworkType: givenFrameworkType,
            alignment: givenAlignment
        )

        stub.subscribePublishers(on: &self.subscriptions)

        // THEN

        // Properties
        XCTAssertEqual(
            stub.viewModel.alignment,
            givenAlignment,
            "Wrong alignment value"
        )

        // **
        // Published properties

        // Spacings
        ButtonViewModelDeprecatedPublisherTest.XCTAssert(
            layout: stub.layoutPublisherMock,
            expectedNumberOfSinks: 1,
            expectedValue: !isUIKit ? stub.layout : nil
        )

        // Is Image Trailing
        ButtonViewModelDeprecatedPublisherTest.XCTAssert(
            isImageTrailing: stub.isImageTrailingPublisherMock,
            expectedNumberOfSinks: 1,
            expectedValue: !isUIKit ? givenAlignment.isTrailingImage : false
        )

        // Title Font Token
        ButtonViewModelDeprecatedPublisherTest.XCTAssert(
            titleFontToken: stub.titleFontTokenPublisherMock,
            expectedNumberOfSinks: 1,
            expectedValue: !isUIKit ? stub.themeMock.typography.callout as? TypographyFontTokenGeneratedMock : nil
        )
        // **

        // Use Cases
        ButtonGetSpacingsUseCaseDeprecatedableMockTest.XCTAssert(
            stub.getSpacingsUseCaseMock,
            expectedNumberOfCalls: (isUIKit ? 0 : 1),
            givenSpacing: stub.themeMock.layout.spacing as? LayoutSpacingGeneratedMock,
            expectedReturnValue: stub.layout
        )
    }

    // MARK: - Setter Tests

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
        let defaultValue: ButtonAlignment = .leadingImage
        let newValue: ButtonAlignment = givenIsDifferentNewValue ? .trailingImage : defaultValue

        let stub = Stub(
            alignment: defaultValue
        )
        let viewModel = stub.viewModel

        stub.subscribePublishers(on: &self.subscriptions)

        viewModel.load() // Needed to get colors from usecase one time

        // Reset all UseCase mock
        stub.resetMockedData()

        // WHEN
        viewModel.alignment = newValue

        // THEN

        // Properties
        XCTAssertEqual(
            stub.viewModel.alignment,
            newValue,
            "Wrong alignment value"
        )

        // **
        // Published properties

        // Spacings
        ButtonViewModelDeprecatedPublisherTest.XCTSinksCount(
            layout: stub.layoutPublisherMock,
            expectedNumberOfSinks: 0
        )

        // Is Image Trailing
        ButtonViewModelDeprecatedPublisherTest.XCTAssert(
            isImageTrailing: stub.isImageTrailingPublisherMock,
            expectedNumberOfSinks: givenIsDifferentNewValue ? 1 : 0,
            expectedValue: newValue.isTrailingImage
        )

        // Title Font Token
        ButtonViewModelDeprecatedPublisherTest.XCTSinksCount(
            titleFontToken: stub.titleFontTokenPublisherMock,
            expectedNumberOfSinks: 0
        )
        // **

        // Use Cases
        ButtonGetSpacingsUseCaseDeprecatedableMockTest.XCTCallsCount(
            stub.getSpacingsUseCaseMock,
            executeWithSpacingNumberOfCalls: 0
        )
    }

    // MARK: - Update Tests

    func test_updateAll() {
        // GIVEN
        let givenAlignment: ButtonAlignment = .trailingImage

        let stub = Stub(
            alignment: givenAlignment
        )
        let viewModel = stub.viewModel

        stub.subscribePublishers(on: &self.subscriptions)

        viewModel.load() // Needed to get colors from usecase one time

        // Reset all UseCase mock
        stub.resetMockedData()

        // WHEN
        viewModel.updateAll()

        // THEN

        // **
        // Published properties

        // Spacings
        ButtonViewModelDeprecatedPublisherTest.XCTAssert(
            layout: stub.layoutPublisherMock,
            expectedNumberOfSinks: 1,
            expectedValue: stub.layout
        )

        // Is Image Trailing
        ButtonViewModelDeprecatedPublisherTest.XCTAssert(
            isImageTrailing: stub.isImageTrailingPublisherMock,
            expectedNumberOfSinks: 1,
            expectedValue: givenAlignment.isTrailingImage
        )

        // Title Font Token
        ButtonViewModelDeprecatedPublisherTest.XCTAssert(
            titleFontToken: stub.titleFontTokenPublisherMock,
            expectedNumberOfSinks: 1,
            expectedValue: stub.themeMock.typography.callout as? TypographyFontTokenGeneratedMock
        )
        // **

        // Use Cases
        ButtonGetSpacingsUseCaseDeprecatedableMockTest.XCTAssert(
            stub.getSpacingsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenSpacing: stub.themeMock.layout.spacing as? LayoutSpacingGeneratedMock,
            expectedReturnValue: stub.layout
        )
    }
}

private final class Stub: ButtonViewModelDeprecatedStub {

    // MARK: - Properties

    let layout = ButtonLayout.mocked()

    let themeMock = ThemeGeneratedMock.mocked()

    // MARK: - Initialization

    init(
        frameworkType: FrameworkType = .uiKit,
        alignment: ButtonAlignment
    ) {
        // **
        // Use Cases
        let getSpacingsUseCaseMock = ButtonGetSpacingsUseCaseDeprecatedableGeneratedMock()
        getSpacingsUseCaseMock.executeWithSpacingReturnValue = self.layout
        // **

        // **
        // View Model
        let viewModel = ButtonViewModelDeprecated(
            for: frameworkType,
            theme: self.themeMock,
            appearance: .default,
            intent: .main,
            variant: .filled,
            shape: .pill,
            size: .medium,
            alignment: alignment,
            getSpacingsUseCase: getSpacingsUseCaseMock
        )
        // **

        super.init(
            viewModel: viewModel,
            getSpacingsUseCaseMock: getSpacingsUseCaseMock
        )
    }
}

