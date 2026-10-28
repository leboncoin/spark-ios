//
//  FileUploadToken+PreviewColorsTests.swift
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

struct FileUploadTokenPreviewColorsTests {

    // MARK: - Properties

    private let theme = ThemeGeneratedMock.mocked()

    private var token: FileUploadToken.Preview.Colors {
        return .init(theme: self.theme)
    }

    // MARK: - Tests

    @Test
    func nameTextShouldReturnOnSurface() {
        // GIVEN / WHEN
        let result = self.token.nameText

        // THEN
        #expect(result.equals(self.theme.colors.base.onSurface))
    }

    @Test
    func sizeTextShouldReturnOnSurfaceDim1() {
        // GIVEN / WHEN
        let result = self.token.sizeText

        // THEN
        #expect(result.equals(self.theme.colors.base.onSurface.opacity(self.theme.dims.dim1)))
    }

    @Test
    func errorTextShouldReturnError() {
        // GIVEN / WHEN
        let result = self.token.errorText

        // THEN
        #expect(result.equals(self.theme.colors.feedback.error))
    }

    @Test
    func backgroundWhenPressedShouldReturnSurfacePressed() {
        // GIVEN / WHEN
        let result = self.token.background(isPressed: true)

        // THEN
        #expect(result.equals(self.theme.colors.states.surfacePressed))
    }

    @Test
    func backgroundWhenNotPressedShouldReturnSurface() {
        // GIVEN / WHEN
        let result = self.token.background(isPressed: false)

        // THEN
        #expect(result.equals(self.theme.colors.base.surface))
    }

    @Test
    func borderWhenSucceedShouldReturnOutline() {
        // GIVEN / WHEN
        let result = self.token.border(isSucceed: true)

        // THEN
        #expect(result.equals(self.theme.colors.base.outline))
    }

    @Test
    func borderWhenFailedShouldReturnError() {
        // GIVEN / WHEN
        let result = self.token.border(isSucceed: false)

        // THEN
        #expect(result.equals(self.theme.colors.feedback.error))
    }

    @Test
    func imageTintWhenSucceedShouldReturnOnNeutralContainer() {
        // GIVEN / WHEN
        let result = self.token.imageTint(isSucceed: true)

        // THEN
        #expect(result.equals(self.theme.colors.feedback.onNeutralContainer))
    }

    @Test
    func imageTintWhenFailedShouldReturnOnErrorContainer() {
        // GIVEN / WHEN
        let result = self.token.imageTint(isSucceed: false)

        // THEN
        #expect(result.equals(self.theme.colors.feedback.onErrorContainer))
    }

    @Test
    func imageBackgroundWhenSucceedShouldReturnNeutralContainer() {
        // GIVEN / WHEN
        let result = self.token.imageBackground(isSucceed: true)

        // THEN
        #expect(result.equals(self.theme.colors.feedback.neutralContainer))
    }

    @Test
    func imageBackgroundWhenFailedShouldReturnErrorContainer() {
        // GIVEN / WHEN
        let result = self.token.imageBackground(isSucceed: false)

        // THEN
        #expect(result.equals(self.theme.colors.feedback.errorContainer))
    }

    // MARK: - Equatable Tests

    @Test
    func equatableWithSameThemeShouldReturnTrue() {
        // GIVEN
        let lhs = FileUploadToken.Preview.Colors(theme: self.theme)
        let rhs = FileUploadToken.Preview.Colors(theme: self.theme)

        // WHEN / THEN
        #expect(lhs == rhs)
    }

    @Test
    func equatableWithDifferentThemeShouldReturnFalse() {
        // GIVEN
        let lhs = FileUploadToken.Preview.Colors(theme: self.theme)
        let rhs = FileUploadToken.Preview.Colors(theme: ThemeGeneratedMock.mocked2())

        // WHEN / THEN
        #expect(lhs != rhs)
    }
}
