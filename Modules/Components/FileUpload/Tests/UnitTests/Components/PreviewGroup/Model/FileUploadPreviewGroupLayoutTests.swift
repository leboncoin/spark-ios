//
//  FileUploadPreviewGroupLayoutTests.swift
//  SparkComponentFileUploadTests
//
//  Created by robin.lemaire on 24/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentFileUpload
import Testing

@Suite("FileUploadPreviewGroup Layout Tests")
struct FileUploadPreviewGroupLayoutTests {

    // MARK: - Tests

    @Test("Default initialization")
    func defaultInitialization() {
        // GIVEN / WHEN
        let layout = FileUploadPreviewGroupLayout()

        // THEN
        #expect(layout.spacing == .zero)
    }

    @Test("Equality when same values")
    func equalityWhenSameValues() {
        // GIVEN / WHEN
        let layout1 = FileUploadPreviewGroupLayout(spacing: 8.0)
        let layout2 = FileUploadPreviewGroupLayout(spacing: 8.0)

        // THEN
        #expect(layout1 == layout2)
    }

    @Test("Inequality when different spacing")
    func inequalityWhenDifferentSpacing() {
        // GIVEN / WHEN
        let layout1 = FileUploadPreviewGroupLayout(spacing: 8.0)
        let layout2 = FileUploadPreviewGroupLayout(spacing: 12.0)

        // THEN
        #expect(layout1 != layout2)
    }
}
