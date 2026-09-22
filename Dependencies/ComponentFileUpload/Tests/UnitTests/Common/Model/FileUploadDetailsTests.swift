//
//  FileUploadDetailsTests.swift
//  SparkComponentFileUploadTests
//
//  Created by robin.lemaire on 15/04/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
@testable import SparkComponentFileUpload
@_spi(SI_SPI) @testable import SparkComponentFileUploadTesting
import Testing

@Suite("FileUploadDetails Tests")
struct FileUploadDetailsTests {

    // MARK: - Tests - Public Initialization

    @Test("Public init sets url correctly")
    func publicInitSetsUrlCorrectly() {
        // GIVEN
        let url = URL(fileURLWithPath: "/path/to/document.pdf")
        let fileExtension = "pdf"
        let size: Double = 1024

        // WHEN
        let details = FileUploadDetails(
            url: url,
            data: .mock,
            fileExtension: fileExtension,
            size: size
        )

        // THEN
        #expect(details.url == url)
    }

    @Test("Public init sets fileExtension correctly")
    func publicInitSetsFileExtensionCorrectly() {
        // GIVEN
        let url = URL(fileURLWithPath: "/path/to/image.jpg")
        let fileExtension = "jpg"
        let size: Double = 2048

        // WHEN
        let details = FileUploadDetails(
            url: url,
            data: .mock,
            fileExtension: fileExtension,
            size: size
        )

        // THEN
        #expect(details.fileExtension == fileExtension)
    }

    @Test("Public init sets size correctly")
    func publicInitSetsSizeCorrectly() {
        // GIVEN
        let url = URL(fileURLWithPath: "/path/to/video.mp4")
        let fileExtension = "mp4"
        let size: Double = 4096

        // WHEN
        let details = FileUploadDetails(
            url: url,
            data: .mock,
            fileExtension: fileExtension,
            size: size
        )

        // THEN
        #expect(details.size == size)
    }

    @Test("Public init sets previewType based on image extension")
    func publicInitSetsPreviewTypeBasedOnImageExtension() {
        // GIVEN
        let url = URL(fileURLWithPath: "/path/to/photo.png")
        let fileExtension = "png"
        let size: Double = 1024

        // WHEN
        let details = FileUploadDetails(
            url: url,
            data: .mock,
            fileExtension: fileExtension,
            size: size
        )

        // THEN
        #expect(details.previewType == .image)
    }

    @Test("Public init sets previewType based on pdf extension")
    func publicInitSetsPreviewTypeBasedOnPdfExtension() {
        // GIVEN
        let url = URL(fileURLWithPath: "/path/to/document.pdf")
        let fileExtension = "pdf"
        let size: Double = 2048

        // WHEN
        let details = FileUploadDetails(
            url: url,
            data: .mock,
            fileExtension: fileExtension,
            size: size
        )

        // THEN
        #expect(details.previewType == .pdf)
    }

    @Test("Public init sets previewType based on video extension")
    func publicInitSetsPreviewTypeBasedOnVideoExtension() {
        // GIVEN
        let url = URL(fileURLWithPath: "/path/to/clip.mp4")
        let fileExtension = "mp4"
        let size: Double = 8192

        // WHEN
        let details = FileUploadDetails(
            url: url,
            data: .mock,
            fileExtension: fileExtension,
            size: size
        )

        // THEN
        #expect(details.previewType == .video)
    }

    @Test("Public init sets previewType based on generic file extension")
    func publicInitSetsPreviewTypeBasedOnGenericFileExtension() {
        // GIVEN
        let url = URL(fileURLWithPath: "/path/to/document.txt")
        let fileExtension = "txt"
        let size: Double = 512

        // WHEN
        let details = FileUploadDetails(
            url: url,
            data: .mock,
            fileExtension: fileExtension,
            size: size
        )

        // THEN
        #expect(details.previewType == .file)
    }

