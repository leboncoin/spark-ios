//
//  FileUploadPreviewGroupAccessibilityIdentifierTests.swift
//  SparkComponentFileUploadTests
//
//  Created by robin.lemaire on 24/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentFileUpload
import Testing

@Suite("SparkFileUploadPreviewGroup AccessibilityIdentifier Tests")
struct FileUploadPreviewGroupAccessibilityIdentifierTests {

    // MARK: - Tests

    @Test("View accessibility identifier is spark-file-upload-preview-group-view")
    func viewAccessibilityIdentifier() {
        // GIVEN / WHEN / THEN
        #expect(FileUploadPreviewGroupAccessibilityIdentifier.view == "spark-file-upload-preview-group-view")
    }
}
