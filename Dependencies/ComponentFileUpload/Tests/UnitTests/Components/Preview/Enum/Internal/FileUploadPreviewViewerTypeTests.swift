//
//  FileUploadPreviewViewerTypeTests.swift
//  SparkComponentFileUploadTests
//
//  Created by robin.lemaire on 24/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentFileUpload
import Testing

@Suite("FileUploadPreview ViewerType Tests")
struct FileUploadPreviewViewerTypeTests {

    // MARK: - Tests

    @Test("All cases contains expected cases")
    func allCasesContainsExpectedCases() {
        // GIVEN
        let expectedCases: [FileUploadPreviewViewerType] = [.image, .video, .pdf, .webview]

        // WHEN / THEN
        #expect(FileUploadPreviewViewerType.allCases.count == expectedCases.count)
        #expect(Set(FileUploadPreviewViewerType.allCases) == Set(expectedCases))
    }

    // MARK: - Initialization Tests

    @Test("Init with jpg extension returns image")
    func initWithJpgExtensionReturnsImage() {
        // GIVEN / WHEN
        let type = FileUploadPreviewViewerType(fileExtension: "jpg")

        // THEN
        #expect(type == .image)
    }

    @Test("Init with jpeg extension returns image")
    func initWithJpegExtensionReturnsImage() {
        // GIVEN / WHEN
        let type = FileUploadPreviewViewerType(fileExtension: "jpeg")

        // THEN
        #expect(type == .image)
    }

    @Test("Init with png extension returns image")
    func initWithPngExtensionReturnsImage() {
        // GIVEN / WHEN
        let type = FileUploadPreviewViewerType(fileExtension: "png")

        // THEN
        #expect(type == .image)
    }

    @Test("Init with tiff extension returns image")
    func initWithTiffExtensionReturnsImage() {
        // GIVEN / WHEN
        let type = FileUploadPreviewViewerType(fileExtension: "tiff")

        // THEN
        #expect(type == .image)
    }

    @Test("Init with heic extension returns image")
    func initWithHeicExtensionReturnsImage() {
        // GIVEN / WHEN
        let type = FileUploadPreviewViewerType(fileExtension: "heic")

        // THEN
        #expect(type == .image)
    }

    @Test("Init with raw extension returns image")
    func initWithRawExtensionReturnsImage() {
        // GIVEN / WHEN
        let type = FileUploadPreviewViewerType(fileExtension: "raw")

        // THEN
        #expect(type == .image)
    }

    @Test("Init with mp4 extension returns video")
    func initWithMp4ExtensionReturnsVideo() {
        // GIVEN / WHEN
        let type = FileUploadPreviewViewerType(fileExtension: "mp4")

        // THEN
        #expect(type == .video)
    }

    @Test("Init with m4v extension returns video")
    func initWithM4vExtensionReturnsVideo() {
        // GIVEN / WHEN
        let type = FileUploadPreviewViewerType(fileExtension: "m4v")

        // THEN
        #expect(type == .video)
    }

    @Test("Init with mov extension returns video")
    func initWithMovExtensionReturnsVideo() {
        // GIVEN / WHEN
        let type = FileUploadPreviewViewerType(fileExtension: "mov")

        // THEN
        #expect(type == .video)
    }

    @Test("Init with pdf extension returns pdf")
    func initWithPdfExtensionReturnsPdf() {
        // GIVEN / WHEN
        let type = FileUploadPreviewViewerType(fileExtension: "pdf")

        // THEN
        #expect(type == .pdf)
    }

    @Test("Init with unknown extension returns webview")
    func initWithUnknownExtensionReturnsWebview() {
        // GIVEN / WHEN
        let type = FileUploadPreviewViewerType(fileExtension: "txt")

        // THEN
        #expect(type == .webview)
    }

    @Test("Init with doc extension returns webview")
    func initWithDocExtensionReturnsWebview() {
        // GIVEN / WHEN
        let type = FileUploadPreviewViewerType(fileExtension: "doc")

        // THEN
        #expect(type == .webview)
    }

    @Test("Init with html extension returns webview")
    func initWithHtmlExtensionReturnsWebview() {
        // GIVEN / WHEN
        let type = FileUploadPreviewViewerType(fileExtension: "html")

        // THEN
        #expect(type == .webview)
    }
}
