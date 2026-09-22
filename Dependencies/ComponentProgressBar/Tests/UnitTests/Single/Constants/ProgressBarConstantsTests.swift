//
//  ProgressBarConstantsTests.swift
//  SparkComponentProgressBarTests
//
//  Created by robin.lemaire on 16/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

@testable import SparkComponentProgressBar
import XCTest

final class ProgressBarConstantsTests: XCTestCase {

    // MARK: - Tests

    func test_height_value() {
        // GIVEN / WHEN
        let height = ProgressBarConstants.height

        // THEN
        XCTAssertEqual(height, 4.0)
    }
}
