//
//  CommonUIViewModelTests.swift
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

final class CommonUIViewModelTests: XCTestCase {

    // MARK: - Initialization Tests

    func test_initialization_shouldUseDefaultValues() {
        // GIVEN / WHEN
        let stub = Stub()

        // THEN
        XCTAssertEqualToExpected(
            on: stub,
            otherSelectedValue: true,
            otherStaticAnimationType: .unanimated,
            otherDynamicAnimationType: .unanimated,
            otherContentRadius: 0,
            otherDim: 1,
            otherSpacing: 0,
            otherTitleStyle: CommonTitleStyle()
        )

        // UseCase Calls Count
        XCTAssertNotCalled(
            on: stub,
            getStaticAnimationType: true,
            getDynamicAnimationType: true,
            getContentRadius: true,
            getDim: true,
            getSpacing: true,
            getTitleStyle: true,
            resetAnimation: true
        )
    }

    // MARK: - Load Tests

    func test_load_shouldCallAllUseCases_exceptAnimationType() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // WHEN
        viewModel.load(stub: stub)

        // THEN
        XCTAssertEqualToExpected(on: stub)

        // **
        // UseCase Calls Count
        XCTAssertNotCalled(
            on: stub,
            resetAnimation: true
        )

        CommonGetAnimationTypeUseCaseableMockTest.XCTAssert(
            stub.getAnimationTypeUseCaseMock,
            expectedNumberOfCalls: 1,
            givenIsReduceMotionEnabled: stub.givenIsReduceMotionEnabled,
            expectedReturnValue: stub.expectedStaticAnimationType
        )

