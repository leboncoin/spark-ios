//
//  UTType+DefaultsExtensionTests.swift
//  SparkComponentFileUploadTests
//
//  Created by robin.lemaire on 24/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentFileUpload
import Testing
import UniformTypeIdentifiers

@Suite("UTType Defaults Extension Tests")
struct UTTypeDefaultsExtensionTests {

    // MARK: - Tests

    @Test("Spark defaults returns expected UTTypes")
    func sparkDefaultsReturnsExpectedUTTypes() {
        // GIVEN
        let expectedTypes: [UTType] = [.pdf, .movie, .image, .text, .plainText]

        // WHEN
        let sparkDefaults = [UTType].sparkDefaults

        // THEN
        #expect(sparkDefaults.count == expectedTypes.count)
        #expect(sparkDefaults.count == 5)
        #expect(sparkDefaults == expectedTypes)
    }
}
