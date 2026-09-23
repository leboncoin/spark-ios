//
//  InputOTPGetSlotBorderUseCaseTests.swift
//  SparkComponentInputOTPTests
//
//  Created by robin.lemaire on 04/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentInputOTP
@_spi(SI_SPI) import SparkThemingTesting
import Testing

@Suite("Input OTP Get Slot Border Use Case Tests")
struct InputOTPGetSlotBorderUseCaseTests {

    // MARK: - Properties

    let sut: InputOTPGetSlotBorderUseCase

    let theme: ThemeGeneratedMock

    // MARK: - Initialization

    init() {
        self.theme = .mocked()
        self.sut = InputOTPGetSlotBorderUseCase()
    }

    // MARK: - Tests

    @Test("On error returns medium width")
    func onErrorReturnsMediumWidth() throws {
        // GIVEN / WHEN
        let border = self.sut.execute(
            theme: self.theme,
            onError: true,
            isFocus: false
        )

        // THEN
        #expect(border.width == self.theme.border.width.medium)
        #expect(border.radius == self.theme.border.radius.medium)
    }

    @Test("Is focus returns medium width")
    func isFocusReturnsMediumWidth() throws {
        // GIVEN / WHEN
        let border = self.sut.execute(
            theme: self.theme,
            onError: false,
            isFocus: true
        )

        // THEN
        #expect(border.width == self.theme.border.width.medium)
        #expect(border.radius == self.theme.border.radius.medium)
    }

    @Test("Normal state returns small width")
    func normalStateReturnsSmallWidth() throws {
        // GIVEN / WHEN
        let border = self.sut.execute(
            theme: self.theme,
            onError: false,
            isFocus: false
        )

        // THEN
        #expect(border.width == self.theme.border.width.small)
        #expect(border.radius == self.theme.border.radius.medium)
    }

    @Test("On error takes priority over focus")
    func onErrorTakesPriorityOverFocus() throws {
        // GIVEN / WHEN
        let border = self.sut.execute(
            theme: self.theme,
            onError: true,
            isFocus: true
        )

        // THEN
        #expect(border.width == self.theme.border.width.medium)
        #expect(border.radius == self.theme.border.radius.medium)
    }
}
