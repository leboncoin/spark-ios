//
//  FileUploadDropzoneGetColorsUseCaseTests.swift
//  SparkComponentFileUploadTests
//
//  Created by robin.lemaire on 02/04/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentFileUpload
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting
import Testing

@Suite("FileUploadDropzone Get Colors Use Case Tests")
struct FileUploadDropzoneGetColorsUseCaseTests {

    // MARK: - Properties

    let sut: FileUploadDropzoneGetColorsUseCase
    let theme: ThemeGeneratedMock

    // MARK: - Initialization

    init() {
        self.theme = .mocked()
        self.sut = FileUploadDropzoneGetColorsUseCase()
    }

    // MARK: - Tests

    @Test("Background color token is base surface when not targeted")
    func backgroundColorTokenIsBaseSurfaceWhenNotTargeted() {
        // GIVEN / WHEN
        let colors = self.sut.execute(theme: self.theme, isTargeted: false)

        // THEN
        #expect(colors.backgroundColorToken.equals(self.theme.colors.base.surface))
    }

    @Test("Background color token is states surfacePressed when targeted")
    func backgroundColorTokenIsStatesSurfacePressedWhenTargeted() {
        // GIVEN / WHEN
        let colors = self.sut.execute(theme: self.theme, isTargeted: true)

        // THEN
        #expect(colors.backgroundColorToken.equals(self.theme.colors.states.surfacePressed))
    }

    @Test("Border color token is always base outline")
    func borderColorTokenIsAlwaysBaseOutline() {
        // GIVEN / WHEN
        let colors = self.sut.execute(theme: self.theme, isTargeted: false)

        // THEN
        #expect(colors.borderColorToken.equals(self.theme.colors.base.outline))
    }

    @Test("Image tint color token is always base onSurface")
    func imageTintColorTokenIsAlwaysBaseOnSurface() {
        // GIVEN / WHEN
        let colors = self.sut.execute(theme: self.theme, isTargeted: false)

        // THEN
        #expect(colors.imageTintColorToken.equals(self.theme.colors.base.onSurface))
    }

    @Test("Description text color token is always base onSurface")
    func descriptionTextColorTokenIsAlwaysBaseOnSurface() {
        // GIVEN / WHEN
        let colors = self.sut.execute(theme: self.theme, isTargeted: false)

        // THEN
        #expect(colors.descriptionTextColorToken.equals(self.theme.colors.base.onSurface))
    }

    @Test("Additional text color token is always base onSurface with dim1")
    func additionalTextColorTokenIsAlwaysBaseOnSurfaceWithDim1() {
        // GIVEN / WHEN
        let colors = self.sut.execute(theme: self.theme, isTargeted: false)

        // THEN
        #expect(colors.additionalTextColorToken.equals(self.theme.colors.base.onSurface.opacity(self.theme.dims.dim1)))
    }
}
