//
//  ProgressTrackerIntentTests.swift
//  SparkComponentProgressTracker
//
//  Created by Michael Zimmermann on 11.01.24.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import Testing

@testable import SparkComponentProgressTracker

@Suite("Progress Tracker Intent Tests")
struct ProgressTrackerIntentTests {

    // MARK: - Tests
    @Test("All cases")
    func allCases() {
        // GIVEN
        let sut = ProgressTrackerIntent.allCases

        // THEN
        #expect(sut == [.neutral, .success, .support])
    }
}
