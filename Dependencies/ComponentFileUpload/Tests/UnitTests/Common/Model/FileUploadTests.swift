//
//  FileUploadTests.swift
//  SparkComponentFileUploadTests
//
//  Created by robin.lemaire on 15/04/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
@testable import SparkComponentFileUpload
@_spi(SI_SPI) @testable import SparkComponentFileUploadTesting
import Testing

@Suite("FileUpload Tests")
struct FileUploadTests {

    // MARK: - Tests - Public Initialization

    @Test("Public init sets id correctly")
    func publicInitSetsIdCorrectly() {
        // GIVEN
        let id = "test-id-123"
        let name = "document.pdf"
        let source = FileUploadSource.files
        let url = URL(fileURLWithPath: "/path/to/document.pdf")
        let data = Data.mock
        let result: Result<FileUploadDetails, FileUploadError> = .success(.init(
            url: url,
            data: data,
            fileExtension: "pdf",
            size: 1024
        ))

        // WHEN
        let fileUpload = FileUpload(
            id: id,
            name: name,
            source: source,
            result: result
        )

        // THEN
        #expect(fileUpload.id == id)
    }

    @Test("Public init sets name correctly")
    func publicInitSetsNameCorrectly() {
        // GIVEN
        let id = "test-id-456"
        let name = "photo.jpg"
        let source = FileUploadSource.camera
        let url = URL(fileURLWithPath: "/path/to/photo.jpg")
        let data = Data.mock
        let result: Result<FileUploadDetails, FileUploadError> = .success(.init(
            url: url,
            data: data,
            fileExtension: "jpg",
            size: 2048
        ))

        // WHEN
        let fileUpload = FileUpload(
            id: id,
            name: name,
            source: source,
            result: result
        )

        // THEN
        #expect(fileUpload.name == name)
    }

    @Test("Public init sets source correctly")
    func publicInitSetsSourceCorrectly() {
        // GIVEN
        let id = "test-id-789"
        let name = "video.mp4"
        let source = FileUploadSource.photos
        let url = URL(fileURLWithPath: "/path/to/video.mp4")
        let data = Data.mock
        let result: Result<FileUploadDetails, FileUploadError> = .success(.init(
            url: url,
            data: data,
            fileExtension: "mp4",
            size: 4096
        ))

        // WHEN
        let fileUpload = FileUpload(
            id: id,
            name: name,
            source: source,
            result: result
        )

        // THEN
        #expect(fileUpload.source == source)
    }

    @Test("Public init sets result correctly")
    func publicInitSetsResultCorrectly() {
        // GIVEN
        let id = "test-id-101"
        let name = "image.png"
        let source = FileUploadSource.drop
        let url = URL(fileURLWithPath: "/path/to/image.png")
        let data = Data.mock
        let result: Result<FileUploadDetails, FileUploadError> = .success(.init(
            url: url,
            data: data,
            fileExtension: "png",
            size: 8192
        ))

        // WHEN
        let fileUpload = FileUpload(
            id: id,
            name: name,
            source: source,
            result: result
        )

        // THEN
        switch fileUpload.result {
        case .success(let details):
            switch result {
            case .success(let expectedDetails):
                #expect(details == expectedDetails)
            case .failure:
                Issue.record("Expected success but got failure")
            }
        case .failure:
            Issue.record("Expected success but got failure")
        }
    }

    @Test("Public init sets all properties correctly with success result")
    func publicInitSetsAllPropertiesCorrectlyWithSuccessResult() {
        // GIVEN
        let id = "complete-test-id"
        let name = "complete.txt"
        let source = FileUploadSource.files
        let url = URL(fileURLWithPath: "/path/to/complete.txt")
        let data = Data.mock
        let fileExtension = "txt"
        let size: Double = 512
        let result: Result<FileUploadDetails, FileUploadError> = .success(.init(
            url: url,
            data: data,
            fileExtension: fileExtension,
            size: size
        ))

        // WHEN
        let fileUpload = FileUpload(
            id: id,
            name: name,
            source: source,
            result: result
        )

        // THEN
        #expect(fileUpload.id == id)
        #expect(fileUpload.name == name)
        #expect(fileUpload.source == source)

        switch fileUpload.result {
        case .success(let details):
            #expect(details.url == url)
            #expect(details.data == data)
            #expect(details.fileExtension == fileExtension)
            #expect(details.size == size)
        case .failure:
            Issue.record("Expected success but got failure")
        }
    }

