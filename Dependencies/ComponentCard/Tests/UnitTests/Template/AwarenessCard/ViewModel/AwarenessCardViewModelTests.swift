//
//  AwarenessCardViewModelTests.swift
//  SparkComponentCardTests
//
//  Created by robin.lemaire on 17/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing

@testable import SparkComponentCard
@_spi(SI_SPI) @testable import SparkComponentCardTesting
@_spi(SI_SPI) import SparkThemingTesting
@_spi(SI_SPI) import SparkCommonTesting
import SparkTheming

// MARK: - Tests

@Suite("AwarenessCardViewModel Tests")
struct AwarenessCardViewModelTests {

    // MARK: - Tests

    @Test("Initialization should use default values")
    func test_initialization_shouldUseDefaultValues() {
        // GIVEN / WHEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // THEN
        #expect(viewModel.theme == nil)

        expectEqualToExpected(
            on: stub,
            otherLayout: AwarenessCardLayout(),
            otherTypographies: AwarenessCardTypographies()
        )

        expectNotCalled(
            on: stub,
            getLayoutUseCase: true,
            getTypographiesUseCase: true
        )
    }

    @Test("Setup should call all use cases")
    func test_setup_shouldCallAllUseCases() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // WHEN
        viewModel.setup(stub: stub)

        // THEN
        expectEqualToExpected(on: stub)

        AwarenessCardGetLayoutUseCaseableMockTest.expect(
            stub.getLayoutUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            expectedReturnValue: stub.expectedLayout
        )
        AwarenessCardGetTypographiesUseCaseableMockTest.expect(
            stub.getTypographiesUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            expectedReturnValue: stub.expectedTypographies
        )
    }

    @Test("Theme changed should update dependent properties")
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
        expectEqualToExpected(on: stub)

        AwarenessCardGetLayoutUseCaseableMockTest.expect(
            stub.getLayoutUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: newTheme,
            expectedReturnValue: stub.expectedLayout
        )
        AwarenessCardGetTypographiesUseCaseableMockTest.expect(
            stub.getTypographiesUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: newTheme,
            expectedReturnValue: stub.expectedTypographies
        )
    }

    @Test("Properties changed before setup should not call use cases")
    func test_propertiesChanged_beforeSetup_shouldNotCallUseCases() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        let theme = ThemeGeneratedMock.mocked()

        // WHEN
        viewModel.theme = theme

        // THEN
        expectEqualToExpected(
            on: stub,
            otherLayout: AwarenessCardLayout(),
            otherTypographies: AwarenessCardTypographies()
        )

        expectNotCalled(
            on: stub,
            getLayoutUseCase: true,
            getTypographiesUseCase: true
        )
    }

    @Test("Properties changed without value change should not call use cases")
    func test_propertiesChanged_withoutValueChange_shouldNotCallUseCases() {
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
            getLayoutUseCase: true,
            getTypographiesUseCase: true
        )
    }

    @Test("Properties changed for nil should not call use cases")
    func test_propertiesChanged_forNil_shouldNotCallUseCases() {
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
            getLayoutUseCase: true,
            getTypographiesUseCase: true
        )
    }
}

// MARK: - Stub

private final class Stub {

    // MARK: - Given

    let givenTheme = ThemeGeneratedMock.mocked()

    // MARK: - Expected

    let expectedLayout = AwarenessCardLayout(horizontalSpacing: 16, verticalSpacing: 12)
    let expectedTypographies = AwarenessCardTypographies(
        titleFontToken: TypographyFontTokenGeneratedMock.body(),
        descriptionFontToken: TypographyFontTokenGeneratedMock.caption()
    )

    // MARK: - Use Case Mocks

    let getLayoutUseCaseMock: AwarenessCardGetLayoutUseCaseableGeneratedMock
    let getTypographiesUseCaseMock: AwarenessCardGetTypographiesUseCaseableGeneratedMock

    // MARK: - View Model

    let viewModel: AwarenessCardViewModel

    // MARK: - Initialization

    init() {
        let getLayoutUseCaseMock = AwarenessCardGetLayoutUseCaseableGeneratedMock()
        getLayoutUseCaseMock.executeWithThemeReturnValue = self.expectedLayout

        let getTypographiesUseCaseMock = AwarenessCardGetTypographiesUseCaseableGeneratedMock()
        getTypographiesUseCaseMock.executeWithThemeReturnValue = self.expectedTypographies

        self.viewModel = AwarenessCardViewModel(
            getLayoutUseCase: getLayoutUseCaseMock,
            getTypographiesUseCase: getTypographiesUseCaseMock
        )

        self.getLayoutUseCaseMock = getLayoutUseCaseMock
        self.getTypographiesUseCaseMock = getTypographiesUseCaseMock
    }

    // MARK: - Helpers

    func resetMockedData() {
        self.getLayoutUseCaseMock.reset()
        self.getTypographiesUseCaseMock.reset()
    }
}

// MARK: - Helpers

private extension AwarenessCardViewModel {

    func setup(stub: Stub) {
        self.setup(
            theme: stub.givenTheme
        )
    }
}

private func expectNotCalled(
    on stub: Stub,
    getLayoutUseCase: Bool = false,
    getTypographiesUseCase: Bool = false
) {
    AwarenessCardGetLayoutUseCaseableMockTest.expectCalled(
        stub.getLayoutUseCaseMock,
        executeWithThemeCalled: !getLayoutUseCase
    )
    AwarenessCardGetTypographiesUseCaseableMockTest.expectCalled(
        stub.getTypographiesUseCaseMock,
        executeWithThemeCalled: !getTypographiesUseCase
    )
}

private func expectEqualToExpected(
    on stub: Stub,
    otherLayout: AwarenessCardLayout? = nil,
    otherTypographies: AwarenessCardTypographies? = nil
) {
    let viewModel = stub.viewModel

    #expect(
        viewModel.layout == (otherLayout ?? stub.expectedLayout),
        "Wrong layout value"
    )

    #expect(
        viewModel.typographies == (otherTypographies ?? stub.expectedTypographies),
        "Wrong typographies value"
    )
}
