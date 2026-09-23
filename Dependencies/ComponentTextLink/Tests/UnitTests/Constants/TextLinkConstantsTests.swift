//
//  TextLinkConstantsTests.swift
//  SparkComponentTextLinkUnitTests
//
//  Created by robin.lemaire on 25/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentTextLink

final class TextLinkConstantsTests: XCTestCase {

    // MARK: - Tests

    func test_animationDuration_value() {
        // GIVEN / WHEN
        let animationDuration = TextLinkConstants.animationDuration

        // THEN
        XCTAssertEqual(animationDuration, 0.2, "Animation duration should be 0.2 seconds (200ms)")
    }
}
