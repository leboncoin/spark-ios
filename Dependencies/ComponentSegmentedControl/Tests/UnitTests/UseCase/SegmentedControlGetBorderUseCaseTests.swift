//
//  SegmentedControlGetBorderUseCaseTests.swift
//  SparkComponentSegmentedControlTests
//
//  Created by robin.lemaire on 24/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentSegmentedControl
@_spi(SI_SPI) @testable import SparkComponentSegmentedControlTesting
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting
import Testing
import Foundation

@Suite("SegmentedControl Get Border Use Case Tests")
struct SegmentedControlGetBorderUseCaseTests {

    // MARK: - Properties

    let sut: SegmentedControlGetBorderUseCase
    let theme: ThemeGeneratedMock
    let getLayoutUseCaseMock: SegmentedControlGetLayoutUseCaseableGeneratedMock
    let expectedLayout: SegmentedControlLayout

    // MARK: - Initialization

    init() {
        self.theme = .mocked()
        self.expectedLayout = SegmentedControlLayout(
            padding: 4.0,
            spacing: 4.0
        )

        let getLayoutUseCaseMock = SegmentedControlGetLayoutUseCaseableGeneratedMock()
        getLayoutUseCaseMock.executeWithThemeReturnValue = self.expectedLayout

        self.getLayoutUseCaseMock = getLayoutUseCaseMock
        self.sut = SegmentedControlGetBorderUseCase(getLayoutUseCase: getLayoutUseCaseMock)
    }

    // MARK: - Tests

    @Test("Execute returns correct border")
    func executeReturnsCorrectBorder() {
        // GIVEN
        let expectedRadius = SegmentedControlConstants.minHeight / 2

        // WHEN
        let border = self.sut.execute(theme: self.theme)

        // THEN
        #expect(border.radius == expectedRadius)
        #expect(border.width == self.theme.border.width.small)
        #expect(border.selectedItemRadius == expectedRadius - self.expectedLayout.padding)
        #expect(border.selectedItemWidth == self.theme.border.width.small)

        SegmentedControlGetLayoutUseCaseableMockTest.expect(
            self.getLayoutUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: self.theme,
            expectedReturnValue: self.expectedLayout
        )
    }
}
