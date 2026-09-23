//
//  FileUploadPreviewLayoutTests.swift
//  SparkComponentFileUploadTests
//
//  Created by robin.lemaire on 24/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentFileUpload
import Testing

@Suite("FileUploadPreview Layout Tests")
struct FileUploadPreviewLayoutTests {

    // MARK: - Tests

    @Test("Default initialization")
    func defaultInitialization() {
        // GIVEN / WHEN
        let layout = FileUploadPreviewLayout()

        // THEN
        #expect(layout.spacing == .zero)
        #expect(layout.horizontalPadding == .zero)
        #expect(layout.verticalPadding == .zero)
    }

    @Test("Equality when same values")
    func equalityWhenSameValues() {
        // GIVEN / WHEN
        let layout1 = FileUploadPreviewLayout(
            spacing: 8.0,
            horizontalPadding: 16.0,
            verticalPadding: 12.0
        )
        let layout2 = FileUploadPreviewLayout(
            spacing: 8.0,
            horizontalPadding: 16.0,
            verticalPadding: 12.0
        )

        // THEN
        #expect(layout1 == layout2)
    }

    @Test("Inequality when different horizontal spacing")
    func inequalityWhenDifferentSpacing() {
        // GIVEN / WHEN
        let layout1 = FileUploadPreviewLayout(
            spacing: 8.0,
            horizontalPadding: 16.0,
            verticalPadding: 12.0
        )
        let layout2 = FileUploadPreviewLayout(
            spacing: 12.0,
            horizontalPadding: 16.0,
            verticalPadding: 12.0
        )

        // THEN
        #expect(layout1 != layout2)
    }

    @Test("Inequality when different horizontal padding")
    func inequalityWhenDifferentHorizontalPadding() {
        // GIVEN / WHEN
        let layout1 = FileUploadPreviewLayout(
            spacing: 8.0,
            horizontalPadding: 16.0,
            verticalPadding: 12.0
        )
        let layout2 = FileUploadPreviewLayout(
            spacing: 8.0,
            horizontalPadding: 20.0,
            verticalPadding: 12.0
        )

        // THEN
        #expect(layout1 != layout2)
    }

    @Test("Inequality when different vertical padding")
    func inequalityWhenDifferentVerticalPadding() {
        // GIVEN / WHEN
        let layout1 = FileUploadPreviewLayout(
            spacing: 8.0,
            horizontalPadding: 16.0,
            verticalPadding: 12.0
        )
        let layout2 = FileUploadPreviewLayout(
            spacing: 8.0,
            horizontalPadding: 16.0,
            verticalPadding: 16.0
        )

        // THEN
        #expect(layout1 != layout2)
    }
}
