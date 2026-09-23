//
//  FileUploadButtonFetchCameraImageServiceTests.swift
//  SparkComponentFileUploadTests
//
//  Created by robin.lemaire on 08/04/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentFileUpload
import Testing
import UIKit

@Suite("FileUpload Button Fetch Camera Image Service Tests")
struct FileUploadButtonFetchCameraImageServiceTests {

    // MARK: - Properties

    let sut: FileUploadButtonFetchCameraImageService

    // MARK: - Initialization

    init() {
        self.sut = FileUploadButtonFetchCameraImageService()
    }

    // MARK: - Tests

    @Test("Execute with valid image returns successful FileUpload")
    func executeWithValidImageReturnsSuccessfulFileUpload() throws {
        // GIVEN
        let image = try UIImage.photoMock

        // WHEN
        let file = self.sut.execute(image)

        // THEN
        #expect(!file.id.isEmpty)
        #expect(file.source == .camera)
        #expect(file.isSucceed)

        if case .success(let details) = file.result {
            #expect(details.fileExtension == "jpg")
            #expect(details.size > 0)
            #expect(details.url.path.contains("camera_"))
        } else {
            Issue.record("Expected success result but got failure")
        }
    }

    @Test("Execute returns independent file for each call")
    func executeReturnsIndependentFileForEachCall() throws {
        // GIVEN
        let image = try UIImage.photoMock

        // WHEN
        let file1 = self.sut.execute(image)
        let file2 = self.sut.execute(image)

        // THEN
        #expect(file1.id != file2.id)
    }

    @Test("Execute generates unique IDs for each camera photo")
    func executeGeneratesUniqueIDsForEachCameraPhoto() throws {
        // GIVEN
        let image1 = try UIImage.photoMock
        let image2 = try UIImage.cameraMock

        // WHEN
        let file1 = self.sut.execute(image1)
        let file2 = self.sut.execute(image2)

        // THEN
        #expect(file1.id != file2.id)
    }

    @Test("Execute creates temporary file in correct location")
    func executeCreatesTemporaryFileInCorrectLocation() throws {
        // GIVEN
        let image = try UIImage.photoMock

        // WHEN
        let file = self.sut.execute(image)

        // THEN
        if case .success(let details) = file.result {
            let tempDirectory = FileManager.default.temporaryDirectory
            #expect(details.url.path.contains(tempDirectory.path))

            // Clean up: remove the temporary file
            try? FileManager.default.removeItem(at: details.url)
        } else {
            Issue.record("Expected success result")
        }
    }
}

// MARK: - UIImage Mock Extension

private extension UIImage {

    static var photoMock: UIImage {
        get throws {
            try #require(.init(systemName: "photo"))
        }
    }

    static var cameraMock: UIImage {
        get throws {
            try #require(.init(systemName: "camera"))
        }
    }
}
