//
//  SegmentedGaugeViewModelTests.swift
//  SparkComponentSegmentedGaugeUnitTests
//
//  Created by robin.lemaire on 30/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
import Foundation
import SwiftUI
import UIKit

@testable import SparkComponentSegmentedGauge
@_spi(SI_SPI) @testable import SparkComponentSegmentedGaugeTesting
@_spi(SI_SPI) import SparkThemingTesting

@MainActor
@Suite("SegmentedGauge ViewModel Tests")
struct SegmentedGaugeViewModelTests {

    // MARK: - Initialization

    @Test("Initialization should use default values")
    func initializationShouldUseDefaultValues() {
        // GIVEN / WHEN
        let stub = Stub()

        // THEN
        #expect(stub.viewModel.theme == nil)
        #expect(stub.viewModel.alignment == nil)
        #expect(stub.viewModel.segments == nil)
        #expect(stub.viewModel.size == nil)
        #expect(stub.viewModel.type == nil)

        expectEqualToExpected(
            on: stub,
            otherColors: SegmentedGaugeColors(),
            otherLabelsStyle: SegmentedGaugeLabelsStyle(),
            otherLayout: SegmentedGaugeLayout(),
            otherLevels: SegmentedGaugeLevels(),
            otherSegmentBorder: SegmentedGaugeSegmentBorder(),
            otherSizes: SegmentedGaugeSizes()
        )

        expectNotCalled(
            on: stub,
            getColorsUseCase: true,
            getLabelsStyleUseCase: true,
            getLayoutUseCase: true,
            getLevelsUseCase: true,
            getSegmentBorderUseCase: true,
            getSizesUseCase: true
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

        SegmentedGaugeGetColorsUseCaseableMockTest.expect(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenType: stub.givenType,
            givenSegments: stub.givenSegments,
            expectedReturnValue: stub.expectedColors
        )

        SegmentedGaugeGetLabelsStyleUseCaseableMockTest.expect(
            stub.getLabelsStyleUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            expectedReturnValue: stub.expectedLabelsStyle
        )

        SegmentedGaugeGetLayoutUseCaseableMockTest.expect(
            stub.getLayoutUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenAlignment: stub.givenAlignment,
            expectedReturnValue: stub.expectedLayout
        )

        SegmentedGaugeGetLevelsUseCaseableMockTest.expect(
            stub.getLevelsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenSegments: stub.givenSegments,
            givenType: stub.givenType,
            expectedReturnValue: stub.expectedLevels
        )

        SegmentedGaugeGetSegmentBorderUseCaseableMockTest.expect(
            stub.getSegmentBorderUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            expectedReturnValue: stub.expectedSegmentBorder
        )

        SegmentedGaugeGetSizesUseCaseableMockTest.expect(
            stub.getSizesUseCaseMock,
            expectedNumberOfCalls: 1,
            givenSize: stub.givenSize,
            expectedReturnValue: stub.expectedSizes
        )
    }

    // MARK: - Property Changes

    @Test("Theme changed should update dependent properties")
    func themeChangedShouldUpdateDependentProperties() {
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

        SegmentedGaugeGetColorsUseCaseableMockTest.expect(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: newTheme,
            givenType: stub.givenType,
            givenSegments: stub.givenSegments,
            expectedReturnValue: stub.expectedColors
        )

        SegmentedGaugeGetLabelsStyleUseCaseableMockTest.expect(
            stub.getLabelsStyleUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: newTheme,
            expectedReturnValue: stub.expectedLabelsStyle
        )

        SegmentedGaugeGetLayoutUseCaseableMockTest.expect(
            stub.getLayoutUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: newTheme,
            givenAlignment: stub.givenAlignment,
            expectedReturnValue: stub.expectedLayout
        )

        SegmentedGaugeGetSegmentBorderUseCaseableMockTest.expect(
            stub.getSegmentBorderUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: newTheme,
            expectedReturnValue: stub.expectedSegmentBorder
        )

        expectNotCalled(
            on: stub,
            getLevelsUseCase: true,
            getSizesUseCase: true
        )
    }

    @Test("Alignment changed should update layout only")
    func alignmentChangedShouldUpdateLayoutOnly() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let newAlignment: SegmentedGaugeAlignment = .vertical

        // WHEN
        viewModel.alignment = newAlignment

        // THEN
        expectEqualToExpected(on: stub)

        SegmentedGaugeGetLayoutUseCaseableMockTest.expect(
            stub.getLayoutUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenAlignment: newAlignment,
            expectedReturnValue: stub.expectedLayout
        )

        expectNotCalled(
            on: stub,
            getColorsUseCase: true,
            getLabelsStyleUseCase: true,
            getLevelsUseCase: true,
            getSegmentBorderUseCase: true,
            getSizesUseCase: true
        )
    }

