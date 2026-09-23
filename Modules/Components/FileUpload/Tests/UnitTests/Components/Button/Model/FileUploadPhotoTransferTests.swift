//
//  FileUploadPhotoTransferTests.swift
//  SparkComponentFileUploadTests
//
//  Created by robin.lemaire on 24/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
@testable import SparkComponentFileUpload
@_spi(SI_SPI) @testable import SparkComponentFileUploadTesting
import Testing

@Suite("FileUploadPhotoTransfer Tests")
struct FileUploadPhotoTransferTests {

    // MARK: - Properties

    // Store original use case to restore after tests
    let originalService: FileUploadConvertURLServicing

    // MARK: - Initialization

    init() {
        // Store the original use case
        self.originalService = FileUploadPhotoTransfer.convertURLService
    }

    // MARK: - Static Property Tests

    @Test("Static convertURLService has default value")
    func staticConvertURLServiceHasDefaultValue() {
        // GIVEN / WHEN
        let useCase = FileUploadPhotoTransfer.convertURLService

        // THEN
        #expect(useCase is FileUploadConvertURLService)
    }

    @Test("Static convertURLService can be replaced with mock")
    func staticConvertURLServiceCanBeReplacedWithMock() {
        // GIVEN
        let mockService = FileUploadConvertURLServicingMock()

        // WHEN
        FileUploadPhotoTransfer.convertURLService = mockService

        // THEN
        #expect(FileUploadPhotoTransfer.convertURLService is FileUploadConvertURLServicingMock)

        // Cleanup
        FileUploadPhotoTransfer.convertURLService = self.originalService
    }

    // MARK: - Properties Tests

    @Test("Init with all properties sets name correctly")
    func initWithAllPropertiesSetsNameCorrectly() {
        // GIVEN
        let name = "photo.jpg"
        let fileExtension = "jpg"
        let size: Double = 2_048_000
        let url = URL(fileURLWithPath: "file:///photos/photo.jpg")
        let data = Data.mock

        // WHEN
        let transfer = FileUploadPhotoTransfer(
            name: name,
            fileExtension: fileExtension,
            size: size,
            url: url,
            data: data
        )

        // THEN
        #expect(transfer.name == name)
    }

    @Test("Init with all properties sets fileExtension correctly")
    func initWithAllPropertiesSetsFileExtensionCorrectly() {
        // GIVEN
        let name = "video.mp4"
        let fileExtension = "mp4"
        let size: Double = 10_485_760
        let url = URL(fileURLWithPath: "file:///videos/video.mp4")
        let data = Data.mock

        // WHEN
        let transfer = FileUploadPhotoTransfer(
            name: name,
            fileExtension: fileExtension,
            size: size,
            url: url,
            data: data
        )

        // THEN
        #expect(transfer.fileExtension == fileExtension)
    }

    @Test("Init with all properties sets size correctly")
    func initWithAllPropertiesSetsSizeCorrectly() throws {
        // GIVEN
        let name = "image.png"
        let fileExtension = "png"
        let size: Double = 5_242_880
        let data = Data.mock

        // WHEN
        let transfer = FileUploadPhotoTransfer(
            name: name,
            fileExtension: fileExtension,
            size: size,
            url: URL(fileURLWithPath: "file:///images/image.png"),
            data: data
        )

        // THEN
        #expect(transfer.size == size)
    }

    @Test("Init with all properties sets url correctly")
    func initWithAllPropertiesSetsUrlCorrectly() {
        // GIVEN
        let name = "photo.heic"
        let fileExtension = "heic"
        let size: Double = 1_048_576
        let url = URL(fileURLWithPath: "file:///photos/photo.heic")
        let data = Data.mock

        // WHEN
        let transfer = FileUploadPhotoTransfer(
            name: name,
            fileExtension: fileExtension,
            size: size,
            url: url,
            data: data
        )

        // THEN
        #expect(transfer.url == url)
    }

    @Test("Init with all properties sets all values correctly")
    func initWithAllPropertiesSetsAllValuesCorrectly() {
        // GIVEN
        let name = "document.pdf"
        let fileExtension = "pdf"
        let size: Double = 3_145_728
        let url = URL(fileURLWithPath: "file:///documents/document.pdf")
        let data = Data.mock

        // WHEN
        let transfer = FileUploadPhotoTransfer(
            name: name,
            fileExtension: fileExtension,
            size: size,
            url: url,
            data: data
        )

        // THEN
        #expect(transfer.name == name)
        #expect(transfer.fileExtension == fileExtension)
        #expect(transfer.size == size)
        #expect(transfer.url == url)
    }

    // MARK: - Different File Types Tests

    @Test("Init works with image file types")
    func initWorksWithImageFileTypes() {
        // GIVEN
        let imageExtensions = ["jpg", "jpeg", "png", "heic", "heif", "gif"]

        for ext in imageExtensions {
            // WHEN
            let transfer = FileUploadPhotoTransfer(
                name: "image.\(ext)",
                fileExtension: ext,
                size: 2_000_000,
                url: URL(fileURLWithPath: "file:///image.\(ext)"),
                data: .mock
            )

            // THEN
            #expect(transfer.fileExtension == ext, "Should handle \(ext) extension")
        }
    }

