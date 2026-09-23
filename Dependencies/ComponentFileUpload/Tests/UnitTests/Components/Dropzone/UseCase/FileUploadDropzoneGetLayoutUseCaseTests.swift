//
//  FileUploadDropzoneGetLayoutUseCaseTests.swift
//  SparkComponentFileUploadTests
//
//  Created by robin.lemaire on 02/04/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentFileUpload
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting
import Testing

@Suite("FileUploadDropzone Get Layout Use Case Tests")
struct FileUploadDropzoneGetLayoutUseCaseTests {

    // MARK: - Properties

    let sut: FileUploadDropzoneGetLayoutUseCase
    let theme: ThemeGeneratedMock

    // MARK: - Initialization

    init() {
        self.theme = .mocked()
        self.sut = FileUploadDropzoneGetLayoutUseCase()
    }

    // MARK: - Tests

    @Test("Vertical spacing is large")
    func verticalSpacingIsLarge() {
        // GIVEN / WHEN
        let layout = self.sut.execute(theme: self.theme)

        // THEN
        #expect(layout.verticalSpacing == self.theme.layout.spacing.large)
    }

    @Test("Sub vertical spacing is medium")
    func subVerticalSpacingIsMedium() {
        // GIVEN / WHEN
        let layout = self.sut.execute(theme: self.theme)

        // THEN
        #expect(layout.subVerticalSpacing == self.theme.layout.spacing.medium)
    }

    @Test("Padding is large")
    func paddingIsLarge() {
        // GIVEN / WHEN
        let layout = self.sut.execute(theme: self.theme)

        // THEN
        #expect(layout.padding == self.theme.layout.spacing.large)
    }
}