    @Test("Segments changed should update levels only")
    func segmentsChangedShouldUpdateLevelsOnly() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let newSegments: SegmentedGaugeSegments = .five

        // WHEN
        viewModel.segments = newSegments

        // THEN
        expectEqualToExpected(on: stub)

        SegmentedGaugeGetColorsUseCaseableMockTest.expect(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenType: stub.givenType,
            givenSegments: newSegments,
            expectedReturnValue: stub.expectedColors
        )

        SegmentedGaugeGetLevelsUseCaseableMockTest.expect(
            stub.getLevelsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenSegments: newSegments,
            givenType: stub.givenType,
            expectedReturnValue: stub.expectedLevels
        )

        expectNotCalled(
            on: stub,
            getLabelsStyleUseCase: true,
            getLayoutUseCase: true,
            getSegmentBorderUseCase: true,
            getSizesUseCase: true
        )
    }

    @Test("Size changed should update segment size only")
    func sizeChangedShouldUpdateSegmentSizeOnly() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let newSize: SegmentedGaugeSize = .medium

        // WHEN
        viewModel.size = newSize

        // THEN
        expectEqualToExpected(on: stub)

        SegmentedGaugeGetSizesUseCaseableMockTest.expect(
            stub.getSizesUseCaseMock,
            expectedNumberOfCalls: 1,
            givenSize: newSize,
            expectedReturnValue: stub.expectedSizes
        )

        expectNotCalled(
            on: stub,
            getColorsUseCase: true,
            getLabelsStyleUseCase: true,
            getLayoutUseCase: true,
            getLevelsUseCase: true,
            getSegmentBorderUseCase: true
        )
    }

    @Test("Type changed should update colors and levels")
    func typeChangedShouldUpdateColorsAndLevels() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let newType: SegmentedGaugeType = .veryHigh

        // WHEN
        viewModel.type = newType

        // THEN
        expectEqualToExpected(on: stub)

        SegmentedGaugeGetColorsUseCaseableMockTest.expect(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenType: newType,
            givenSegments: stub.givenSegments,
            expectedReturnValue: stub.expectedColors
        )

        SegmentedGaugeGetLevelsUseCaseableMockTest.expect(
            stub.getLevelsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenSegments: stub.givenSegments,
            givenType: newType,
            expectedReturnValue: stub.expectedLevels
        )

        expectNotCalled(
            on: stub,
            getLabelsStyleUseCase: true,
            getLayoutUseCase: true,
            getSegmentBorderUseCase: true,
            getSizesUseCase: true
        )
    }

    @Test("Properties changed before setup should not call use cases")
    func propertiesChangedBeforeSetupShouldNotCallUseCases() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // WHEN
        viewModel.theme = ThemeGeneratedMock.mocked()
        viewModel.alignment = .vertical
        viewModel.segments = .five
        viewModel.size = .medium
        viewModel.type = .veryLow

        // THEN
        expectEqualToExpected(
            on: stub,
            otherColors: SegmentedGaugeColors(),
            otherLabelsStyle: SegmentedGaugeLabelsStyle(),
            otherLayout: SegmentedGaugeLayout(),
            otherLevels: SegmentedGaugeLevels(),
            otherSegmentBorder: SegmentedGaugeSegmentBorder(),
            otherSizes: SegmentedGaugeSizes()
        )

        expectNotCalled(
            on: stub,
            getColorsUseCase: true,
            getLabelsStyleUseCase: true,
            getLayoutUseCase: true,
            getLevelsUseCase: true,
            getSegmentBorderUseCase: true,
            getSizesUseCase: true
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
        viewModel.alignment = stub.givenAlignment
        viewModel.segments = stub.givenSegments
        viewModel.size = stub.givenSize
        viewModel.type = stub.givenType

        // THEN
        expectEqualToExpected(on: stub)

        expectNotCalled(
            on: stub,
            getColorsUseCase: true,
            getLabelsStyleUseCase: true,
            getLayoutUseCase: true,
            getLevelsUseCase: true,
            getSegmentBorderUseCase: true,
            getSizesUseCase: true
        )
    }

    @Test("Properties changed for nil should not call use cases")
    func propertiesChangedForNilShouldNotCallUseCases() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        // WHEN
        viewModel.theme = nil
        viewModel.alignment = nil
        viewModel.segments = nil
        viewModel.size = nil
        viewModel.type = nil

        // THEN
        expectEqualToExpected(on: stub)

        expectNotCalled(
            on: stub,
            getColorsUseCase: true,
            getLabelsStyleUseCase: true,
            getLayoutUseCase: true,
            getLevelsUseCase: true,
            getSegmentBorderUseCase: true,
            getSizesUseCase: true
        )
    }
}

