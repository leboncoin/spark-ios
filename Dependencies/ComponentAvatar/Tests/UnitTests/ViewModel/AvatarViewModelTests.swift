//
//  AvatarViewModelTests.swift
//  SparkComponentAvatarTests
//
//  Created by robin.lemaire on 22/07/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

@testable import SparkComponentAvatar
@_spi(SI_SPI) @testable import SparkComponentAvatarTesting
@_spi(SI_SPI) import SparkThemingTesting
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkCommonTesting
import Testing

@Suite("Avatar ViewModel Tests")
struct AvatarViewModelTests {

    // MARK: - Initialization

    @Test("Initialization should use default values")
    func initializationShouldUseDefaultValues() {
        // GIVEN / WHEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // THEN
        #expect(viewModel.theme == nil)
        #expect(viewModel.contentType == nil)
        #expect(viewModel.size == nil)
        #expect(viewModel.isBorder == nil)
        #expect(viewModel.isPressed == false)
        #expect(viewModel.isEnabled == nil)

        expectEqualToExpected(
            on: stub,
            otherColors: AvatarColors(),
            otherBorder: AvatarBorder(),
            otherDim: .zero,
            otherSizes: AvatarSizes(),
            otherLayout: AvatarLayout(),
            otherTypographies: AvatarTypographies(),
            otherScaleEffect: 1.0
        )

        expectNotCalled(
            on: stub,
            getColorsUseCase: true,
            getBorderUseCase: true,
            getDimUseCase: true,
            getSizesUseCase: true,
            getLayoutUseCase: true,
            getTypographiesUseCase: true,
            getScaleEffectUseCase: true
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

        AvatarGetColorsUseCaseableMockTest.expect(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenContentType: stub.givenContentType,
            givenIsPressed: false,
            expectedReturnValue: stub.expectedColors
        )

        AvatarGetBorderUseCaseableMockTest.expect(
            stub.getBorderUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIsBorder: stub.givenIsBorder,
            givenSize: stub.givenSize,
            givenContentType: stub.givenContentType,
            expectedReturnValue: stub.expectedBorder
        )

        AvatarGetDimUseCaseableMockTest.expect(
            stub.getDimUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIsEnabled: stub.givenIsEnabled,
            expectedReturnValue: stub.expectedDim
        )

        AvatarGetSizesUseCaseableMockTest.expect(
            stub.getSizesUseCaseMock,
            expectedNumberOfCalls: 1,
            givenSize: stub.givenSize,
            expectedReturnValue: stub.expectedSizes
        )

        AvatarGetLayoutUseCaseableMockTest.expect(
            stub.getLayoutUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            expectedReturnValue: stub.expectedLayout
        )

        AvatarGetTypographiesUseCaseableMockTest.expect(
            stub.getTypographiesUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenSize: stub.givenSize,
            expectedReturnValue: stub.expectedTypographies
        )

        AvatarGetScaleEffectUseCaseableMockTest.expect(
            stub.getScaleEffectUseCaseMock,
            expectedNumberOfCalls: 1,
            givenSize: stub.givenSize,
            givenIsPressed: false,
            expectedReturnValue: stub.expectedScaleEffect
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

        AvatarGetColorsUseCaseableMockTest.expect(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: newTheme,
            givenContentType: stub.givenContentType,
            givenIsPressed: false,
            expectedReturnValue: stub.expectedColors
        )

        AvatarGetBorderUseCaseableMockTest.expect(
            stub.getBorderUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: newTheme,
            givenIsBorder: stub.givenIsBorder,
            givenSize: stub.givenSize,
            givenContentType: stub.givenContentType,
            expectedReturnValue: stub.expectedBorder
        )

        AvatarGetDimUseCaseableMockTest.expect(
            stub.getDimUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: newTheme,
            givenIsEnabled: stub.givenIsEnabled,
            expectedReturnValue: stub.expectedDim
        )

        AvatarGetLayoutUseCaseableMockTest.expect(
            stub.getLayoutUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: newTheme,
            expectedReturnValue: stub.expectedLayout
        )

        AvatarGetTypographiesUseCaseableMockTest.expect(
            stub.getTypographiesUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: newTheme,
            givenSize: stub.givenSize,
            expectedReturnValue: stub.expectedTypographies
        )

        expectNotCalled(
            on: stub,
            getSizesUseCase: true,
            getScaleEffectUseCase: true
        )
    }

    @Test("ContentType when changed should call use cases")
    func contentTypeWhenChangedShouldCallUseCases() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel
        viewModel.setup(stub: stub)

        stub.resetMockedData()

        let newContentType: AvatarContentType = .company

        // WHEN
        viewModel.contentType = newContentType

        // THEN
        expectEqualToExpected(on: stub)

        AvatarGetColorsUseCaseableMockTest.expect(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenContentType: newContentType,
            givenIsPressed: false,
            expectedReturnValue: stub.expectedColors
        )

        AvatarGetBorderUseCaseableMockTest.expect(
            stub.getBorderUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIsBorder: stub.givenIsBorder,
            givenSize: stub.givenSize,
            givenContentType: newContentType,
            expectedReturnValue: stub.expectedBorder
        )

        expectNotCalled(
            on: stub,
            getDimUseCase: true,
            getSizesUseCase: true,
            getLayoutUseCase: true,
            getTypographiesUseCase: true,
            getScaleEffectUseCase: true
        )
    }

    @Test("Size when changed should call use cases")
    func sizeWhenChangedShouldCallUseCases() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel
        viewModel.setup(stub: stub)

        stub.resetMockedData()

        let newSize: AvatarSize = .xl

        // WHEN
        viewModel.size = newSize

        // THEN
        expectEqualToExpected(on: stub)

        AvatarGetBorderUseCaseableMockTest.expect(
            stub.getBorderUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIsBorder: stub.givenIsBorder,
            givenSize: newSize,
            givenContentType: stub.givenContentType,
            expectedReturnValue: stub.expectedBorder
        )

        AvatarGetSizesUseCaseableMockTest.expect(
            stub.getSizesUseCaseMock,
            expectedNumberOfCalls: 1,
            givenSize: newSize,
            expectedReturnValue: stub.expectedSizes
        )

        AvatarGetTypographiesUseCaseableMockTest.expect(
            stub.getTypographiesUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenSize: newSize,
            expectedReturnValue: stub.expectedTypographies
        )

        AvatarGetScaleEffectUseCaseableMockTest.expect(
            stub.getScaleEffectUseCaseMock,
            expectedNumberOfCalls: 1,
            givenSize: newSize,
            givenIsPressed: false,
            expectedReturnValue: stub.expectedScaleEffect
        )

        expectNotCalled(
            on: stub,
            getColorsUseCase: true,
            getDimUseCase: true,
            getLayoutUseCase: true
        )
    }

