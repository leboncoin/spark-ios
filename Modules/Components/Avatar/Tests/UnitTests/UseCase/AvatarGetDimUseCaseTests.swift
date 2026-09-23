//
//  AvatarGetDimUseCaseTests.swift
//  SparkComponentAvatarTests
//
//  Created by robin.lemaire on 21/07/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentAvatar
@_spi(SI_SPI) import SparkThemingTesting
import Testing

@Suite("Avatar Get Dim Use Case Tests")
struct AvatarGetDimUseCaseTests {

    // MARK: - Properties

    let sut: AvatarGetDimUseCase

    let theme: ThemeGeneratedMock

    // MARK: - Initialization

    init() {
        self.theme = .mocked()
        self.sut = AvatarGetDimUseCase()
    }

    // MARK: - Tests

    @Test("Is enabled true")
    func isEnabledTrue() throws {
        // GIVEN / WHEN
        let dim = self.sut.execute(theme: self.theme, isEnabled: true)

        // THEN
        #expect(dim == self.theme.dims.none)
    }

    @Test("Is enabled false")
    func isEnabledFalse() throws {
        // GIVEN / WHEN
        let dim = self.sut.execute(theme: self.theme, isEnabled: false)

        // THEN
        #expect(dim == self.theme.dims.dim3)
    }
}
