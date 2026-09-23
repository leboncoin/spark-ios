//
//  FileUploadDropzoneBorderTests.swift
//  SparkComponentFileUploadTests
//
//  Created by robin.lemaire on 02/04/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentFileUpload
import Testing

@Suite("FileUploadDropzone Border Tests")
struct FileUploadDropzoneBorderTests {

    // MARK: - Tests

    @Test("Default initialization")
    func defaultInitialization() {
        // GIVEN / WHEN
        let border = FileUploadDropzoneBorder()

        // THEN
        #expect(border.width == .zero)
        #expect(border.radius == .zero)
    }

    @Test("Equality when same values")
    func equalityWhenSameValues() {
        // GIVEN / WHEN
        let border1 = FileUploadDropzoneBorder(width: 1.0, radius: 8.0)
        let border2 = FileUploadDropzoneBorder(width: 1.0, radius: 8.0)

        // THEN
        #expect(border1 == border2)
    }

    @Test("Inequality when different width")
    func inequalityWhenDifferentWidth() {
        // GIVEN / WHEN
        let border1 = FileUploadDropzoneBorder(width: 1.0, radius: 8.0)
        let border2 = FileUploadDropzoneBorder(width: 2.0, radius: 8.0)

        // THEN
        #expect(border1 != border2)
    }

    @Test("Inequality when different radius")
    func inequalityWhenDifferentRadius() {
        // GIVEN / WHEN
        let border1 = FileUploadDropzoneBorder(width: 1.0, radius: 8.0)
        let border2 = FileUploadDropzoneBorder(width: 1.0, radius: 12.0)

        // THEN
        #expect(border1 != border2)
    }
}
