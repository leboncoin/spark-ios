//
//  FileUploadToken+DropzoneColorsTests.swift
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

struct FileUploadTokenDropzoneColorsTests {

    // MARK: - Properties

    private let theme = ThemeGeneratedMock.mocked()

    private var token: FileUploadToken.Dropzone.Colors {
        return .init(theme: self.theme)
    }

    // MARK: - Tests

    @Test
    func borderShouldReturnOutline() {
        // GIVEN / WHEN
        let result = self.token.border

        // THEN
        #expect(result.equals(self.theme.colors.base.outline))
    }

    @Test
    func imageTintShouldReturnOnSurface() {
        // GIVEN / WHEN
        let result = self.token.imageTint

        // THEN
        #expect(result.equals(self.theme.colors.base.onSurface))
    }

    @Test
    func descriptionTextShouldReturnOnSurface() {
        // GIVEN / WHEN
        let result = self.token.descriptionText

        // THEN
        #expect(result.equals(self.theme.colors.base.onSurface))
    }

    @Test
    func additionalTextShouldReturnOnSurfaceDim1() {
        // GIVEN / WHEN
        let result = self.token.additionalText

        // THEN
        #expect(result.equals(self.theme.colors.base.onSurface.opacity(self.theme.dims.dim1)))
    }

    @Test
    func backgroundWhenTargetedShouldReturnSurfacePressed() {
        // GIVEN / WHEN
        let result = self.token.background(isTargeted: true)

        // THEN
        #expect(result.equals(self.theme.colors.states.surfacePressed))
    }

    @Test
    func backgroundWhenNotTargetedShouldReturnSurface() {
        // GIVEN / WHEN
        let result = self.token.background(isTargeted: false)

        // THEN
        #expect(result.equals(self.theme.colors.base.surface))
    }

    // MARK: - Equatable Tests

    @Test
    func equatableWithSameThemeShouldReturnTrue() {
        // GIVEN
        let lhs = FileUploadToken.Dropzone.Colors(theme: self.theme)
        let rhs = FileUploadToken.Dropzone.Colors(theme: self.theme)

        // WHEN / THEN
        #expect(lhs == rhs)
    }

    @Test
    func equatableWithDifferentThemeShouldReturnFalse() {
        // GIVEN
        let lhs = FileUploadToken.Dropzone.Colors(theme: self.theme)
        let rhs = FileUploadToken.Dropzone.Colors(theme: ThemeGeneratedMock.mocked2())

        // WHEN / THEN
        #expect(lhs != rhs)
    }
}
