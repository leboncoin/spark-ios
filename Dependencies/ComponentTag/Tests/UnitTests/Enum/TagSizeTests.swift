//
//  TagSizeTests.swift
//  SparkComponentTagTests
//
//  Created by robin.lemaire on 06/08/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentTag

struct TagSizeTests {

    // MARK: - Tests

    @Test
    func test_default() {
        #expect(TagSize.default == .medium)
    }
}
