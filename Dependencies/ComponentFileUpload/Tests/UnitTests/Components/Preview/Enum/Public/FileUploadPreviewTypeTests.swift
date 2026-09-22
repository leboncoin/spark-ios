//
//  FileUploadPreviewTypeTests.swift
//  SparkComponentFileUploadTests
//
//  Created by robin.lemaire on 24/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentFileUpload
import Testing

@Suite("FileUploadPreview Type Tests")
struct FileUploadPreviewTypeTests {

    // MARK: - Tests

    @Test("All cases contains expected cases")
    func allCasesContainsExpectedCases() {
        // GIVEN
        let expectedCases: [FileUploadPreviewType] = [.file, .image, .pdf, .video]

        // WHEN / THEN
        #expect(FileUploadPreviewType.allCases.count == expectedCases.count)
        #expect(Set(FileUploadPreviewType.allCases) == Set(expectedCases))
    }

    @Test("Default value is file")
    func defaultValueIsFile() {
        // GIVEN / WHEN / THEN
        #expect(FileUploadPreviewType.default == .file)
    }

    // MARK: - Initialization Tests

    @Test("Init with jpg extension returns image")
    func initWithJpgExtensionReturnsImage() {
        // GIVEN / WHEN
        let type = FileUploadPreviewType(fileExtension: "jpg")

        // THEN
        #expect(type == .image)
    }

    @Test("Init with jpeg extension returns image")
    func initWithJpegExtensionReturnsImage() {
        // GIVEN / WHEN
        let type = FileUploadPreviewType(fileExtension: "jpeg")

        // THEN
        #expect(type == .image)
    }

    @Test("Init with png extension returns image")
    func initWithPngExtensionReturnsImage() {
        // GIVEN / WHEN
        let type = FileUploadPreviewType(fileExtension: "png")

        // THEN
        #expect(type == .image)
    }

    @Test("Init with gif extension returns image")
    func initWithGifExtensionReturnsImage() {
        // GIVEN / WHEN
        let type = FileUploadPreviewType(fileExtension: "gif")

        // THEN
        #expect(type == .image)
    }

    @Test("Init with heic extension returns image")
    func initWithHeicExtensionReturnsImage() {
        // GIVEN / WHEN
        let type = FileUploadPreviewType(fileExtension: "heic")

        // THEN
        #expect(type == .image)
    }

    @Test("Init with pdf extension returns pdf")
    func initWithPdfExtensionReturnsPdf() {
        // GIVEN / WHEN
        let type = FileUploadPreviewType(fileExtension: "pdf")

        // THEN
        #expect(type == .pdf)
    }

    @Test("Init with mp4 extension returns video")
    func initWithMp4ExtensionReturnsVideo() {
        // GIVEN / WHEN
        let type = FileUploadPreviewType(fileExtension: "mp4")

        // THEN
        #expect(type == .video)
    }

    @Test("Init with mov extension returns video")
    func initWithMovExtensionReturnsVideo() {
        // GIVEN / WHEN
        let type = FileUploadPreviewType(fileExtension: "mov")

        // THEN
        #expect(type == .video)
    }

    @Test("Init with avi extension returns video")
    func initWithAviExtensionReturnsVideo() {
        // GIVEN / WHEN
        let type = FileUploadPreviewType(fileExtension: "avi")

        // THEN
        #expect(type == .video)
    }

    @Test("Init with unknown extension returns file")
    func initWithUnknownExtensionReturnsFile() {
        // GIVEN / WHEN
        let type = FileUploadPreviewType(fileExtension: "txt")

        // THEN
        #expect(type == .file)
    }

    @Test("Init with doc extension returns file")
    func initWithDocExtensionReturnsFile() {
        // GIVEN / WHEN
        let type = FileUploadPreviewType(fileExtension: "doc")

        // THEN
        #expect(type == .file)
    }
}
