//
//  FileUploadPreviewGetColorsUseCaseTests.swift
//  SparkComponentFileUploadTests
//
//  Created by robin.lemaire on 24/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
@testable import SparkComponentFileUpload
@_spi(SI_SPI) @testable import SparkComponentFileUploadTesting
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting
import Testing

@Suite("FileUploadPreview Get Colors Use Case Tests")
struct FileUploadPreviewGetColorsUseCaseTests {

    // MARK: - Properties

    let sut: FileUploadPreviewGetColorsUseCase
    let theme: ThemeGeneratedMock

    // MARK: - Initialization

    init() {
        self.theme = .mocked()
        self.sut = FileUploadPreviewGetColorsUseCase()
    }

    // MARK: - Tests

    @Test("Background color token is base surface when not pressed")
    func backgroundColorTokenIsBaseSurfaceWhenNotPressed() {
        // GIVEN
        let fileDetails = FileUploadDetails(
            url: URL(fileURLWithPath: "file:///test.pdf"),
            data: .mock,
            fileExtension: "pdf",
            size: 2_048_000
        )
        let file = FileUpload(
            id: "test-id",
            name: "test.pdf",
            source: .files,
            result: .success(fileDetails)
        )

        // WHEN
        let colors = self.sut.execute(
            theme: self.theme,
            file: file,
            isPressed: false
        )

        // THEN
        #expect(colors.backgroundColorToken.equals(self.theme.colors.base.surface))
    }

    @Test("Background color token is states surfacePressed when pressed")
    func backgroundColorTokenIsStatesSurfacePressedWhenPressed() {
        // GIVEN
        let fileDetails = FileUploadDetails(
            url: URL(fileURLWithPath: "file:///test.pdf"),
            data: .mock,
            fileExtension: "pdf",
            size: 2_048_000
        )
        let file = FileUpload(
            id: "test-id",
            name: "test.pdf",
            source: .files,
            result: .success(fileDetails)
        )

        // WHEN
        let colors = self.sut.execute(
            theme: self.theme,
            file: file,
            isPressed: true
        )

        // THEN
        #expect(colors.backgroundColorToken.equals(self.theme.colors.states.surfacePressed))
    }

    @Test("Name text color token is always base onSurface")
    func nameTextColorTokenIsAlwaysBaseOnSurface() {
        // GIVEN
        let fileDetails = FileUploadDetails(
            url: URL(fileURLWithPath: "file:///test.pdf"),
            data: .mock,
            fileExtension: "pdf",
            size: 2_048_000
        )
        let file = FileUpload(
            id: "test-id",
            name: "test.pdf",
            source: .files,
            result: .success(fileDetails)
        )

        // WHEN
        let colors = self.sut.execute(
            theme: self.theme,
            file: file,
            isPressed: false
        )

        // THEN
        #expect(colors.nameTextColorToken.equals(self.theme.colors.base.onSurface))
    }

    @Test("Size text color token is always base onSurface with dim1")
    func sizeTextColorTokenIsAlwaysBaseOnSurfaceWithDim1() {
        // GIVEN
        let fileDetails = FileUploadDetails(
            url: URL(fileURLWithPath: "file:///test.pdf"),
            data: .mock,
            fileExtension: "pdf",
            size: 2_048_000
        )
        let file = FileUpload(
            id: "test-id",
            name: "test.pdf",
            source: .files,
            result: .success(fileDetails)
        )

        // WHEN
        let colors = self.sut.execute(
            theme: self.theme,
            file: file,
            isPressed: false
        )

        // THEN
        #expect(colors.sizeTextColorToken.equals(self.theme.colors.base.onSurface.opacity(self.theme.dims.dim1)))
    }

    @Test("Error text color token is always feedback error")
    func errorTextColorTokenIsAlwaysFeedbackError() {
        // GIVEN
        let fileDetails = FileUploadDetails(
            url: URL(fileURLWithPath: "file:///test.pdf"),
            data: .mock,
            fileExtension: "pdf",
            size: 2_048_000
        )
        let file = FileUpload(
            id: "test-id",
            name: "test.pdf",
            source: .files,
            result: .success(fileDetails)
        )

        // WHEN
        let colors = self.sut.execute(
            theme: self.theme,
            file: file,
            isPressed: false
        )

        // THEN
        #expect(colors.errorTextColorToken.equals(self.theme.colors.feedback.error))
    }