    @Test("Init works with video file types")
    func initWorksWithVideoFileTypes() {
        // GIVEN
        let videoExtensions = ["mp4", "mov", "m4v", "avi"]

        for ext in videoExtensions {
            // WHEN
            let transfer = FileUploadPhotoTransfer(
                name: "video.\(ext)",
                fileExtension: ext,
                size: 10_000_000,
                url: URL(fileURLWithPath: "file:///video.\(ext)"),
                data: .mock
            )

            // THEN
            #expect(transfer.fileExtension == ext, "Should handle \(ext) extension")
        }
    }

    // MARK: - Edge Cases Tests

    @Test("Init works with empty name")
    func initWorksWithEmptyName() {
        // GIVEN / WHEN
        let transfer = FileUploadPhotoTransfer(
            name: "",
            fileExtension: "jpg",
            size: 1024,
            url: URL(fileURLWithPath: "file:///unnamed.jpg"),
            data: .mock
        )

        // THEN
        #expect(transfer.name.isEmpty)
    }

    @Test("Init works with zero size")
    func initWorksWithZeroSize() {
        // GIVEN / WHEN
        let transfer = FileUploadPhotoTransfer(
            name: "empty.txt",
            fileExtension: "txt",
            size: 0,
            url: URL(fileURLWithPath: "file:///empty.txt"),
            data: .mock
        )

        // THEN
        #expect(transfer.size == 0)
    }

    @Test("Init works with large size values")
    func initWorksWithLargeSizeValues() {
        // GIVEN
        let largeSize: Double = 100_000_000_000 // 100 GB

        // WHEN
        let transfer = FileUploadPhotoTransfer(
            name: "large.zip",
            fileExtension: "zip",
            size: largeSize,
            url: URL(fileURLWithPath: "file:///large.zip"),
            data: .mock
        )

        // THEN
        #expect(transfer.size == largeSize)
    }

    @Test("Init works with special characters in name")
    func initWorksWithSpecialCharactersInName() {
        // GIVEN
        let specialName = "test-file_2024 (1).jpg"

        // WHEN
        let transfer = FileUploadPhotoTransfer(
            name: specialName,
            fileExtension: "jpg",
            size: 1024,
            url: URL(fileURLWithPath: "file:///test-file_2024%20(1).jpg"),
            data: .mock
        )

        // THEN
        #expect(transfer.name == specialName)
    }

    @Test("Init works with unicode characters in name")
    func initWorksWithUnicodeCharactersInName() {
        // GIVEN
        let unicodeName = "照片.jpg"

        // WHEN
        let transfer = FileUploadPhotoTransfer(
            name: unicodeName,
            fileExtension: "jpg",
            size: 2048,
            url: URL(fileURLWithPath: "file:///photo.jpg"),
            data: .mock
        )

        // THEN
        #expect(transfer.name == unicodeName)
    }

    @Test("Init preserves exact size values")
    func initPreservesExactSizeValues() {
        // GIVEN
        let preciseSize: Double = 1_234_567.89

        // WHEN
        let transfer = FileUploadPhotoTransfer(
            name: "file.dat",
            fileExtension: "dat",
            size: preciseSize,
            url: URL(fileURLWithPath: "file:///file.dat"),
            data: .mock
        )

        // THEN
        #expect(transfer.size == preciseSize)
    }

    @Test("Multiple instances maintain independent values")
    func multipleInstancesMaintainIndependentValues() {
        // GIVEN / WHEN
        let transfer1 = FileUploadPhotoTransfer(
            name: "photo1.jpg",
            fileExtension: "jpg",
            size: 1_000_000,
            url: URL(fileURLWithPath: "file:///photo1.jpg"),
            data: .mock
        )

        let transfer2 = FileUploadPhotoTransfer(
            name: "photo2.png",
            fileExtension: "png",
            size: 2_000_000,
            url: URL(fileURLWithPath: "file:///photo2.png"),
            data: .mock2
        )

        // THEN
        #expect(transfer1.name != transfer2.name)
        #expect(transfer1.fileExtension != transfer2.fileExtension)
        #expect(transfer1.size != transfer2.size)
        #expect(transfer1.url != transfer2.url)
        #expect(transfer1.data != transfer2.data)
    }

    // MARK: - FileUploadConvertible Conformance Tests

    @Test("Transfer properties match FileUploadConvertible requirements")
    func transferPropertiesMatchFileUploadConvertibleRequirements() {
        // GIVEN
        let name = "photo.heic"
        let fileExtension = "heic"
        let size: Double = 2_500_000
        let url = URL(fileURLWithPath: "file:///photo.heic")
        let data = Data.mock

        // WHEN
        let transfer = FileUploadPhotoTransfer(
            name: name,
            fileExtension: fileExtension,
            size: size,
            url: url,
            data: data
        )

        // THEN - Verify it has all required FileUploadConvertible properties
        #expect(transfer.name == name)
        #expect(transfer.fileExtension == fileExtension)
        #expect(transfer.size == size)
        #expect(transfer.url == url)
        #expect(transfer.data == data)
    }
}
