//
//  FileUploadPreviewGetLayoutUseCaseTests.swift
//  SparkComponentFileUploadTests
//
//  Created by robin.lemaire on 24/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentFileUpload
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting
import Testing

@Suite("FileUploadPreview Get Layout Use Case Tests")
struct FileUploadPreviewGetLayoutUseCaseTests {

    // MARK: - Properties

    let sut: FileUploadPreviewGetLayoutUseCase
    let theme: ThemeGeneratedMock

    // MARK: - Initialization

    init() {
        self.theme = .mocked()
        self.sut = FileUploadPreviewGetLayoutUseCase()
    }

    // MARK: - Tests

    @Test("Horizontal spacing is medium")
    func spacingIsMedium() {
        // GIVEN / WHEN
        let layout = self.sut.execute(theme: self.theme)

        // THEN
        #expect(layout.spacing == self.theme.layout.spacing.medium)
    }

    @Test("Horizontal padding is medium")
    func horizontalPaddingIsMedium() {
        // GIVEN / WHEN
        let layout = self.sut.execute(theme: self.theme)

        // THEN
        #expect(layout.horizontalPadding == self.theme.layout.spacing.medium)
    }

    @Test("Vertical padding is medium")
    func verticalPaddingIsMedium() {
        // GIVEN / WHEN
        let layout = self.sut.execute(theme: self.theme)

        // THEN
        #expect(layout.verticalPadding == self.theme.layout.spacing.medium)
    }
}