        CommonGetAnimationTypeUseCaseableMockTest.XCTAssert(
            stub.getAnimationTypeUseCaseMock,
            expectedNumberOfCalls: 1,
            givenSelectedValueAnimated: false,
            givenIsReduceMotionEnabled: stub.givenIsReduceMotionEnabled,
            expectedReturnValue: stub.expectedDynamicAnimationType
        )

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
            givenIsEnabled: true,
            expectedReturnValue: stub.expectedDim
        )

        CommonGetSpacingUseCaseableMockTest.XCTAssert(
            stub.getSpacingUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            expectedReturnValue: stub.expectedSpacing
        )

        CommonGetTitleStyleUseCaseableMockTest.XCTAssert(
            stub.getTitleStyleUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            expectedReturnValue: stub.expectedTitleStyle
        )
        // **
    }

    // MARK: - Setter Tests

    func test_themeChanged_shouldUpdateSomeProperties() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.load(stub: stub)
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
            getStaticAnimationType: true,
            getDynamicAnimationType: true,
            resetAnimation: true
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
            givenIsEnabled: true,
            expectedReturnValue: stub.expectedDim
        )

        CommonGetSpacingUseCaseableMockTest.XCTAssert(
            stub.getSpacingUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: givenTheme,
            expectedReturnValue: stub.expectedSpacing
        )

        CommonGetTitleStyleUseCaseableMockTest.XCTAssert(
            stub.getTitleStyleUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: givenTheme,
            expectedReturnValue: stub.expectedTitleStyle
        )
        // **
    }

    func test_isEnabledChanged_shouldUpdateDim() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.load(stub: stub)
        stub.resetMockedData()

        let givenIsEnabled = false

        // WHEN
        viewModel.isEnabled = givenIsEnabled

        // THEN
        XCTAssertEqualToExpected(on: stub)

        // **
        // UseCase Calls Count
        XCTAssertNotCalled(
            on: stub,
            getStaticAnimationType: true,
            getDynamicAnimationType: true,
            getContentRadius: true,
            getSpacing: true,
            getTitleStyle: true,
            resetAnimation: true
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

    func test_isReduceMotionEnabled_shouldUpdateAnimationType() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.load(stub: stub)
        stub.resetMockedData()

        let givenIsReduceMotionEnabled = true

        // WHEN
        viewModel.isReduceMotionEnabled = givenIsReduceMotionEnabled

        // THEN
        XCTAssertEqualToExpected(on: stub)

        // **
        // UseCase Calls Count
        XCTAssertNotCalled(
            on: stub,
            getContentRadius: true,
            getDim: true,
            getSpacing: true,
            getTitleStyle: true,
            resetAnimation: true
        )

        CommonGetAnimationTypeUseCaseableMockTest.XCTAssert(
            stub.getAnimationTypeUseCaseMock,
            expectedNumberOfCalls: 1,
            givenIsReduceMotionEnabled: givenIsReduceMotionEnabled,
            expectedReturnValue: stub.expectedStaticAnimationType
        )

        CommonGetAnimationTypeUseCaseableMockTest.XCTAssert(
            stub.getAnimationTypeUseCaseMock,
            expectedNumberOfCalls: 1,
            givenSelectedValueAnimated: false,
            givenIsReduceMotionEnabled: givenIsReduceMotionEnabled,
            expectedReturnValue: stub.expectedDynamicAnimationType
        )
        // **
    }

    func test_allSetter_withoutChange() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.load(stub: stub)
        stub.resetMockedData()

        // WHEN
        viewModel.theme = stub.givenTheme
        viewModel.isEnabled = true
        viewModel.isReduceMotionEnabled = stub.givenIsReduceMotionEnabled
        viewModel.setSelectedValue(true)

        // THEN
        XCTAssertEqualToExpected(on: stub)

        // UseCase Calls Count
        XCTAssertNotCalled(
            on: stub,
            getStaticAnimationType: true,
            getDynamicAnimationType: true,
            getContentRadius: true,
            getDim: true,
            getSpacing: true,
            getTitleStyle: true,
            resetAnimation: true
        )
    }

    func test_allSetter_withoutLoadBefore() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        let givenIsReduceMotionEnabled = true
        let givenAnimated = true

        // WHEN
        viewModel.theme = ThemeGeneratedMock.mocked()
        viewModel.isEnabled = false
        viewModel.isReduceMotionEnabled = givenIsReduceMotionEnabled
        viewModel.setSelectedValue(false, animated: givenAnimated)

        // THEN
        XCTAssertEqualToExpected(
            on: stub,
            otherSelectedValue: false,
            otherStaticAnimationType: .unanimated,
            otherDynamicAnimationType: stub.expectedDynamicAnimationType,
            otherContentRadius: 0,
            otherDim: 1,
            otherSpacing: 0,
            otherTitleStyle: CommonTitleStyle()
        )

        // **
        // UseCase Calls Count
        XCTAssertNotCalled(
            on: stub,
            getStaticAnimationType: true,
            getContentRadius: true,
            getDim: true,
            getSpacing: true,
            getTitleStyle: true,
            resetAnimation: true
        )

        CommonGetAnimationTypeUseCaseableMockTest.XCTAssert(
            stub.getAnimationTypeUseCaseMock,
            expectedNumberOfCalls: 1,
            givenSelectedValueAnimated: givenAnimated,
            givenIsReduceMotionEnabled: givenIsReduceMotionEnabled,
            expectedReturnValue: stub.expectedDynamicAnimationType
        )
        // **
    }

    // MARK: - Action

    func test_setSelectedValue_without_animation() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel
        let givenSelectedValue = false
        let givenAnimated = false

        viewModel.load(stub: stub)
        stub.resetMockedData()

        // WHEN
        viewModel.setSelectedValue(givenSelectedValue, animated: givenAnimated)

        // THEN
        XCTAssertEqualToExpected(on: stub)

        // **
        // UseCase Calls Count
        XCTAssertNotCalled(
            on: stub,
            getStaticAnimationType: true,
            getContentRadius: true,
            getDim: true,
            getSpacing: true,
            getTitleStyle: true,
            resetAnimation: true
        )

        CommonGetAnimationTypeUseCaseableMockTest.XCTAssert(
            stub.getAnimationTypeUseCaseMock,
            expectedNumberOfCalls: 1,
            givenSelectedValueAnimated: givenAnimated,
            givenIsReduceMotionEnabled: stub.givenIsReduceMotionEnabled,
            expectedReturnValue: stub.expectedDynamicAnimationType
        )
        // **
    }

    func test_setSelectedValue_with_animation() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel
        let givenSelectedValue = false
        let givenAnimated = true

        viewModel.load(stub: stub)
        stub.resetMockedData()

        // WHEN
        viewModel.setSelectedValue(givenSelectedValue, animated: givenAnimated)

        // THEN
        XCTAssertEqualToExpected(on: stub)

        // **
        // UseCase Calls Count
        XCTAssertNotCalled(
            on: stub,
            getStaticAnimationType: true,
            getContentRadius: true,
            getDim: true,
            getSpacing: true,
            getTitleStyle: true,
            resetAnimation: true
        )

        CommonGetAnimationTypeUseCaseableMockTest.XCTAssert(
            stub.getAnimationTypeUseCaseMock,
            expectedNumberOfCalls: 1,
            givenSelectedValueAnimated: givenAnimated,
            givenIsReduceMotionEnabled: stub.givenIsReduceMotionEnabled,
            expectedReturnValue: stub.expectedDynamicAnimationType
        )
        // **
    }

    func test_setCompletedAnimation() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel
        let givenAnimation: CommonCompletedAnimationMock = .one

        viewModel.load(stub: stub)
        stub.resetMockedData()

        // WHEN
        viewModel.setCompletedAnimation(givenAnimation)

        // THEN
        XCTAssertEqualToExpected(on: stub)

        // **
        // UseCase Calls Count
        XCTAssertNotCalled(
            on: stub,
            getStaticAnimationType: true,
            getDynamicAnimationType: true,
            getContentRadius: true,
            getDim: true,
            getSpacing: true,
            getTitleStyle: true
        )

        CommonResetAnimationUseCaseableMockTest.XCTAssert(
            stub.resetAnimationUseCaseMock,
            expectedNumberOfCalls: 1,
            givenAnimationType: stub.expectedDynamicAnimationType,
            givenCompletedAnimations: [givenAnimation],
            givenSelectedValueAnimated: false,
            givenIsReduceMotionEnabled: stub.givenIsReduceMotionEnabled
        )
        // **

        // ****
        // 2nd Test

        // GIVEN
        let givenAnimation2: CommonCompletedAnimationMock = .two
        stub.resetMockedData()

        // WHEN
        viewModel.setCompletedAnimation(givenAnimation2)

        // THEN
        XCTAssertEqualToExpected(on: stub)

        // **
        // UseCase Calls Count
        XCTAssertNotCalled(
            on: stub,
            getStaticAnimationType: true,
            getDynamicAnimationType: true,
            getContentRadius: true,
            getDim: true,
            getSpacing: true,
            getTitleStyle: true
        )

        CommonResetAnimationUseCaseableMockTest.XCTAssert(
            stub.resetAnimationUseCaseMock,
            expectedNumberOfCalls: 1,
            givenAnimationType: stub.expectedDynamicAnimationType,
            givenCompletedAnimations: [givenAnimation, givenAnimation2],
            givenSelectedValueAnimated: false,
            givenIsReduceMotionEnabled: stub.givenIsReduceMotionEnabled
        )
        // **
        // ****
    }

    // MARK: - Update Tests

    func test_selectedValueChanged() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.load(stub: stub)
        stub.resetMockedData()

        // WHEN
        viewModel.selectedValueChanged(oldValue: true)

        // THEN
        XCTAssertEqualToExpected(on: stub)

        // UseCase Calls Count
        XCTAssertNotCalled(
            on: stub,
            getStaticAnimationType: true,
            getDynamicAnimationType: true,
            getContentRadius: true,
            getDim: true,
            getSpacing: true,
            getTitleStyle: true,
            resetAnimation: true
        )
    }
}