    @Test("Public init sets previewViewerType based on image extension")
    func publicInitSetsPreviewViewerTypeBasedOnImageExtension() {
        // GIVEN
        let url = URL(fileURLWithPath: "/path/to/photo.jpg")
        let fileExtension = "jpg"
        let size: Double = 1024

        // WHEN
        let details = FileUploadDetails(
            url: url,
            data: .mock,
            fileExtension: fileExtension,
            size: size
        )

        // THEN
        #expect(details.previewViewerType == .image)
    }

    @Test("Public init sets previewViewerType based on video extension")
    func publicInitSetsPreviewViewerTypeBasedOnVideoExtension() {
        // GIVEN
        let url = URL(fileURLWithPath: "/path/to/clip.mov")
        let fileExtension = "mov"
        let size: Double = 4096

        // WHEN
        let details = FileUploadDetails(
            url: url,
            data: .mock,
            fileExtension: fileExtension,
            size: size
        )

        // THEN
        #expect(details.previewViewerType == .video)
    }

    @Test("Public init sets previewViewerType based on pdf extension")
    func publicInitSetsPreviewViewerTypeBasedOnPdfExtension() {
        // GIVEN
        let url = URL(fileURLWithPath: "/path/to/document.pdf")
        let fileExtension = "pdf"
        let size: Double = 2048

        // WHEN
        let details = FileUploadDetails(
            url: url,
            data: .mock,
            fileExtension: fileExtension,
            size: size
        )

        // THEN
        #expect(details.previewViewerType == .pdf)
    }

    @Test("Public init sets previewViewerType based on generic extension")
    func publicInitSetsPreviewViewerTypeBasedOnGenericExtension() {
        // GIVEN
        let url = URL(fileURLWithPath: "/path/to/document.doc")
        let fileExtension = "doc"
        let size: Double = 512

        // WHEN
        let details = FileUploadDetails(
            url: url,
            data: .mock,
            fileExtension: fileExtension,
            size: size
        )

        // THEN
        #expect(details.previewViewerType == .webview)
    }

    @Test("Public init sets all properties correctly")
    func publicInitSetsAllPropertiesCorrectly() {
        // GIVEN
        let url = URL(fileURLWithPath: "/path/to/complete.png")
        let fileExtension = "png"
        let size: Double = 1536

        // WHEN
        let details = FileUploadDetails(
            url: url,
            data: .mock,
            fileExtension: fileExtension,
            size: size
        )

        // THEN
        #expect(details.url == url)
        #expect(details.fileExtension == fileExtension)
        #expect(details.size == size)
        #expect(details.previewType == .image)
        #expect(details.previewViewerType == .image)
    }

    // MARK: - Tests - Internal Initialization (Photo Transfer)

    @Test("Internal init with transfer sets url from transfer")
    func internalInitWithTransferSetsUrlFromTransfer() {
        // GIVEN
        let url = URL(fileURLWithPath: "/path/to/photo.jpg")
        let transfer = FileUploadPhotoTransfer(
            name: "photo.jpg",
            fileExtension: "jpg",
            size: 1024,
            url: url,
            data: .mock
        )

        // WHEN
        let details = FileUploadDetails(transfer: transfer)

        // THEN
        #expect(details.url == url)
    }

    @Test("Internal init with transfer sets fileExtension from transfer")
    func internalInitWithTransferSetsFileExtensionFromTransfer() {
        // GIVEN
        let fileExtension = "heic"
        let transfer = FileUploadPhotoTransfer(
            name: "photo.heic",
            fileExtension: fileExtension,
            size: 2048,
            url: URL(fileURLWithPath: "/path/to/photo.heic"),
            data: .mock
        )

        // WHEN
        let details = FileUploadDetails(transfer: transfer)

        // THEN
        #expect(details.fileExtension == fileExtension)
    }

    @Test("Internal init with transfer sets size from transfer")
    func internalInitWithTransferSetsSizeFromTransfer() {
        // GIVEN
        let size: Double = 4096
        let transfer = FileUploadPhotoTransfer(
            name: "video.mp4",
            fileExtension: "mp4",
            size: size,
            url: URL(fileURLWithPath: "/path/to/video.mp4"),
            data: .mock
        )

        // WHEN
        let details = FileUploadDetails(transfer: transfer)

        // THEN
        #expect(details.size == size)
    }

