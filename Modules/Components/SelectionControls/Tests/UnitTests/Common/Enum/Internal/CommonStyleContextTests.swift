//
//  CommonStyleContextTests.swift
//  SparkComponentSelectionControlsTests
//
//  Created by robin.lemaire on 12/02/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentSelectionControls

final class CommonStyleContextTests: XCTestCase {

    // MARK: - Properties Tests

    func test_default_shouldReturnAlone() {
        // GIVEN / WHEN
        let result = CommonStyleContext.default

        // THEN
        XCTAssertEqual(result, .alone)
    }
}
