//
//  FileUploadDropzoneLayoutTests.swift
//  SparkComponentFileUploadTests
//
//  Created by robin.lemaire on 02/04/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentFileUpload
import Testing

@Suite("FileUploadDropzone Layout Tests")
struct FileUploadDropzoneLayoutTests {

    // MARK: - Tests

    @Test("Default initialization")
    func defaultInitialization() {
        // GIVEN / WHEN
        let layout = FileUploadDropzoneLayout()

        // THEN
        #expect(layout.verticalSpacing == .zero)
        #expect(layout.subVerticalSpacing == .zero)
        #expect(layout.padding == .zero)
    }

    @Test("Equality when same values")
    func equalityWhenSameValues() {
        // GIVEN / WHEN
        let layout1 = FileUploadDropzoneLayout(
            verticalSpacing: 16.0,
            subVerticalSpacing: 12.0,
            padding: 16.0
        )
        let layout2 = FileUploadDropzoneLayout(
            verticalSpacing: 16.0,
            subVerticalSpacing: 12.0,
            padding: 16.0
        )

        // THEN
        #expect(layout1 == layout2)
    }

    @Test("Inequality when different vertical spacing")
    func inequalityWhenDifferentVerticalSpacing() {
        // GIVEN / WHEN
        let layout1 = FileUploadDropzoneLayout(
            verticalSpacing: 16.0,
            subVerticalSpacing: 12.0,
            padding: 16.0
        )
        let layout2 = FileUploadDropzoneLayout(
            verticalSpacing: 20.0,
            subVerticalSpacing: 12.0,
            padding: 16.0
        )

        // THEN
        #expect(layout1 != layout2)
    }

    @Test("Inequality when different sub vertical spacing")
    func inequalityWhenDifferentSubVerticalSpacing() {
        // GIVEN / WHEN
        let layout1 = FileUploadDropzoneLayout(
            verticalSpacing: 16.0,
            subVerticalSpacing: 12.0,
            padding: 16.0
        )
        let layout2 = FileUploadDropzoneLayout(
            verticalSpacing: 16.0,
            subVerticalSpacing: 8.0,
            padding: 16.0
        )

        // THEN
        #expect(layout1 != layout2)
    }

    @Test("Inequality when different padding")
    func inequalityWhenDifferentPadding() {
        // GIVEN / WHEN
        let layout1 = FileUploadDropzoneLayout(
            verticalSpacing: 16.0,
            subVerticalSpacing: 12.0,
            padding: 16.0
        )
        let layout2 = FileUploadDropzoneLayout(
            verticalSpacing: 16.0,
            subVerticalSpacing: 12.0,
            padding: 20.0
        )

        // THEN
        #expect(layout1 != layout2)
    }
}
