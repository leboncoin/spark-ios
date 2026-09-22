//
//  FileUploadPreviewGetImageUseCaseTests.swift
//  SparkComponentFileUploadTests
//
//  Created by robin.lemaire on 24/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
@testable import SparkComponentFileUpload
@_spi(SI_SPI) @testable import SparkComponentFileUploadTesting
import Testing

@Suite("FileUploadPreview Get Image Use Case Tests")
struct FileUploadPreviewGetImageUseCaseTests {

    // MARK: - Properties

    let sut: FileUploadPreviewGetImageUseCase

    // MARK: - Initialization

    init() {
        self.sut = FileUploadPreviewGetImageUseCase()
    }

    // MARK: - Tests

    @Test("Image is error when result is failure")
    func imageIsErrorWhenResultIsFailure() {
        // GIVEN
        let file = FileUpload(
            id: "test-id",
            name: "test.pdf",
            source: .files,
            error: .photoResourceNotFound
        )

        // WHEN
        let image = self.sut.execute(file: file)

        // THEN
        #expect(image == .error)
    }

    @Test("Image is file when preview type is file")
    func imageIsFileWhenPreviewTypeIsFile() {
        // GIVEN
        let fileDetails = FileUploadDetails(
            url: URL(fileURLWithPath: "file:///test.txt"),
            data: .mock,
            fileExtension: "txt",
            size: 1024
        )
        let file = FileUpload(
            id: "test-id",
            name: "test.txt",
            source: .files,
            result: .success(fileDetails)
        )

        // WHEN
        let image = self.sut.execute(file: file)

        // THEN
        #expect(image == .file)
    }

    @Test("Image is image when preview type is image")
    func imageIsImageWhenPreviewTypeIsImage() {
        // GIVEN
        let fileDetails = FileUploadDetails(
            url: URL(fileURLWithPath: "file:///test.jpg"),
            data: .mock,
            fileExtension: "jpg",
            size: 2_048_000
        )
        let file = FileUpload(
            id: "test-id",
            name: "test.jpg",
            source: .files,
            result: .success(fileDetails)
        )

        // WHEN
        let image = self.sut.execute(file: file)

        // THEN
        #expect(image == .image)
    }

    @Test("Image is pdf when preview type is pdf")
    func imageIsPdfWhenPreviewTypeIsPdf() {
        // GIVEN
        let fileDetails = FileUploadDetails(
            url: URL(fileURLWithPath: "file:///test.pdf"),
            data: .mock,
            fileExtension: "pdf",
            size: 3_072_000
        )
        let file = FileUpload(
            id: "test-id",
            name: "test.pdf",
            source: .files,
            result: .success(fileDetails)
        )

        // WHEN
        let image = self.sut.execute(file: file)

        // THEN
        #expect(image == .pdf)
    }

    @Test("Image is video when preview type is video")
    func imageIsVideoWhenPreviewTypeIsVideo() {
        // GIVEN
        let fileDetails = FileUploadDetails(
            url: URL(fileURLWithPath: "file:///test.mp4"),
            data: .mock,
            fileExtension: "mp4",
            size: 10_485_760
        )
        let file = FileUpload(
            id: "test-id",
            name: "test.mp4",
            source: .files,
            result: .success(fileDetails)
        )

        // WHEN
        let image = self.sut.execute(file: file)

        // THEN
        #expect(image == .video)
    }
}
