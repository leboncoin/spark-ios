//
//  CommonViewModelTests.swift
//  SparkComponentSelectionControlsTests
//
//  Created by robin.lemaire on 10/07/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentSelectionControls
@_spi(SI_SPI) @testable import SparkComponentSelectionControlsTesting
@_spi(SI_SPI) import SparkCommon
import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting
import SwiftUI

final class CommonViewModelTests: XCTestCase {

    // MARK: - Initialization Test

    func test_initialization_shouldUseDefaultValues() {
        // GIVEN / WHEN
        let stub = Stub()

        // THEN
        XCTAssertEqualToExpected(
            on: stub,
            otherContentRadius: 0,
            otherDim: 1,
            otherTitleStyle: CommonTitleStyle(),
            otherShowHiddenEmptyLabel: false,
            otherSpacing: 0
        )

        // UseCase Calls Count
        XCTAssertNotCalled(
            on: stub,
            getContentRadius: true,
            getDim: true,
            getTitleStyle: true,
            getShowHiddenEmptyLabel: true,
            getSpacing: true
        )
    }

    // MARK: - Setup Tests

    func test_setup_shouldCallAllUseCases() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // WHEN
        viewModel.setup(stub: stub)

        // THEN
        XCTAssertEqualToExpected(on: stub)

        // **
        // UseCase Calls Count
        CommonGetContentRadiusUseCaseableMockTest.XCTAssert(
            stub.getContentRadiusUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenType: stub.givenType,
            expectedReturnValue: stub.expectedContentRadius
        )

        CommonGetDimUseCaseableMockTest.XCTAssert(
            stub.getDimUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIsEnabled: stub.givenIsEnabled,
            expectedReturnValue: stub.expectedDim
        )

        CommonGetTitleStyleUseCaseableMockTest.XCTAssert(
            stub.getTitleStyleUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            expectedReturnValue: stub.expectedTitleStyle
        )

        CommonGetShowHiddenEmptyLabelUseCaseableMockTest.XCTAssert(
            stub.getShowHiddenEmptyLabelUseCaseMock,
            expectedNumberOfCalls: 1,
            givenIsCustomLabel: stub.givenIsCustomLabel,
            expectedReturnValue: stub.expectedShowHiddenEmptyLabel
        )

