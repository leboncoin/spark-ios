//
//  FileUploadPreviewStatusTests.swift
//  SparkComponentFileUploadTests
//
//  Created by robin.lemaire on 24/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentFileUpload
import Testing

@Suite("FileUploadPreview Status Tests")
struct FileUploadPreviewStatusTests {

    // MARK: - Tests

    @Test("All cases contains expected cases")
    func allCasesContainsExpectedCases() {
        // GIVEN
        let expectedCases: [FileUploadPreviewStatus] = [.succeed, .failed]

        // WHEN / THEN
        #expect(FileUploadPreviewStatus.allCases.count == expectedCases.count)
        #expect(Set(FileUploadPreviewStatus.allCases) == Set(expectedCases))
    }

    @Test("Default value is succeed")
    func defaultValueIsSucceed() {
        // GIVEN / WHEN / THEN
        #expect(FileUploadPreviewStatus.default == .succeed)
    }
}