    @Test("Internal init with transfer sets previewType from transfer fileExtension")
    func internalInitWithTransferSetsPreviewTypeFromTransferFileExtension() {
        // GIVEN
        let transfer = FileUploadPhotoTransfer(
            name: "image.png",
            fileExtension: "png",
            size: 1024,
            url: URL(fileURLWithPath: "/path/to/image.png"),
            data: .mock
        )

        // WHEN
        let details = FileUploadDetails(transfer: transfer)

        // THEN
        #expect(details.previewType == .image)
    }

    @Test("Internal init with transfer sets previewViewerType from transfer fileExtension")
    func internalInitWithTransferSetsPreviewViewerTypeFromTransferFileExtension() {
        // GIVEN
        let transfer = FileUploadPhotoTransfer(
            name: "video.mov",
            fileExtension: "mov",
            size: 8192,
            url: URL(fileURLWithPath: "/path/to/video.mov"),
            data: .mock
        )

        // WHEN
        let details = FileUploadDetails(transfer: transfer)

        // THEN
        #expect(details.previewViewerType == .video)
    }

    @Test("Internal init with transfer sets all properties correctly")
    func internalInitWithTransferSetsAllPropertiesCorrectly() {
        // GIVEN
        let url = URL(fileURLWithPath: "/path/to/complete.heic")
        let fileExtension = "heic"
        let size: Double = 3072
        let transfer = FileUploadPhotoTransfer(
            name: "complete.heic",
            fileExtension: fileExtension,
            size: size,
            url: url,
            data: .mock
        )

        // WHEN
        let details = FileUploadDetails(transfer: transfer)

        // THEN
        #expect(details.url == url)
        #expect(details.fileExtension == fileExtension)
        #expect(details.size == size)
        #expect(details.previewType == .image)
        #expect(details.previewViewerType == .image)
    }

    // MARK: - Tests - Different File Extensions

    @Test("Init handles all image extensions correctly")
    func initHandlesAllImageExtensionsCorrectly() {
        // GIVEN
        let imageExtensions = ["jpg", "jpeg", "png", "gif", "bmp", "webp", "svg", "ico", "tiff", "tif", "heif", "heic", "raw"]

        for ext in imageExtensions {
            // WHEN
            let details = FileUploadDetails(
                url: URL(fileURLWithPath: "/path/to/image.\(ext)"),
                data: .mock,
                fileExtension: ext,
                size: 1024
            )

            // THEN
            #expect(details.previewType == .image, "Extension \(ext) should be image preview type")
        }
    }

    @Test("Init handles all video extensions correctly")
    func initHandlesAllVideoExtensionsCorrectly() {
        // GIVEN
        let videoExtensions = ["mp4", "m4v", "avi", "mov", "wmv", "flv", "webm", "mkv"]

        for ext in videoExtensions {
            // WHEN
            let details = FileUploadDetails(
                url: URL(fileURLWithPath: "/path/to/video.\(ext)"),
                data: .mock,
                fileExtension: ext,
                size: 4096
            )

            // THEN
            #expect(details.previewType == .video, "Extension \(ext) should be video preview type")
        }
    }

    @Test("Init handles pdf extension correctly")
    func initHandlesPdfExtensionCorrectly() {
        // GIVEN
        let ext = "pdf"

        // WHEN
        let details = FileUploadDetails(
            url: URL(fileURLWithPath: "/path/to/document.\(ext)"),
            data: .mock,
            fileExtension: ext,
            size: 2048
        )

        // THEN
        #expect(details.previewType == .pdf)
        #expect(details.previewViewerType == .pdf)
    }

    @Test("Init handles unknown extensions as file type")
    func initHandlesUnknownExtensionsAsFileType() {
        // GIVEN
        let unknownExtensions = ["txt", "doc", "docx", "xls", "zip", "unknown"]

        for ext in unknownExtensions {
            // WHEN
            let details = FileUploadDetails(
                url: URL(fileURLWithPath: "/path/to/file.\(ext)"),
                data: .mock,
                fileExtension: ext,
                size: 512
            )

            // THEN
            #expect(details.previewType == .file, "Extension \(ext) should be file preview type")
        }
    }