        CommonGetSpacingUseCaseableMockTest.XCTAssert(
            stub.getSpacingUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            expectedReturnValue: stub.expectedSpacing
        )
        // **
    }

    // MARK: - Setter

    func test_themeChanged_shouldUpdateAllProperties_exceptIsIcon() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let givenTheme = ThemeGeneratedMock.mocked()

        // WHEN
        viewModel.theme = givenTheme

        // THEN
        XCTAssertEqualToExpected(on: stub)

        // **
        // UseCase Calls Count
        XCTAssertNotCalled(
            on: stub,
            getShowHiddenEmptyLabel: true
        )

        CommonGetContentRadiusUseCaseableMockTest.XCTAssert(
            stub.getContentRadiusUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: givenTheme,
            givenType: stub.givenType,
            expectedReturnValue: stub.expectedContentRadius
        )

        CommonGetDimUseCaseableMockTest.XCTAssert(
            stub.getDimUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: givenTheme,
            givenIsEnabled: stub.givenIsEnabled,
            expectedReturnValue: stub.expectedDim
        )

        CommonGetTitleStyleUseCaseableMockTest.XCTAssert(
            stub.getTitleStyleUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: givenTheme,
            expectedReturnValue: stub.expectedTitleStyle
        )

        CommonGetSpacingUseCaseableMockTest.XCTAssert(
            stub.getSpacingUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: givenTheme,
            expectedReturnValue: stub.expectedSpacing
        )
        // **
    }

    func test_isEnabledChanged_shouldUpdateDim() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let givenIsEnabled = true

        // WHEN
        viewModel.isEnabled = givenIsEnabled

        // THEN
        XCTAssertEqualToExpected(on: stub)

        // **
        // UseCase Calls Count
        XCTAssertNotCalled(
            on: stub,
            getContentRadius: true,
            getTitleStyle: true,
            getShowHiddenEmptyLabel: true,
            getSpacing: true
        )

        CommonGetDimUseCaseableMockTest.XCTAssert(
            stub.getDimUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIsEnabled: givenIsEnabled,
            expectedReturnValue: stub.expectedDim
        )
        // **
    }

    func test_allSetter_withoutChange() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        // WHEN
        viewModel.theme = stub.givenTheme
        viewModel.isEnabled = stub.givenIsEnabled

        // THEN
        XCTAssertEqualToExpected(on: stub)

        // UseCase Calls Count
        XCTAssertNotCalled(
            on: stub,
            getContentRadius: true,
            getDim: true,
            getTitleStyle: true,
            getShowHiddenEmptyLabel: true,
            getSpacing: true
        )
    }

    func test_allSetter_withoutSetupBefore() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // WHEN
        viewModel.theme = ThemeGeneratedMock.mocked()
        viewModel.isEnabled = true

        // THEN
        XCTAssertEqualToExpected(
            on: stub,
            otherContentRadius: 0,
            otherDim: 1,
            otherTitleStyle: CommonTitleStyle(),
            otherShowHiddenEmptyLabel: false,
            otherSpacing: 0
        )

        // UseCase Calls Count
        XCTAssertNotCalled(
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

// MARK: - XCT

private func XCTAssertNotCalled(
    on stub: Stub,
    getContentRadius getContentRadiusNotCalled: Bool = false,
    getDim getDimNotCalled: Bool = false,
    getTitleStyle getTitleStyleNotCalled: Bool = false,
    getShowHiddenEmptyLabel getShowHiddenEmptyLabelCalled: Bool = false,
    getSpacing getSpacingNotCalled: Bool = false
) {
    CommonGetContentRadiusUseCaseableMockTest.XCTCalled(
        stub.getContentRadiusUseCaseMock,
        executeWithThemeAndTypeCalled: !getContentRadiusNotCalled
    )

    CommonGetDimUseCaseableMockTest.XCTCalled(
        stub.getDimUseCaseMock,
        executeWithThemeAndIsEnabledCalled: !getDimNotCalled
    )

    CommonGetTitleStyleUseCaseableMockTest.XCTCalled(
        stub.getTitleStyleUseCaseMock,
        executeWithThemeCalled: !getTitleStyleNotCalled
    )

    CommonGetShowHiddenEmptyLabelUseCaseableMockTest.XCTCalled(
        stub.getShowHiddenEmptyLabelUseCaseMock,
        executeWithIsCustomLabelCalled: !getShowHiddenEmptyLabelCalled
    )

    CommonGetSpacingUseCaseableMockTest.XCTCalled(
        stub.getSpacingUseCaseMock,
        executeWithThemeCalled: !getSpacingNotCalled
    )
}

private func XCTAssertEqualToExpected(
    on stub: Stub,
    otherContentRadius: CGFloat? = nil,
    otherDim: CGFloat? = nil,
    otherTitleStyle: CommonTitleStyle? = nil,
    otherShowHiddenEmptyLabel: Bool? = nil,
    otherSpacing: CGFloat? = nil
) {
    let viewModel = stub.viewModel

    XCTAssertEqual(
        viewModel.contentRadius,
        otherContentRadius ?? stub.expectedContentRadius,
        "Wrong contentRadius value"
    )
    XCTAssertEqual(
        viewModel.dim,
        otherDim ?? stub.expectedDim,
        "Wrong dim value"
    )
    XCTAssertEqual(
        viewModel.titleStyle,
        otherTitleStyle ?? stub.expectedTitleStyle,
        "Wrong font value"
    )
    XCTAssertEqual(
        viewModel.showHiddenEmptyLabel,
        otherShowHiddenEmptyLabel ?? stub.expectedShowHiddenEmptyLabel,
        "Wrong otherShowHiddenEmptyLabel value"
    )
    XCTAssertEqual(
        viewModel.spacing,
        otherSpacing ?? stub.expectedSpacing,
        "Wrong spacing value"
    )
}
