//
//  CommonViewModelTests.swift
//  SparkComponentSelectionControlsTests
//
//  Created by robin.lemaire on 10/07/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentSelectionControls
@_spi(SI_SPI) @testable import SparkComponentSelectionControlsTesting
@_spi(SI_SPI) import SparkCommon
import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting
import SwiftUI

@MainActor
@Suite("Common ViewModel Tests")
struct CommonViewModelTests {

    // MARK: - Initialization Test

    @Test("Initialization should use default values")
    func initializationShouldUseDefaultValues() {
        // GIVEN / WHEN
        let stub = Stub()

        // THEN
        expectEqualToExpected(
            on: stub,
            otherContentRadius: 0,
            otherDim: 1,
            otherTitleStyle: CommonTitleStyle(),
            otherShowHiddenEmptyLabel: false,
            otherSpacing: 0
        )

        // UseCase Calls Count
        expectNotCalled(
            on: stub,
            getContentRadius: true,
            getDim: true,
            getTitleStyle: true,
            getShowHiddenEmptyLabel: true,
            getSpacing: true
        )
    }

    // MARK: - Setup Tests

    @Test("Setup should call all use cases")
    func setupShouldCallAllUseCases() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // WHEN
        viewModel.setup(stub: stub)

        // THEN
        expectEqualToExpected(on: stub)

        // **
        // UseCase Calls Count
        CommonGetContentRadiusUseCaseableMockTest.expect(
            stub.getContentRadiusUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenType: stub.givenType,
            expectedReturnValue: stub.expectedContentRadius
        )

        CommonGetDimUseCaseableMockTest.expect(
            stub.getDimUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIsEnabled: stub.givenIsEnabled,
            expectedReturnValue: stub.expectedDim
        )

        CommonGetTitleStyleUseCaseableMockTest.expect(
            stub.getTitleStyleUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            expectedReturnValue: stub.expectedTitleStyle
        )

        CommonGetShowHiddenEmptyLabelUseCaseableMockTest.expect(
            stub.getShowHiddenEmptyLabelUseCaseMock,
            expectedNumberOfCalls: 1,
            givenIsCustomLabel: stub.givenIsCustomLabel,
            expectedReturnValue: stub.expectedShowHiddenEmptyLabel
        )

