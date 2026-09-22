//
//  FileUploadDropzoneAccessibilityIdentifierTests.swift
//  SparkComponentFileUploadTests
//
//  Created by robin.lemaire on 02/04/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentFileUpload
import Testing

@Suite("SparkFileUploadDropzone AccessibilityIdentifier Tests")
struct FileUploadDropzoneAccessibilityIdentifierTests {

    // MARK: - Tests

    @Test("View accessibility identifier is spark-file-upload-dropzone-view")
    func viewAccessibilityIdentifier() {
        // GIVEN / WHEN / THEN
        #expect(FileUploadDropzoneAccessibilityIdentifier.view == "spark-file-upload-dropzone-view")
    }
}
