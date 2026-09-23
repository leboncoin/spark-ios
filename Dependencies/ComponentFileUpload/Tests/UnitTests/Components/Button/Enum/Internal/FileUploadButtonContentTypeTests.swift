//
//  FileUploadButtonContentTypeTests.swift
//  SparkComponentFileUploadTests
//
//  Created by robin.lemaire on 24/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
@testable import SparkComponentFileUpload
import Testing

@Suite("FileUploadButton ContentType Tests")
struct FileUploadButtonContentTypeTests {

    // MARK: - Tests

    @Test("Default value is none")
    func defaultValueIsNone() {
        // GIVEN / WHEN / THEN
        #expect(FileUploadButtonContentType.default == .none)
    }

    // MARK: - isMenu Tests

    @Test("isMenu is true when type is all")
    func isMenuIsTrueWhenTypeIsAll() {
        // GIVEN / WHEN
        let type = FileUploadButtonContentType.all

        // THEN
        #expect(type.isMenu == true)
    }

    @Test("isMenu is false when type is photos")
    func isMenuIsFalseWhenTypeIsPhotos() {
        // GIVEN / WHEN
        let type = FileUploadButtonContentType.photos

        // THEN
        #expect(type.isMenu == false)
    }

    @Test("isMenu is false when type is files")
    func isMenuIsFalseWhenTypeIsFiles() {
        // GIVEN / WHEN
        let type = FileUploadButtonContentType.files

        // THEN
        #expect(type.isMenu == false)
    }

    @Test("isMenu is false when type is none")
    func isMenuIsFalseWhenTypeIsNone() {
        // GIVEN / WHEN
        let type = FileUploadButtonContentType.none

        // THEN
        #expect(type.isMenu == false)
    }

    // MARK: - showPhotos Tests

    @Test("showPhotos is true when type is photos")
    func showPhotosIsTrueWhenTypeIsPhotos() {
        // GIVEN / WHEN
        let type = FileUploadButtonContentType.photos

        // THEN
        #expect(type.showPhotos == true)
    }

    @Test("showPhotos is true when type is all")
    func showPhotosIsTrueWhenTypeIsAll() {
        // GIVEN / WHEN
        let type = FileUploadButtonContentType.all

        // THEN
        #expect(type.showPhotos == true)
    }

    @Test("showPhotos is false when type is files")
    func showPhotosIsFalseWhenTypeIsFiles() {
        // GIVEN / WHEN
        let type = FileUploadButtonContentType.files

        // THEN
        #expect(type.showPhotos == false)
    }

    @Test("showPhotos is false when type is none")
    func showPhotosIsFalseWhenTypeIsNone() {
        // GIVEN / WHEN
        let type = FileUploadButtonContentType.none

        // THEN
        #expect(type.showPhotos == false)
    }

    // MARK: - showFiles Tests

    @Test("showFiles is true when type is files")
    func showFilesIsTrueWhenTypeIsFiles() {
        // GIVEN / WHEN
        let type = FileUploadButtonContentType.files

        // THEN
        #expect(type.showFiles == true)
    }

    @Test("showFiles is true when type is all")
    func showFilesIsTrueWhenTypeIsAll() {
        // GIVEN / WHEN
        let type = FileUploadButtonContentType.all

        // THEN
        #expect(type.showFiles == true)
    }

    @Test("showFiles is false when type is photos")
    func showFilesIsFalseWhenTypeIsPhotos() {
        // GIVEN / WHEN
        let type = FileUploadButtonContentType.photos

        // THEN
        #expect(type.showFiles == false)
    }

    @Test("showFiles is false when type is none")
    func showFilesIsFalseWhenTypeIsNone() {
        // GIVEN / WHEN
        let type = FileUploadButtonContentType.none

        // THEN
        #expect(type.showFiles == false)
    }
}
