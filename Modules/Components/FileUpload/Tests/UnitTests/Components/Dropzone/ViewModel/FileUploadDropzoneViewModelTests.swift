//
//  FileUploadDropzoneViewModelTests.swift
//  SparkComponentFileUploadTests
//
//  Created by robin.lemaire on 24/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

@testable import SparkComponentFileUpload
@_spi(SI_SPI) @testable import SparkComponentFileUploadTesting
@_spi(SI_SPI) import SparkThemingTesting
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkCommonTesting
import Testing

@Suite("FileUploadDropzone ViewModel Tests")
struct FileUploadDropzoneViewModelTests {

    // MARK: - Initialization

    @Test("Initialization should use default values")
    func initializationShouldUseDefaultValues() {
        // GIVEN / WHEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // THEN
        #expect(viewModel.theme == nil)
        #expect(viewModel.isTargeted == false)

        expectEqualToExpected(
            on: stub,
            otherBorder: FileUploadDropzoneBorder(),
            otherColors: FileUploadDropzoneColors(),
            otherFonts: FileUploadDropzoneFonts(),
            otherLayout: FileUploadDropzoneLayout()
        )

        expectNotCalled(
            on: stub,
            getBorderUseCase: true,
            getColorsUseCase: true,
            getFontsUseCase: true,
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

        FileUploadDropzoneGetBorderUseCaseableMockTest.expect(
            stub.getBorderUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            expectedReturnValue: stub.expectedBorder
        )

        FileUploadDropzoneGetColorsUseCaseableMockTest.expect(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIsTargeted: false,
            expectedReturnValue: stub.expectedColors
        )

        FileUploadDropzoneGetFontsUseCaseableMockTest.expect(
            stub.getFontsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            expectedReturnValue: stub.expectedFonts
        )

        FileUploadDropzoneGetLayoutUseCaseableMockTest.expect(
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

        FileUploadDropzoneGetBorderUseCaseableMockTest.expect(
            stub.getBorderUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: newTheme,
            expectedReturnValue: stub.expectedBorder
        )

        FileUploadDropzoneGetColorsUseCaseableMockTest.expect(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: newTheme,
            givenIsTargeted: false,
            expectedReturnValue: stub.expectedColors
        )

        FileUploadDropzoneGetFontsUseCaseableMockTest.expect(
            stub.getFontsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: newTheme,
            expectedReturnValue: stub.expectedFonts
        )

        FileUploadDropzoneGetLayoutUseCaseableMockTest.expect(
            stub.getLayoutUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: newTheme,
            expectedReturnValue: stub.expectedLayout
        )
    }

    @Test("IsTargeted when changed should call colors use case")
    func isTargetedWhenChangedShouldCallColorsUseCase() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel
        viewModel.setup(stub: stub)

        stub.resetMockedData()

        // WHEN
        viewModel.isTargeted = true

        // THEN
        expectEqualToExpected(on: stub)

        FileUploadDropzoneGetColorsUseCaseableMockTest.expect(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIsTargeted: true,
            expectedReturnValue: stub.expectedColors
        )

        expectNotCalled(
            on: stub,
            getBorderUseCase: true,
            getFontsUseCase: true,
            getLayoutUseCase: true
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
        viewModel.isTargeted = true

        // THEN
        expectEqualToExpected(
            on: stub,
            otherBorder: FileUploadDropzoneBorder(),
            otherColors: FileUploadDropzoneColors(),
            otherFonts: FileUploadDropzoneFonts(),
            otherLayout: FileUploadDropzoneLayout()
        )

        expectNotCalled(
            on: stub,
            getBorderUseCase: true,
            getColorsUseCase: true,
            getFontsUseCase: true,
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
        viewModel.isTargeted = false

        // THEN
        expectEqualToExpected(on: stub)

        expectNotCalled(
            on: stub,
            getBorderUseCase: true,
            getColorsUseCase: true,
            getFontsUseCase: true,
            getLayoutUseCase: true
        )
    }

    @Test("Properties changed with nil theme should not call use cases")
    func propertiesChangedWithNilThemeShouldNotCallUseCases() {
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
            getBorderUseCase: true,
            getColorsUseCase: true,
            getFontsUseCase: true,
            getLayoutUseCase: true
        )
    }
}

// MARK: - Stub

private final class Stub {

    // MARK: - Properties

    let givenTheme = ThemeGeneratedMock.mocked()

    let expectedBorder = FileUploadDropzoneBorder(width: 1, radius: 2)
    let expectedColors = FileUploadDropzoneColors(
        backgroundColorToken: ColorTokenGeneratedMock.random(),
        borderColorToken: ColorTokenGeneratedMock.green(),
        imageTintColorToken: ColorTokenGeneratedMock.random(),
        descriptionTextColorToken: ColorTokenGeneratedMock.random(),
        additionalTextColorToken: ColorTokenGeneratedMock.random()
    )
    let expectedFonts = FileUploadDropzoneFonts(
        descriptionFontToken: TypographyFontTokenGeneratedMock.caption(),
        additionalTextFontToken: TypographyFontTokenGeneratedMock.callout()
    )
    let expectedLayout = FileUploadDropzoneLayout(
        verticalSpacing: 8.0,
        subVerticalSpacing: 16.0,
        padding: 12.0
    )

    // MARK: - Use Case Mocks

    let getBorderUseCaseMock: FileUploadDropzoneGetBorderUseCaseableGeneratedMock
    let getColorsUseCaseMock: FileUploadDropzoneGetColorsUseCaseableGeneratedMock
    let getFontsUseCaseMock: FileUploadDropzoneGetFontsUseCaseableGeneratedMock
    let getLayoutUseCaseMock: FileUploadDropzoneGetLayoutUseCaseableGeneratedMock

    // MARK: - ViewModel

    let viewModel: FileUploadDropzoneViewModel

    // MARK: - Initialization

    init() {
        let getBorderUseCaseMock = FileUploadDropzoneGetBorderUseCaseableGeneratedMock()
        getBorderUseCaseMock.executeWithThemeReturnValue = self.expectedBorder

        let getColorsUseCaseMock = FileUploadDropzoneGetColorsUseCaseableGeneratedMock()
        getColorsUseCaseMock.executeWithThemeAndIsTargetedReturnValue = self.expectedColors

        let getFontsUseCaseMock = FileUploadDropzoneGetFontsUseCaseableGeneratedMock()
        getFontsUseCaseMock.executeWithThemeReturnValue = self.expectedFonts

        let getLayoutUseCaseMock = FileUploadDropzoneGetLayoutUseCaseableGeneratedMock()
        getLayoutUseCaseMock.executeWithThemeReturnValue = self.expectedLayout

        self.viewModel = FileUploadDropzoneViewModel(
            getBorderUseCase: getBorderUseCaseMock,
            getColorsUseCase: getColorsUseCaseMock,
            getFontsUseCase: getFontsUseCaseMock,
            getLayoutUseCase: getLayoutUseCaseMock
        )

        self.getBorderUseCaseMock = getBorderUseCaseMock
        self.getColorsUseCaseMock = getColorsUseCaseMock
        self.getFontsUseCaseMock = getFontsUseCaseMock
        self.getLayoutUseCaseMock = getLayoutUseCaseMock
    }

    // MARK: - Methods

    func resetMockedData() {
        self.getBorderUseCaseMock.reset()
        self.getColorsUseCaseMock.reset()
        self.getFontsUseCaseMock.reset()
        self.getLayoutUseCaseMock.reset()
    }
}

// MARK: - Extension

private extension FileUploadDropzoneViewModel {

    func setup(stub: Stub) {
        self.setup(theme: stub.givenTheme)
    }
}

// MARK: - Expectations

private func expectNotCalled(
    on stub: Stub,
    getBorderUseCase: Bool = false,
    getColorsUseCase: Bool = false,
    getFontsUseCase: Bool = false,
    getLayoutUseCase: Bool = false,
    sourceLocation: Testing.SourceLocation = #_sourceLocation
) {
    FileUploadDropzoneGetBorderUseCaseableMockTest.expectCalled(
        stub.getBorderUseCaseMock,
        executeWithThemeCalled: !getBorderUseCase,
        sourceLocation: sourceLocation
    )

    FileUploadDropzoneGetColorsUseCaseableMockTest.expectCalled(
        stub.getColorsUseCaseMock,
        executeWithThemeAndIsTargetedCalled: !getColorsUseCase,
        sourceLocation: sourceLocation
    )

    FileUploadDropzoneGetFontsUseCaseableMockTest.expectCalled(
        stub.getFontsUseCaseMock,
        executeWithThemeCalled: !getFontsUseCase,
        sourceLocation: sourceLocation
    )

    FileUploadDropzoneGetLayoutUseCaseableMockTest.expectCalled(
        stub.getLayoutUseCaseMock,
        executeWithThemeCalled: !getLayoutUseCase,
        sourceLocation: sourceLocation
    )
}

private func expectEqualToExpected(
    on stub: Stub,
    otherBorder: FileUploadDropzoneBorder? = nil,
    otherColors: FileUploadDropzoneColors? = nil,
    otherFonts: FileUploadDropzoneFonts? = nil,
    otherLayout: FileUploadDropzoneLayout? = nil,
    sourceLocation: Testing.SourceLocation = #_sourceLocation
) {
    let viewModel = stub.viewModel

    let expectedBorder = otherBorder ?? stub.expectedBorder
    let expectedColors = otherColors ?? stub.expectedColors
    let expectedFonts = otherFonts ?? stub.expectedFonts
    let expectedLayout = otherLayout ?? stub.expectedLayout

    #expect(
        viewModel.border == expectedBorder,
        "Wrong border value",
        sourceLocation: sourceLocation
    )

    #expect(
        viewModel.colors == expectedColors,
        "Wrong colors value",
        sourceLocation: sourceLocation
    )

    #expect(
        viewModel.fonts == expectedFonts,
        "Wrong fonts value",
        sourceLocation: sourceLocation
    )

    #expect(
        viewModel.layout == expectedLayout,
        "Wrong layout value",
        sourceLocation: sourceLocation
    )
}
