//
//  FileUpload+DropzoneInitExtensionTests.swift
//  SparkComponentFileUploadTests
//
//  Created by robin.lemaire on 24/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
@testable import SparkComponentFileUpload
@_spi(SI_SPI) @testable import SparkComponentFileUploadTesting
import Testing

@Suite("FileUpload Dropzone Init Extension Tests")
struct FileUploadDropzoneInitExtensionTests {

    // MARK: - Success Init Tests

    @Test("Init with name, fileExtension, size, and url creates success result")
    func initWithNameFileExtensionSizeAndUrlCreatesSuccessResult() {
        // GIVEN
        let name = "document.pdf"
        let fileExtension = "pdf"
        let size: Double = 2_048_000
        let url = URL(fileURLWithPath: "document.pdf")
        let data = Data.mock

        // WHEN
        let fileUpload = FileUpload(
            name: name,
            fileExtension: fileExtension,
            size: size,
            url: url,
            data: data
        )

        // THEN
        #expect(fileUpload.id == url.absoluteString)
        #expect(fileUpload.name == name)
        #expect(fileUpload.source == .drop)

        switch fileUpload.result {
        case .success(let details):
            #expect(details.url == url)
            #expect(details.data == data)
            #expect(details.fileExtension == fileExtension)
            #expect(details.size == size)
        case .failure:
            Issue.record("Expected success result, got failure")
        }
    }

    @Test("Init with success sets id to url absolute string")
    func initWithSuccessSetsIdToUrlAbsoluteString() {
        // GIVEN
        let url = URL(fileURLWithPath: "file.txt")

        // WHEN
        let fileUpload = FileUpload(
            name: "file.txt",
            fileExtension: "txt",
            size: 1024,
            url: url,
            data: .mock
        )

        // THEN
        #expect(fileUpload.id.contains("file.txt"))
    }

    @Test("Init with success sets source to drop")
    func initWithSuccessSetsSourceToDrop() {
        // GIVEN / WHEN
        let fileUpload = FileUpload(
            name: "image.jpg",
            fileExtension: "jpg",
            size: 500_000,
            url: URL(fileURLWithPath: "image.jpg"),
            data: .mock
        )

        // THEN
        #expect(fileUpload.source == .drop)
    }

    @Test("Init with success creates correct FileUploadDetails")
    func initWithSuccessCreatesCorrectFileUploadDetails() {
        // GIVEN
        let url = URL(fileURLWithPath: "video.mp4")
        let data = Data.mock
        let fileExtension = "mp4"
        let size: Double = 10_485_760

        // WHEN
        let fileUpload = FileUpload(
            name: "video.mp4",
            fileExtension: fileExtension,
            size: size,
            url: url,
            data: data
        )

        // THEN
        switch fileUpload.result {
        case .success(let details):
            #expect(details.url == url)
            #expect(details.data == data)
            #expect(details.fileExtension == fileExtension)
            #expect(details.size == size)
            #expect(details.previewType == .video)
            #expect(details.previewViewerType == .video)
        case .failure:
            Issue.record("Expected success result")
        }
    }

    @Test("Init with different file extensions creates appropriate preview types")
    func initWithDifferentFileExtensionsCreatesAppropriatePreviewTypes() {
        // GIVEN / WHEN
        let pdfFile = FileUpload(
            name: "doc.pdf",
            fileExtension: "pdf",
            size: 1024,
            url: URL(fileURLWithPath: "doc.pdf"),
            data: .mock
        )

        let imageFile = FileUpload(
            name: "photo.jpg",
            fileExtension: "jpg",
            size: 1024,
            url: URL(fileURLWithPath: "photo.jpg"),
            data: .mock
        )

        // THEN
        switch pdfFile.result {
        case .success(let details):
            #expect(details.previewType == .pdf)
        case .failure:
            Issue.record("Expected success result for PDF")
        }

        switch imageFile.result {
        case .success(let details):
            #expect(details.previewType == .image)
        case .failure:
            Issue.record("Expected success result for image")
        }
    }

    // MARK: - Failure Init Tests

    @Test("Init with url and error creates failure result")
    func initWithUrlAndErrorCreatesFailureResult() {
        // GIVEN
        let url = URL(fileURLWithPath: "failed.txt")
        let error = NSError(domain: "TestDomain", code: 123, userInfo: nil)

        // WHEN
        let fileUpload = FileUpload(url: url, error: error)

        // THEN
        #expect(fileUpload.id == url.absoluteString)
        #expect(fileUpload.name == url.absoluteString)
        #expect(fileUpload.source == .drop)

        switch fileUpload.result {
        case .success:
            Issue.record("Expected failure result, got success")
        case .failure(let failedError):
            if case .dropConversion(let wrappedError) = failedError {
                #expect(wrappedError as? NSError == error)
            } else {
                Issue.record("Expected dropConversion error type")
            }
        }
    }

    @Test("Init with error sets id to url absolute string")
    func initWithErrorSetsIdToUrlAbsoluteString() {
        // GIVEN
        let url = URL(fileURLWithPath: "file.txt")
        let error = NSError(domain: "Test", code: 1, userInfo: nil)

        // WHEN
        let fileUpload = FileUpload(url: url, error: error)

        // THEN
        #expect(fileUpload.id.contains("file.txt"))
    }

    @Test("Init with error sets name to url absolute string")
    func initWithErrorSetsNameToUrlAbsoluteString() {
        // GIVEN
        let url = URL(fileURLWithPath: "document.pdf")
        let error = NSError(domain: "Test", code: 1, userInfo: nil)

        // WHEN
        let fileUpload = FileUpload(url: url, error: error)

        // THEN
        #expect(fileUpload.name.contains("document.pdf"))
    }

    @Test("Init with error sets source to drop")
    func initWithErrorSetsSourceToDrop() {
        // GIVEN / WHEN
        let fileUpload = FileUpload(
            url: URL(fileURLWithPath: "error.txt"),
            error: NSError(domain: "Test", code: 1, userInfo: nil)
        )

        // THEN
        #expect(fileUpload.source == .drop)
    }

    @Test("Init with error wraps error in dropConversion")
    func initWithErrorWrapsErrorInDropConversion() {
        // GIVEN
        let originalError = NSError(
            domain: "OriginalDomain",
            code: 456,
            userInfo: [NSLocalizedDescriptionKey: "Original error"]
        )
        let url = URL(fileURLWithPath: "test.txt")

        // WHEN
        let fileUpload = FileUpload(url: url, error: originalError)

        // THEN
        switch fileUpload.result {
        case .success:
            Issue.record("Expected failure result")
        case .failure(let failedError):
            if case .dropConversion(let wrappedError) = failedError {
                let nsError = wrappedError as? NSError
                #expect(nsError?.domain == "OriginalDomain")
                #expect(nsError?.code == 456)
            } else {
                Issue.record("Expected dropConversion error type")
            }
        }
    }

    @Test("Init with different error types preserves error information")
    func initWithDifferentErrorTypesPreservesErrorInformation() {
        // GIVEN
        let customError = ErrorMock.value
        let url = URL(fileURLWithPath: "custom.txt")

        // WHEN
        let fileUpload = FileUpload(url: url, error: customError)

        // THEN
        switch fileUpload.result {
        case .success:
            Issue.record("Expected failure result")
        case .failure(let failedError):
            if case .dropConversion(let wrappedError) = failedError {
                let customErr = wrappedError as? ErrorMock
                #expect(customErr == .value)
            } else {
                Issue.record("Expected dropConversion error type")
            }
        }
    }
}