    @Test("Init handles viewer type image extensions correctly")
    func initHandlesViewerTypeImageExtensionsCorrectly() {
        // GIVEN
        let imageViewerExtensions = ["jpg", "jpeg", "png", "tiff", "tif", "heif", "heic", "raw"]

        for ext in imageViewerExtensions {
            // WHEN
            let details = FileUploadDetails(
                url: URL(fileURLWithPath: "/path/to/image.\(ext)"),
                data: .mock,
                fileExtension: ext,
                size: 1024
            )

            // THEN
            #expect(details.previewViewerType == .image, "Extension \(ext) should have image viewer type")
        }
    }

    @Test("Init handles viewer type video extensions correctly")
    func initHandlesViewerTypeVideoExtensionsCorrectly() {
        // GIVEN
        let videoViewerExtensions = ["mp4", "m4v", "mov"]

        for ext in videoViewerExtensions {
            // WHEN
            let details = FileUploadDetails(
                url: URL(fileURLWithPath: "/path/to/video.\(ext)"),
                data: .mock,
                fileExtension: ext,
                size: 4096
            )

            // THEN
            #expect(details.previewViewerType == .video, "Extension \(ext) should have video viewer type")
        }
    }

    @Test("Init handles viewer type webview extensions correctly")
    func initHandlesViewerTypeWebviewExtensionsCorrectly() {
        // GIVEN
        let webviewExtensions = ["gif", "bmp", "webp", "svg", "ico", "avi", "wmv", "flv", "webm", "mkv", "txt", "doc"]

        for ext in webviewExtensions {
            // WHEN
            let details = FileUploadDetails(
                url: URL(fileURLWithPath: "/path/to/file.\(ext)"),
                data: .mock,
                fileExtension: ext,
                size: 512
            )

            // THEN
            #expect(details.previewViewerType == .webview, "Extension \(ext) should have webview viewer type")
        }
    }

    // MARK: - Tests - Equatable

    @Test("Equatable returns true when all properties are equal")
    func equatableReturnsTrueWhenAllPropertiesAreEqual() {
        // GIVEN
        let url = URL(fileURLWithPath: "/path/to/equal.pdf")
        let data = Data.mock
        let fileExtension = "pdf"
        let size: Double = 1024

        let details1 = FileUploadDetails(
            url: url,
            data: data,
            fileExtension: fileExtension,
            size: size
        )
        let details2 = FileUploadDetails(
            url: url,
            data: data,
            fileExtension: fileExtension,
            size: size
        )

        // WHEN / THEN
        #expect(details1 == details2)
    }

    @Test("Equatable returns false when urls are different")
    func equatableReturnsFalseWhenUrlsAreDifferent() {
        // GIVEN
        let url1 = URL(fileURLWithPath: "/path/to/file1.pdf")
        let url2 = URL(fileURLWithPath: "/path/to/file2.pdf")
        let data = Data.mock
        let fileExtension = "pdf"
        let size: Double = 1024

        let details1 = FileUploadDetails(
            url: url1,
            data: data,
            fileExtension: fileExtension,
            size: size
        )
        let details2 = FileUploadDetails(
            url: url2,
            data: data,
            fileExtension: fileExtension,
            size: size
        )

        // WHEN / THEN
        #expect(details1 != details2)
    }

    @Test("Equatable returns false when datas are different")
    func equatableReturnsFalseWhenDatasAreDifferent() {
        // GIVEN
        let url = URL(fileURLWithPath: "/path/to/file")
        let fileExtension = "pdf"
        let size: Double = 1024

        let details1 = FileUploadDetails(
            url: url,
            data: .mock,
            fileExtension: fileExtension,
            size: size
        )
        let details2 = FileUploadDetails(
            url: url,
            data: .mock2,
            fileExtension: fileExtension,
            size: size
        )

        // WHEN / THEN
        #expect(details1 != details2)
    }