    @Test("IsBorder when changed should call border use case")
    func isBorderWhenChangedShouldCallBorderUseCase() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel
        viewModel.setup(stub: stub)

        stub.resetMockedData()

        // WHEN
        viewModel.isBorder = false

        // THEN
        expectEqualToExpected(on: stub)

        AvatarGetBorderUseCaseableMockTest.expect(
            stub.getBorderUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIsBorder: false,
            givenSize: stub.givenSize,
            givenContentType: stub.givenContentType,
            expectedReturnValue: stub.expectedBorder
        )

        expectNotCalled(
            on: stub,
            getColorsUseCase: true,
            getDimUseCase: true,
            getSizesUseCase: true,
            getLayoutUseCase: true,
            getTypographiesUseCase: true,
            getScaleEffectUseCase: true
        )
    }

    @Test("IsPressed when changed should call colors and scale effect use cases")
    func isPressedWhenChangedShouldCallColorsAndScaleEffectUseCases() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel
        viewModel.setup(stub: stub)

        stub.resetMockedData()

        // WHEN
        viewModel.isPressed = true

        // THEN
        expectEqualToExpected(on: stub)

        AvatarGetColorsUseCaseableMockTest.expect(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenContentType: stub.givenContentType,
            givenIsPressed: true,
            expectedReturnValue: stub.expectedColors
        )

        AvatarGetScaleEffectUseCaseableMockTest.expect(
            stub.getScaleEffectUseCaseMock,
            expectedNumberOfCalls: 1,
            givenSize: stub.givenSize,
            givenIsPressed: true,
            expectedReturnValue: stub.expectedScaleEffect
        )

        expectNotCalled(
            on: stub,
            getBorderUseCase: true,
            getDimUseCase: true,
            getSizesUseCase: true,
            getLayoutUseCase: true,
            getTypographiesUseCase: true
        )
    }

    @Test("IsEnabled when changed should call dim use case")
    func isEnabledWhenChangedShouldCallDimUseCase() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel
        viewModel.setup(stub: stub)

        stub.resetMockedData()

        // WHEN
        viewModel.isEnabled = false

        // THEN
        expectEqualToExpected(on: stub)

        AvatarGetDimUseCaseableMockTest.expect(
            stub.getDimUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIsEnabled: false,
            expectedReturnValue: stub.expectedDim
        )

        expectNotCalled(
            on: stub,
            getColorsUseCase: true,
            getBorderUseCase: true,
            getSizesUseCase: true,
            getLayoutUseCase: true,
            getTypographiesUseCase: true,
            getScaleEffectUseCase: true
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
        viewModel.contentType = .user
        viewModel.size = .lg
        viewModel.isBorder = true
        viewModel.isPressed = true
        viewModel.isEnabled = true

        // THEN
        expectEqualToExpected(
            on: stub,
            otherColors: AvatarColors(),
            otherBorder: AvatarBorder(),
            otherDim: .zero,
            otherSizes: AvatarSizes(),
            otherLayout: AvatarLayout(),
            otherTypographies: AvatarTypographies(),
            otherScaleEffect: 1.0
        )

        expectNotCalled(
            on: stub,
            getColorsUseCase: true,
            getBorderUseCase: true,
            getDimUseCase: true,
            getSizesUseCase: true,
            getLayoutUseCase: true,
            getTypographiesUseCase: true,
            getScaleEffectUseCase: true
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
        viewModel.contentType = stub.givenContentType
        viewModel.size = stub.givenSize
        viewModel.isBorder = stub.givenIsBorder
        viewModel.isPressed = false
        viewModel.isEnabled = stub.givenIsEnabled

        // THEN
        expectEqualToExpected(on: stub)

        expectNotCalled(
            on: stub,
            getColorsUseCase: true,
            getBorderUseCase: true,
            getDimUseCase: true,
            getSizesUseCase: true,
            getLayoutUseCase: true,
            getTypographiesUseCase: true,
            getScaleEffectUseCase: true
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
        viewModel.contentType = nil
        viewModel.size = nil
        viewModel.isBorder = nil
        viewModel.isEnabled = nil

        // THEN
        expectEqualToExpected(on: stub)

        expectNotCalled(
            on: stub,
            getColorsUseCase: true,
            getBorderUseCase: true,
            getDimUseCase: true,
            getSizesUseCase: true,
            getLayoutUseCase: true,
            getTypographiesUseCase: true,
            getScaleEffectUseCase: true
        )
    }

    // MARK: - Getter

    @Test("GetCornerViewOffset should call use case and return expected value")
    func getCornerViewOffsetShouldCallUseCaseAndReturnExpectedValue() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel
        viewModel.setup(stub: stub)

        stub.resetMockedData()

        let cornerViewSize = CGSize(width: 24, height: 24)

        // WHEN
        let result = viewModel.getCornerViewOffset(cornerViewSize: cornerViewSize)

        // THEN
        AvatarGetCornerViewOffsetUseCaseableMockTest.expect(
            stub.getCornerViewOffsetUseCaseMock,
            expectedNumberOfCalls: 1,
            givenContentType: stub.givenContentType,
            givenAvatarSize: stub.expectedSizes.size,
            givenCornerViewSize: cornerViewSize,
            expectedReturnValue: stub.expectedCornerViewOffset
        )

        #expect(result == stub.expectedCornerViewOffset)
    }

    @Test("GetCornerViewOffset with nil corner view size should call use case")
    func getCornerViewOffsetWithNilCornerViewSizeShouldCallUseCase() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel
        viewModel.setup(stub: stub)

        stub.resetMockedData()

        // WHEN
        let result = viewModel.getCornerViewOffset(cornerViewSize: nil)

        // THEN
        AvatarGetCornerViewOffsetUseCaseableMockTest.expect(
            stub.getCornerViewOffsetUseCaseMock,
            expectedNumberOfCalls: 1,
            givenContentType: stub.givenContentType,
            givenAvatarSize: stub.expectedSizes.size,
            givenCornerViewSize: nil,
            expectedReturnValue: stub.expectedCornerViewOffset
        )

        #expect(result == stub.expectedCornerViewOffset)
    }

    @Test("GetCornerViewOffset before setup should return zero")
    func getCornerViewOffsetBeforeSetupShouldReturnZero() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        let cornerViewSize = CGSize(width: 24, height: 24)

        // WHEN
        let result = viewModel.getCornerViewOffset(cornerViewSize: cornerViewSize)

        // THEN
        AvatarGetCornerViewOffsetUseCaseableMockTest.expectCalled(
            stub.getCornerViewOffsetUseCaseMock,
            executeWithContentTypeAndAvatarSizeAndCornerViewSizeCalled: false
        )

        #expect(result == .zero)
    }
}

