//
//  Array+FileUploadExtensionTests.swift
//  SparkComponentFileUploadTests
//
//  Created by robin.lemaire on 09/04/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentFileUpload
@_spi(SI_SPI) @testable import SparkComponentFileUploadTesting
import Testing
import Foundation

@Suite("Array FileUpload Extension Tests")
struct ArrayFileUploadExtensionTests {

    // MARK: - Tests

    // MARK: appendIfUnique Single Item Tests

    @Test("appendIfUnique with single item adds item when array is empty")
    func appendIfUniqueWithSingleItemAddsItemWhenArrayIsEmpty() {
        // GIVEN
        var files: [FileUpload] = []
        let newFile = FileUpload(
            id: "file1",
            name: "test.txt",
            source: .files,
            result: .success(.init(
                url: URL(fileURLWithPath: "/test.txt"),
                data: .mock,
                fileExtension: "txt",
                size: 100
            ))
        )

        // WHEN
        files.appendIfUnique(newFile)

        // THEN
        #expect(files.count == 1)
        #expect(files.first?.id == "file1")
    }

    @Test("appendIfUnique with single item adds item when not already present")
    func appendIfUniqueWithSingleItemAddsItemWhenNotAlreadyPresent() {
        // GIVEN
        let existingFile = FileUpload(
            id: "file1",
            name: "existing.txt",
            source: .files,
            result: .success(.init(
                url: URL(fileURLWithPath: "/existing.txt"),
                data: .mock,
                fileExtension: "txt",
                size: 100
            ))
        )
        var files: [FileUpload] = [existingFile]

        let newFile = FileUpload(
            id: "file2",
            name: "new.txt",
            source: .files,
            result: .success(.init(
                url: URL(fileURLWithPath: "/new.txt"),
                data: .mock,
                fileExtension: "txt",
                size: 200
            ))
        )

        // WHEN
        files.appendIfUnique(newFile)

        // THEN
        #expect(files.count == 2)
        #expect(files[0].id == "file1")
        #expect(files[1].id == "file2")
    }

    @Test("appendIfUnique with single item does not add duplicate item")
    func appendIfUniqueWithSingleItemDoesNotAddDuplicateItem() {
        // GIVEN
        let existingFile = FileUpload(
            id: "file1",
            name: "existing.txt",
            source: .files,
            result: .success(.init(
                url: URL(fileURLWithPath: "/existing.txt"),
                data: .mock,
                fileExtension: "txt",
                size: 100
            ))
        )
        var files: [FileUpload] = [existingFile]

        let duplicateFile = FileUpload(
            id: "file1",
            name: "duplicate.txt",
            source: .photos,
            result: .success(.init(
                url: URL(fileURLWithPath: "/duplicate.txt"),
                data: .mock,
                fileExtension: "txt",
                size: 200
            ))
        )

        // WHEN
        files.appendIfUnique(duplicateFile)

        // THEN
        #expect(files.count == 1)
        #expect(files.first?.id == "file1")
        #expect(files.first?.name == "existing.txt")
    }

    // MARK: appendIfUnique Multiple Items Tests

    @Test("appendIfUnique with multiple items adds all items when array is empty")
    func appendIfUniqueWithMultipleItemsAddsAllItemsWhenArrayIsEmpty() {
        // GIVEN
        var files: [FileUpload] = []
        let newFiles = [
            FileUpload(
                id: "file1",
                name: "test1.txt",
                source: .files,
                result: .success(.init(
                    url: URL(fileURLWithPath: "/test1.txt"),
                    data: .mock,
                    fileExtension: "txt",
                    size: 100
                ))
            ),
            FileUpload(
                id: "file2",
                name: "test2.txt",
                source: .files,
                result: .success(.init(
                    url: URL(fileURLWithPath: "/test2.txt"),
                    data: .mock,
                    fileExtension: "txt",
                    size: 200
                ))
            )
        ]

        // WHEN
        files.appendIfUnique(newFiles)

        // THEN
        #expect(files.count == 2)
        #expect(files[0].id == "file1")
        #expect(files[1].id == "file2")
    }

