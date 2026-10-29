//
//  FileUploadToken+PreviewSizeTests.swift
//  SparkComponentFileUploadTests
//
//  Created by Robin Lemaire on 02/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
import Foundation
@testable import SparkComponentFileUpload

// MARK: - Tests

struct FileUploadTokenPreviewSizeTests {

    // MARK: - Properties

    private let token = FileUploadToken.Preview.Size()

    // MARK: - Tests

    @Test("Image should return 24")
    func imageShouldReturn24() {
        // GIVEN / WHEN
        let result = self.token.image

        // THEN
        #expect(result == 24)
    }

    @Test("Image container should return 36")
    func imageContainerShouldReturn36() {
        // GIVEN / WHEN
        let result = self.token.imageContainer

        // THEN
        #expect(result == 36)
    }
}
