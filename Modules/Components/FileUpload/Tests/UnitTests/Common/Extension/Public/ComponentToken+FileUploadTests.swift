//
//  ComponentToken+FileUploadTests.swift
//  SparkComponentFileUploadTests
//
//  Created by Robin Lemaire on 28/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
import Foundation
@testable import SparkComponentFileUpload
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

// MARK: - Tests

struct ComponentTokenFileUploadTests {

    // MARK: - Properties

    private let theme = ThemeGeneratedMock.mocked()

    // MARK: - Tests

    @Test
    func fileUploadShouldReturnTokenFromTheme() {
        #expect(ComponentToken(theme: self.theme).fileUpload == FileUploadToken(theme: self.theme))
    }

    @Test
    func fileUploadFromThemeComponentShouldReturnTokenFromTheme() {
        #expect(self.theme.component.fileUpload == FileUploadToken(theme: self.theme))
    }

    @Test
    func fileUploadWithDifferentThemeShouldNotReturnTokenFromTheme() {
        // GIVEN
        let componentToken = ComponentToken(theme: ThemeGeneratedMock.mocked2())

        // WHEN / THEN
        #expect(componentToken.fileUpload != FileUploadToken(theme: self.theme))
    }
}
