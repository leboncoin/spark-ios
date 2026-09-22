//
//  FileUploadButtonClearFilesServiceTests.swift
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

@Suite("FileUpload Button Clear Files Service Tests")
struct FileUploadButtonClearFilesServiceTests {

    // MARK: - Properties

    let sut: FileUploadButtonClearFilesService

    // MARK: - Initialization

    init() {
        self.sut = FileUploadButtonClearFilesService()
    }

    // MARK: - Tests

    @Test("Execute removes photo files not in selection")
    func executeRemovesPhotoFilesNotInSelection() {
        // GIVEN
        let file1Mock = FileUpload.mock(id: "id1", source: .photos)
        let file2Mock = FileUpload.mock(id: "id2", source: .photos)
        let file3Mock = FileUpload.mock(id: "id3", source: .photos)

        var files: [FileUpload] = [
            file1Mock,
            file2Mock,
            file3Mock
        ]

        let selection = [
            PhotosPickerItem(itemIdentifier: file1Mock.id),
            PhotosPickerItem(itemIdentifier: file2Mock.id),
            PhotosPickerItem(itemIdentifier: "photo1")
        ]

        // WHEN
        self.sut.execute(&files, photoSelection: selection)

        // THEN
        #expect(files.count == 2)
        #expect(files.first == file1Mock)
        #expect(files.last == file2Mock)
    }

    @Test("Execute keeps non-photo files")
    func executeKeepsNonPhotoFiles() {
        // GIVEN
        let file1Mock = FileUpload.mock(id: "2", source: .camera)
        let file2Mock = FileUpload.mock(id: "3", source: .camera)

        var files: [FileUpload] = [
            file1Mock,
            file2Mock
        ]

        let photoSelection: [PhotosPickerItem] = []

        // WHEN
        self.sut.execute(&files, photoSelection: photoSelection)

        // THEN
        #expect(files.count == 2)
        #expect(files.first == file1Mock)
        #expect(files.last == file2Mock)
    }

    @Test("Execute with empty selection removes all photo files")
    func executeWithEmptySelectionRemovesAllPhotoFiles() {
        // GIVEN
        let file1Mock = FileUpload.mock(id: "2", source: .photos)
        let file2Mock = FileUpload.mock(id: "3", source: .photos)

        var files: [FileUpload] = [
            file1Mock,
            file2Mock
        ]

        let photoSelection: [PhotosPickerItem] = []

        // WHEN
        self.sut.execute(&files, photoSelection: photoSelection)

        // THEN
        #expect(files.isEmpty)
    }

    @Test("Execute with all photos in selection keeps all photo files")
    func executeWithAllPhotosInSelectionKeepsAllPhotoFiles() {
        // GIVEN
        let file1Mock = FileUpload.mock(id: "2", source: .photos)
        let file2Mock = FileUpload.mock(id: "3", source: .photos)
        let file3Mock = FileUpload.mock(id: "4", source: .camera)

        var files: [FileUpload] = [
            file1Mock,
            file2Mock,
            file3Mock
        ]

        let photoSelection = [
            PhotosPickerItem(itemIdentifier: "2"),
            PhotosPickerItem(itemIdentifier: "3"),
            PhotosPickerItem(itemIdentifier: "4")
        ]

        // WHEN
        self.sut.execute(&files, photoSelection: photoSelection)

        // THEN
        #expect(files.count == 3)
        #expect(files[0] == file1Mock)
        #expect(files[1] == file2Mock)
        #expect(files[2] == file3Mock)
    }

    @Test("Execute with empty files array does nothing")
    func executeWithEmptyFilesArrayDoesNothing() {
        // GIVEN
        var files: [FileUpload] = []
        let photoSelection = [PhotosPickerItem(itemIdentifier: "photo1")]

        // WHEN
        self.sut.execute(&files, photoSelection: photoSelection)

        // THEN
        #expect(files.isEmpty)
    }
}
