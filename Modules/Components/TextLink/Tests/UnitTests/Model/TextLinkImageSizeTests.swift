//
//  TextLinkImageSizeTests.swift
//  SparkComponentTextLinkUnitTests
//
//  Created by robin.lemaire on 25/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentTextLink

final class TextLinkImageSizeTests: XCTestCase {

    // MARK: - Tests

    func test_init_default_values() {
        // GIVEN / WHEN
        let imageSize = TextLinkImageSize()

        // THEN
        XCTAssertEqual(imageSize.size, 0, "Size should be 0")
        XCTAssertEqual(imageSize.padding, 0, "Padding should be 0")
    }

    func test_init_with_custom_values() {
        // GIVEN / WHEN
        var imageSize = TextLinkImageSize()
        imageSize.size = 16.0
        imageSize.padding = 4.0

        // THEN
        XCTAssertEqual(imageSize.size, 16.0, "Size should match set value")
        XCTAssertEqual(imageSize.padding, 4.0, "Padding should match set value")
    }

    func test_equatable_same_default_instances() {
        // GIVEN
        let imageSize1 = TextLinkImageSize()
        let imageSize2 = TextLinkImageSize()

        // WHEN / THEN
        XCTAssertEqual(imageSize1, imageSize2, "Two default instances should be equal")
    }

    func test_equatable_same_custom_values() {
        // GIVEN
        var imageSize1 = TextLinkImageSize()
        var imageSize2 = TextLinkImageSize()

        imageSize1.size = 25.0
        imageSize1.padding = 7.0

        imageSize2.size = 25.0
        imageSize2.padding = 7.0

        // WHEN / THEN
        XCTAssertEqual(imageSize1, imageSize2, "Instances with same values should be equal")
    }

    func test_different_size_only() {
        // GIVEN
        var imageSize1 = TextLinkImageSize()
        var imageSize2 = TextLinkImageSize()

        imageSize1.size = 15.0
        imageSize2.size = 20.0

        // WHEN / THEN
        XCTAssertNotEqual(imageSize1, imageSize2, "Instances with different size only should not be equal")
    }

    func test_different_padding_only() {
        // GIVEN
        var imageSize1 = TextLinkImageSize()
        var imageSize2 = TextLinkImageSize()

        imageSize1.padding = 4.0
        imageSize2.padding = 8.0

        // WHEN / THEN
        XCTAssertNotEqual(imageSize1, imageSize2, "Instances with different padding only should not be equal")
    }
}
