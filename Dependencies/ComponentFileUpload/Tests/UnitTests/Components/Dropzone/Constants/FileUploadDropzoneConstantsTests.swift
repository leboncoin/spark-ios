//
//  FileUploadDropzoneConstantsTests.swift
//  SparkComponentFileUploadTests
//
//  Created by robin.lemaire on 02/04/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentFileUpload
import Testing

@Suite("SparkFileUploadDropzone Constants Tests")
struct FileUploadDropzoneConstantsTests {

    // MARK: - Tests

    @Test("Image size is 24")
    func imageSizeIs24() {
        // GIVEN / WHEN / THEN
        #expect(FileUploadDropzoneConstants.imageSize == 24)
    }

    @Test("Border dashed is 2")
    func borderDashedIs2() {
        // GIVEN / WHEN / THEN
        #expect(FileUploadDropzoneConstants.borderDashed == 2)
    }
}
