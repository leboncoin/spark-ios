//
//  SelectionControlsAxisTests.swift
//  SparkComponentSelectionControlsTests
//
//  Created by robin.lemaire on 28/08/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentSelectionControls

@Suite("Selection Controls Axis Tests")
struct SelectionControlsAxisTests {

    // MARK: - Properties Tests

    @Test("Default should return vertical")
    func defaultShouldReturnVertical() {
        // GIVEN / WHEN
        let result = SelectionControlsAxis.default

        // THEN
        #expect(result == .vertical)
    }
}
