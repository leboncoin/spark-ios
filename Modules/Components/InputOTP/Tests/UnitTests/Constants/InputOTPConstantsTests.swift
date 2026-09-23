//
//  InputOTPConstantsTests.swift
//  SparkComponentInputOTPTests
//
//  Created by robin.lemaire on 04/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentInputOTP

@Suite("Input OTP Constants Tests")
struct InputOTPConstantsTests {

    // MARK: - Tests

    @Test("Size width constant")
    func sizeWidthConstant() {
        // GIVEN / WHEN / THEN
        #expect(InputOTPConstants.Size.width == 40)
    }

    @Test("Size height constant")
    func sizeHeightConstant() {
        // GIVEN / WHEN / THEN
        #expect(InputOTPConstants.Size.height == 50)
    }

    @Test("Separator size width constant")
    func separatorSizeWidthConstant() {
        // GIVEN / WHEN / THEN
        #expect(InputOTPConstants.SeparatorSize.width == 8)
    }

    @Test("Separator size height constant")
    func separatorSizeHeightConstant() {
        // GIVEN / WHEN / THEN
        #expect(InputOTPConstants.SeparatorSize.height == 4)
    }

    @Test("Content empty constant")
    func contentEmptyConstant() {
        // GIVEN / WHEN / THEN
        #expect(InputOTPConstants.Content.empty == "-")
    }

    @Test("Content focus constant")
    func contentFocusConstant() {
        // GIVEN / WHEN / THEN
        #expect(InputOTPConstants.Content.focus == "|")
    }
}
