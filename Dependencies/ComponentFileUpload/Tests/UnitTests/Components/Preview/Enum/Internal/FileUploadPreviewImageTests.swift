//
//  FileUploadPreviewImageTests.swift
//  SparkComponentFileUploadTests
//
//  Created by robin.lemaire on 24/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentFileUpload
@_spi(SI_SPI) import SparkCommon
import SparkResources
import SwiftUI
import Testing

@Suite("FileUploadPreview Image Tests")
struct FileUploadPreviewImageTests {

    // MARK: - SwiftUI Image Tests

    @Test("SwiftUI image for file is sparkFileOutline")
    func swiftUIImageForFileIsSparkFileOutline() {
        // GIVEN
        let image = FileUploadPreviewImage.file

        // WHEN / THEN
        #expect(image.swiftUIImage == Image(spark: \.fileOutline))
    }

    @Test("SwiftUI image for image is sparkImageOutline")
    func swiftUIImageForImageIsSparkImageOutline() {
        // GIVEN
        let image = FileUploadPreviewImage.image

        // WHEN / THEN
        #expect(image.swiftUIImage == Image(spark: \.imageOutline))
    }

    @Test("SwiftUI image for pdf is sparkPdfOutline")
    func swiftUIImageForPdfIsSparkPdfOutline() {
        // GIVEN
        let image = FileUploadPreviewImage.pdf

        // WHEN / THEN
        #expect(image.swiftUIImage == Image(spark: \.pdfOutline))
    }

    @Test("SwiftUI image for video is sparkPlayOutline")
    func swiftUIImageForVideoIsSparkPlayOutline() {
        // GIVEN
        let image = FileUploadPreviewImage.video

        // WHEN / THEN
        #expect(image.swiftUIImage == Image(spark: \.playOutline))
    }

    @Test("SwiftUI image for error is sparkWarningOutline")
    func swiftUIImageForErrorIsSparkWarningOutline() {
        // GIVEN
        let image = FileUploadPreviewImage.error

        // WHEN / THEN
        #expect(image.swiftUIImage == Image(spark: \.warningOutline))
    }
}
