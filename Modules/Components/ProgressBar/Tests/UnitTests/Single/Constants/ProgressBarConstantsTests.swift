//
//  ProgressBarConstantsTests.swift
//  SparkComponentProgressBarTests
//
//  Created by robin.lemaire on 16/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

@testable import SparkComponentProgressBar
import Testing

@Suite("Progress Bar Constants Tests")
struct ProgressBarConstantsTests {

    // MARK: - Tests

    @Test("Height value")
    func heightValue() {
        // GIVEN / WHEN
        let height = ProgressBarConstants.height

        // THEN
        #expect(height == 4.0)
    }
}