// MARK: - Stub

private final class Stub: CommonUIViewModelStub {

    // MARK: - Given Properties

    let givenType = CommonType.checkbox
    let givenTheme = ThemeGeneratedMock.mocked()
    let givenIsEnabled: Bool = false
    let givenIsReduceMotionEnabled = false

    // MARK: - Expected Properties

    let expectedStaticAnimationType = UIExecuteAnimationType.animated(duration: 2)
    let expectedDynamicAnimationType = UIExecuteAnimationType.animated(duration: 3)
    let expectedContentRadius: CGFloat = 4
    let expectedDim: CGFloat = 0.5
    let expectedSpacing: CGFloat = 10
    let expectedTitleStyle = CommonTitleStyle()

    // MARK: - Initialization

    init() {
        let getAnimationTypeUseCaseMock = CommonGetAnimationTypeUseCaseableGeneratedMock()
        getAnimationTypeUseCaseMock.executeWithIsReduceMotionEnabledReturnValue = self.expectedStaticAnimationType
        getAnimationTypeUseCaseMock.executeWithSelectedValueAnimatedAndIsReduceMotionEnabledReturnValue = self.expectedDynamicAnimationType

        let getContentRadiusUseCaseMock = CommonGetContentRadiusUseCaseableGeneratedMock()
        getContentRadiusUseCaseMock.executeWithThemeAndTypeReturnValue = self.expectedContentRadius

        let getDimUseCaseMock = CommonGetDimUseCaseableGeneratedMock()
        getDimUseCaseMock.executeWithThemeAndIsEnabledReturnValue = self.expectedDim

        let getSpacingUseCaseMock = CommonGetSpacingUseCaseableGeneratedMock()
        getSpacingUseCaseMock.executeWithThemeReturnValue = self.expectedSpacing

        let getTitleStyleUseCaseMock = CommonGetTitleStyleUseCaseableGeneratedMock()
        getTitleStyleUseCaseMock.executeWithThemeReturnValue = self.expectedTitleStyle

        let resetAnimationUseCaseMock = CommonResetAnimationUseCaseableGeneratedMock()

        let viewModel = CommonUIViewModel<CommonCompletedAnimationMock, Bool>(
            type: self.givenType,
            theme: self.givenTheme,
            selectedValue: true,
            getAnimationTypeUseCase: getAnimationTypeUseCaseMock,
            getContentRadiusUseCase: getContentRadiusUseCaseMock,
            getDimUseCase: getDimUseCaseMock,
            getSpacingUseCase: getSpacingUseCaseMock,
            getTitleStyleUseCase: getTitleStyleUseCaseMock,
            resetAnimationUseCase: resetAnimationUseCaseMock
        )

        super.init(
            viewModel: viewModel,
            getAnimationTypeUseCaseMock: getAnimationTypeUseCaseMock,
            getContentRadiusUseCaseMock: getContentRadiusUseCaseMock,
            getDimUseCaseMock: getDimUseCaseMock,
            getSpacingUseCaseMock: getSpacingUseCaseMock,
            getTitleStyleUseCaseMock: getTitleStyleUseCaseMock,
            resetAnimationUseCaseMock: resetAnimationUseCaseMock
        )
    }
}