// MARK: - Stub

private final class Stub {

    // MARK: - Properties

    let givenTheme = ThemeGeneratedMock.mocked()
    let givenContentType: AvatarContentType = .user
    let givenSize: AvatarSize = .lg
    let givenIsBorder = true
    let givenIsEnabled = true

    let expectedColors = AvatarColors(
        backgroundColorToken: ColorTokenGeneratedMock.random(),
        borderColorToken: ColorTokenGeneratedMock.green(),
        placeholderTintColorToken: ColorTokenGeneratedMock.random(),
        actionBackgroundColorToken: ColorTokenGeneratedMock.random(),
        actionTintColorToken: ColorTokenGeneratedMock.random()
    )
    let expectedBorder = AvatarBorder(radius: 8.0, width: 2.0)
    let expectedDim: CGFloat = 0.5
    let expectedSizes = AvatarSizes(size: 56, placeholderSize: 48, actionSize: 32, badgeSize: .medium)
    let expectedLayout = AvatarLayout(actionPadding: 8.0)
    let expectedTypographies = AvatarTypographies(
        placeholderFontToken: TypographyFontTokenGeneratedMock.mocked(.title2)
    )
    let expectedScaleEffect: CGFloat = 1.1
    let expectedCornerViewOffset = CGSize(width: 19.80, height: 19.80)