    @Test("Public init sets all properties correctly with failure result")
    func publicInitSetsAllPropertiesCorrectlyWithFailureResult() {
        // GIVEN
        let id = "failure-test-id"
        let name = "failed.doc"
        let source = FileUploadSource.camera
        let error = FileUploadError.photoResourceNotFound
        let result: Result<FileUploadDetails, FileUploadError> = .failure(error)

        // WHEN
        let fileUpload = FileUpload(
            id: id,
            name: name,
            source: source,
            result: result
        )

        // THEN
        #expect(fileUpload.id == id)
        #expect(fileUpload.name == name)
        #expect(fileUpload.source == source)

        switch fileUpload.result {
        case .success:
            Issue.record("Expected failure but got success")
        case .failure(let resultError):
            #expect(resultError == error)
        }
    }

    // MARK: - Tests - Internal Initialization (Photo Transfer)

    @Test("Internal init with photo transfer sets id correctly")
    func internalInitWithPhotoTransferSetsIdCorrectly() {
        // GIVEN
        let id = "photo-transfer-id"
        let transfer = FileUploadPhotoTransfer(
            name: "photo.jpg",
            fileExtension: "jpg",
            size: 1024,
            url: URL(fileURLWithPath: "/path/to/photo.jpg"),
            data: .mock
        )

        // WHEN
        let fileUpload = FileUpload(id: id, transfer: transfer)

        // THEN
        #expect(fileUpload.id == id)
    }

    @Test("Internal init with photo transfer sets name from transfer")
    func internalInitWithPhotoTransferSetsNameFromTransfer() {
        // GIVEN
        let id = "photo-id"
        let transferName = "sunset.heic"
        let transfer = FileUploadPhotoTransfer(
            name: transferName,
            fileExtension: "heic",
            size: 2048,
            url: URL(fileURLWithPath: "/path/to/sunset.heic"),
            data: .mock
        )

        // WHEN
        let fileUpload = FileUpload(id: id, transfer: transfer)

        // THEN
        #expect(fileUpload.name == transferName)
    }

    @Test("Internal init with photo transfer sets source to photos")
    func internalInitWithPhotoTransferSetsSourceToPhotos() {
        // GIVEN
        let id = "photo-source-id"
        let transfer = FileUploadPhotoTransfer(
            name: "image.png",
            fileExtension: "png",
            size: 4096,
            url: URL(fileURLWithPath: "/path/to/image.png"),
            data: .mock
        )

        // WHEN
        let fileUpload = FileUpload(id: id, transfer: transfer)

        // THEN
        #expect(fileUpload.source == .photos)
    }

    @Test("Internal init with photo transfer sets result to success")
    func internalInitWithPhotoTransferSetsResultToSuccess() {
        // GIVEN
        let id = "success-photo-id"
        let transfer = FileUploadPhotoTransfer(
            name: "video.mp4",
            fileExtension: "mp4",
            size: 8192,
            url: URL(fileURLWithPath: "/path/to/video.mp4"),
            data: .mock
        )

        // WHEN
        let fileUpload = FileUpload(id: id, transfer: transfer)

        // THEN
        switch fileUpload.result {
        case .success(let details):
            #expect(details.url == transfer.url)
            #expect(details.data == transfer.data)
            #expect(details.fileExtension == transfer.fileExtension)
            #expect(details.size == transfer.size)
        case .failure:
            Issue.record("Expected success but got failure")
        }
    }

    // MARK: - Tests - Internal Initialization (Error)

    @Test("Internal init with error sets id correctly")
    func internalInitWithErrorSetsIdCorrectly() {
        // GIVEN
        let id = "error-id"
        let source = FileUploadSource.files
        let error = FileUploadError.fileSizeNotFound(nil)

        // WHEN
        let fileUpload = FileUpload(id: id, name: nil, source: source, error: error)

        // THEN
        #expect(fileUpload.id == id)
    }

    @Test("Internal init with error uses provided name")
    func internalInitWithErrorUsesProvidedName() {
        // GIVEN
        let id = "error-name-id"
        let name = "error-file.txt"
        let source = FileUploadSource.camera
        let error = FileUploadError.photoResourceNotFound

        // WHEN
        let fileUpload = FileUpload(id: id, name: name, source: source, error: error)

        // THEN
        #expect(fileUpload.name == name)
    }

