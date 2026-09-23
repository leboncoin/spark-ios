//
//  FileUploadPreviewAccessibilityIdentifierTests.swift
//  SparkComponentFileUploadTests
//
//  Created by robin.lemaire on 24/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentFileUpload
import Testing

@Suite("SparkFileUploadPreview AccessibilityIdentifier Tests")
struct FileUploadPreviewAccessibilityIdentifierTests {

    // MARK: - Tests

    @Test("View accessibility identifier is spark-file-upload-preview-view")
    func viewAccessibilityIdentifier() {
        // GIVEN / WHEN / THEN
        #expect(FileUploadPreviewAccessibilityIdentifier.view == "spark-file-upload-preview-view")
    }
}