    // MARK: - Use Case Mocks

    let getColorsUseCaseMock: AvatarGetColorsUseCaseableGeneratedMock
    let getBorderUseCaseMock: AvatarGetBorderUseCaseableGeneratedMock
    let getDimUseCaseMock: AvatarGetDimUseCaseableGeneratedMock
    let getSizesUseCaseMock: AvatarGetSizesUseCaseableGeneratedMock
    let getLayoutUseCaseMock: AvatarGetLayoutUseCaseableGeneratedMock
    let getTypographiesUseCaseMock: AvatarGetTypographiesUseCaseableGeneratedMock
    let getScaleEffectUseCaseMock: AvatarGetScaleEffectUseCaseableGeneratedMock
    let getCornerViewOffsetUseCaseMock: AvatarGetCornerViewOffsetUseCaseableGeneratedMock

    // MARK: - ViewModel

    let viewModel: AvatarViewModel

    // MARK: - Initialization

    init() {
        let getColorsUseCaseMock = AvatarGetColorsUseCaseableGeneratedMock()
        getColorsUseCaseMock.executeWithThemeAndContentTypeAndIsPressedReturnValue = self.expectedColors

        let getBorderUseCaseMock = AvatarGetBorderUseCaseableGeneratedMock()
        getBorderUseCaseMock.executeWithThemeAndIsBorderAndSizeAndContentTypeReturnValue = self.expectedBorder

        let getDimUseCaseMock = AvatarGetDimUseCaseableGeneratedMock()
        getDimUseCaseMock.executeWithThemeAndIsEnabledReturnValue = self.expectedDim

        let getSizesUseCaseMock = AvatarGetSizesUseCaseableGeneratedMock()
        getSizesUseCaseMock.executeWithSizeReturnValue = self.expectedSizes

        let getLayoutUseCaseMock = AvatarGetLayoutUseCaseableGeneratedMock()
        getLayoutUseCaseMock.executeWithThemeReturnValue = self.expectedLayout

        let getTypographiesUseCaseMock = AvatarGetTypographiesUseCaseableGeneratedMock()
        getTypographiesUseCaseMock.executeWithThemeAndSizeReturnValue = self.expectedTypographies

        let getScaleEffectUseCaseMock = AvatarGetScaleEffectUseCaseableGeneratedMock()
        getScaleEffectUseCaseMock.executeWithSizeAndIsPressedReturnValue = self.expectedScaleEffect

        let getCornerViewOffsetUseCaseMock = AvatarGetCornerViewOffsetUseCaseableGeneratedMock()
        getCornerViewOffsetUseCaseMock.executeWithContentTypeAndAvatarSizeAndCornerViewSizeReturnValue = self.expectedCornerViewOffset

        self.viewModel = AvatarViewModel(
            getColorsUseCase: getColorsUseCaseMock,
            getBorderUseCase: getBorderUseCaseMock,
            getDimUseCase: getDimUseCaseMock,
            getSizesUseCase: getSizesUseCaseMock,
            getLayoutUseCase: getLayoutUseCaseMock,
            getTypographiesUseCase: getTypographiesUseCaseMock,
            getScaleEffectUseCase: getScaleEffectUseCaseMock,
            getCornerViewOffsetUseCase: getCornerViewOffsetUseCaseMock
        )

        self.getColorsUseCaseMock = getColorsUseCaseMock
        self.getBorderUseCaseMock = getBorderUseCaseMock
        self.getDimUseCaseMock = getDimUseCaseMock
        self.getSizesUseCaseMock = getSizesUseCaseMock
        self.getLayoutUseCaseMock = getLayoutUseCaseMock
        self.getTypographiesUseCaseMock = getTypographiesUseCaseMock
        self.getScaleEffectUseCaseMock = getScaleEffectUseCaseMock
        self.getCornerViewOffsetUseCaseMock = getCornerViewOffsetUseCaseMock
    }