// MARK: - Stub

private final class Stub {

    // MARK: - Given

    let givenTheme = ThemeGeneratedMock.mocked()
    let givenAlignment: SegmentedGaugeAlignment = .horizontal
    let givenSegments: SegmentedGaugeSegments = .three
    let givenSize: SegmentedGaugeSize = .small
    let givenType: SegmentedGaugeType = .medium

    // MARK: - Expected

    let expectedColors = SegmentedGaugeColors(
        plainSegmentBackground: ColorTokenGeneratedMock.blue(),
        otherSegmentBackground: ColorTokenGeneratedMock.orange(),
        plainSegmentBorder: ColorTokenGeneratedMock.purple(),
        otherSegmentBorder: ColorTokenGeneratedMock.green(),
        markerOuterBackground: ColorTokenGeneratedMock.green(),
        markerInnerBackground: ColorTokenGeneratedMock.yellow()
    )
    let expectedLabelsStyle = SegmentedGaugeLabelsStyle(
        titleTypography: TypographyFontTokenGeneratedMock.mocked(.title2),
        descriptionTypography: TypographyFontTokenGeneratedMock.mocked(.title3),
        color: ColorTokenGeneratedMock.red()
    )
    let expectedLayout = SegmentedGaugeLayout(contentSpacing: 2, subContentSpacing: 3, segmentsSpacing: 4)
    let expectedLevels = SegmentedGaugeLevels(currentLevel: 2, levels: 3)
    let expectedSegmentBorder = SegmentedGaugeSegmentBorder(width: 1.5, radius: 7.5)
    let expectedSizes = SegmentedGaugeSizes(segmentSize: .init(width: 1, height: 2), markerInnerSize: 3, markerOuterSize: 4)

    // MARK: - Use Case Mocks

    let getColorsUseCaseMock: SegmentedGaugeGetColorsUseCaseableGeneratedMock
    let getLabelsStyleUseCaseMock: SegmentedGaugeGetLabelsStyleUseCaseableGeneratedMock
    let getLayoutUseCaseMock: SegmentedGaugeGetLayoutUseCaseableGeneratedMock
    let getLevelsUseCaseMock: SegmentedGaugeGetLevelsUseCaseableGeneratedMock
    let getSegmentBorderUseCaseMock: SegmentedGaugeGetSegmentBorderUseCaseableGeneratedMock
    let getSizesUseCaseMock: SegmentedGaugeGetSizesUseCaseableGeneratedMock

    // MARK: - ViewModel

    let viewModel: SegmentedGaugeViewModel

    // MARK: - Initialization

    init() {
        let getColorsUseCaseMock = SegmentedGaugeGetColorsUseCaseableGeneratedMock()
        getColorsUseCaseMock.executeWithThemeAndTypeAndSegmentsReturnValue = self.expectedColors

        let getLabelsStyleUseCaseMock = SegmentedGaugeGetLabelsStyleUseCaseableGeneratedMock()
        getLabelsStyleUseCaseMock.executeWithThemeReturnValue = self.expectedLabelsStyle

        let getLayoutUseCaseMock = SegmentedGaugeGetLayoutUseCaseableGeneratedMock()
        getLayoutUseCaseMock.executeWithThemeAndAlignmentReturnValue = self.expectedLayout

        let getLevelsUseCaseMock = SegmentedGaugeGetLevelsUseCaseableGeneratedMock()
        getLevelsUseCaseMock.executeWithSegmentsAndTypeReturnValue = self.expectedLevels

        let getSegmentBorderUseCaseMock = SegmentedGaugeGetSegmentBorderUseCaseableGeneratedMock()
        getSegmentBorderUseCaseMock.executeWithThemeReturnValue = self.expectedSegmentBorder

        let getSizesUseCaseMock = SegmentedGaugeGetSizesUseCaseableGeneratedMock()
        getSizesUseCaseMock.executeWithSizeReturnValue = self.expectedSizes

        self.viewModel = SegmentedGaugeViewModel(
            getColorsUseCase: getColorsUseCaseMock,
            getLabelsStyleUseCase: getLabelsStyleUseCaseMock,
            getLayoutUseCase: getLayoutUseCaseMock,
            getLevelsUseCase: getLevelsUseCaseMock,
            getSegmentBorderUseCase: getSegmentBorderUseCaseMock,
            getSizesUseCase: getSizesUseCaseMock
        )

        self.getColorsUseCaseMock = getColorsUseCaseMock
        self.getLabelsStyleUseCaseMock = getLabelsStyleUseCaseMock
        self.getLayoutUseCaseMock = getLayoutUseCaseMock
        self.getLevelsUseCaseMock = getLevelsUseCaseMock
        self.getSegmentBorderUseCaseMock = getSegmentBorderUseCaseMock
        self.getSizesUseCaseMock = getSizesUseCaseMock
    }

