//
//  FileUploadPreviewGetBorderUseCaseTests.swift
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

@Suite("FileUploadPreview Get Border Use Case Tests")
struct FileUploadPreviewGetBorderUseCaseTests {

    // MARK: - Properties

    let sut: FileUploadPreviewGetBorderUseCase
    let theme: ThemeGeneratedMock

    // MARK: - Initialization

    init() {
        self.theme = .mocked()
        self.sut = FileUploadPreviewGetBorderUseCase()
    }

    // MARK: - Tests

    @Test("Border radius is always medium")
    func borderRadiusIsAlwaysMedium() {
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
        let border = self.sut.execute(theme: self.theme, file: file)

        // THEN
        #expect(border.radius == self.theme.border.radius.medium)
    }

    @Test("Border width is small when result is success")
    func borderWidthIsSmallWhenResultIsSuccess() {
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
        let border = self.sut.execute(theme: self.theme, file: file)

        // THEN
        #expect(border.width == self.theme.border.width.small)
    }

    @Test("Border width is medium when result is failure")
    func borderWidthIsMediumWhenResultIsFailure() {
        // GIVEN
        let file = FileUpload(
            id: "test-id",
            name: "test.pdf",
            source: .files,
            error: .photoResourceNotFound
        )

        // WHEN
        let border = self.sut.execute(theme: self.theme, file: file)

        // THEN
        #expect(border.width == self.theme.border.width.medium)
    }

    @Test("Image radius is always medium")
    func imageRadiusIsAlwaysMedium() {
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
        let border = self.sut.execute(theme: self.theme, file: file)

        // THEN
        #expect(border.imageRadius == self.theme.border.width.medium)
    }
}
