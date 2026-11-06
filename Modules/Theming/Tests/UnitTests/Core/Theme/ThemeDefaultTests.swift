//
//  ThemeDefaultTests.swift
//  SparkThemingUnitTests
//
//  Created by Robin Lemaire on 06/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import Testing
import SparkTheming

@Suite("Theme Default Tests")
struct ThemeDefaultTests {

    // MARK: - Tests

    @Test("Copy of a theme should be equal to the original")
    func copyShouldBeEqual() {
        // GIVEN
        let theme = ThemeEquatableTests.createMock1()
        let copy = theme

        // WHEN / THEN
        #expect(theme.equals(copy))
        #expect(theme == copy)
    }

    @Test("Copy of a theme stored as any Theme should be equal to the original")
    func copyAsAnyThemeShouldBeEqual() {
        // GIVEN
        let theme: any Theme = ThemeEquatableTests.createMock1()
        let copy: any Theme = theme

        // WHEN / THEN
        #expect(theme.equals(copy))
    }

    @Test("Two instances with the same tokens should be equal")
    func sameTokensShouldBeEqual() {
        // GIVEN
        let theme1 = ThemeEquatableTests.createMock1()
        let theme2 = ThemeEquatableTests.createMock2()

        // WHEN / THEN
        #expect(theme1.equals(theme2))
    }

    @Test("Two instances with different tokens should not be equal")
    func differentTokensShouldNotBeEqual() {
        // GIVEN
        let theme1 = ThemeEquatableTests.createMock1()
        let theme2 = ThemeEquatableTests.createDifferentMock()

        // WHEN / THEN
        #expect(!theme1.equals(theme2))
    }
}
