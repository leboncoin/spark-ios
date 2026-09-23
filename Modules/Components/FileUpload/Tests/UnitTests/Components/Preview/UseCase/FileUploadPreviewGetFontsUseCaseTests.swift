//
//  FileUploadPreviewGetFontsUseCaseTests.swift
//  SparkComponentFileUploadTests
//
//  Created by robin.lemaire on 24/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentFileUpload
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting
import Testing

@Suite("FileUploadPreview Get Fonts Use Case Tests")
struct FileUploadPreviewGetFontsUseCaseTests {

    // MARK: - Properties

    let sut: FileUploadPreviewGetFontsUseCase
    let theme: ThemeGeneratedMock

    // MARK: - Initialization

    init() {
        self.theme = .mocked()
        self.sut = FileUploadPreviewGetFontsUseCase()
    }

    // MARK: - Tests

    @Test("Name font token is caption")
    func nameFontTokenIsCaption() {
        // GIVEN / WHEN
        let fonts = self.sut.execute(theme: self.theme)

        // THEN
        #expect(fonts.nameFontToken.equals(self.theme.typography.caption))
    }

    @Test("Size font token is caption")
    func sizeFontTokenIsCaption() {
        // GIVEN / WHEN
        let fonts = self.sut.execute(theme: self.theme)

        // THEN
        #expect(fonts.sizeFontToken.equals(self.theme.typography.caption))
    }

    @Test("Error font token is caption")
    func errorFontTokenIsCaption() {
        // GIVEN / WHEN
        let fonts = self.sut.execute(theme: self.theme)

        // THEN
        #expect(fonts.errorFontToken.equals(self.theme.typography.caption))
    }
}
