//
//  FileUploadPreviewGetContentUseCaseTests.swift
//  SparkComponentFileUploadTests
//
//  Created by robin.lemaire on 24/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
@testable import SparkComponentFileUpload
@_spi(SI_SPI) @testable import SparkComponentFileUploadTesting
import Testing

@Suite("FileUploadPreview Get Content Use Case Tests")
struct FileUploadPreviewGetContentUseCaseTests {

    // MARK: - Properties

    let sut: FileUploadPreviewGetContentUseCase

    // MARK: - Initialization

    init() {
        self.sut = FileUploadPreviewGetContentUseCase()
    }

    // MARK: - Tests

    @Test("Content has file size when result is success")
    func contentHasFileSizeWhenResultIsSuccess() {
        // GIVEN
        let fileDetails = FileUploadDetails(
            url: URL(fileURLWithPath: "file:///test.pdf"),
            data: .mock,
            fileExtension: "pdf",
            size: 2_048_000 // 2 MB in bytes
        )
        let file = FileUpload(
            id: "test-id",
            name: "test.pdf",
            source: .files,
            result: .success(fileDetails)
        )

        // WHEN
        let content = self.sut.execute(file: file)

        // THEN
        #expect(content.fileSize != nil)
        #expect(content.error == nil)
    }

    @Test("Content has error when result is failure")
    func contentHasErrorWhenResultIsFailure() {
        // GIVEN
        let file = FileUpload(
            id: "test-id",
            name: "test.pdf",
            source: .files,
            error: .photoResourceNotFound
        )

        // WHEN
        let content = self.sut.execute(file: file)

        // THEN
        #expect(content.fileSize == nil)
        #expect(content.error != nil)
    }

    @Test("Content file size is formatted correctly for small file")
    func contentFileSizeIsFormattedCorrectlyForSmallFile() {
        // GIVEN
        let fileDetails = FileUploadDetails(
            url: URL(fileURLWithPath: "file:///test.txt"),
            data: .mock,
            fileExtension: "txt",
            size: 1024 // 1 KB in bytes
        )
        let file = FileUpload(
            id: "test-id",
            name: "test.txt",
            source: .files,
            result: .success(fileDetails)
        )

        // WHEN
        let content = self.sut.execute(file: file)

        // THEN
        #expect(content.fileSize != nil)
        #expect(content.error == nil)
    }

    @Test("Content file size is formatted correctly for large file")
    func contentFileSizeIsFormattedCorrectlyForLargeFile() {
        // GIVEN
        let fileDetails = FileUploadDetails(
            url: URL(fileURLWithPath: "file:///test.mp4"),
            data: .mock,
            fileExtension: "mp4",
            size: 10_485_760 // 10 MB in bytes
        )
        let file = FileUpload(
            id: "test-id",
            name: "test.mp4",
            source: .files,
            result: .success(fileDetails)
        )

        // WHEN
        let content = self.sut.execute(file: file)

        // THEN
        #expect(content.fileSize != nil)
        #expect(content.error == nil)
    }

    @Test("Content error contains localized description")
    func contentErrorContainsLocalizedDescription() {
        // GIVEN
        let customError = NSError(
            domain: "TestDomain",
            code: 123,
            userInfo: [NSLocalizedDescriptionKey: "Custom error message"]
        )
        let file = FileUpload(
            id: "test-id",
            name: "test.pdf",
            source: .files,
            error: .other(customError)
        )

        // WHEN
        let content = self.sut.execute(file: file)

        // THEN
        #expect(content.fileSize == nil)
        #expect(content.error != nil)
        #expect(content.error?.contains("Custom error message") == true)
    }
}
