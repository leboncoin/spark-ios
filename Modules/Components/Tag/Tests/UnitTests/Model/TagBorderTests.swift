//
//  TagBorderTests.swift
//  SparkComponentTagTests
//
//  Created by robin.lemaire on 06/08/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentTag

struct TagBorderTests {

    // MARK: - Tests

    @Test
    func test_default_values() {
        // GIVEN / WHEN
        let border = TagBorder()

        // THEN
        #expect(border.width == 0)
        #expect(border.radius == 0)
    }
}
