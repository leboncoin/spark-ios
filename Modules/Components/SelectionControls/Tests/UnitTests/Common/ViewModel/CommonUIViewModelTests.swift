//
//  CommonUIViewModelTests.swift
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
@Suite("Common UI ViewModel Tests")
struct CommonUIViewModelTests {

    // MARK: - Initialization Tests

    @Test("Initialization should use default values")
    func initializationShouldUseDefaultValues() {
        // GIVEN / WHEN
        let stub = Stub()

        // THEN
        expectEqualToExpected(
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
        expectNotCalled(
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

    @Test("Load should call all use cases except animation type")
    func loadShouldCallAllUseCasesExceptAnimationType() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // WHEN
        viewModel.load(stub: stub)

        // THEN
        expectEqualToExpected(on: stub)

        // **
        // UseCase Calls Count
        expectNotCalled(
            on: stub,
            resetAnimation: true
        )

        CommonGetAnimationTypeUseCaseableMockTest.expect(
            stub.getAnimationTypeUseCaseMock,
            expectedNumberOfCalls: 1,
            givenIsReduceMotionEnabled: stub.givenIsReduceMotionEnabled,
            expectedReturnValue: stub.expectedStaticAnimationType
        )

        CommonGetAnimationTypeUseCaseableMockTest.expect(
            stub.getAnimationTypeUseCaseMock,
            expectedNumberOfCalls: 1,
            givenSelectedValueAnimated: false,
            givenIsReduceMotionEnabled: stub.givenIsReduceMotionEnabled,
            expectedReturnValue: stub.expectedDynamicAnimationType
        )

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
            givenIsEnabled: true,
            expectedReturnValue: stub.expectedDim
        )

        CommonGetSpacingUseCaseableMockTest.expect(
            stub.getSpacingUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            expectedReturnValue: stub.expectedSpacing
        )

        CommonGetTitleStyleUseCaseableMockTest.expect(
            stub.getTitleStyleUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            expectedReturnValue: stub.expectedTitleStyle
        )
        // **
    }

    // MARK: - Setter Tests

    @Test("Theme changed should update some properties")
    func themeChangedShouldUpdateSomeProperties() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.load(stub: stub)
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
            getStaticAnimationType: true,
            getDynamicAnimationType: true,
            resetAnimation: true
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
            givenIsEnabled: true,
            expectedReturnValue: stub.expectedDim
        )

        CommonGetSpacingUseCaseableMockTest.expect(
            stub.getSpacingUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: givenTheme,
            expectedReturnValue: stub.expectedSpacing
        )