    @Test("appendIfUnique with multiple items adds only unique items")
    func appendIfUniqueWithMultipleItemsAddsOnlyUniqueItems() {
        // GIVEN
        let existingFile = FileUpload(
            id: "file1",
            name: "existing.txt",
            source: .files,
            result: .success(.init(
                url: URL(fileURLWithPath: "/existing.txt"),
                data: .mock,
                fileExtension: "txt",
                size: 100
            ))
        )
        var files: [FileUpload] = [existingFile]

        let newFiles = [
            FileUpload(
                id: "file1",
                name: "duplicate.txt",
                source: .files,
                result: .success(.init(
                    url: URL(fileURLWithPath: "/duplicate.txt"),
                    data: .mock,
                    fileExtension: "txt",
                    size: 150
                ))
            ),
            FileUpload(
                id: "file2",
                name: "new.txt",
                source: .files,
                result: .success(.init(
                    url: URL(fileURLWithPath: "/new.txt"),
                    data: .mock,
                    fileExtension: "txt",
                    size: 200
                ))
            ),
            FileUpload(
                id: "file3",
                name: "new2.txt",
                source: .photos,
                result: .success(.init(
                    url: URL(fileURLWithPath: "/new2.txt"),
                    data: .mock,
                    fileExtension: "txt",
                    size: 300
                ))
            )
        ]

        // WHEN
        files.appendIfUnique(newFiles)

        // THEN
        #expect(files.count == 3)
        #expect(files[0].id == "file1")
        #expect(files[0].name == "existing.txt")
        #expect(files[1].id == "file2")
        #expect(files[2].id == "file3")
    }

    @Test("appendIfUnique with multiple items does not add any duplicates")
    func appendIfUniqueWithMultipleItemsDoesNotAddAnyDuplicates() {
        // GIVEN
        let existingFiles = [
            FileUpload(
                id: "file1",
                name: "existing1.txt",
                source: .files,
                result: .success(.init(
                    url: URL(fileURLWithPath: "/existing1.txt"),
                    data: .mock,
                    fileExtension: "txt",
                    size: 100
                ))
            ),
            FileUpload(
                id: "file2",
                name: "existing2.txt",
                source: .files,
                result: .success(.init(
                    url: URL(fileURLWithPath: "/existing2.txt"),
                    data: .mock,
                    fileExtension: "txt",
                    size: 200
                ))
            )
        ]
        var files: [FileUpload] = existingFiles

        let duplicateFiles = [
            FileUpload(
                id: "file1",
                name: "duplicate1.txt",
                source: .photos,
                result: .success(.init(
                    url: URL(fileURLWithPath: "/duplicate1.txt"),
                    data: .mock,
                    fileExtension: "txt",
                    size: 150
                ))
            ),
            FileUpload(
                id: "file2",
                name: "duplicate2.txt",
                source: .camera,
                result: .success(.init(
                    url: URL(fileURLWithPath: "/duplicate2.txt"),
                    data: .mock,
                    fileExtension: "txt",
                    size: 250
                ))
            )
        ]

        // WHEN
        files.appendIfUnique(duplicateFiles)

        // THEN
        #expect(files.count == 2)
        #expect(files[0].id == "file1")
        #expect(files[0].name == "existing1.txt")
        #expect(files[1].id == "file2")
        #expect(files[1].name == "existing2.txt")
    }

    @Test("appendIfUnique with empty array does not modify original array")
    func appendIfUniqueWithEmptyArrayDoesNotModifyOriginalArray() {
        // GIVEN
        let existingFile = FileUpload(
            id: "file1",
            name: "existing.txt",
            source: .files,
            result: .success(.init(
                url: URL(fileURLWithPath: "/existing.txt"),
                data: .mock,
                fileExtension: "txt",
                size: 100
            ))
        )
        var files: [FileUpload] = [existingFile]
        let emptyArray: [FileUpload] = []

        // WHEN
        files.appendIfUnique(emptyArray)

        // THEN
        #expect(files.count == 1)
        #expect(files.first?.id == "file1")
    }

    // MARK: notContains String Tests

