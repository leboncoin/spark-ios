//
//  DividerConstantsTests.swift
//  SparkComponentDividerTests
//
//  Created by robin.lemaire on 12/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
import Foundation

@testable import SparkComponentDivider

final class DividerConstantsTests: XCTestCase {

    // MARK: - Tests

    func test_minimumWidth_value() {
        // GIVEN & WHEN
        let minimumWidth = DividerConstants.minimumWidth

        // THEN
        XCTAssertEqual(minimumWidth, 40)
    }

    func test_thickness_value() {
        // GIVEN & WHEN
        let thickness = DividerConstants.thickness

        // THEN
        XCTAssertEqual(thickness, 1)
    }
}
