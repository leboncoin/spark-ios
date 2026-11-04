//
//  FileUploadButtonConstantsTests.swift
//  SparkComponentFileUploadTests
//
//  Created by robin.lemaire on 20/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentFileUpload
import Testing

@Suite("FileUpload Constants Tests")
struct FileUploadButtonConstantsTests {

    // MARK: - Tests

    @Test("jpegCompressionQuality is 0.8")
    func jpegCompressionQualityIs0Point8() {
        // GIVEN / WHEN / THEN
        #expect(FileUploadButtonConstants.jpegCompressionQuality == 0.8)
    }
}
