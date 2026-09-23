//
//  FileUploadDropzoneFetchDroppedFilesServiceTests.swift
//  SparkComponentFileUploadTests
//
//  Created by robin.lemaire on 08/04/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentFileUpload
@_spi(SI_SPI) @testable import SparkComponentFileUploadTesting
import Testing
import Foundation

@Suite("FileUpload Dropzone Fetch Dropped Files UseCase Tests")
struct FileUploadDropzoneFetchDroppedFilesServiceTests {

    // MARK: - Properties

    let mockService: FileUploadConvertURLServicingMock
    let sut: FileUploadDropzoneFetchDroppedFilesService

    // MARK: - Initialization

    init() {
        self.mockService = FileUploadConvertURLServicingMock()
        self.sut = FileUploadDropzoneFetchDroppedFilesService(convertURLService: self.mockService)
    }

    // MARK: - Tests

    @Test("Execute with empty providers returns empty array")
    func executeWithEmptyProvidersReturnsEmptyArray() async {
        // GIVEN
        let providers: [NSItemProvider] = []
        let existingFiles: [FileUpload] = []

        // WHEN
        let result = await self.sut.execute(
            from: providers,
            existingFiles: existingFiles
        )

        // THEN
        #expect(result.isEmpty)
    }

    @Test("Execute with valid provider returns file")
    func executeWithValidProviderReturnsFile() async throws {
        // GIVEN
        let testURL = try URL.imageMock

        let provider = try #require(NSItemProvider(contentsOf: testURL))
        let providers = [provider]
        let existingFiles: [FileUpload] = []

        let resultMock = FileUpload.mock

        self.mockService.executeWithUrlReturnValue = resultMock

        // WHEN
        let result = await self.sut.execute(
            from: providers,
            existingFiles: existingFiles
        )

        // THEN
        #expect(result.count == 1)
        #expect(result.first == resultMock)
    }

    @Test("Execute skips files that already exist")
    func executeSkipsFilesThatAlreadyExist() async throws {
        // GIVEN
        let testURL = try URL.imageMock

        // Create existing file with same ID
        let existingFile = FileUpload.mock(url: testURL)
        let existingFiles = [existingFile]

        self.mockService.executeWithUrlReturnValue = existingFile

        let provider = try #require(NSItemProvider(contentsOf: testURL))
        let providers = [provider]

        // WHEN
        let result = await self.sut.execute(
            from: providers,
            existingFiles: existingFiles
        )

        // THEN
        #expect(result.isEmpty)
    }
}
