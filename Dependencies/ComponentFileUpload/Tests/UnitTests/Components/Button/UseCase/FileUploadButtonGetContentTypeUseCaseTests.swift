//
//  FileUploadButtonGetContentTypeUseCaseTests.swift
//  SparkComponentFileUploadTests
//
//  Created by robin.lemaire on 24/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
@testable import SparkComponentFileUpload
import PhotosUI
import UniformTypeIdentifiers
import Testing

@Suite("FileUploadButton Get ContentType Use Case Tests")
struct FileUploadButtonGetContentTypeUseCaseTests {

    // MARK: - Properties

    let sut: FileUploadButtonGetContentTypeUseCase

    // MARK: - Initialization

    init() {
        self.sut = FileUploadButtonGetContentTypeUseCase()
    }

    // MARK: - Tests

    @Test("Content type is all when both photoTypes and fileTypes are not empty")
    func contentTypeIsAllWhenBothPhotoTypesAndFileTypesAreNotEmpty() {
        // GIVEN
        let photoTypes: [PHPickerFilter] = [.images, .videos]
        let fileTypes: [UTType] = [.pdf, .text]

        // WHEN
        let contentType = self.sut.execute(
            photoTypes: photoTypes,
            fileTypes: fileTypes
        )

        // THEN
        #expect(contentType == .all)
    }

    @Test("Content type is files when photoTypes is empty and fileTypes is not empty")
    func contentTypeIsFilesWhenPhotoTypesIsEmptyAndFileTypesIsNotEmpty() {
        // GIVEN
        let photoTypes: [PHPickerFilter] = []
        let fileTypes: [UTType] = [.pdf, .text, .image]

        // WHEN
        let contentType = self.sut.execute(
            photoTypes: photoTypes,
            fileTypes: fileTypes
        )

        // THEN
        #expect(contentType == .files)
    }

    @Test("Content type is photos when photoTypes is not empty and fileTypes is empty")
    func contentTypeIsPhotosWhenPhotoTypesIsNotEmptyAndFileTypesIsEmpty() {
        // GIVEN
        let photoTypes: [PHPickerFilter] = [.images, .videos]
        let fileTypes: [UTType] = []

        // WHEN
        let contentType = self.sut.execute(
            photoTypes: photoTypes,
            fileTypes: fileTypes
        )

        // THEN
        #expect(contentType == .photos)
    }

    @Test("Content type is none when both photoTypes and fileTypes are empty")
    func contentTypeIsNoneWhenBothPhotoTypesAndFileTypesAreEmpty() {
        // GIVEN
        let photoTypes: [PHPickerFilter] = []
        let fileTypes: [UTType] = []

        // WHEN
        let contentType = self.sut.execute(
            photoTypes: photoTypes,
            fileTypes: fileTypes
        )

        // THEN
        #expect(contentType == .none)
    }

    // MARK: - Single Item Tests

    @Test("Content type is all when both arrays have single item")
    func contentTypeIsAllWhenBothArraysHaveSingleItem() {
        // GIVEN
        let photoTypes: [PHPickerFilter] = [.images]
        let fileTypes: [UTType] = [.pdf]

        // WHEN
        let contentType = self.sut.execute(
            photoTypes: photoTypes,
            fileTypes: fileTypes
        )

        // THEN
        #expect(contentType == .all)
    }

    @Test("Content type is files when only single file type provided")
    func contentTypeIsFilesWhenOnlySingleFileTypeProvided() {
        // GIVEN
        let photoTypes: [PHPickerFilter] = []
        let fileTypes: [UTType] = [.pdf]

        // WHEN
        let contentType = self.sut.execute(
            photoTypes: photoTypes,
            fileTypes: fileTypes
        )

        // THEN
        #expect(contentType == .files)
    }

    @Test("Content type is photos when only single photo type provided")
    func contentTypeIsPhotosWhenOnlySinglePhotoTypeProvided() {
        // GIVEN
        let photoTypes: [PHPickerFilter] = [.images]
        let fileTypes: [UTType] = []

        // WHEN
        let contentType = self.sut.execute(
            photoTypes: photoTypes,
            fileTypes: fileTypes
        )

        // THEN
        #expect(contentType == .photos)
    }
}