    @Test("Equatable returns false when fileExtensions are different")
    func equatableReturnsFalseWhenFileExtensionsAreDifferent() {
        // GIVEN
        let url = URL(fileURLWithPath: "/path/to/file")
        let data = Data.mock
        let size: Double = 1024

        let details1 = FileUploadDetails(
            url: url,
            data: data,
            fileExtension: "pdf",
            size: size
        )
        let details2 = FileUploadDetails(
            url: url,
            data: data,
            fileExtension: "txt",
            size: size
        )

        // WHEN / THEN
        #expect(details1 != details2)
    }

    @Test("Equatable returns false when sizes are different")
    func equatableReturnsFalseWhenSizesAreDifferent() {
        // GIVEN
        let url = URL(fileURLWithPath: "/path/to/file.pdf")
        let data = Data.mock
        let fileExtension = "pdf"

        let details1 = FileUploadDetails(
            url: url,
            data: data,
            fileExtension: fileExtension,
            size: 1024
        )
        let details2 = FileUploadDetails(
            url: url,
            data: data,
            fileExtension: fileExtension,
            size: 2048
        )

        // WHEN / THEN
        #expect(details1 != details2)
    }

    // MARK: - Tests - Edge Cases

    @Test("Init works with zero size")
    func initWorksWithZeroSize() {
        // GIVEN
        let url = URL(fileURLWithPath: "/path/to/empty.txt")

        // WHEN
        let details = FileUploadDetails(
            url: url,
            data: .mock,
            fileExtension: "txt",
            size: 0
        )

        // THEN
        #expect(details.size == 0)
    }

    @Test("Init works with very large size")
    func initWorksWithVeryLargeSize() {
        // GIVEN
        let largeSize: Double = 100_000_000_000 // 100 GB
        let url = URL(fileURLWithPath: "/path/to/large.zip")

        // WHEN
        let details = FileUploadDetails(
            url: url,
            data: .mock,
            fileExtension: "zip",
            size: largeSize
        )

        // THEN
        #expect(details.size == largeSize)
    }

    @Test("Init works with decimal size values")
    func initWorksWithDecimalSizeValues() {
        // GIVEN
        let decimalSize: Double = 1234.56789
        let url = URL(fileURLWithPath: "/path/to/file.dat")

        // WHEN
        let details = FileUploadDetails(
            url: url,
            data: .mock,
            fileExtension: "dat",
            size: decimalSize
        )

        // THEN
        #expect(details.size == decimalSize)
    }

    @Test("Init works with empty file extension")
    func initWorksWithEmptyFileExtension() {
        // GIVEN
        let url = URL(fileURLWithPath: "/path/to/file")

        // WHEN
        let details = FileUploadDetails(
            url: url,
            data: .mock,
            fileExtension: "",
            size: 1024)

        // THEN
        #expect(details.fileExtension.isEmpty)
        #expect(details.previewType == .file)
        #expect(details.previewViewerType == .webview)
    }

    @Test("Init works with case sensitive extensions")
    func initWorksWithCaseSensitiveExtensions() {
        // GIVEN
        let url = URL(fileURLWithPath: "/path/to/file.PDF")

        // WHEN
        let details = FileUploadDetails(
            url: url,
            data: .mock,
            fileExtension: "PDF",
            size: 1024
        )

        // THEN
        #expect(details.fileExtension == "PDF")
        #expect(details.previewType == .file) // Extension matching is case-sensitive
    }

    @Test("Multiple instances maintain independent values")
    func multipleInstancesMaintainIndependentValues() {
        // GIVEN
        let url1 = URL(fileURLWithPath: "/path/to/file1.jpg")
        let url2 = URL(fileURLWithPath: "/path/to/file2.pdf")

        // WHEN
        let details1 = FileUploadDetails(
            url: url1,
            data: .mock,
            fileExtension: "jpg",
            size: 1024
        )
        let details2 = FileUploadDetails(
            url: url2,
            data: .mock,
            fileExtension: "pdf",
            size: 2048
        )

        // THEN
        #expect(details1.url != details2.url)
        #expect(details1.fileExtension != details2.fileExtension)
        #expect(details1.size != details2.size)
        #expect(details1.previewType != details2.previewType)
    }
}