    @Test("notContains with string returns true when id not in array")
    func notContainsWithStringReturnsTrueWhenIdNotInArray() {
        // GIVEN
        let files: [FileUpload] = [
            FileUpload(
                id: "file1",
                name: "test1.txt",
                source: .files,
                result: .success(.init(
                    url: URL(fileURLWithPath: "/test1.txt"),
                    data: .mock,
                    fileExtension: "txt",
                    size: 100
                ))
            ),
            FileUpload(
                id: "file2",
                name: "test2.txt",
                source: .files,
                result: .success(.init(
                    url: URL(fileURLWithPath: "/test2.txt"),
                    data: .mock,
                    fileExtension: "txt",
                    size: 200
                ))
            )
        ]

        // WHEN
        let result = files.notContains("file3")

        // THEN
        #expect(result == true)
    }

    @Test("notContains with string returns false when id exists in array")
    func notContainsWithStringReturnsFalseWhenIdExistsInArray() {
        // GIVEN
        let files: [FileUpload] = [
            FileUpload(
                id: "file1",
                name: "test1.txt",
                source: .files,
                result: .success(.init(
                    url: URL(fileURLWithPath: "/test1.txt"),
                    data: .mock,
                    fileExtension: "txt",
                    size: 100
                ))
            ),
            FileUpload(
                id: "file2",
                name: "test2.txt",
                source: .files,
                result: .success(.init(
                    url: URL(fileURLWithPath: "/test2.txt"),
                    data: .mock,
                    fileExtension: "txt",
                    size: 200
                ))
            )
        ]

        // WHEN
        let result = files.notContains("file2")

        // THEN
        #expect(result == false)
    }

    @Test("notContains with string returns true when array is empty")
    func notContainsWithStringReturnsTrueWhenArrayIsEmpty() {
        // GIVEN
        let files: [FileUpload] = []

        // WHEN
        let result = files.notContains("file1")

        // THEN
        #expect(result == true)
    }

    // MARK: Edge Case Tests

    @Test("appendIfUnique handles files with same id but different sources")
    func appendIfUniqueHandlesFilesWithSameIdButDifferentSources() {
        // GIVEN
        let existingFile = FileUpload(
            id: "file1",
            name: "photo.jpg",
            source: .photos,
            result: .success(.init(
                url: URL(fileURLWithPath: "/photo.jpg"),
                data: .mock,
                fileExtension: "jpg",
                size: 1000
            ))
        )
        var files: [FileUpload] = [existingFile]

        let newFile = FileUpload(
            id: "file1",
            name: "photo.jpg",
            source: .camera,
            result: .success(.init(
                url: URL(fileURLWithPath: "/photo.jpg"),
                data: .mock,
                fileExtension: "jpg",
                size: 1000
            ))
        )

        // WHEN
        files.appendIfUnique(newFile)

        // THEN
        #expect(files.count == 1)
        #expect(files.first?.source == .photos)
    }

    @Test("appendIfUnique handles files with failed results")
    func appendIfUniqueHandlesFilesWithFailedResults() {
        // GIVEN
        var files: [FileUpload] = []
        let failedFile = FileUpload(
            id: "file1",
            name: "failed.txt",
            source: .files,
            result: .failure(.photoResourceNotFound)
        )

        // WHEN
        files.appendIfUnique(failedFile)

        // THEN
        #expect(files.count == 1)
        #expect(files.first?.id == "file1")
        #expect(files.first?.isSucceed == false)
    }

    @Test("appendIfUnique with multiple items handles mixed success and failure results")
    func appendIfUniqueWithMultipleItemsHandlesMixedSuccessAndFailureResults() {
        // GIVEN
        var files: [FileUpload] = []
        let mixedFiles = [
            FileUpload(
                id: "file1",
                name: "success.txt",
                source: .files,
                result: .success(.init(
                    url: URL(fileURLWithPath: "/success.txt"),
                    data: .mock,
                    fileExtension: "txt",
                    size: 100
                ))
            ),
            FileUpload(
                id: "file2",
                name: "failed.txt",
                source: .photos,
                result: .failure(.photoResourceNotFound)
            ),
            FileUpload(
                id: "file3",
                name: "success2.txt",
                source: .camera,
                result: .success(.init(
                    url: URL(fileURLWithPath: "/success2.txt"),
                    data: .mock,
                    fileExtension: "txt",
                    size: 200
                ))
            )
        ]

        // WHEN
        files.appendIfUnique(mixedFiles)

        // THEN
        #expect(files.count == 3)
        #expect(files[0].isSucceed == true)
        #expect(files[1].isSucceed == false)
        #expect(files[2].isSucceed == true)
    }
}