        CommonGetSpacingUseCaseableMockTest.expect(
            stub.getSpacingUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            expectedReturnValue: stub.expectedSpacing
        )
        // **
    }

    // MARK: - Setter

    @Test("Theme changed should update all properties except is icon")
    func themeChangedShouldUpdateAllPropertiesExceptIsIcon() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let givenTheme = ThemeGeneratedMock.mocked()

        // WHEN
        viewModel.theme = givenTheme

        // THEN
        expectEqualToExpected(on: stub)

        // **
        // UseCase Calls Count
        expectNotCalled(
            on: stub,
            getShowHiddenEmptyLabel: true
        )

        CommonGetContentRadiusUseCaseableMockTest.expect(
            stub.getContentRadiusUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: givenTheme,
            givenType: stub.givenType,
            expectedReturnValue: stub.expectedContentRadius
        )

        CommonGetDimUseCaseableMockTest.expect(
            stub.getDimUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: givenTheme,
            givenIsEnabled: stub.givenIsEnabled,
            expectedReturnValue: stub.expectedDim
        )

        CommonGetTitleStyleUseCaseableMockTest.expect(
            stub.getTitleStyleUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: givenTheme,
            expectedReturnValue: stub.expectedTitleStyle
        )

        CommonGetSpacingUseCaseableMockTest.expect(
            stub.getSpacingUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: givenTheme,
            expectedReturnValue: stub.expectedSpacing
        )
        // **
    }

    @Test("Is enabled changed should update dim")
    func isEnabledChangedShouldUpdateDim() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let givenIsEnabled = true

        // WHEN
        viewModel.isEnabled = givenIsEnabled

        // THEN
        expectEqualToExpected(on: stub)

        // **
        // UseCase Calls Count
        expectNotCalled(
            on: stub,
            getContentRadius: true,
            getTitleStyle: true,
            getShowHiddenEmptyLabel: true,
            getSpacing: true
        )

        CommonGetDimUseCaseableMockTest.expect(
            stub.getDimUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIsEnabled: givenIsEnabled,
            expectedReturnValue: stub.expectedDim
        )
        // **
    }

    @Test("All setter without change")
    func allSetterWithoutChange() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        // WHEN
        viewModel.theme = stub.givenTheme
        viewModel.isEnabled = stub.givenIsEnabled

        // THEN
        expectEqualToExpected(on: stub)

        // UseCase Calls Count
        expectNotCalled(
            on: stub,
            getContentRadius: true,
            getDim: true,
            getTitleStyle: true,
            getShowHiddenEmptyLabel: true,
            getSpacing: true
        )
    }

    @Test("All setter without setup before")
    func allSetterWithoutSetupBefore() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // WHEN
        viewModel.theme = ThemeGeneratedMock.mocked()
        viewModel.isEnabled = true

        // THEN
        expectEqualToExpected(
            on: stub,
            otherContentRadius: 0,
            otherDim: 1,
            otherTitleStyle: CommonTitleStyle(),
            otherShowHiddenEmptyLabel: false,
            otherSpacing: 0
        )

        // UseCase Calls Count
        expectNotCalled(
            on: stub,
            getContentRadius: true,
            getDim: true,
            getTitleStyle: true,
            getShowHiddenEmptyLabel: true,
            getSpacing: true
        )
    }
}

// MARK: - Stub

private final class Stub: CommonViewModelStub {

    // MARK: - Given Properties

    let givenTheme = ThemeGeneratedMock.mocked()
    let givenType = CommonType.radioButton
    let givenIsEnabled: Bool = false
    let givenIsCustomLabel: Bool = false

    // MARK: - Expected Properties

    let expectedContentRadius: CGFloat = 4
    let expectedDim: CGFloat = 0.5
    let expectedTitleStyle = CommonTitleStyle()
    let expectedShowHiddenEmptyLabel = true
    let expectedSpacing: CGFloat = 10

    // MARK: - Initialization

    init() {
        let getContentRadiusUseCaseMock = CommonGetContentRadiusUseCaseableGeneratedMock()
        getContentRadiusUseCaseMock.executeWithThemeAndTypeReturnValue = self.expectedContentRadius

        let getDimUseCaseMock = CommonGetDimUseCaseableGeneratedMock()
        getDimUseCaseMock.executeWithThemeAndIsEnabledReturnValue = self.expectedDim

        let getTitleStyleUseCaseMock = CommonGetTitleStyleUseCaseableGeneratedMock()
        getTitleStyleUseCaseMock.executeWithThemeReturnValue = self.expectedTitleStyle

        let getShowHiddenEmptyLabelUseCaseMock = CommonGetShowHiddenEmptyLabelUseCaseableGeneratedMock()
        getShowHiddenEmptyLabelUseCaseMock.executeWithIsCustomLabelReturnValue = self.expectedShowHiddenEmptyLabel

        let getSpacingUseCaseMock = CommonGetSpacingUseCaseableGeneratedMock()
        getSpacingUseCaseMock.executeWithThemeReturnValue = self.expectedSpacing

        let viewModel = CommonViewModel(
            type: self.givenType,
            getContentRadiusUseCase: getContentRadiusUseCaseMock,
            getDimUseCase: getDimUseCaseMock,
            getTitleStyleUseCase: getTitleStyleUseCaseMock,
            getShowHiddenEmptyLabelUseCase: getShowHiddenEmptyLabelUseCaseMock,
            getSpacingUseCase: getSpacingUseCaseMock
        )

        super.init(
            viewModel: viewModel,
            getContentRadiusUseCaseMock: getContentRadiusUseCaseMock,
            getDimUseCaseMock: getDimUseCaseMock,
            getTitleStyleUseCaseMock: getTitleStyleUseCaseMock,
            getShowHiddenEmptyLabelUseCaseMock: getShowHiddenEmptyLabelUseCaseMock,
            getSpacingUseCaseMock: getSpacingUseCaseMock
        )
    }
}