    @Test("Internal init with error uses id as name when name is nil")
    func internalInitWithErrorUsesIdAsNameWhenNameIsNil() {
        // GIVEN
        let id = "fallback-name-id"
        let source = FileUploadSource.drop
        let error = FileUploadError.dropConversion(nil)

        // WHEN
        let fileUpload = FileUpload(id: id, name: nil, source: source, error: error)

        // THEN
        #expect(fileUpload.name == id)
    }

    @Test("Internal init with error sets source correctly")
    func internalInitWithErrorSetsSourceCorrectly() {
        // GIVEN
        let id = "error-source-id"
        let source = FileUploadSource.photos
        let error = FileUploadError.photoTransfer(nil)

        // WHEN
        let fileUpload = FileUpload(id: id, name: nil, source: source, error: error)

        // THEN
        #expect(fileUpload.source == source)
    }

    @Test("Internal init with error sets result to failure")
    func internalInitWithErrorSetsResultToFailure() {
        // GIVEN
        let id = "failure-error-id"
        let source = FileUploadSource.files
        let error = FileUploadError.fileDataConversion(nil)

        // WHEN
        let fileUpload = FileUpload(id: id, name: nil, source: source, error: error)

        // THEN
        switch fileUpload.result {
        case .success:
            Issue.record("Expected failure but got success")
        case .failure(let resultError):
            #expect(resultError == error)
        }
    }

    @Test("Internal init with error generates UUID when id is not provided")
    func internalInitWithErrorGeneratesUuidWhenIdIsNotProvided() {
        // GIVEN
        let source = FileUploadSource.camera
        let error = FileUploadError.other(NSError(domain: "test", code: 1))

        // WHEN
        let fileUpload = FileUpload(name: nil, source: source, error: error)

        // THEN
        #expect(!fileUpload.id.isEmpty)
    }

    // MARK: - Tests - isSucceed Property

    @Test("isSucceed returns true when result is success")
    func isSucceedReturnsTrueWhenResultIsSuccess() {
        // GIVEN
        let url = URL(fileURLWithPath: "/path/to/success.pdf")
        let fileUpload = FileUpload(
            id: "success-id",
            name: "success.pdf",
            source: .files,
            result: .success(.init(
                url: url,
                data: .mock,
                fileExtension: "pdf",
                size: 1024
            ))
        )

        // WHEN / THEN
        #expect(fileUpload.isSucceed == true)
    }

    @Test("isSucceed returns false when result is failure")
    func isSucceedReturnsFalseWhenResultIsFailure() {
        // GIVEN
        let fileUpload = FileUpload(
            id: "failure-id",
            name: "failure.doc",
            source: .camera,
            result: .failure(.photoResourceNotFound)
        )

        // WHEN / THEN
        #expect(fileUpload.isSucceed == false)
    }

    // MARK: - Tests - Equatable

    @Test("Equatable returns true when all properties are equal")
    func equatableReturnsTrueWhenAllPropertiesAreEqual() {
        // GIVEN
        let id = "equal-id"
        let name = "equal.txt"
        let source = FileUploadSource.files
        let url = URL(fileURLWithPath: "/path/to/equal.txt")
        let result: Result<FileUploadDetails, FileUploadError> = .success(.init(
            url: url,
            data: .mock,
            fileExtension: "txt",
            size: 512
        ))

        let fileUpload1 = FileUpload(id: id, name: name, source: source, result: result)
        let fileUpload2 = FileUpload(id: id, name: name, source: source, result: result)

        // WHEN / THEN
        #expect(fileUpload1 == fileUpload2)
    }

    @Test("Equatable returns false when ids are different")
    func equatableReturnsFalseWhenIdsAreDifferent() {
        // GIVEN
        let name = "same.txt"
        let source = FileUploadSource.files
        let url = URL(fileURLWithPath: "/path/to/same.txt")
        let result: Result<FileUploadDetails, FileUploadError> = .success(.init(
            url: url,
            data: .mock,
            fileExtension: "txt",
            size: 512
        ))

        let fileUpload1 = FileUpload(id: "id-1", name: name, source: source, result: result)
        let fileUpload2 = FileUpload(id: "id-2", name: name, source: source, result: result)

        // WHEN / THEN
        #expect(fileUpload1 != fileUpload2)
    }

    @Test("Equatable returns false when names are different")
    func equatableReturnsFalseWhenNamesAreDifferent() {
        // GIVEN
        let id = "same-id"
        let source = FileUploadSource.files
        let url = URL(fileURLWithPath: "/path/to/file.txt")
        let result: Result<FileUploadDetails, FileUploadError> = .success(.init(
            url: url,
            data: .mock,
            fileExtension: "txt",
            size: 512
        ))

        let fileUpload1 = FileUpload(id: id, name: "name1.txt", source: source, result: result)
        let fileUpload2 = FileUpload(id: id, name: "name2.txt", source: source, result: result)

        // WHEN / THEN
        #expect(fileUpload1 != fileUpload2)
    }

