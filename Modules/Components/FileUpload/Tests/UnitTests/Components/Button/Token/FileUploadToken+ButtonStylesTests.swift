//
//  FileUploadToken+ButtonStylesTests.swift
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

struct FileUploadTokenButtonStylesTests {

    // MARK: - Properties

    private let token = FileUploadToken.Button.Styles()

    // MARK: - Tests

    @Test
    func alignmentShouldReturnLeadingImage() {
        // GIVEN / WHEN
        let result = self.token.alignment

        // THEN
        #expect(result == .leadingImage)
    }

    @Test
    func intentShouldReturnSupport() {
        // GIVEN / WHEN
        let result = self.token.intent

        // THEN
        #expect(result == .support)
    }

    @Test
    func variantShouldReturnDefault() {
        // GIVEN / WHEN
        let result = self.token.variant

        // THEN
        #expect(result == .default)
    }
}