// MARK: - Extension

private extension CommonUIViewModel {

    func load(stub: Stub) {
        self.load(
            isReduceMotionEnabled: stub.givenIsReduceMotionEnabled
        )
    }
}

// MARK: - XCT

private func XCTAssertNotCalled(
    on stub: Stub,
    getStaticAnimationType getStaticAnimationTypeNotCalled: Bool = false,
    getDynamicAnimationType getDynamicAnimationTypeNotCalled: Bool = false,
    getContentRadius getContentRadiusNotCalled: Bool = false,
    getDim getDimNotCalled: Bool = false,
    getSpacing getSpacingNotCalled: Bool = false,
    getTitleStyle getTitleStyleNotCalled: Bool = false,
    resetAnimation resetAnimationNotCalled: Bool = false
) {
    CommonGetAnimationTypeUseCaseableMockTest.XCTCalled(
        stub.getAnimationTypeUseCaseMock,
        executeWithIsReduceMotionEnabledCalled: !getStaticAnimationTypeNotCalled
    )

    CommonGetAnimationTypeUseCaseableMockTest.XCTCalled(
        stub.getAnimationTypeUseCaseMock,
        executeWithSelectedValueAnimatedAndIsReduceMotionEnabledCalled: !getDynamicAnimationTypeNotCalled
    )

    CommonGetContentRadiusUseCaseableMockTest.XCTCalled(
        stub.getContentRadiusUseCaseMock,
        executeWithThemeAndTypeCalled: !getContentRadiusNotCalled
    )

    CommonGetSpacingUseCaseableMockTest.XCTCalled(
        stub.getSpacingUseCaseMock,
        executeWithThemeCalled: !getSpacingNotCalled
    )

    CommonGetTitleStyleUseCaseableMockTest.XCTCalled(
        stub.getTitleStyleUseCaseMock,
        executeWithThemeCalled: !getTitleStyleNotCalled
    )

    CommonResetAnimationUseCaseableMockTest.XCTCalled(
        stub.resetAnimationUseCaseMock,
        executeWithAnimationTypeAndCompletedAnimationsAndSelectedValueAnimatedAndIsReduceMotionEnabledCalled: !resetAnimationNotCalled
    )
}

private func XCTAssertEqualToExpected(
    on stub: Stub,
    otherSelectedValue: Bool? = nil,
    otherStaticAnimationType: UIExecuteAnimationType? = nil,
    otherDynamicAnimationType: UIExecuteAnimationType? = nil,
    otherContentRadius: CGFloat? = nil,
    otherDim: CGFloat? = nil,
    otherSpacing: CGFloat? = nil,
    otherTitleStyle: CommonTitleStyle? = nil
) {
    let viewModel = stub.viewModel

    if let otherSelectedValue {
        XCTAssertEqual(
            viewModel.selectedValue,
            otherSelectedValue,
            "Wrong isOn value"
        )
    }

    XCTAssertEqual(
        viewModel.staticAnimationType,
        otherStaticAnimationType ?? stub.expectedStaticAnimationType,
        "Wrong staticAnimationType value"
    )
    XCTAssertEqual(
        viewModel.dynamicAnimationType,
        otherDynamicAnimationType ?? stub.expectedDynamicAnimationType,
        "Wrong dynamicAnimationType value"
    )
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
        viewModel.spacing,
        otherSpacing ?? stub.expectedSpacing,
        "Wrong spacing value"
    )
    XCTAssertEqual(
        viewModel.titleStyle,
        otherTitleStyle ?? stub.expectedTitleStyle,
        "Wrong font value"
    )
}
