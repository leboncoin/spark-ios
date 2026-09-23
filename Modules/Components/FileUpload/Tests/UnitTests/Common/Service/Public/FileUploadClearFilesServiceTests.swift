//
//  FileUploadClearFilesServiceTests.swift
//  SparkComponentFileUploadTests
//
//  Created by robin.lemaire on 04/05/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentFileUpload
@_spi(SI_SPI) @testable import SparkComponentFileUploadTesting
import Testing
import Foundation

@Suite("FileUpload Clear Temporary Service Tests", .serialized)
class FileUploadClearFilesServiceTests {

    // MARK: - Properties

    let sut: FileUploadClearFilesService
    let fileManager: FileManager

    // MARK: - Initialization

    init() {
        self.fileManager = .default
        self.sut = FileUploadClearFilesService(fileManager: self.fileManager)
    }

    deinit {
        // Clean up any remaining test files
        self.cleanupTemporaryFiles()
    }

    // MARK: - Tests

    @Test("Execute clears temporary files successfully")
    func executeClearsTemporaryFilesSuccessfully() throws {
        // GIVEN
        let temporaryDirectory = fileManager.temporaryDirectory

        // Create temporary test files
        let testFile1URL = temporaryDirectory.appendingPathComponent("test_file_1.txt")
        let testFile2URL = temporaryDirectory.appendingPathComponent("test_file_2.jpg")

        let testData = "Test content".data(using: .utf8) ?? Data()
        try testData.write(to: testFile1URL)
        try testData.write(to: testFile2URL)

        let fileUploads: [FileUpload] = [
            .mock(
                id: "1",
                name: "test_file_1.txt",
                source: .files,
                url: testFile1URL,
                data: testData,
                fileExtension: "txt",
                size: Double(testData.count)
            ),
            .mock(
                id: "2",
                name: "test_file_2.jpg",
                source: .camera,
                url: testFile2URL,
                data: testData,
                fileExtension: "jpg",
                size: Double(testData.count)
            )
        ]

        // Verify files exist before clearing
        #expect(fileManager.fileExists(atPath: testFile1URL.path))
        #expect(fileManager.fileExists(atPath: testFile2URL.path))

        // WHEN
        try sut.execute(fileUploads: fileUploads)

        // THEN
        #expect(!fileManager.fileExists(atPath: testFile1URL.path))
        #expect(!fileManager.fileExists(atPath: testFile2URL.path))
    }

    @Test("Execute ignores failed uploads")
    func executeIgnoresFailedUploads() throws {
        // GIVEN
        let temporaryDirectory = fileManager.temporaryDirectory
        let testFileURL = temporaryDirectory.appendingPathComponent("test_file_failed.txt")

        let testData = "Test content".data(using: .utf8) ?? Data()
        try testData.write(to: testFileURL)

        let failedUpload = FileUpload(
            id: "failed",
            name: "test_file_failed.txt",
            source: .files,
            error: .other(ErrorMock.value)
        )

        let fileUploads: [FileUpload] = [failedUpload]

        // Verify file exists before clearing
        #expect(fileManager.fileExists(atPath: testFileURL.path))

        // WHEN
        try sut.execute(fileUploads: fileUploads)

        // THEN - File should still exist since the upload failed
        #expect(fileManager.fileExists(atPath: testFileURL.path))

        // Cleanup
        try? fileManager.removeItem(at: testFileURL)
    }

    @Test("Execute ignores files not in temporary directory")
    func executeIgnoresFilesNotInTemporaryDirectory() throws {
        // GIVEN
        let nonTemporaryURL = URL.documentsDirectory.appendingPathComponent("non_temp_file.txt")

        let fileUploads: [FileUpload] = [
            .mock(
                id: "3",
                name: "non_temp_file.txt",
                source: .files,
                url: nonTemporaryURL,
                fileExtension: "txt"
            )
        ]

        // WHEN / THEN - Should not throw error
        try sut.execute(fileUploads: fileUploads)
    }

