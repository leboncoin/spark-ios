//
//  FileUploadPreviewGroupGetLayoutUseCaseTests.swift
//  SparkComponentFileUploadTests
//
//  Created by robin.lemaire on 24/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentFileUpload
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting
import Testing

@Suite("FileUploadPreviewGroup Get Layout Use Case Tests")
struct FileUploadPreviewGroupGetLayoutUseCaseTests {

    // MARK: - Properties

    let sut: FileUploadPreviewGroupGetLayoutUseCase
    let theme: ThemeGeneratedMock

    // MARK: - Initialization

    init() {
        self.theme = .mocked()
        self.sut = FileUploadPreviewGroupGetLayoutUseCase()
    }

    // MARK: - Tests

    @Test("Spacing is medium")
    func spacingIsMedium() {
        // GIVEN / WHEN
        let layout = self.sut.execute(theme: self.theme)

        // THEN
        #expect(layout.spacing == self.theme.layout.spacing.medium)
    }
}
