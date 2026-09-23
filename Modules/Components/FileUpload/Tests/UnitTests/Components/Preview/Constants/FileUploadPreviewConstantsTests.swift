//
//  FileUploadPreviewConstantsTests.swift
//  SparkComponentFileUploadTests
//
//  Created by robin.lemaire on 24/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentFileUpload
import SparkComponentButton
import Testing

@Suite("SparkFileUploadPreview Constants Tests")
struct FileUploadPreviewConstantsTests {

    // MARK: - Tests

    @Test("Pressed scaled is 1.02")
    func pressedScaledIs1Point02() {
        // GIVEN / WHEN / THEN
        #expect(FileUploadPreviewConstants.pressedScaled == 1.02)
    }

    @Test("Animation duration is 0.1")
    func animationDurationIs0Point1() {
        // GIVEN / WHEN / THEN
        #expect(FileUploadPreviewConstants.animationDuration == 0.1)
    }

    @Test("Button intent is surface")
    func buttonIntentIsSurface() {
        // GIVEN / WHEN / THEN
        #expect(FileUploadPreviewConstants.Button.intent == .surface)
    }

    @Test("Button variant is contrast")
    func buttonVariantIsContrast() {
        // GIVEN / WHEN / THEN
        #expect(FileUploadPreviewConstants.Button.variant == .contrast)
    }

    @Test("Button size is small")
    func buttonSizeIsSmall() {
        // GIVEN / WHEN / THEN
        #expect(FileUploadPreviewConstants.Button.size == .small)
    }

    @Test("Image size is 24")
    func imageSizeIs24() {
        // GIVEN / WHEN / THEN
        #expect(FileUploadPreviewConstants.Image.size == 24)
    }

    @Test("Image container size is 36")
    func imageContainerSizeIs36() {
        // GIVEN / WHEN / THEN
        #expect(FileUploadPreviewConstants.Image.containerSize == 36)
    }
}