    // MARK: - Helpers

    func resetMockedData() {
        self.getColorsUseCaseMock.reset()
        self.getLabelsStyleUseCaseMock.reset()
        self.getLayoutUseCaseMock.reset()
        self.getLevelsUseCaseMock.reset()
        self.getSegmentBorderUseCaseMock.reset()
        self.getSizesUseCaseMock.reset()
    }
}

// MARK: - Helpers

private extension SegmentedGaugeViewModel {

    func setup(stub: Stub) {
        self.setup(
            theme: stub.givenTheme,
            alignment: stub.givenAlignment,
            segments: stub.givenSegments,
            size: stub.givenSize,
            type: stub.givenType
        )
    }
}

private func expectNotCalled(
    on stub: Stub,
    getColorsUseCase: Bool = false,
    getLabelsStyleUseCase: Bool = false,
    getLayoutUseCase: Bool = false,
    getLevelsUseCase: Bool = false,
    getSegmentBorderUseCase: Bool = false,
    getSizesUseCase: Bool = false,
    sourceLocation: Testing.SourceLocation = #_sourceLocation
) {
    SegmentedGaugeGetColorsUseCaseableMockTest.expectCalled(
        stub.getColorsUseCaseMock,
        executeWithThemeAndTypeAndSegmentsCalled: !getColorsUseCase,
        sourceLocation: sourceLocation
    )

    SegmentedGaugeGetLabelsStyleUseCaseableMockTest.expectCalled(
        stub.getLabelsStyleUseCaseMock,
        executeWithThemeCalled: !getLabelsStyleUseCase,
        sourceLocation: sourceLocation
    )

    SegmentedGaugeGetLayoutUseCaseableMockTest.expectCalled(
        stub.getLayoutUseCaseMock,
        executeWithThemeAndAlignmentCalled: !getLayoutUseCase,
        sourceLocation: sourceLocation
    )

    SegmentedGaugeGetLevelsUseCaseableMockTest.expectCalled(
        stub.getLevelsUseCaseMock,
        executeWithSegmentsAndTypeCalled: !getLevelsUseCase,
        sourceLocation: sourceLocation
    )

    SegmentedGaugeGetSegmentBorderUseCaseableMockTest.expectCalled(
        stub.getSegmentBorderUseCaseMock,
        executeWithThemeCalled: !getSegmentBorderUseCase,
        sourceLocation: sourceLocation
    )

    SegmentedGaugeGetSizesUseCaseableMockTest.expectCalled(
        stub.getSizesUseCaseMock,
        executeWithSizeCalled: !getSizesUseCase,
        sourceLocation: sourceLocation
    )
}

private func expectEqualToExpected(
    on stub: Stub,
    otherColors: SegmentedGaugeColors? = nil,
    otherLabelsStyle: SegmentedGaugeLabelsStyle? = nil,
    otherLayout: SegmentedGaugeLayout? = nil,
    otherLevels: SegmentedGaugeLevels? = nil,
    otherSegmentBorder: SegmentedGaugeSegmentBorder? = nil,
    otherSizes: SegmentedGaugeSizes? = nil,
    sourceLocation: Testing.SourceLocation = #_sourceLocation
) {
    let viewModel = stub.viewModel

    #expect(
        viewModel.colors == otherColors ?? stub.expectedColors,
        "Wrong colors value",
        sourceLocation: sourceLocation
    )
    #expect(
        viewModel.labelsStyle == otherLabelsStyle ?? stub.expectedLabelsStyle,
        "Wrong labelsStyle value",
        sourceLocation: sourceLocation
    )
    #expect(
        viewModel.layout == otherLayout ?? stub.expectedLayout,
        "Wrong layout value",
        sourceLocation: sourceLocation
    )
    #expect(
        viewModel.levels == otherLevels ?? stub.expectedLevels,
        "Wrong levels value",
        sourceLocation: sourceLocation
    )
    #expect(
        viewModel.segmentBorder == otherSegmentBorder ?? stub.expectedSegmentBorder,
        "Wrong segmentBorder value",
        sourceLocation: sourceLocation
    )
    #expect(
        viewModel.sizes == otherSizes ?? stub.expectedSizes,
        "Wrong sizes value",
        sourceLocation: sourceLocation
    )
}