    // MARK: - Methods

    func resetMockedData() {
        self.getColorsUseCaseMock.reset()
        self.getBorderUseCaseMock.reset()
        self.getDimUseCaseMock.reset()
        self.getSizesUseCaseMock.reset()
        self.getLayoutUseCaseMock.reset()
        self.getTypographiesUseCaseMock.reset()
        self.getScaleEffectUseCaseMock.reset()
        self.getCornerViewOffsetUseCaseMock.reset()
    }
}

// MARK: - Extension

private extension AvatarViewModel {

    func setup(stub: Stub) {
        self.setup(
            theme: stub.givenTheme,
            contentType: stub.givenContentType,
            size: stub.givenSize,
            isBorder: stub.givenIsBorder,
            isEnabled: stub.givenIsEnabled
        )
    }
}

// MARK: - Expectations

private func expectNotCalled(
    on stub: Stub,
    getColorsUseCase: Bool = false,
    getBorderUseCase: Bool = false,
    getDimUseCase: Bool = false,
    getSizesUseCase: Bool = false,
    getLayoutUseCase: Bool = false,
    getTypographiesUseCase: Bool = false,
    getScaleEffectUseCase: Bool = false,
    sourceLocation: Testing.SourceLocation = #_sourceLocation
) {
    AvatarGetColorsUseCaseableMockTest.expectCalled(
        stub.getColorsUseCaseMock,
        executeWithThemeAndContentTypeAndIsPressedCalled: !getColorsUseCase,
        sourceLocation: sourceLocation
    )

    AvatarGetBorderUseCaseableMockTest.expectCalled(
        stub.getBorderUseCaseMock,
        executeWithThemeAndIsBorderAndSizeAndContentTypeCalled: !getBorderUseCase,
        sourceLocation: sourceLocation
    )

    AvatarGetDimUseCaseableMockTest.expectCalled(
        stub.getDimUseCaseMock,
        executeWithThemeAndIsEnabledCalled: !getDimUseCase,
        sourceLocation: sourceLocation
    )

    AvatarGetSizesUseCaseableMockTest.expectCalled(
        stub.getSizesUseCaseMock,
        executeWithSizeCalled: !getSizesUseCase,
        sourceLocation: sourceLocation
    )

    AvatarGetLayoutUseCaseableMockTest.expectCalled(
        stub.getLayoutUseCaseMock,
        executeWithThemeCalled: !getLayoutUseCase,
        sourceLocation: sourceLocation
    )

    AvatarGetTypographiesUseCaseableMockTest.expectCalled(
        stub.getTypographiesUseCaseMock,
        executeWithThemeAndSizeCalled: !getTypographiesUseCase,
        sourceLocation: sourceLocation
    )

    AvatarGetScaleEffectUseCaseableMockTest.expectCalled(
        stub.getScaleEffectUseCaseMock,
        executeWithSizeAndIsPressedCalled: !getScaleEffectUseCase,
        sourceLocation: sourceLocation
    )

    AvatarGetCornerViewOffsetUseCaseableMockTest.expectCalled(
        stub.getCornerViewOffsetUseCaseMock,
        executeWithContentTypeAndAvatarSizeAndCornerViewSizeCalled: false,
        sourceLocation: sourceLocation
    )
}

