//
//  FileUploadToken+ButtonTests.swift
//  SparkComponentFileUploadTests
//
//  Created by Robin Lemaire on 02/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
import Foundation
@testable import SparkComponentFileUpload

// MARK: - Tests

struct FileUploadTokenButtonTests {

    // MARK: - Properties

    private let token = FileUploadToken.Button()

    // MARK: - Tests

    @Test
    func stylesShouldReturnStyles() {
        // GIVEN / WHEN
        let result = self.token.styles

        // THEN
        #expect(result == .init())
    }
}
