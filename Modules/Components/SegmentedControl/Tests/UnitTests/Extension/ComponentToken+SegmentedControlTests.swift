//
//  ComponentToken+SegmentedControlTests.swift
//  SparkComponentSegmentedControlTests
//
//  Created by robin.lemaire on 27/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentSegmentedControl
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

// MARK: - Tests

struct ComponentTokenSegmentedControlTests {

    // MARK: - Properties

    private let theme = ThemeGeneratedMock.mocked()

    // MARK: - Tests

    @Test
    func segmentedControlShouldReturnTokenFromTheme() {
        // GIVEN
        let componentToken = ComponentToken(theme: self.theme)

        // WHEN
        let token = componentToken.segmentedControl

        // THEN
        #expect(token == SegmentedControlToken(theme: self.theme))
    }

    @Test
    func segmentedControlFromThemeComponentShouldReturnTokenFromTheme() {
        // GIVEN / WHEN
        let token = self.theme.component.segmentedControl

        // THEN
        #expect(token == SegmentedControlToken(theme: self.theme))
    }

    @Test
    func segmentedControlWithDifferentThemeShouldNotReturnTokenFromTheme() {
        // GIVEN
        let componentToken = ComponentToken(theme: ThemeGeneratedMock.mocked2())

        // WHEN
        let token = componentToken.segmentedControl

        // THEN
        #expect(token != SegmentedControlToken(theme: self.theme))
    }
}
