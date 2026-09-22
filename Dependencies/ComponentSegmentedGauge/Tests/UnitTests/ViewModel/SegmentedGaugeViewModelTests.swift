//
//  SegmentedGaugeViewModelTests.swift
//  SparkComponentSegmentedGaugeUnitTests
//
//  Created by robin.lemaire on 30/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
import SwiftUI
import UIKit

@testable import SparkComponentSegmentedGauge
@_spi(SI_SPI) @testable import SparkComponentSegmentedGaugeTesting
@_spi(SI_SPI) import SparkThemingTesting

final class SegmentedGaugeViewModelTests: XCTestCase {

    // MARK: - Initialization

    func test_initialization_shouldUseDefaultValues() {
        // GIVEN / WHEN
        let stub = Stub()

        // THEN
        XCTAssertNil(stub.viewModel.theme)
        XCTAssertNil(stub.viewModel.alignment)
        XCTAssertNil(stub.viewModel.segments)
        XCTAssertNil(stub.viewModel.size)
        XCTAssertNil(stub.viewModel.type)

        XCTAssertEqualToExpected(
            on: stub,
            otherColors: SegmentedGaugeColors(),
            otherLabelsStyle: SegmentedGaugeLabelsStyle(),
            otherLayout: SegmentedGaugeLayout(),
            otherLevels: SegmentedGaugeLevels(),
            otherSegmentBorder: SegmentedGaugeSegmentBorder(),
            otherSizes: SegmentedGaugeSizes()
        )

        XCTAssertNotCalled(
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

    func test_setup_shouldCallAllUseCases() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // WHEN
        viewModel.setup(stub: stub)

        // THEN
        XCTAssertEqualToExpected(on: stub)

        SegmentedGaugeGetColorsUseCaseableMockTest.XCTAssert(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenType: stub.givenType,
            givenSegments: stub.givenSegments,
            expectedReturnValue: stub.expectedColors
        )

        SegmentedGaugeGetLabelsStyleUseCaseableMockTest.XCTAssert(
            stub.getLabelsStyleUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            expectedReturnValue: stub.expectedLabelsStyle
        )

        SegmentedGaugeGetLayoutUseCaseableMockTest.XCTAssert(
            stub.getLayoutUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenAlignment: stub.givenAlignment,
            expectedReturnValue: stub.expectedLayout
        )

        SegmentedGaugeGetLevelsUseCaseableMockTest.XCTAssert(
            stub.getLevelsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenSegments: stub.givenSegments,
            givenType: stub.givenType,
            expectedReturnValue: stub.expectedLevels
        )

        SegmentedGaugeGetSegmentBorderUseCaseableMockTest.XCTAssert(
            stub.getSegmentBorderUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            expectedReturnValue: stub.expectedSegmentBorder
        )

        SegmentedGaugeGetSizesUseCaseableMockTest.XCTAssert(
            stub.getSizesUseCaseMock,
            expectedNumberOfCalls: 1,
            givenSize: stub.givenSize,
            expectedReturnValue: stub.expectedSizes
        )
    }

    // MARK: - Property Changes

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
        XCTAssertEqualToExpected(on: stub)

        SegmentedGaugeGetColorsUseCaseableMockTest.XCTAssert(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: newTheme,
            givenType: stub.givenType,
            givenSegments: stub.givenSegments,
            expectedReturnValue: stub.expectedColors
        )

        SegmentedGaugeGetLabelsStyleUseCaseableMockTest.XCTAssert(
            stub.getLabelsStyleUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: newTheme,
            expectedReturnValue: stub.expectedLabelsStyle
        )

        SegmentedGaugeGetLayoutUseCaseableMockTest.XCTAssert(
            stub.getLayoutUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: newTheme,
            givenAlignment: stub.givenAlignment,
            expectedReturnValue: stub.expectedLayout
        )

        SegmentedGaugeGetSegmentBorderUseCaseableMockTest.XCTAssert(
            stub.getSegmentBorderUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: newTheme,
            expectedReturnValue: stub.expectedSegmentBorder
        )

        XCTAssertNotCalled(
            on: stub,
            getLevelsUseCase: true,
            getSizesUseCase: true
        )
    }

