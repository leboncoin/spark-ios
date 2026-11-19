//
//  PopoverConstantsTests.swift
//  SparkComponentPopoverUnitTests
//
//  Created by Robin Lemaire on 18/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
import Foundation
@testable import SparkComponentPopover

// MARK: - Tests

struct PopoverConstantsTests {

    // MARK: - Tests

    @Test("Liquid glass top padding should return 10")
    func liquidGlassTopPaddingShouldReturn10() {
        #expect(PopoverConstants.liquidGlassTopPadding == 10)
    }
}
