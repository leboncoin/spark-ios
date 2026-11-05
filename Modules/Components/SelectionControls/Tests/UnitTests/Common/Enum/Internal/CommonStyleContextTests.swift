//
//  CommonStyleContextTests.swift
//  SparkComponentSelectionControlsTests
//
//  Created by robin.lemaire on 12/02/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentSelectionControls

@Suite("Common Style Context Tests")
struct CommonStyleContextTests {

    // MARK: - Properties Tests

    @Test("Default should return alone")
    func defaultShouldReturnAlone() {
        // GIVEN / WHEN
        let result = CommonStyleContext.default

        // THEN
        #expect(result == .alone)
    }
}
