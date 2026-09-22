//
//  PHPickerFilter+DefaultsExtensionTests.swift
//  SparkComponentFileUploadTests
//
//  Created by robin.lemaire on 24/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentFileUpload
import PhotosUI
import Testing

@Suite("PHPickerFilter Defaults Extension Tests")
struct PHPickerFilterDefaultsExtensionTests {

    // MARK: - Tests

    @Test("Spark defaults returns expected filters")
    func sparkDefaultsReturnsExpectedFilters() {
        // GIVEN
        let expectedFilters: [PHPickerFilter] = [.images, .videos]

        // WHEN
        let sparkDefaults = [PHPickerFilter].sparkDefaults

        // THEN
        #expect(sparkDefaults.count == expectedFilters.count)
        #expect(sparkDefaults.count == 2)
        #expect(sparkDefaults == expectedFilters)
    }
}