private func expectEqualToExpected(
    on stub: Stub,
    otherColors: AvatarColors? = nil,
    otherBorder: AvatarBorder? = nil,
    otherDim: CGFloat? = nil,
    otherSizes: AvatarSizes? = nil,
    otherLayout: AvatarLayout? = nil,
    otherTypographies: AvatarTypographies? = nil,
    otherScaleEffect: CGFloat? = nil,
    sourceLocation: Testing.SourceLocation = #_sourceLocation
) {
    let viewModel = stub.viewModel

    let expectedColors = otherColors ?? stub.expectedColors
    let expectedBorder = otherBorder ?? stub.expectedBorder
    let expectedDim = otherDim ?? stub.expectedDim
    let expectedSizes = otherSizes ?? stub.expectedSizes
    let expectedLayout = otherLayout ?? stub.expectedLayout
    let expectedTypographies = otherTypographies ?? stub.expectedTypographies
    let expectedScaleEffect = otherScaleEffect ?? stub.expectedScaleEffect

    #expect(
        viewModel.colors == expectedColors,
        "Wrong colors value",
        sourceLocation: sourceLocation
    )

    #expect(
        viewModel.border == expectedBorder,
        "Wrong border value",
        sourceLocation: sourceLocation
    )

    #expect(
        viewModel.dim == expectedDim,
        "Wrong dim value",
        sourceLocation: sourceLocation
    )

    #expect(
        viewModel.sizes == expectedSizes,
        "Wrong sizes value",
        sourceLocation: sourceLocation
    )

    #expect(
        viewModel.layout == expectedLayout,
        "Wrong layout value",
        sourceLocation: sourceLocation
    )

    #expect(
        viewModel.typographies == expectedTypographies,
        "Wrong typographies value",
        sourceLocation: sourceLocation
    )

    #expect(
        viewModel.scaleEffect == expectedScaleEffect,
        "Wrong scaleEffect value",
        sourceLocation: sourceLocation
    )
}
