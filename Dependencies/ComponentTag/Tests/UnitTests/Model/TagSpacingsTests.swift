//
//  TagSpacingsTests.swift
//  SparkComponentTagTests
//
//  Created by robin.lemaire on 06/08/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentTag

struct TagSpacingsTests {

    // MARK: - Tests

    @Test
    func test_default_values() {
        // GIVEN / WHEN
        let spacings = TagSpacings()

        // THEN
        #expect(spacings.horizontalPadding == 0)
        #expect(spacings.horizontalSpacing == 0)
    }
}
