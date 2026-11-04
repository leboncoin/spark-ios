//
//  FileUploadToken+PreviewButtonTests.swift
//  SparkComponentFileUploadTests
//
//  Created by Robin Lemaire on 02/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
import Foundation
@testable import SparkComponentFileUpload
import SparkComponentButton

// MARK: - Tests

struct FileUploadTokenPreviewButtonTests {

    // MARK: - Properties

    private let token = FileUploadToken.Preview.Button()

    // MARK: - Tests

    @Test
    func intentShouldReturnSurface() {
        // GIVEN / WHEN
        let result = self.token.intent

        // THEN
        #expect(result == .surface)
    }

    @Test
    func variantShouldReturnContrast() {
        // GIVEN / WHEN
        let result = self.token.variant

        // THEN
        #expect(result == .contrast)
    }

    @Test
    func sizeShouldReturnSmall() {
        // GIVEN / WHEN
        let result = self.token.size

        // THEN
        #expect(result == .small)
    }
}
