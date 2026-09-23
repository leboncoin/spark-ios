//
//  TabConstantsTests.swift
//  SparkComponentTabTests
//
//  Created by robin.lemaire on 23/02/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentTab

@Suite("Tab Constants Tests")
struct TabConstantsTests {

    // MARK: - Tests

    @Test("Line height constant")
    func lineHeightConstant() {
        // GIVEN / WHEN / THEN
        #expect(TabConstants.lineHeight == 1.0)
    }

    @Test("Selected line height constant")
    func selectedLineHeightConstant() {
        // GIVEN / WHEN / THEN
        #expect(TabConstants.selectedLineHeight == 2.0)
    }

    @Test("Pressed scaled constant")
    func pressedScaledConstant() {
        // GIVEN / WHEN / THEN
        #expect(TabConstants.pressedScaled == 0.90)
    }

    @Test("Animation duration constant")
    func animationDurationConstant() {
        // GIVEN / WHEN / THEN
        #expect(TabConstants.animationDuration == 0.2)
    }

    @Test("Content animation duration constant")
    func contentAnimationDurationConstant() {
        // GIVEN / WHEN / THEN
        #expect(TabConstants.contentAnimationDuration == 0.1)
    }

    @Test("Default selected index constant")
    func defaultSelectedIndexConstant() {
        // GIVEN / WHEN / THEN
        #expect(TabConstants.defaultSelectedIndex == -1)
    }
}