    @Test("Execute handles non-existent files gracefully")
    func executeHandlesNonExistentFilesGracefully() throws {
        // GIVEN
        let temporaryDirectory = fileManager.temporaryDirectory
        let nonExistentURL = temporaryDirectory.appendingPathComponent("non_existent_file.txt")

        let fileUploads: [FileUpload] = [
            .mock(
                id: "4",
                name: "non_existent_file.txt",
                source: .files,
                url: nonExistentURL,
                fileExtension: "txt"
            )
        ]

        // WHEN / THEN - Should not throw error
        try sut.execute(fileUploads: fileUploads)
    }

    @Test("Execute handles empty array")
    func executeHandlesEmptyArray() throws {
        // GIVEN
        let fileUploads: [FileUpload] = []

        // WHEN / THEN - Should not throw error
        try sut.execute(fileUploads: fileUploads)
    }

    @Test("Execute handles mixed uploads with successful and failed")
    func executeHandlesMixedUploads() throws {
        // GIVEN
        let temporaryDirectory = fileManager.temporaryDirectory
        let testFileURL = temporaryDirectory.appendingPathComponent("test_file_mixed.txt")

        let testData = "Test content".data(using: .utf8) ?? Data()
        try testData.write(to: testFileURL)

        let successUpload = FileUpload.mock(
            id: "5",
            name: "test_file_mixed.txt",
            source: .files,
            url: testFileURL,
            data: testData,
            fileExtension: "txt",
            size: Double(testData.count)
        )

        let failedUpload = FileUpload(
            id: "6",
            name: "failed_file.txt",
            source: .files,
            error: .other(ErrorMock.value)
        )

        let fileUploads: [FileUpload] = [successUpload, failedUpload]

        // Verify file exists before clearing
        #expect(fileManager.fileExists(atPath: testFileURL.path))

        // WHEN
        try sut.execute(fileUploads: fileUploads)

        // THEN - Only successful upload should be cleared
        #expect(!fileManager.fileExists(atPath: testFileURL.path))
    }

    @Test("Execute clears only temporary files among mixed locations")
    func executeClearsOnlyTemporaryFilesAmongMixedLocations() throws {
        // GIVEN
        let temporaryDirectory = fileManager.temporaryDirectory
        let tempFileURL = temporaryDirectory.appendingPathComponent("test_temp_file.txt")

        let testData = "Test content".data(using: .utf8) ?? Data()
        try testData.write(to: tempFileURL)

        let nonTempURL = URL.documentsDirectory.appendingPathComponent("non_temp_file.txt")

        let fileUploads: [FileUpload] = [
            .mock(
                id: "7",
                name: "test_temp_file.txt",
                source: .files,
                url: tempFileURL,
                data: testData,
                fileExtension: "txt",
                size: Double(testData.count)
            ),
            .mock(
                id: "8",
                name: "non_temp_file.txt",
                source: .files,
                url: nonTempURL,
                fileExtension: "txt"
            )
        ]

        // Verify temp file exists before clearing
        #expect(fileManager.fileExists(atPath: tempFileURL.path))

        // WHEN
        try sut.execute(fileUploads: fileUploads)

        // THEN - Only temp file should be cleared
        #expect(!fileManager.fileExists(atPath: tempFileURL.path))
    }

    // MARK: - Private Methods

    private func cleanupTemporaryFiles() {
        let temporaryDirectory = fileManager.temporaryDirectory
        let testFiles = [
            "test_file_1.txt",
            "test_file_2.jpg",
            "test_file_failed.txt",
            "test_file_mixed.txt",
            "test_temp_file.txt"
        ]

        for filename in testFiles {
            let fileURL = temporaryDirectory.appendingPathComponent(filename)
            try? fileManager.removeItem(at: fileURL)
        }
    }
}
