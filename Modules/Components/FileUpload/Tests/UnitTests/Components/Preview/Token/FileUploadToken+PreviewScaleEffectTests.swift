//
//  FileUploadToken+PreviewScaleEffectTests.swift
//  SparkComponentFileUploadTests
//
//  Created by Robin Lemaire on 02/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
import Foundation
@testable import SparkComponentFileUpload

// MARK: - Tests

struct FileUploadTokenPreviewScaleEffectTests {

    // MARK: - Properties

    private let token = FileUploadToken.Preview.ScaleEffect()

    // MARK: - Tests

    @Test("Value should return expected scale", arguments: [
        (isPressed: true, expected: CGFloat(1.02)),
        (isPressed: false, expected: CGFloat(1.0))
    ])
    func valueShouldReturnExpectedScale(isPressed: Bool, expected: CGFloat) {
        // GIVEN / WHEN
        let result = self.token.value(isPressed: isPressed)

        // THEN
        #expect(result == expected)
    }
}
