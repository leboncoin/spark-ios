//
//  FileUploadDropzoneGetFontsUseCaseTests.swift
//  SparkComponentFileUploadTests
//
//  Created by robin.lemaire on 02/04/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentFileUpload
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting
import Testing

@Suite("FileUploadDropzone Get Fonts Use Case Tests")
struct FileUploadDropzoneGetFontsUseCaseTests {

    // MARK: - Properties

    let sut: FileUploadDropzoneGetFontsUseCase
    let theme: ThemeGeneratedMock

    // MARK: - Initialization

    init() {
        self.theme = .mocked()
        self.sut = FileUploadDropzoneGetFontsUseCase()
    }

    // MARK: - Tests

    @Test("Description font token is body1")
    func descriptionFontTokenIsBody1() {
        // GIVEN / WHEN
        let fonts = self.sut.execute(theme: self.theme)

        // THEN
        #expect(fonts.descriptionFontToken.equals(self.theme.typography.body1Highlight))
    }

    @Test("Additional text font token is caption")
    func additionalTextFontTokenIsCaption() {
        // GIVEN / WHEN
        let fonts = self.sut.execute(theme: self.theme)

        // THEN
        #expect(fonts.additionalTextFontToken.equals(self.theme.typography.caption))
    }
}
