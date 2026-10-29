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

    @Test("Icon should return 16")
    func iconShouldReturn16() {
        #expect(self.token.icon == 16)
    }

    @Test("Min height should return 44")
    func minHeightShouldReturn44() {
        #expect(self.token.minHeight == 44)
    }

    @Test("Separator height should return 24")
    func separatorHeightShouldReturn24() {
        #expect(self.token.separatorHeight == 24)
    }

    @Test("Separator width should return 1")
    func separatorWidthShouldReturn1() {
        #expect(self.token.separatorWidth == 1)
    }

    // MARK: - Equatable Tests

    @Test("Equatable should return true")
    func equatableShouldReturnTrue() {
        #expect(SegmentedControlToken.Size() == SegmentedControlToken.Size())
    }
}
