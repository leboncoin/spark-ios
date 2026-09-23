//
//  FileUploadButtonFetchPhotosServiceTests.swift
//  SparkComponentFileUploadTests
//
//  Created by robin.lemaire on 08/04/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentFileUpload
@_spi(SI_SPI) @testable import SparkComponentFileUploadTesting
import Testing
import PhotosUI
import SwiftUI

@Suite("FileUpload Button Fetch Photos Service Tests")
struct FileUploadButtonFetchPhotosServiceTests {

    // MARK: - Properties

    let sut: FileUploadButtonFetchPhotosService

    // MARK: - Initialization

    init() {
        self.sut = FileUploadButtonFetchPhotosService()
    }

    // MARK: - Tests

    @Test("Execute with empty selection returns empty array")
    func executeWithEmptySelectionReturnsEmptyArray() async {
        // GIVEN
        let selection: [PhotosPickerItem] = []
        let files: [FileUpload] = []

        // WHEN
        let result = await self.sut.execute(
            from: selection,
            files: files
        )

        // THEN
        #expect(result.isEmpty)
    }

    @Test("Execute skips photos already in files")
    func executeSkipsPhotosAlreadyInFiles() async {
        // GIVEN
        let existingFile = FileUpload.mock
        let files = [existingFile]
        let selection = [PhotosPickerItem(itemIdentifier: existingFile.id)]

        // WHEN
        let result = await self.sut.execute(
            from: selection,
            files: files
        )

        // THEN
        #expect(result.isEmpty)
    }

    @Test("Execute returns files with photos source")
    func executeReturnsFilesWithPhotosSource() async throws {
        // GIVEN
        let selection = [PhotosPickerItem(itemIdentifier: "photo1")]
        let files: [FileUpload] = []

        // WHEN
        let result = await self.sut.execute(
            from: selection,
            files: files
        )

        // THEN
        #expect(result.count == 1)

        let file = try #require(result.first)
        #expect(file.id == "photo1")
        #expect(file.source == .photos)
    }

    @Test("Execute processes multiple photos")
    func executeProcessesMultiplePhotos() async {
        // GIVEN
        let selection = [
            PhotosPickerItem(itemIdentifier: "photo1"),
            PhotosPickerItem(itemIdentifier: "photo2"),
            PhotosPickerItem(itemIdentifier: "photo3")
        ]
        let files: [FileUpload] = []

        // WHEN
        let result = await self.sut.execute(
            from: selection,
            files: files
        )

        // THEN
        #expect(result.count == 3)

        let file = result[0]
        #expect(file.id == "photo1")
        #expect(file.source == .photos)

        let file2 = result[1]
        #expect(file2.id == "photo2")
        #expect(file2.source == .photos)

        let file3 = result[2]
        #expect(file3.id == "photo3")
        #expect(file3.source == .photos)
    }

    @Test("Execute filters out photos that are already in files list")
    func executeFiltersOutPhotosThatAreAlreadyInFilesList() async {
        // GIVEN
        let newId = "new_photo"

        let existingFile1 = FileUpload.mock
        let existingFile2 = FileUpload.mock2
        let files = [existingFile1, existingFile2]

        let selection = [
            PhotosPickerItem(itemIdentifier: existingFile1.id),
            PhotosPickerItem(itemIdentifier: newId),
            PhotosPickerItem(itemIdentifier: existingFile2.id)
        ]

        // WHEN
        let result = await self.sut.execute(
            from: selection,
            files: files
        )

        // THEN
        // Only the new photo should be in the result
        #expect(result.allSatisfy { $0.id == newId })
    }

    @Test("Execute returns empty array when all photos already exist")
    func executeReturnsEmptyArrayWhenAllPhotosAlreadyExist() async {
        // GIVEN
        let existingFile1 = FileUpload.mock
        let existingFile2 = FileUpload.mock2
        let files = [existingFile1, existingFile2]

        let selection = [
            PhotosPickerItem(itemIdentifier: existingFile1.id),
            PhotosPickerItem(itemIdentifier: existingFile2.id)
        ]

        // WHEN
        let result = await self.sut.execute(
            from: selection,
            files: files
        )

        // THEN
        #expect(result.isEmpty)
    }
}
