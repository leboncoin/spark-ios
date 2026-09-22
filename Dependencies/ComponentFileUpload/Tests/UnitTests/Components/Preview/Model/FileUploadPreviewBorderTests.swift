//
//  FileUploadPreviewBorderTests.swift
//  SparkComponentFileUploadTests
//
//  Created by robin.lemaire on 24/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentFileUpload
import Testing

@Suite("FileUploadPreview Border Tests")
struct FileUploadPreviewBorderTests {

    // MARK: - Tests

    @Test("Default initialization")
    func defaultInitialization() {
        // GIVEN / WHEN
        let border = FileUploadPreviewBorder()

        // THEN
        #expect(border.width == .zero)
        #expect(border.radius == .zero)
        #expect(border.imageRadius == .zero)
    }

    @Test("Equality when same values")
    func equalityWhenSameValues() {
        // GIVEN / WHEN
        let border1 = FileUploadPreviewBorder(width: 1.0, radius: 8.0, imageRadius: 18.0)
        let border2 = FileUploadPreviewBorder(width: 1.0, radius: 8.0, imageRadius: 18.0)

        // THEN
        #expect(border1 == border2)
    }

    @Test("Inequality when different width")
    func inequalityWhenDifferentWidth() {
        // GIVEN / WHEN
        let border1 = FileUploadPreviewBorder(width: 1.0, radius: 8.0, imageRadius: 18.0)
        let border2 = FileUploadPreviewBorder(width: 2.0, radius: 8.0, imageRadius: 18.0)

        // THEN
        #expect(border1 != border2)
    }

    @Test("Inequality when different radius")
    func inequalityWhenDifferentRadius() {
        // GIVEN / WHEN
        let border1 = FileUploadPreviewBorder(width: 1.0, radius: 8.0, imageRadius: 18.0)
        let border2 = FileUploadPreviewBorder(width: 1.0, radius: 12.0, imageRadius: 18.0)

        // THEN
        #expect(border1 != border2)
    }

    @Test("Inequality when different imageRadius")
    func inequalityWhenDifferentImageRadius() {
        // GIVEN / WHEN
        let border1 = FileUploadPreviewBorder(width: 1.0, radius: 8.0, imageRadius: 18.0)
        let border2 = FileUploadPreviewBorder(width: 1.0, radius: 8.0, imageRadius: 20.0)

        // THEN
        #expect(border1 != border2)
    }
}
