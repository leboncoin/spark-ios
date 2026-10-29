//
//  InputOTPToken+SizeTests.swift
//  SparkComponentInputOTPTests
//
//  Created by Robin Lemaire on 28/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
import Foundation
@testable import SparkComponentInputOTP
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

// MARK: - Tests

struct InputOTPTokenSizeTests {

    // MARK: - Properties

    private let token = InputOTPToken.Size()

    // MARK: - Tests

    @Test("Slot size should return expected values")
    func slotSizeShouldReturnExpectedValues() {
        #expect(self.token.slotWidth == 40)
        #expect(self.token.slotHeight == 50)
    }

    @Test("Separator size should return expected values")
    func separatorSizeShouldReturnExpectedValues() {
        #expect(self.token.separatorWidth == 8)
        #expect(self.token.separatorHeight == 4)
    }
}
