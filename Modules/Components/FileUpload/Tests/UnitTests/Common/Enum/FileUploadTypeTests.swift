//
//  FileUploadTypeTests.swift
//  SparkComponentFileUploadTests
//
//  Created by robin.lemaire on 24/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentFileUpload
import Testing

@Suite("FileUpload Type Tests")
struct FileUploadTypeTests {

    // MARK: - Tests

    @Test("All cases contains expected cases")
    func allCasesContainsExpectedCases() {
        // GIVEN
        let expectedCases: [FileUploadType] = [.file, .image, .pdf, .video]

        // WHEN / THEN
        #expect(FileUploadType.allCases.count == expectedCases.count)
        #expect(Set(FileUploadType.allCases) == Set(expectedCases))
    }

    @Test("Default value is file")
    func defaultValueIsFile() {
        // GIVEN / WHEN / THEN
        #expect(FileUploadType.default == .file)
    }
}