// MARK: - Extension

private extension CommonViewModel {

    func setup(stub: Stub) {
        self.setup(
            theme: stub.givenTheme,
            isEnabled: stub.givenIsEnabled,
            isCustomLabel: stub.givenIsCustomLabel
        )
    }
}

// MARK: - Expectations

private func expectNotCalled(
    on stub: Stub,
    getContentRadius getContentRadiusNotCalled: Bool = false,
    getDim getDimNotCalled: Bool = false,
    getTitleStyle getTitleStyleNotCalled: Bool = false,
    getShowHiddenEmptyLabel getShowHiddenEmptyLabelCalled: Bool = false,
    getSpacing getSpacingNotCalled: Bool = false,
    sourceLocation: Testing.SourceLocation = #_sourceLocation
) {
    CommonGetContentRadiusUseCaseableMockTest.expectCalled(
        stub.getContentRadiusUseCaseMock,
        executeWithThemeAndTypeCalled: !getContentRadiusNotCalled,
        sourceLocation: sourceLocation
    )

    CommonGetDimUseCaseableMockTest.expectCalled(
        stub.getDimUseCaseMock,
        executeWithThemeAndIsEnabledCalled: !getDimNotCalled,
        sourceLocation: sourceLocation
    )

    CommonGetTitleStyleUseCaseableMockTest.expectCalled(
        stub.getTitleStyleUseCaseMock,
        executeWithThemeCalled: !getTitleStyleNotCalled,
        sourceLocation: sourceLocation
    )

    CommonGetShowHiddenEmptyLabelUseCaseableMockTest.expectCalled(
        stub.getShowHiddenEmptyLabelUseCaseMock,
        executeWithIsCustomLabelCalled: !getShowHiddenEmptyLabelCalled,
        sourceLocation: sourceLocation
    )

    CommonGetSpacingUseCaseableMockTest.expectCalled(
        stub.getSpacingUseCaseMock,
        executeWithThemeCalled: !getSpacingNotCalled,
        sourceLocation: sourceLocation
    )
}

private func expectEqualToExpected(
    on stub: Stub,
    otherContentRadius: CGFloat? = nil,
    otherDim: CGFloat? = nil,
    otherTitleStyle: CommonTitleStyle? = nil,
    otherShowHiddenEmptyLabel: Bool? = nil,
    otherSpacing: CGFloat? = nil,
    sourceLocation: Testing.SourceLocation = #_sourceLocation
) {
    let viewModel = stub.viewModel

    #expect(
        viewModel.contentRadius == (otherContentRadius ?? stub.expectedContentRadius),
        "Wrong contentRadius value",
        sourceLocation: sourceLocation
    )
    #expect(
        viewModel.dim == (otherDim ?? stub.expectedDim),
        "Wrong dim value",
        sourceLocation: sourceLocation
    )
    #expect(
        viewModel.titleStyle == (otherTitleStyle ?? stub.expectedTitleStyle),
        "Wrong font value",
        sourceLocation: sourceLocation
    )
    #expect(
        viewModel.showHiddenEmptyLabel == (otherShowHiddenEmptyLabel ?? stub.expectedShowHiddenEmptyLabel),
        "Wrong otherShowHiddenEmptyLabel value",
        sourceLocation: sourceLocation
    )
    #expect(
        viewModel.spacing == (otherSpacing ?? stub.expectedSpacing),
        "Wrong spacing value",
        sourceLocation: sourceLocation
    )
}