    @Test("Equatable returns false when sources are different")
    func equatableReturnsFalseWhenSourcesAreDifferent() {
        // GIVEN
        let id = "same-id"
        let name = "same.txt"
        let url = URL(fileURLWithPath: "/path/to/same.txt")
        let result: Result<FileUploadDetails, FileUploadError> = .success(.init(
            url: url,
            data: .mock,
            fileExtension: "txt",
            size: 512
        ))

        let fileUpload1 = FileUpload(id: id, name: name, source: .files, result: result)
        let fileUpload2 = FileUpload(id: id, name: name, source: .photos, result: result)

        // WHEN / THEN
        #expect(fileUpload1 != fileUpload2)
    }

    @Test("Equatable returns false when results are different")
    func equatableReturnsFalseWhenResultsAreDifferent() {
        // GIVEN
        let id = "same-id"
        let name = "same.txt"
        let source = FileUploadSource.files
        let url = URL(fileURLWithPath: "/path/to/same.txt")

        let result1: Result<FileUploadDetails, FileUploadError> = .success(.init(
            url: url,
            data: .mock,
            fileExtension: "txt",
            size: 512
        ))
        let result2: Result<FileUploadDetails, FileUploadError> = .failure(.photoResourceNotFound)

        let fileUpload1 = FileUpload(id: id, name: name, source: source, result: result1)
        let fileUpload2 = FileUpload(id: id, name: name, source: source, result: result2)

        // WHEN / THEN
        #expect(fileUpload1 != fileUpload2)
    }

    // MARK: - Tests - All Sources

    @Test("Init works with all source types")
    func initWorksWithAllSourceTypes() {
        // GIVEN
        let sources: [FileUploadSource] = [.photos, .files, .camera, .drop]
        let url = URL(fileURLWithPath: "/path/to/file.txt")

        for source in sources {
            // WHEN
            let fileUpload = FileUpload(
                id: "test-id",
                name: "test.txt",
                source: source,
                result: .success(.init(
                    url: url,
                    data: .mock,
                    fileExtension: "txt",
                    size: 1024
                ))
            )

            // THEN
            #expect(fileUpload.source == source, "Should handle \(source) source")
        }
    }

    // MARK: - Tests - Different Error Cases

    @Test("Init works with photoResourceNotFound error")
    func initWorksWithPhotoResourceNotFoundError() {
        // GIVEN
        let error = FileUploadError.photoResourceNotFound

        // WHEN
        let fileUpload = FileUpload(id: "error-id", name: nil, source: .photos, error: error)

        // THEN
        switch fileUpload.result {
        case .success:
            Issue.record("Expected failure")
        case .failure(let resultError):
            #expect(resultError == error)
        }
    }

    @Test("Init works with photoTransfer error")
    func initWorksWithPhotoTransferError() {
        // GIVEN
        let underlyingError = NSError(domain: "test", code: 100)
        let error = FileUploadError.photoTransfer(underlyingError)

        // WHEN
        let fileUpload = FileUpload(id: "error-id", name: nil, source: .photos, error: error)

        // THEN
        switch fileUpload.result {
        case .success:
            Issue.record("Expected failure")
        case .failure(let resultError):
            #expect(resultError == error)
        }
    }

    @Test("Init works with fileSizeNotFound error")
    func initWorksWithFileSizeNotFoundError() {
        // GIVEN
        let error = FileUploadError.fileSizeNotFound(nil)

        // WHEN
        let fileUpload = FileUpload(id: "error-id", name: nil, source: .files, error: error)

        // THEN
        switch fileUpload.result {
        case .success:
            Issue.record("Expected failure")
        case .failure(let resultError):
            #expect(resultError == error)
        }
    }

    @Test("Init works with fileDataConversion error")
    func initWorksWithFileDataConversionError() {
        // GIVEN
        let underlyingError = NSError(domain: "conversion", code: 200)
        let error = FileUploadError.fileDataConversion(underlyingError)

        // WHEN
        let fileUpload = FileUpload(id: "error-id", name: nil, source: .files, error: error)

        // THEN
        switch fileUpload.result {
        case .success:
            Issue.record("Expected failure")
        case .failure(let resultError):
            #expect(resultError == error)
        }
    }

