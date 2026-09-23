//
//  FileUploadPreviewGroupViewModelTests.swift
//  SparkComponentFileUploadTests
//
//  Created by robin.lemaire on 24/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
import Combine

@testable import SparkComponentFileUpload
@_spi(SI_SPI) @testable import SparkComponentFileUploadTesting
@_spi(SI_SPI) import SparkThemingTesting
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkCommonTesting
import Testing

@Suite("FileUploadPreviewGroup ViewModel Tests")
struct FileUploadPreviewGroupViewModelTests {

    // MARK: - Initialization

    @Test("Initialization should use default values")
    func initializationShouldUseDefaultValues() {
        // GIVEN / WHEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // THEN
        #expect(viewModel.theme == nil)

        expectEqualToExpected(
            on: stub,
            otherLayout: FileUploadPreviewGroupLayout()
        )

        expectNotCalled(
            on: stub,
            getLayoutUseCase: true
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

        FileUploadPreviewGroupGetLayoutUseCaseableMockTest.expect(
            stub.getLayoutUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            expectedReturnValue: stub.expectedLayout
        )
    }

    // MARK: - Property Changes

    @Test("Theme when changed should call use cases")
    func themeWhenChangedShouldCallUseCases() {
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

        FileUploadPreviewGroupGetLayoutUseCaseableMockTest.expect(
            stub.getLayoutUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: newTheme,
            expectedReturnValue: stub.expectedLayout
        )
    }

    // MARK: - Properties Changed Before Setup

    @Test("Properties changed before setup should not call use cases")
    func propertiesChangedBeforeSetupShouldNotCallUseCases() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // WHEN
        viewModel.theme = ThemeGeneratedMock.mocked()

        // THEN
        expectEqualToExpected(
            on: stub,
            otherLayout: FileUploadPreviewGroupLayout()
        )

        expectNotCalled(
            on: stub,
            getLayoutUseCase: true
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

        // THEN
        expectEqualToExpected(on: stub)

        expectNotCalled(
            on: stub,
            getLayoutUseCase: true
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

        // THEN
        expectEqualToExpected(on: stub)

        expectNotCalled(
            on: stub,
            getLayoutUseCase: true
        )
    }
}

// MARK: - Stub

private final class Stub {

    // MARK: - Properties

    let givenTheme = ThemeGeneratedMock.mocked()

    let expectedLayout = FileUploadPreviewGroupLayout(spacing: 8.0)

    // MARK: - Use Case Mocks

    let getLayoutUseCaseMock: FileUploadPreviewGroupGetLayoutUseCaseableGeneratedMock

    // MARK: - ViewModel

    let viewModel: FileUploadPreviewGroupViewModel

    // MARK: - Initialization

    init() {
        let getLayoutUseCaseMock = FileUploadPreviewGroupGetLayoutUseCaseableGeneratedMock()
        getLayoutUseCaseMock.executeWithThemeReturnValue = self.expectedLayout

        self.viewModel = FileUploadPreviewGroupViewModel(
            getLayoutUseCase: getLayoutUseCaseMock
        )

        self.getLayoutUseCaseMock = getLayoutUseCaseMock
    }

    // MARK: - Methods

    func resetMockedData() {
        self.getLayoutUseCaseMock.reset()
    }
}

// MARK: - Extension

private extension FileUploadPreviewGroupViewModel {

    func setup(stub: Stub) {
        self.setup(theme: stub.givenTheme)
    }
}

// MARK: - Expectations

private func expectNotCalled(
    on stub: Stub,
    getLayoutUseCase: Bool = false,
    sourceLocation: Testing.SourceLocation = #_sourceLocation
) {
    FileUploadPreviewGroupGetLayoutUseCaseableMockTest.expectCalled(
        stub.getLayoutUseCaseMock,
        executeWithThemeCalled: !getLayoutUseCase,
        sourceLocation: sourceLocation
    )
}

private func expectEqualToExpected(
    on stub: Stub,
    otherLayout: FileUploadPreviewGroupLayout? = nil,
    sourceLocation: Testing.SourceLocation = #_sourceLocation
) {
    let viewModel = stub.viewModel

    let expectedLayout = otherLayout ?? stub.expectedLayout

    #expect(
        viewModel.layout == expectedLayout,
        "Wrong layout value",
        sourceLocation: sourceLocation
    )
}
