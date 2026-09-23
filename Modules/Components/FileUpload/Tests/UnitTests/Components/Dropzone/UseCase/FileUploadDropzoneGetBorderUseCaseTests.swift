//
//  FileUploadDropzoneGetBorderUseCaseTests.swift
//  SparkComponentFileUploadTests
//
//  Created by robin.lemaire on 02/04/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentFileUpload
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting
import Testing

@Suite("FileUploadDropzone Get Border Use Case Tests")
struct FileUploadDropzoneGetBorderUseCaseTests {

    // MARK: - Properties

    let sut: FileUploadDropzoneGetBorderUseCase
    let theme: ThemeGeneratedMock

    // MARK: - Initialization

    init() {
        self.theme = .mocked()
        self.sut = FileUploadDropzoneGetBorderUseCase()
    }

    // MARK: - Tests

    @Test("Border radius is always large")
    func borderRadiusIsAlwaysLarge() {
        // GIVEN / WHEN
        let border = self.sut.execute(theme: self.theme)

        // THEN
        #expect(border.radius == self.theme.border.radius.large)
    }

    @Test("Border width is always small")
    func borderWidthIsAlwaysSmall() {
        // GIVEN / WHEN
        let border = self.sut.execute(theme: self.theme)

        // THEN
        #expect(border.width == self.theme.border.width.small)
    }
}