    @Test("Border color token is base outline when result is success")
    func borderColorTokenIsBaseOutlineWhenResultIsSuccess() {
        // GIVEN
        let fileDetails = FileUploadDetails(
            url: URL(fileURLWithPath: "file:///test.pdf"),
            data: .mock,
            fileExtension: "pdf",
            size: 2_048_000
        )
        let file = FileUpload(
            id: "test-id",
            name: "test.pdf",
            source: .files,
            result: .success(fileDetails)
        )

        // WHEN
        let colors = self.sut.execute(
            theme: self.theme,
            file: file,
            isPressed: false
        )

        // THEN
        #expect(colors.borderColorToken.equals(self.theme.colors.base.outline))
    }

    @Test("Image tint color token is feedback onNeutralContainer when result is success")
    func imageTintColorTokenIsFeedbackOnNeutralContainerWhenResultIsSuccess() {
        // GIVEN
        let fileDetails = FileUploadDetails(
            url: URL(fileURLWithPath: "file:///test.pdf"),
            data: .mock,
            fileExtension: "pdf",
            size: 2_048_000
        )
        let file = FileUpload(
            id: "test-id",
            name: "test.pdf",
            source: .files,
            result: .success(fileDetails)
        )

        // WHEN
        let colors = self.sut.execute(
            theme: self.theme,
            file: file,
            isPressed: false
        )

        // THEN
        #expect(colors.imageTintColorToken.equals(self.theme.colors.feedback.onNeutralContainer))
    }

    @Test("Image background color token is feedback neutralContainer when result is success")
    func imageBackgroundColorTokenIsFeedbackNeutralContainerWhenResultIsSuccess() {
        // GIVEN
        let fileDetails = FileUploadDetails(
            url: URL(fileURLWithPath: "file:///test.pdf"),
            data: .mock,
            fileExtension: "pdf",
            size: 2_048_000
        )
        let file = FileUpload(
            id: "test-id",
            name: "test.pdf",
            source: .files,
            result: .success(fileDetails)
        )

        // WHEN
        let colors = self.sut.execute(
            theme: self.theme,
            file: file,
            isPressed: false
        )

        // THEN
        #expect(colors.imageBackgroundColorToken.equals(self.theme.colors.feedback.neutralContainer))
    }

    @Test("Border color token is feedback error when result is failure")
    func borderColorTokenIsFeedbackErrorWhenResultIsFailure() {
        // GIVEN
        let file = FileUpload(
            id: "test-id",
            name: "test.pdf",
            source: .files,
            error: .photoResourceNotFound
        )

        // WHEN
        let colors = self.sut.execute(
            theme: self.theme,
            file: file,
            isPressed: false
        )

        // THEN
        #expect(colors.borderColorToken.equals(self.theme.colors.feedback.error))
    }

    @Test("Image tint color token is feedback onErrorContainer when result is failure")
    func imageTintColorTokenIsFeedbackOnErrorContainerWhenResultIsFailure() {
        // GIVEN
        let file = FileUpload(
            id: "test-id",
            name: "test.pdf",
            source: .files,
            error: .photoResourceNotFound
        )

        // WHEN
        let colors = self.sut.execute(
            theme: self.theme,
            file: file,
            isPressed: false
        )

        // THEN
        #expect(colors.imageTintColorToken.equals(self.theme.colors.feedback.onErrorContainer))
    }

    @Test("Image background color token is feedback errorContainer when result is failure")
    func imageBackgroundColorTokenIsFeedbackErrorContainerWhenResultIsFailure() {
        // GIVEN
        let file = FileUpload(
            id: "test-id",
            name: "test.pdf",
            source: .files,
            error: .photoResourceNotFound
        )

        // WHEN
        let colors = self.sut.execute(
            theme: self.theme,
            file: file,
            isPressed: false
        )

        // THEN
        #expect(colors.imageBackgroundColorToken.equals(self.theme.colors.feedback.errorContainer))
    }
}
