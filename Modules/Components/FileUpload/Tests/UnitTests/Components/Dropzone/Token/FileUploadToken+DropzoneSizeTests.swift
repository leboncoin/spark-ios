//
//  FileUploadToken+DropzoneSizeTests.swift
//  SparkComponentFileUploadTests
//
//  Created by Robin Lemaire on 02/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
import Foundation
@testable import SparkComponentFileUpload

// MARK: - Tests

struct FileUploadTokenDropzoneSizeTests {

    // MARK: - Properties

    private let token = FileUploadToken.Dropzone.Size()

    // MARK: - Tests

    @Test
    func imageShouldReturn24() {
        // GIVEN / WHEN
        let result = self.token.image

        // THEN
        #expect(result == 24)
    }
}
