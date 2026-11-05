//
//  ComponentTokenTests.swift
//  SparkThemeUnitTests
//
//  Created by Robin Lemaire on 23/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
import SparkTheming

// MARK: - Tests

struct ComponentTokenTests {

    // MARK: - Properties

    private let theme = ThemeEquatableTests.createMock1()

    // MARK: - Tests

    @Test("Init should set theme")
    func initShouldSetTheme() {
        // GIVEN / WHEN
        let token = ComponentToken(theme: self.theme)

        // THEN
        #expect(token.theme.equals(self.theme))
    }

    @Test("Theme component should return token with same theme")
    func themeComponentShouldReturnTokenWithSameTheme() {
        // GIVEN / WHEN
        let token = self.theme.component

        // THEN
        #expect(token.theme.equals(self.theme))
    }
}
