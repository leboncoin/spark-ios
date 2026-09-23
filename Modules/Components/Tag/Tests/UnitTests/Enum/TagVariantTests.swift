//
//  TagVariantTests.swift
//  SparkComponentTagTests
//
//  Created by robin.lemaire on 06/08/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentTag

struct TagVariantTests {

    // MARK: - Tests

    @Test
    func test_default() {
        #expect(TagVariant.default == .filled)
    }
}
