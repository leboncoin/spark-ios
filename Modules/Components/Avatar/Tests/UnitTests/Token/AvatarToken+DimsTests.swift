//
//  AvatarToken+DimsTests.swift
//  SparkComponentAvatarTests
//
//  Created by Robin Lemaire on 23/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
import Foundation
@testable import SparkComponentAvatar
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

// MARK: - Tests

struct AvatarTokenDimsTests {

    // MARK: - Properties

    private let theme = ThemeGeneratedMock.mocked()

    private var token: AvatarToken.Dims {
        return .init(theme: self.theme)
    }

    // MARK: - Tests

    @Test
    func opacityWhenEnabledShouldReturnDimNone() {
        // GIVEN / WHEN
        let result = self.token.opacity(isEnabled: true)

        // THEN
        #expect(result == self.theme.dims.none)
    }

    @Test
    func opacityWhenDisabledShouldReturnDim3() {
        // GIVEN / WHEN
        let result = self.token.opacity(isEnabled: false)

        // THEN
        #expect(result == self.theme.dims.dim3)
    }

    // MARK: - Equatable Tests

    @Test
    func equatableWithSameThemeShouldReturnTrue() {
        // GIVEN
        let lhs = AvatarToken.Dims(theme: self.theme)
        let rhs = AvatarToken.Dims(theme: self.theme)

        // WHEN / THEN
        #expect(lhs == rhs)
    }

    @Test
    func equatableWithDifferentThemeShouldReturnFalse() {
        // GIVEN
        let lhs = AvatarToken.Dims(theme: self.theme)
        let rhs = AvatarToken.Dims(theme: ThemeGeneratedMock.mocked2())

        // WHEN / THEN
        #expect(lhs != rhs)
    }
}
