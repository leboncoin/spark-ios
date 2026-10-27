//
//  SegmentedControlToken+SizeTests.swift
//  SparkComponentSegmentedControlTests
//
//  Created by robin.lemaire on 27/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
import Foundation
@testable import SparkComponentSegmentedControl

// MARK: - Tests

struct SegmentedControlTokenSizeTests {

    // MARK: - Properties

    private let token = SegmentedControlToken.Size()

    // MARK: - Tests

    @Test
    func iconShouldReturn16() {
        #expect(self.token.icon == 16)
    }

    @Test
    func minHeightShouldReturn44() {
        #expect(self.token.minHeight == 44)
    }

    @Test
    func separatorHeightShouldReturn24() {
        #expect(self.token.separatorHeight == 24)
    }

    @Test
    func separatorWidthShouldReturn1() {
        #expect(self.token.separatorWidth == 1)
    }

    // MARK: - Equatable Tests

    @Test
    func equatableShouldReturnTrue() {
        #expect(SegmentedControlToken.Size() == SegmentedControlToken.Size())
    }
}
