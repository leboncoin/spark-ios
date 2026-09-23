//
//  FileUploadButtonFetchFilesServiceTests.swift
//  SparkComponentFileUploadTests
//
//  Created by robin.lemaire on 08/04/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentFileUpload
@_spi(SI_SPI) @testable import SparkComponentFileUploadTesting
import Testing
import Foundation

@Suite("FileUpload Button Fetch Files Service Tests")
struct FileUploadButtonFetchFilesServiceTests {

    // MARK: - Properties

    let mockService: FileUploadConvertURLServicingMock
    let sut: FileUploadButtonFetchFilesService

    // MARK: - Initialization

    init() {
        self.mockService = FileUploadConvertURLServicingMock()
        self.sut = FileUploadButtonFetchFilesService(convertURLService: self.mockService)
    }

    // MARK: Success Cases Tests

    @Test("Execute with success and empty URLs returns empty array")
    func executeWithSuccessAndEmptyURLsReturnsEmptyArray() {
        // GIVEN
        let files: [FileUpload] = []

        // WHEN
        let newFiles = self.sut.execute(
            from: .success([]),
            files: files
        )

        // THEN
        #expect(newFiles.isEmpty)
    }

    @Test("Execute with success skips files already in list")
    func executeWithSuccessSkipsFilesAlreadyInList() throws {
        // GIVEN
        let url: URL = try .txt2Mock
        let existingFile = FileUpload.mock(id: nil, url: url)
        let files = [existingFile]

        // WHEN
        let newFiles = self.sut.execute(
            from: .success([url]),
            files: files
        )

        // THEN
        #expect(newFiles.isEmpty)
    }

    @Test("Execute with success returns new files not in existing list")
    func executeWithSuccessReturnsNewFilesNotInExistingList() throws {
        // GIVEN
        let existingFile = FileUpload.mock
        let files = [existingFile]

        let testURL = try URL.imageMock

        self.mockService.executeWithUrlReturnValue = existingFile

        // WHEN
        let newFiles = self.sut.execute(
            from: .success([testURL]),
            files: files
        )

        // THEN
        #expect(newFiles.count == 1)
        #expect(newFiles.first == existingFile)
    }

    @Test("Execute with success processes multiple URLs")
    func executeWithSuccessProcessesMultipleURLs() throws {
        // GIVEN
        let files: [FileUpload] = []

        let testURL1 = try URL.imageMock
        let testURL2 = try URL.pdfMock

        self.mockService._executeWithUrl = { url in
            if url.absoluteString.contains(testURL1.lastPathComponent) {
                return FileUpload.mock
            } else if url.absoluteString.contains(testURL2.lastPathComponent) {
                return FileUpload.mock2
            } else {
                return nil
            }
        }

        // WHEN
        let newFiles = self.sut.execute(
            from: .success([testURL1, testURL2]),
            files: files
        )

        // THEN
        #expect(newFiles.count == 2)
        #expect(newFiles[0] == FileUpload.mock)
        #expect(newFiles[1] == FileUpload.mock2)
    }

    // MARK: Failure Cases Tests

    @Test("Execute with failure returns error file")
    func executeWithFailureReturnsErrorFile() throws {
        // GIVEN
        let files: [FileUpload] = []
        let errorMock = FileUploadError.photoResourceNotFound

        // WHEN
        let newFiles = self.sut.execute(
            from: .failure(errorMock),
            files: files
        )

        // THEN
        #expect(newFiles.count == 1)
        let file = try #require(newFiles.first)
        if case .failure(let error) = file.result {
            #expect(error == FileUploadError.other(errorMock))
        } else {
            Issue.record("Expected failure result")
        }
    }

    @Test("Execute with failure returns single error file regardless of existing files")
    func executeWithFailureReturnsSingleErrorFileRegardlessOfExistingFiles() throws {
        // GIVEN
        let existingFile = FileUpload.mock
        let files = [existingFile]
        let errorMock = FileUploadError.fileDataConversion(nil)

        // WHEN
        let newFiles = self.sut.execute(
            from: .failure(errorMock),
            files: files
        )

        // THEN
        #expect(newFiles.count == 1)
        let file = try #require(newFiles.first)
        if case .failure(let error) = file.result {
            #expect(error == FileUploadError.other(errorMock))
        } else {
            Issue.record("Expected failure result")
        }
    }
}
