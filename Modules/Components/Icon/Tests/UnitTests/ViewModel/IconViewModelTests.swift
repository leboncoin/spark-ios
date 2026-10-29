//
//  IconViewModelTests.swift
//  SparkComponentIcon
//
//  Created by robin.lemaire on 06/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
import SwiftUI
import UIKit

@testable import SparkComponentIcon
@_spi(SI_SPI) @testable import SparkComponentIconTesting
@_spi(SI_SPI) import SparkThemingTesting
@_spi(SI_SPI) import SparkTheming

@MainActor
@Suite("Icon ViewModel Tests")
struct IconViewModelTests {

    // MARK: - Initialization

    @Test("Initialization should use default values")
    func initializationShouldUseDefaultValues() {
        // GIVEN / WHEN
        let stub = Stub()

        // THEN
        expectEqualToExpected(
            on: stub,
            otherTintColorToken: ColorTokenClear(),
            otherContentSize: 0
        )

        expectNotCalled(
            on: stub,
            getSizeUseCase: true,
            getTintColorUseCase: true
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

        IconGetSizeUseCaseableMockTest.expect(
            stub.getSizeUseCaseMock,
            expectedNumberOfCalls: 1,
            givenSize: stub.givenSize,
            expectedReturnValue: stub.expectedContentSize
        )

        IconGetTintColorUseCaseableMockTest.expect(
            stub.getTintColorUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: stub.givenIntent,
            expectedReturnValue: stub.expectedTintColorToken
        )
    }

    // MARK: - Property Changes

    @Test("Theme changed should update tint color only")
    func themeChangedShouldUpdateTintColorOnly() {
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

        IconGetTintColorUseCaseableMockTest.expect(
            stub.getTintColorUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: newTheme,
            givenIntent: stub.givenIntent,
            expectedReturnValue: stub.expectedTintColorToken
        )

        expectNotCalled(
            on: stub,
            getSizeUseCase: true
        )
    }

    @Test("Intent changed should update tint color only")
    func intentChangedShouldUpdateTintColorOnly() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let newIntent = IconIntent.error

        // WHEN
        viewModel.intent = newIntent

        // THEN
        expectEqualToExpected(on: stub)

        IconGetTintColorUseCaseableMockTest.expect(
            stub.getTintColorUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: newIntent,
            expectedReturnValue: stub.expectedTintColorToken
        )

        expectNotCalled(
            on: stub,
            getSizeUseCase: true
        )
    }

    @Test("Size changed should update content size only")
    func sizeChangedShouldUpdateContentSizeOnly() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let newSize = IconSize.large

        // WHEN
        viewModel.size = newSize

        // THEN
        expectEqualToExpected(on: stub)

        IconGetSizeUseCaseableMockTest.expect(
            stub.getSizeUseCaseMock,
            expectedNumberOfCalls: 1,
            givenSize: newSize,
            expectedReturnValue: stub.expectedContentSize
        )

        expectNotCalled(
            on: stub,
            getTintColorUseCase: true
        )
    }

    @Test("Properties changed before setup should not call use cases")
    func propertiesChangedBeforeSetupShouldNotCallUseCases() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // WHEN
        viewModel.theme = ThemeGeneratedMock.mocked()
        viewModel.intent = .error
        viewModel.size = .large

        // THEN
        expectEqualToExpected(
            on: stub,
            otherTintColorToken: ColorTokenClear(),
            otherContentSize: 0
        )

        expectNotCalled(
            on: stub,
            getSizeUseCase: true,
            getTintColorUseCase: true
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
        viewModel.size = stub.givenSize

        // THEN
        expectEqualToExpected(on: stub)

        expectNotCalled(
            on: stub,
            getSizeUseCase: true,
            getTintColorUseCase: true
        )
    }

    @Test("Properties changed with nil values should not call use cases")
    func propertiesChangedWithNilValuesShouldNotCallUseCases() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        // WHEN
        viewModel.theme = nil
        viewModel.intent = nil
        viewModel.size = nil

        // THEN
        expectEqualToExpected(on: stub)

        expectNotCalled(
            on: stub,
            getSizeUseCase: true,
            getTintColorUseCase: true
        )
    }
}

// MARK: - Stub

private final class Stub {

    // MARK: - Given

    let givenTheme = ThemeGeneratedMock.mocked()
    let givenIntent: IconIntent = .support
    let givenSize: IconSize = .medium

    // MARK: - Expected

    let expectedTintColorToken = ColorTokenGeneratedMock.red()
    let expectedContentSize: CGFloat = 24.0

    // MARK: - Use Case Mocks

    let getSizeUseCaseMock: IconGetSizeUseCaseableGeneratedMock
    let getTintColorUseCaseMock: IconGetTintColorUseCaseableGeneratedMock

    // MARK: - ViewModel

    let viewModel: IconViewModel

    // MARK: - Initialization

    init() {
        let getSizeUseCaseMock = IconGetSizeUseCaseableGeneratedMock()
        getSizeUseCaseMock.executeWithSizeReturnValue = self.expectedContentSize

        let getTintColorUseCaseMock = IconGetTintColorUseCaseableGeneratedMock()
        getTintColorUseCaseMock.executeWithThemeAndIntentReturnValue = self.expectedTintColorToken

        self.viewModel = IconViewModel(
            getSizeUseCase: getSizeUseCaseMock,
            getTintColorUseCase: getTintColorUseCaseMock
        )

        self.getSizeUseCaseMock = getSizeUseCaseMock
        self.getTintColorUseCaseMock = getTintColorUseCaseMock
    }

    // MARK: - Helpers

    func resetMockedData() {
        self.getSizeUseCaseMock.reset()
        self.getTintColorUseCaseMock.reset()
    }
}

// MARK: - Helpers

private extension IconViewModel {

    func setup(stub: Stub) {
        self.setup(
            theme: stub.givenTheme,
            intent: stub.givenIntent,
            size: stub.givenSize
        )
    }
}

private func expectNotCalled(
    on stub: Stub,
    getSizeUseCase: Bool = false,
    getTintColorUseCase: Bool = false,
    sourceLocation: Testing.SourceLocation = #_sourceLocation
) {
    IconGetSizeUseCaseableMockTest.expectCalled(
        stub.getSizeUseCaseMock,
        executeWithSizeCalled: !getSizeUseCase,
        sourceLocation: sourceLocation
    )

    IconGetTintColorUseCaseableMockTest.expectCalled(
        stub.getTintColorUseCaseMock,
        executeWithThemeAndIntentCalled: !getTintColorUseCase,
        sourceLocation: sourceLocation
    )
}

private func expectEqualToExpected(
    on stub: Stub,
    otherTintColorToken: (any ColorToken)? = nil,
    otherContentSize: CGFloat? = nil,
    sourceLocation: Testing.SourceLocation = #_sourceLocation
) {
    let viewModel = stub.viewModel

    #expect(
        viewModel.tintColorToken.equals(otherTintColorToken ?? stub.expectedTintColorToken),
        "Wrong tintColorToken value",
        sourceLocation: sourceLocation
    )
    #expect(
        viewModel.contentSize == (otherContentSize ?? stub.expectedContentSize),
        "Wrong contentSize value",
        sourceLocation: sourceLocation
    )
}
