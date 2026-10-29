//
//  EnvironmentTheme+FileUploadTokenTests.swift
//  SparkComponentFileUploadTests
//
//  Created by Robin Lemaire on 28/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
import Foundation
@testable import SparkComponentFileUpload
@testable import SparkCommon
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

// MARK: - Tests

struct EnvironmentThemeFileUploadTokenTests {

    // MARK: - Properties

    private let theme = ThemeGeneratedMock.mocked()

    // MARK: - Tests

    @Test("File upload should return file upload token")
    func fileUploadShouldReturnFileUploadToken() {
        #expect(EnvironmentTheme(value: self.theme).fileUpload == self.theme.component.fileUpload)
    }
}
