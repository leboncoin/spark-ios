//
//  FileUploadConvertURLServiceTests.swift
//  SparkComponentFileUploadTests
//
//  Created by robin.lemaire on 08/04/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentFileUpload
@_spi(SI_SPI) @testable import SparkComponentFileUploadTesting
import Testing
import Foundation

@Suite("FileUpload Convert URL UseCase Tests", .serialized)
class FileUploadConvertURLServiceTests {

    // MARK: - Properties

    let sut: FileUploadConvertURLService

    // MARK: - Initialization

    init() {
        self.sut = FileUploadConvertURLService()
    }

    deinit {
        // Clear the temporary directory
        do {
            let testURL: URL = try .txt2Mock
            let filename = testURL.lastPathComponent
            let temporaryURL: URL = FileManager.default.temporaryDirectory.appendingPathComponent(filename)
            if FileManager.default.fileExists(atPath: temporaryURL.path) {
                try FileManager.default.removeItem(at: temporaryURL)
            }
        } catch {
        }
    }

    // MARK: - Tests

    @Test("Execute converts URL to FileUpload successfully")
    func executeConvertsURLToFileUploadSuccessfully() throws {
        // GIVEN
        let testURL: URL = try .txt2Mock

        let expectedFilename = testURL.lastPathComponent
        let expectedURL = FileManager.default.temporaryDirectory.appendingPathComponent(expectedFilename)

        // WHEN
        let result: FileUploadConvertibleMock = try self.sut.execute(from: testURL)

        // THEN
        let arguments = try #require(result.initWithNameAndFileExtensionAndSizeAndUrlAndDataReceivedArguments)
        #expect(arguments.name == expectedFilename)
        #expect(arguments.fileExtension == testURL.pathExtension)
        #expect(arguments.size > 0)
        #expect(arguments.url == expectedURL)
        #expect(!arguments.data.isEmpty)
    }

    @Test("Execute converts URL to FileUpload successfully even if file already exists")
    func executeConvertsURLToFileUploadSuccessfullyWhenFileAlreadyExists() throws {
        // GIVEN
        let firstURL: URL = try .txt2Mock
        let firstFilename = firstURL.lastPathComponent
        let temporaryURL: URL = FileManager.default.temporaryDirectory.appendingPathComponent(firstFilename)
        try FileManager.default.copyItem(at: firstURL, to: temporaryURL)

        let newURL: URL = try .txt2Mock

        let expectedFilename = newURL.lastPathComponent
        let expectedURL = FileManager.default.temporaryDirectory.appendingPathComponent(expectedFilename)

        // WHEN
        let result: FileUploadConvertibleMock = try self.sut.execute(from: newURL)

        // THEN
        let arguments = try #require(result.initWithNameAndFileExtensionAndSizeAndUrlAndDataReceivedArguments)
        #expect(arguments.name == expectedFilename)
        #expect(arguments.fileExtension == newURL.pathExtension)
        #expect(arguments.size > 0)
        #expect(arguments.url == expectedURL)
        #expect(!arguments.data.isEmpty)
    }

    @Test("Execute throws error for non-existent file")
    func executeThrowsErrorForNonExistentFile() throws {
        // GIVEN
        let nonExistentURL = URL(fileURLWithPath: "/tmp/non_existent_file_12345.txt")

        // WHEN / THEN
        #expect(throws: Error.self) {
            let _: FileUploadConvertibleMock = try self.sut.execute(from: nonExistentURL)
        }
    }
}
