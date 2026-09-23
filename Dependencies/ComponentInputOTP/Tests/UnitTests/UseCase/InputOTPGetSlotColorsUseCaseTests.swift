//
//  InputOTPGetSlotColorsUseCaseTests.swift
//  SparkComponentInputOTPTests
//
//  Created by robin.lemaire on 04/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
@testable import SparkComponentInputOTP
@_spi(SI_SPI) @testable import SparkComponentInputOTPTesting
@_spi(SI_SPI) import SparkThemingTesting
import Testing

@Suite("Input OTP Get Slot Colors Use Case Tests")
struct InputOTPGetSlotColorsUseCaseTests {

    // MARK: - Properties

    let sut: InputOTPGetSlotColorsUseCase
    let theme: ThemeGeneratedMock

    // MARK: - Initialization

    init() {
        self.theme = .mocked()
        self.sut = InputOTPGetSlotColorsUseCase()
    }

    // MARK: - Tests

    @Test("On error returns error colors")
    func onErrorReturnsErrorColors() throws {
        // GIVEN / WHEN
        let colors = self.sut.execute(
            theme: self.theme,
            value: nil,
            onError: true,
            isFocus: false
        )

        // THEN
        #expect(colors.contentColorToken.equals(self.theme.colors.base.onSurface))
        #expect(colors.borderColorToken.equals(self.theme.colors.feedback.error))
        #expect(colors.backgroundColorToken.equals(self.theme.colors.feedback.errorContainer))
    }

    @Test("Is focus returns focus colors")
    func isFocusReturnsFocusColors() throws {
        // GIVEN / WHEN
        let colors = self.sut.execute(
            theme: self.theme,
            value: nil,
            onError: false,
            isFocus: true
        )

        // THEN
        #expect(colors.contentColorToken.equals(self.theme.colors.base.onSurface))
        #expect(colors.borderColorToken.equals(self.theme.colors.base.outline))
        #expect(colors.backgroundColorToken.equals(self.theme.colors.base.surface))
    }

    @Test("Has value returns filled colors")
    func hasValueReturnsFilledColors() throws {
        // GIVEN / WHEN
        let colors = self.sut.execute(
            theme: self.theme,
            value: "5",
            onError: false,
            isFocus: false
        )

        // THEN
        #expect(colors.contentColorToken.equals(self.theme.colors.base.onSurface))
        #expect(colors.borderColorToken.equals(self.theme.colors.base.outline))
        #expect(colors.backgroundColorToken.equals(self.theme.colors.feedback.neutralContainer))
    }

    @Test("Empty value returns dimmed colors")
    func emptyValueReturnsDimmedColors() throws {
        // GIVEN / WHEN
        let colors = self.sut.execute(
            theme: self.theme,
            value: nil,
            onError: false,
            isFocus: false
        )

        // THEN
        #expect(colors.contentColorToken.equals(self.theme.colors.base.onSurface.opacity(self.theme.dims.dim3)))
        #expect(colors.borderColorToken.equals(self.theme.colors.base.outline))
        #expect(colors.backgroundColorToken.equals(self.theme.colors.base.surface))
    }

    @Test("On error takes priority over focus")
    func onErrorTakesPriorityOverFocus() throws {
        // GIVEN / WHEN
        let colors = self.sut.execute(
            theme: self.theme,
            value: nil,
            onError: true,
            isFocus: true
        )

        // THEN
        #expect(colors.contentColorToken.equals(self.theme.colors.base.onSurface))
        #expect(colors.borderColorToken.equals(self.theme.colors.feedback.error))
        #expect(colors.backgroundColorToken.equals(self.theme.colors.feedback.errorContainer))
    }

    @Test("On error takes priority over filled value")
    func onErrorTakesPriorityOverFilledValue() throws {
        // GIVEN / WHEN
        let colors = self.sut.execute(
            theme: self.theme,
            value: "5",
            onError: true,
            isFocus: false
        )

        // THEN
        #expect(colors.contentColorToken.equals(self.theme.colors.base.onSurface))
        #expect(colors.borderColorToken.equals(self.theme.colors.feedback.error))
        #expect(colors.backgroundColorToken.equals(self.theme.colors.feedback.errorContainer))
    }

    @Test("Focus takes priority over filled value")
    func focusTakesPriorityOverFilledValue() throws {
        // GIVEN / WHEN
        let colors = self.sut.execute(
            theme: self.theme,
            value: "5",
            onError: false,
            isFocus: true
        )

        // THEN
        #expect(colors.contentColorToken.equals(self.theme.colors.base.onSurface))
        #expect(colors.borderColorToken.equals(self.theme.colors.base.outline))
        #expect(colors.backgroundColorToken.equals(self.theme.colors.base.surface))
    }
}
