//
//  FileUploadPreviewContentTests.swift
//  SparkComponentFileUploadTests
//
//  Created by robin.lemaire on 24/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentFileUpload
import Testing

@Suite("FileUploadPreview Content Tests")
struct FileUploadPreviewContentTests {

    // MARK: - Initialization Tests

    @Test("Default initialization")
    func defaultInitialization() {
        // GIVEN / WHEN
        let content = FileUploadPreviewContent()

        // THEN
        #expect(content.fileSize == nil)
        #expect(content.error == nil)
    }

    @Test("Init with file size")
    func initWithFileSize() {
        // GIVEN / WHEN
        let content = FileUploadPreviewContent(fileSize: "2.5 MB")

        // THEN
        #expect(content.fileSize == "2.5 MB")
        #expect(content.error == nil)
    }

    @Test("Init with error")
    func initWithError() {
        // GIVEN / WHEN
        let content = FileUploadPreviewContent(error: "Upload failed")

        // THEN
        #expect(content.fileSize == nil)
        #expect(content.error == "Upload failed")
    }

    // MARK: - Equality Tests

    @Test("Equality when both have nil values")
    func equalityWhenBothHaveNilValues() {
        // GIVEN / WHEN
        let content1 = FileUploadPreviewContent()
        let content2 = FileUploadPreviewContent()

        // THEN
        #expect(content1 == content2)
    }

    @Test("Equality when same file size")
    func equalityWhenSameFileSize() {
        // GIVEN / WHEN
        let content1 = FileUploadPreviewContent(fileSize: "2.5 MB")
        let content2 = FileUploadPreviewContent(fileSize: "2.5 MB")

        // THEN
        #expect(content1 == content2)
    }

    @Test("Equality when same error")
    func equalityWhenSameError() {
        // GIVEN / WHEN
        let content1 = FileUploadPreviewContent(error: "Upload failed")
        let content2 = FileUploadPreviewContent(error: "Upload failed")

        // THEN
        #expect(content1 == content2)
    }

    // MARK: - Inequality Tests

    @Test("Inequality when different file size")
    func inequalityWhenDifferentFileSize() {
        // GIVEN / WHEN
        let content1 = FileUploadPreviewContent(fileSize: "2.5 MB")
        let content2 = FileUploadPreviewContent(fileSize: "3.0 MB")

        // THEN
        #expect(content1 != content2)
    }

    @Test("Inequality when different error")
    func inequalityWhenDifferentError() {
        // GIVEN / WHEN
        let content1 = FileUploadPreviewContent(error: "Upload failed")
        let content2 = FileUploadPreviewContent(error: "Network error")

        // THEN
        #expect(content1 != content2)
    }

    @Test("Inequality when one has file size and other has nil")
    func inequalityWhenOneHasFileSizeAndOtherHasNil() {
        // GIVEN / WHEN
        let content1 = FileUploadPreviewContent(fileSize: "2.5 MB")
        let content2 = FileUploadPreviewContent()

        // THEN
        #expect(content1 != content2)
    }

    @Test("Inequality when one has error and other has nil")
    func inequalityWhenOneHasErrorAndOtherHasNil() {
        // GIVEN / WHEN
        let content1 = FileUploadPreviewContent(error: "Upload failed")
        let content2 = FileUploadPreviewContent()

        // THEN
        #expect(content1 != content2)
    }

    @Test("Inequality when one has file size and other has error")
    func inequalityWhenOneHasFileSizeAndOtherHasError() {
        // GIVEN / WHEN
        let content1 = FileUploadPreviewContent(fileSize: "2.5 MB")
        let content2 = FileUploadPreviewContent(error: "Upload failed")

        // THEN
        #expect(content1 != content2)
    }
}
