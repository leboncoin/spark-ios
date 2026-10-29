//
//  TextLinkImageSizeTests.swift
//  SparkComponentTextLinkUnitTests
//
//  Created by robin.lemaire on 25/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentTextLink

@Suite("Text Link Image Size Tests")
struct TextLinkImageSizeTests {

    // MARK: - Tests

    @Test("Init default values")
    func initDefaultValues() {
        // GIVEN / WHEN
        let imageSize = TextLinkImageSize()

        // THEN
        #expect(imageSize.size == 0, "Size should be 0")
        #expect(imageSize.padding == 0, "Padding should be 0")
    }

    @Test("Init with custom values")
    func initWithCustomValues() {
        // GIVEN / WHEN
        var imageSize = TextLinkImageSize()
        imageSize.size = 16.0
        imageSize.padding = 4.0

        // THEN
        #expect(imageSize.size == 16.0, "Size should match set value")
        #expect(imageSize.padding == 4.0, "Padding should match set value")
    }

    @Test("Equatable same default instances")
    func equatableSameDefaultInstances() {
        // GIVEN
        let imageSize1 = TextLinkImageSize()
        let imageSize2 = TextLinkImageSize()

        // WHEN / THEN
        #expect(imageSize1 == imageSize2, "Two default instances should be equal")
    }

    @Test("Equatable same custom values")
    func equatableSameCustomValues() {
        // GIVEN
        var imageSize1 = TextLinkImageSize()
        var imageSize2 = TextLinkImageSize()

        imageSize1.size = 25.0
        imageSize1.padding = 7.0

        imageSize2.size = 25.0
        imageSize2.padding = 7.0

        // WHEN / THEN
        #expect(imageSize1 == imageSize2, "Instances with same values should be equal")
    }

    @Test("Different size only")
    func differentSizeOnly() {
        // GIVEN
        var imageSize1 = TextLinkImageSize()
        var imageSize2 = TextLinkImageSize()

        imageSize1.size = 15.0
        imageSize2.size = 20.0

        // WHEN / THEN
        #expect(imageSize1 != imageSize2, "Instances with different size only should not be equal")
    }

    @Test("Different padding only")
    func differentPaddingOnly() {
        // GIVEN
        var imageSize1 = TextLinkImageSize()
        var imageSize2 = TextLinkImageSize()

        imageSize1.padding = 4.0
        imageSize2.padding = 8.0

        // WHEN / THEN
        #expect(imageSize1 != imageSize2, "Instances with different padding only should not be equal")
    }
}
