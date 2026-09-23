//
//  FileUploadButtonClearPhotosSelectionServiceTests.swift
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

@Suite("FileUpload Button Clear Photos Selection Service Tests")
struct FileUploadButtonClearPhotosSelectionServiceTests {

    // MARK: - Properties

    let sut: FileUploadButtonClearPhotosSelectionService

    // MARK: - Initialization

    init() {
        self.sut = FileUploadButtonClearPhotosSelectionService()
    }

    // MARK: - Tests

    @Test("Execute removes photos not in files")
    func executeRemovesPhotosNotInFiles() {
        // GIVEN
        let file1Mock = FileUpload.mock
        let file2Mock = FileUpload.mock2

        let files: [FileUpload] = [
            file1Mock,
            file2Mock
        ]

        var selection = [
            PhotosPickerItem(itemIdentifier: file1Mock.id),
            PhotosPickerItem(itemIdentifier: file2Mock.id),
            PhotosPickerItem(itemIdentifier: "photo3")
        ]

        // WHEN
        self.sut.execute(&selection, files: files)

        // THEN
        #expect(selection.count == 2)
        #expect(selection[0].itemIdentifier == file1Mock.id)
        #expect(selection[1].itemIdentifier == file2Mock.id)
    }

    @Test("Execute keeps photos that exist in files")
    func executeKeepsPhotosThatExistInFiles() {
        // GIVEN
        let file1Mock = FileUpload.mock
        let file2Mock = FileUpload.mock2

        let files: [FileUpload] = [
            file1Mock,
            file2Mock
        ]

        var selection = [
            PhotosPickerItem(itemIdentifier: file1Mock.id),
            PhotosPickerItem(itemIdentifier: file2Mock.id)
        ]

        // WHEN
        self.sut.execute(&selection, files: files)

        // THEN
        #expect(selection.count == 2)
        #expect(selection[0].itemIdentifier == file1Mock.id)
        #expect(selection[1].itemIdentifier == file2Mock.id)
    }

    @Test("Execute with empty files clears all selection")
    func executeWithEmptyFilesClearsAllSelection() {
        // GIVEN
        var selection = [
            PhotosPickerItem(itemIdentifier: "photo1"),
            PhotosPickerItem(itemIdentifier: "photo2"),
            PhotosPickerItem(itemIdentifier: "photo3")
        ]

        let files: [FileUpload] = []

        // WHEN
        self.sut.execute(&selection, files: files)

        // THEN
        #expect(selection.isEmpty)
    }

    @Test("Execute with empty selection does nothing")
    func executeWithEmptySelectionDoesNothing() {
        // GIVEN
        var selection: [PhotosPickerItem] = []

        let files: [FileUpload] = [
            FileUpload.mock
        ]

        // WHEN
        self.sut.execute(&selection, files: files)

        // THEN
        #expect(selection.isEmpty)
    }

    @Test("Execute preserves selection order")
    func executePreservesSelectionOrder() {
        // GIVEN
        let file1Mock = FileUpload.mock
        let file2Mock = FileUpload.mock2
        let file3Mock = FileUpload.mock()

        let files: [FileUpload] = [
            file1Mock,
            file2Mock,
            file3Mock
        ]

        var selection = [
            PhotosPickerItem(itemIdentifier: file1Mock.id),
            PhotosPickerItem(itemIdentifier: file2Mock.id),
            PhotosPickerItem(itemIdentifier: file3Mock.id)
        ]

        // WHEN
        self.sut.execute(&selection, files: files)

        // THEN
        #expect(selection.count == 3)
        #expect(selection[0].itemIdentifier == file1Mock.id)
        #expect(selection[1].itemIdentifier == file2Mock.id)
        #expect(selection[2].itemIdentifier == file3Mock.id)
    }

    @Test("Execute with single non-matching item")
    func executeWithSingleNonMatchingItem() {
        // GIVEN
        let file1Mock = FileUpload.mock

        var selection = [PhotosPickerItem(itemIdentifier: file1Mock.id)]

        let files: [FileUpload] = [
            .mock2
        ]

        // WHEN
        self.sut.execute(&selection, files: files)

        // THEN
        #expect(selection.isEmpty)
    }
}
