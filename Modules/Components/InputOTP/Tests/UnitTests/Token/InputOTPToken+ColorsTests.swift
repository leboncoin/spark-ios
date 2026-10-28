//
//  InputOTPToken+ColorsTests.swift
//  SparkComponentInputOTPTests
//
//  Created by Robin Lemaire on 28/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
import Foundation
@testable import SparkComponentInputOTP
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

// MARK: - Tests

struct InputOTPTokenColorsTests {

    // MARK: - Properties

    private let theme = ThemeGeneratedMock.mocked()

    private var token: InputOTPToken.Colors {
        return .init(theme: self.theme)
    }

    // MARK: - Tests

    @Test
    func separatorShouldReturnOutline() {
        #expect(self.token.separator.equals(self.theme.colors.base.outline))
    }

    @Test
    func slotContentWhenErrorShouldReturnOnSurface() {
        let result = self.token.slotContent(value: nil, onError: true, isFocus: false)
        #expect(result.equals(self.theme.colors.base.onSurface))
    }

    @Test
    func slotContentWhenFocusShouldReturnOnSurface() {
        let result = self.token.slotContent(value: nil, onError: false, isFocus: true)
        #expect(result.equals(self.theme.colors.base.onSurface))
    }

    @Test
    func slotContentWithValueShouldReturnOnSurface() {
        let result = self.token.slotContent(value: "1", onError: false, isFocus: false)
        #expect(result.equals(self.theme.colors.base.onSurface))
    }

    @Test(arguments: [nil, ""] as [String?])
    func slotContentWhenEmptyShouldReturnDimmedOnSurface(value: String?) {
        let result = self.token.slotContent(value: value, onError: false, isFocus: false)
        #expect(result.equals(self.theme.colors.base.onSurface.opacity(self.theme.dims.dim3)))
    }

    @Test
    func slotBorderWhenErrorShouldReturnError() {
        #expect(self.token.slotBorder(onError: true).equals(self.theme.colors.feedback.error))
    }

    @Test
    func slotBorderWhenNoErrorShouldReturnOutline() {
        #expect(self.token.slotBorder(onError: false).equals(self.theme.colors.base.outline))
    }

    @Test
    func slotBackgroundWhenErrorShouldReturnErrorContainer() {
        let result = self.token.slotBackground(value: "1", onError: true, isFocus: true)
        #expect(result.equals(self.theme.colors.feedback.errorContainer))
    }

    @Test
    func slotBackgroundWhenFocusShouldReturnSurface() {
        let result = self.token.slotBackground(value: "1", onError: false, isFocus: true)
        #expect(result.equals(self.theme.colors.base.surface))
    }

    @Test
    func slotBackgroundWithValueShouldReturnNeutralContainer() {
        let result = self.token.slotBackground(value: "1", onError: false, isFocus: false)
        #expect(result.equals(self.theme.colors.feedback.neutralContainer))
    }

    @Test(arguments: [nil, ""] as [String?])
    func slotBackgroundWhenEmptyShouldReturnSurface(value: String?) {
        let result = self.token.slotBackground(value: value, onError: false, isFocus: false)
        #expect(result.equals(self.theme.colors.base.surface))
    }

    // MARK: - Equatable Tests

    @Test
    func equatableWithSameThemeShouldReturnTrue() {
        #expect(InputOTPToken.Colors(theme: self.theme) == InputOTPToken.Colors(theme: self.theme))
    }

    @Test
    func equatableWithDifferentThemeShouldReturnFalse() {
        #expect(InputOTPToken.Colors(theme: self.theme) != InputOTPToken.Colors(theme: ThemeGeneratedMock.mocked2()))
    }
}
