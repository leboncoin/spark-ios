//
//  FileUploadPreviewConstantsTests.swift
//  SparkComponentFileUploadTests
//
//  Created by robin.lemaire on 24/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentFileUpload
import Testing

@Suite("SparkFileUploadPreview Constants Tests")
struct FileUploadPreviewConstantsTests {

    // MARK: - Tests

    @Test("Animation duration is 0.1")
    func animationDurationIs0Point1() {
        // GIVEN / WHEN / THEN
        #expect(FileUploadPreviewConstants.animationDuration == 0.1)
    }
}