    func test_alignmentChanged_shouldUpdateLayoutOnly() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let newAlignment: SegmentedGaugeAlignment = .vertical

        // WHEN
        viewModel.alignment = newAlignment

        // THEN
        XCTAssertEqualToExpected(on: stub)

        SegmentedGaugeGetLayoutUseCaseableMockTest.XCTAssert(
            stub.getLayoutUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenAlignment: newAlignment,
            expectedReturnValue: stub.expectedLayout
        )

        XCTAssertNotCalled(
            on: stub,
            getColorsUseCase: true,
            getLabelsStyleUseCase: true,
            getLevelsUseCase: true,
            getSegmentBorderUseCase: true,
            getSizesUseCase: true
        )
    }

    func test_segmentsChanged_shouldUpdateLevelsOnly() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let newSegments: SegmentedGaugeSegments = .five

        // WHEN
        viewModel.segments = newSegments

        // THEN
        XCTAssertEqualToExpected(on: stub)

        SegmentedGaugeGetColorsUseCaseableMockTest.XCTAssert(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenType: stub.givenType,
            givenSegments: newSegments,
            expectedReturnValue: stub.expectedColors
        )

        SegmentedGaugeGetLevelsUseCaseableMockTest.XCTAssert(
            stub.getLevelsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenSegments: newSegments,
            givenType: stub.givenType,
            expectedReturnValue: stub.expectedLevels
        )

        XCTAssertNotCalled(
            on: stub,
            getLabelsStyleUseCase: true,
            getLayoutUseCase: true,
            getSegmentBorderUseCase: true,
            getSizesUseCase: true
        )
    }

    func test_sizeChanged_shouldUpdateSegmentSizeOnly() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let newSize: SegmentedGaugeSize = .medium

        // WHEN
        viewModel.size = newSize

        // THEN
        XCTAssertEqualToExpected(on: stub)

        SegmentedGaugeGetSizesUseCaseableMockTest.XCTAssert(
            stub.getSizesUseCaseMock,
            expectedNumberOfCalls: 1,
            givenSize: newSize,
            expectedReturnValue: stub.expectedSizes
        )

        XCTAssertNotCalled(
            on: stub,
            getColorsUseCase: true,
            getLabelsStyleUseCase: true,
            getLayoutUseCase: true,
            getLevelsUseCase: true,
            getSegmentBorderUseCase: true
        )
    }

    func test_typeChanged_shouldUpdateColorsAndLevels() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let newType: SegmentedGaugeType = .veryHigh

        // WHEN
        viewModel.type = newType

        // THEN
        XCTAssertEqualToExpected(on: stub)

        SegmentedGaugeGetColorsUseCaseableMockTest.XCTAssert(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenType: newType,
            givenSegments: stub.givenSegments,
            expectedReturnValue: stub.expectedColors
        )

        SegmentedGaugeGetLevelsUseCaseableMockTest.XCTAssert(
            stub.getLevelsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenSegments: stub.givenSegments,
            givenType: newType,
            expectedReturnValue: stub.expectedLevels
        )

        XCTAssertNotCalled(
            on: stub,
            getLabelsStyleUseCase: true,
            getLayoutUseCase: true,
            getSegmentBorderUseCase: true,
            getSizesUseCase: true
        )
    }

    func test_propertiesChanged_beforeSetup_shouldNotCallUseCases() {
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
        XCTAssertEqualToExpected(
            on: stub,
            otherColors: SegmentedGaugeColors(),
            otherLabelsStyle: SegmentedGaugeLabelsStyle(),
            otherLayout: SegmentedGaugeLayout(),
            otherLevels: SegmentedGaugeLevels(),
            otherSegmentBorder: SegmentedGaugeSegmentBorder(),
            otherSizes: SegmentedGaugeSizes()
        )

        XCTAssertNotCalled(
            on: stub,
            getColorsUseCase: true,
            getLabelsStyleUseCase: true,
            getLayoutUseCase: true,
            getLevelsUseCase: true,
            getSegmentBorderUseCase: true,
            getSizesUseCase: true
        )
    }

    func test_propertiesChanged_withoutValueChange_shouldNotCallUseCases() {
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
        XCTAssertEqualToExpected(on: stub)

        XCTAssertNotCalled(
            on: stub,
            getColorsUseCase: true,
            getLabelsStyleUseCase: true,
            getLayoutUseCase: true,
            getLevelsUseCase: true,
            getSegmentBorderUseCase: true,
            getSizesUseCase: true
        )
    }

    func test_propertiesChanged_for_nil_shouldNotCallUseCases() {
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
        XCTAssertEqualToExpected(on: stub)

        XCTAssertNotCalled(
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

private func XCTAssertNotCalled(
    on stub: Stub,
    getColorsUseCase: Bool = false,
    getLabelsStyleUseCase: Bool = false,
    getLayoutUseCase: Bool = false,
    getLevelsUseCase: Bool = false,
    getSegmentBorderUseCase: Bool = false,
    getSizesUseCase: Bool = false
) {
    SegmentedGaugeGetColorsUseCaseableMockTest.XCTCalled(
        stub.getColorsUseCaseMock,
        executeWithThemeAndTypeAndSegmentsCalled: !getColorsUseCase
    )

    SegmentedGaugeGetLabelsStyleUseCaseableMockTest.XCTCalled(
        stub.getLabelsStyleUseCaseMock,
        executeWithThemeCalled: !getLabelsStyleUseCase
    )

    SegmentedGaugeGetLayoutUseCaseableMockTest.XCTCalled(
        stub.getLayoutUseCaseMock,
        executeWithThemeAndAlignmentCalled: !getLayoutUseCase
    )

    SegmentedGaugeGetLevelsUseCaseableMockTest.XCTCalled(
        stub.getLevelsUseCaseMock,
        executeWithSegmentsAndTypeCalled: !getLevelsUseCase
    )

    SegmentedGaugeGetSegmentBorderUseCaseableMockTest.XCTCalled(
        stub.getSegmentBorderUseCaseMock,
        executeWithThemeCalled: !getSegmentBorderUseCase
    )

    SegmentedGaugeGetSizesUseCaseableMockTest.XCTCalled(
        stub.getSizesUseCaseMock,
        executeWithSizeCalled: !getSizesUseCase
    )
}

private func XCTAssertEqualToExpected(
    on stub: Stub,
    otherColors: SegmentedGaugeColors? = nil,
    otherLabelsStyle: SegmentedGaugeLabelsStyle? = nil,
    otherLayout: SegmentedGaugeLayout? = nil,
    otherLevels: SegmentedGaugeLevels? = nil,
    otherSegmentBorder: SegmentedGaugeSegmentBorder? = nil,
    otherSizes: SegmentedGaugeSizes? = nil
) {
    let viewModel = stub.viewModel

    XCTAssertEqual(
        viewModel.colors,
        otherColors ?? stub.expectedColors,
        "Wrong colors value"
    )
    XCTAssertEqual(
        viewModel.labelsStyle,
        otherLabelsStyle ?? stub.expectedLabelsStyle,
        "Wrong labelsStyle value"
    )
    XCTAssertEqual(
        viewModel.layout,
        otherLayout ?? stub.expectedLayout,
        "Wrong layout value"
    )
    XCTAssertEqual(
        viewModel.levels,
        otherLevels ?? stub.expectedLevels,
        "Wrong levels value"
    )
    XCTAssertEqual(
        viewModel.segmentBorder,
        otherSegmentBorder ?? stub.expectedSegmentBorder,
        "Wrong segmentBorder value"
    )
    XCTAssertEqual(
        viewModel.sizes,
        otherSizes ?? stub.expectedSizes,
        "Wrong sizes value"
    )
}
