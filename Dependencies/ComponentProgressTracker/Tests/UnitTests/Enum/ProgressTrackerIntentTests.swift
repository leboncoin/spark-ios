//
//  ProgressTrackerIntentTests.swift
//  SparkComponentProgressTracker
//
//  Created by Michael Zimmermann on 11.01.24.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import XCTest

@testable import SparkComponentProgressTracker

final class ProgressTrackerIntentTests: XCTestCase {

    // MARK: - Tests
    func test_allCases() {
        // GIVEN
        let sut = ProgressTrackerIntent.allCases

        // THEN
        XCTAssertEqual(sut, [.neutral, .success, .support])
    }
}