    @Test("Init works with dropConversion error")
    func initWorksWithDropConversionError() {
        // GIVEN
        let underlyingError = NSError(domain: "drop", code: 300)
        let error = FileUploadError.dropConversion(underlyingError)

        // WHEN
        let fileUpload = FileUpload(id: "error-id", name: nil, source: .drop, error: error)

        // THEN
        switch fileUpload.result {
        case .success:
            Issue.record("Expected failure")
        case .failure(let resultError):
            #expect(resultError == error)
        }
    }

    @Test("Init works with other error")
    func initWorksWithOtherError() {
        // GIVEN
        let underlyingError = NSError(domain: "other", code: 400)
        let error = FileUploadError.other(underlyingError)

        // WHEN
        let fileUpload = FileUpload(id: "error-id", name: nil, source: .camera, error: error)

        // THEN
        switch fileUpload.result {
        case .success:
            Issue.record("Expected failure")
        case .failure(let resultError):
            #expect(resultError == error)
        }
    }

    // MARK: - Tests - Edge Cases

    @Test("Init works with empty name")
    func initWorksWithEmptyName() {
        // GIVEN
        let url = URL(fileURLWithPath: "/path/to/file.txt")

        // WHEN
        let fileUpload = FileUpload(
            id: "test-id",
            name: "",
            source: .files,
            result: .success(.init(
                url: url,
                data: .mock,
                fileExtension: "txt",
                size: 1024
            ))
        )

        // THEN
        #expect(fileUpload.name.isEmpty)
    }

    @Test("Init works with special characters in name")
    func initWorksWithSpecialCharactersInName() {
        // GIVEN
        let specialName = "file-name_2026 (1).pdf"
        let url = URL(fileURLWithPath: "/path/to/file.pdf")

        // WHEN
        let fileUpload = FileUpload(
            id: "test-id",
            name: specialName,
            source: .files,
            result: .success(.init(
                url: url,
                data: .mock,
                fileExtension: "pdf",
                size: 2048
            ))
        )

        // THEN
        #expect(fileUpload.name == specialName)
    }

    @Test("Init works with unicode characters in name")
    func initWorksWithUnicodeCharactersInName() {
        // GIVEN
        let unicodeName = "文档.pdf"
        let url = URL(fileURLWithPath: "/path/to/document.pdf")

        // WHEN
        let fileUpload = FileUpload(
            id: "test-id",
            name: unicodeName,
            source: .files,
            result: .success(.init(
                url: url,
                data: .mock,
                fileExtension: "pdf",
                size: 4096
            ))
        )

        // THEN
        #expect(fileUpload.name == unicodeName)
    }

    @Test("Multiple instances maintain independent values")
    func multipleInstancesMaintainIndependentValues() {
        // GIVEN
        let url1 = URL(fileURLWithPath: "/path/to/file1.txt")
        let url2 = URL(fileURLWithPath: "/path/to/file2.pdf")

        // WHEN
        let fileUpload1 = FileUpload(
            id: "id-1",
            name: "file1.txt",
            source: .files,
            result: .success(.init(
                url: url1,
                data: .mock,
                fileExtension: "txt",
                size: 1024
            ))
        )

        let fileUpload2 = FileUpload(
            id: "id-2",
            name: "file2.pdf",
            source: .photos,
            result: .success(.init(
                url: url2,
                data: .mock,
                fileExtension: "pdf",
                size: 2048
            ))
        )

        // THEN
        #expect(fileUpload1.id != fileUpload2.id)
        #expect(fileUpload1.name != fileUpload2.name)
        #expect(fileUpload1.source != fileUpload2.source)
    }

    // MARK: - Tests - Identifiable Conformance

    @Test("Identifiable conformance provides unique id")
    func identifiableConformanceProvidesUniqueId() {
        // GIVEN
        let url = URL(fileURLWithPath: "/path/to/file.txt")
        let fileUpload1 = FileUpload(
            id: "unique-1",
            name: "file.txt",
            source: .files,
            result: .success(.init(
                url: url,
                data: .mock,
                fileExtension: "txt",
                size: 1024
            ))
        )
        let fileUpload2 = FileUpload(
            id: "unique-2",
            name: "file.txt",
            source: .files,
            result: .success(.init(
                url: url,
                data: .mock,
                fileExtension: "txt",
                size: 1024
            ))
        )

        // WHEN / THEN
        #expect(fileUpload1.id != fileUpload2.id)
    }
}
