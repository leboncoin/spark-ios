//
//  FileUploadButtonConstantsTests.swift
//  SparkComponentFileUploadTests
//
//  Created by robin.lemaire on 20/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentFileUpload
import SparkComponentButton
import Testing

@Suite("FileUpload Constants Tests")
struct FileUploadButtonConstantsTests {

    // MARK: - Tests

    @Test("jpegCompressionQuality is 0.8")
    func jpegCompressionQualityIs0Point8() {
        // GIVEN / WHEN / THEN
        #expect(FileUploadButtonConstants.jpegCompressionQuality == 0.8)
    }

    // MARK: - Styles Tests

    @Test("Alignment is leadingImage")
    func alignmentIsLeadingImage() {
        // GIVEN / WHEN / THEN
        #expect(FileUploadButtonConstants.ButtonStyles.alignment == .leadingImage)
    }

    @Test("Intent is support")
    func intentIsSupport() {
        // GIVEN / WHEN / THEN
        #expect(FileUploadButtonConstants.ButtonStyles.intent == .support)
    }

    @Test("Variant is default")
    func variantIsDefault() {
        // GIVEN / WHEN / THEN
        #expect(FileUploadButtonConstants.ButtonStyles.variant == .default)
    }
}