        CommonGetTitleStyleUseCaseableMockTest.expect(
            stub.getTitleStyleUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: givenTheme,
            expectedReturnValue: stub.expectedTitleStyle
        )
        // **
    }

    @Test("Is enabled changed should update dim")
    func isEnabledChangedShouldUpdateDim() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.load(stub: stub)
        stub.resetMockedData()

        let givenIsEnabled = false

        // WHEN
        viewModel.isEnabled = givenIsEnabled

        // THEN
        expectEqualToExpected(on: stub)

        // **
        // UseCase Calls Count
        expectNotCalled(
            on: stub,
            getStaticAnimationType: true,
            getDynamicAnimationType: true,
            getContentRadius: true,
            getSpacing: true,
            getTitleStyle: true,
            resetAnimation: true
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

    @Test("Is reduce motion enabled should update animation type")
    func isReduceMotionEnabledShouldUpdateAnimationType() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.load(stub: stub)
        stub.resetMockedData()

        let givenIsReduceMotionEnabled = true

        // WHEN
        viewModel.isReduceMotionEnabled = givenIsReduceMotionEnabled

        // THEN
        expectEqualToExpected(on: stub)

        // **
        // UseCase Calls Count
        expectNotCalled(
            on: stub,
            getContentRadius: true,
            getDim: true,
            getSpacing: true,
            getTitleStyle: true,
            resetAnimation: true
        )

        CommonGetAnimationTypeUseCaseableMockTest.expect(
            stub.getAnimationTypeUseCaseMock,
            expectedNumberOfCalls: 1,
            givenIsReduceMotionEnabled: givenIsReduceMotionEnabled,
            expectedReturnValue: stub.expectedStaticAnimationType
        )

        CommonGetAnimationTypeUseCaseableMockTest.expect(
            stub.getAnimationTypeUseCaseMock,
            expectedNumberOfCalls: 1,
            givenSelectedValueAnimated: false,
            givenIsReduceMotionEnabled: givenIsReduceMotionEnabled,
            expectedReturnValue: stub.expectedDynamicAnimationType
        )
        // **
    }

    @Test("All setter without change")
    func allSetterWithoutChange() {
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
        expectEqualToExpected(on: stub)

        // UseCase Calls Count
        expectNotCalled(
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

    @Test("All setter without load before")
    func allSetterWithoutLoadBefore() {
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
        expectEqualToExpected(
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
        expectNotCalled(
            on: stub,
            getStaticAnimationType: true,
            getContentRadius: true,
            getDim: true,
            getSpacing: true,
            getTitleStyle: true,
            resetAnimation: true
        )

        CommonGetAnimationTypeUseCaseableMockTest.expect(
            stub.getAnimationTypeUseCaseMock,
            expectedNumberOfCalls: 1,
            givenSelectedValueAnimated: givenAnimated,
            givenIsReduceMotionEnabled: givenIsReduceMotionEnabled,
            expectedReturnValue: stub.expectedDynamicAnimationType
        )
        // **
    }

    // MARK: - Action

    @Test("Set selected value without animation")
    func setSelectedValueWithoutAnimation() {
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
        expectEqualToExpected(on: stub)

        // **
        // UseCase Calls Count
        expectNotCalled(
            on: stub,
            getStaticAnimationType: true,
            getContentRadius: true,
            getDim: true,
            getSpacing: true,
            getTitleStyle: true,
            resetAnimation: true
        )

        CommonGetAnimationTypeUseCaseableMockTest.expect(
            stub.getAnimationTypeUseCaseMock,
            expectedNumberOfCalls: 1,
            givenSelectedValueAnimated: givenAnimated,
            givenIsReduceMotionEnabled: stub.givenIsReduceMotionEnabled,
            expectedReturnValue: stub.expectedDynamicAnimationType
        )
        // **
    }

    @Test("Set selected value with animation")
    func setSelectedValueWithAnimation() {
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
        expectEqualToExpected(on: stub)

        // **
        // UseCase Calls Count
        expectNotCalled(
            on: stub,
            getStaticAnimationType: true,
            getContentRadius: true,
            getDim: true,
            getSpacing: true,
            getTitleStyle: true,
            resetAnimation: true
        )

        CommonGetAnimationTypeUseCaseableMockTest.expect(
            stub.getAnimationTypeUseCaseMock,
            expectedNumberOfCalls: 1,
            givenSelectedValueAnimated: givenAnimated,
            givenIsReduceMotionEnabled: stub.givenIsReduceMotionEnabled,
            expectedReturnValue: stub.expectedDynamicAnimationType
        )
        // **
    }

    @Test("Set completed animation")
    func setCompletedAnimation() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel
        let givenAnimation: CommonCompletedAnimationMock = .one

        viewModel.load(stub: stub)
        stub.resetMockedData()

        // WHEN
        viewModel.setCompletedAnimation(givenAnimation)

        // THEN
        expectEqualToExpected(on: stub)

        // **
        // UseCase Calls Count
        expectNotCalled(
            on: stub,
            getStaticAnimationType: true,
            getDynamicAnimationType: true,
            getContentRadius: true,
            getDim: true,
            getSpacing: true,
            getTitleStyle: true
        )

        CommonResetAnimationUseCaseableMockTest.expect(
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
        expectEqualToExpected(on: stub)

        // **
        // UseCase Calls Count
        expectNotCalled(
            on: stub,
            getStaticAnimationType: true,
            getDynamicAnimationType: true,
            getContentRadius: true,
            getDim: true,
            getSpacing: true,
            getTitleStyle: true
        )

        CommonResetAnimationUseCaseableMockTest.expect(
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

    @Test("Selected value changed")
    func selectedValueChanged() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.load(stub: stub)
        stub.resetMockedData()

        // WHEN
        viewModel.selectedValueChanged(oldValue: true)

        // THEN
        expectEqualToExpected(on: stub)

        // UseCase Calls Count
        expectNotCalled(
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

// MARK: - Expectations

private func expectNotCalled(
    on stub: Stub,
    getStaticAnimationType getStaticAnimationTypeNotCalled: Bool = false,
    getDynamicAnimationType getDynamicAnimationTypeNotCalled: Bool = false,
    getContentRadius getContentRadiusNotCalled: Bool = false,
    getDim getDimNotCalled: Bool = false,
    getSpacing getSpacingNotCalled: Bool = false,
    getTitleStyle getTitleStyleNotCalled: Bool = false,
    resetAnimation resetAnimationNotCalled: Bool = false,
    sourceLocation: Testing.SourceLocation = #_sourceLocation
) {
    CommonGetAnimationTypeUseCaseableMockTest.expectCalled(
        stub.getAnimationTypeUseCaseMock,
        executeWithIsReduceMotionEnabledCalled: !getStaticAnimationTypeNotCalled,
        sourceLocation: sourceLocation
    )

    CommonGetAnimationTypeUseCaseableMockTest.expectCalled(
        stub.getAnimationTypeUseCaseMock,
        executeWithSelectedValueAnimatedAndIsReduceMotionEnabledCalled: !getDynamicAnimationTypeNotCalled,
        sourceLocation: sourceLocation
    )

    CommonGetContentRadiusUseCaseableMockTest.expectCalled(
        stub.getContentRadiusUseCaseMock,
        executeWithThemeAndTypeCalled: !getContentRadiusNotCalled,
        sourceLocation: sourceLocation
    )

    CommonGetSpacingUseCaseableMockTest.expectCalled(
        stub.getSpacingUseCaseMock,
        executeWithThemeCalled: !getSpacingNotCalled,
        sourceLocation: sourceLocation
    )

    CommonGetTitleStyleUseCaseableMockTest.expectCalled(
        stub.getTitleStyleUseCaseMock,
        executeWithThemeCalled: !getTitleStyleNotCalled,
        sourceLocation: sourceLocation
    )

    CommonResetAnimationUseCaseableMockTest.expectCalled(
        stub.resetAnimationUseCaseMock,
        executeWithAnimationTypeAndCompletedAnimationsAndSelectedValueAnimatedAndIsReduceMotionEnabledCalled: !resetAnimationNotCalled,
        sourceLocation: sourceLocation
    )
}

private func expectEqualToExpected(
    on stub: Stub,
    otherSelectedValue: Bool? = nil,
    otherStaticAnimationType: UIExecuteAnimationType? = nil,
    otherDynamicAnimationType: UIExecuteAnimationType? = nil,
    otherContentRadius: CGFloat? = nil,
    otherDim: CGFloat? = nil,
    otherSpacing: CGFloat? = nil,
    otherTitleStyle: CommonTitleStyle? = nil,
    sourceLocation: Testing.SourceLocation = #_sourceLocation
) {
    let viewModel = stub.viewModel

    if let otherSelectedValue {
        #expect(
            viewModel.selectedValue == otherSelectedValue,
            "Wrong isOn value",
            sourceLocation: sourceLocation
        )
    }

    #expect(
        viewModel.staticAnimationType == (otherStaticAnimationType ?? stub.expectedStaticAnimationType),
        "Wrong staticAnimationType value",
        sourceLocation: sourceLocation
    )
    #expect(
        viewModel.dynamicAnimationType == (otherDynamicAnimationType ?? stub.expectedDynamicAnimationType),
        "Wrong dynamicAnimationType value",
        sourceLocation: sourceLocation
    )
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
        viewModel.spacing == (otherSpacing ?? stub.expectedSpacing),
        "Wrong spacing value",
        sourceLocation: sourceLocation
    )
    #expect(
        viewModel.titleStyle == (otherTitleStyle ?? stub.expectedTitleStyle),
        "Wrong font value",
        sourceLocation: sourceLocation
    )
}
