//
//  EnvironmentTheme+SegmentedControlTests.swift
//  SparkComponentSegmentedControlTests
//
//  Created by robin.lemaire on 27/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentSegmentedControl
@testable import SparkCommon
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

// MARK: - Tests

struct EnvironmentThemeSegmentedControlTests {

    // MARK: - Properties

    private let theme = ThemeGeneratedMock.mocked()

    private var environmentTheme: EnvironmentTheme {
        return .init(value: self.theme)
    }

    // MARK: - Tests

    @Test
    func borderShouldReturnSegmentedControlBorder() {
        #expect(self.environmentTheme.border == self.theme.component.segmentedControl.border)
    }

    @Test
    func colorsShouldReturnSegmentedControlColors() {
        #expect(self.environmentTheme.colors == self.theme.component.segmentedControl.colors)
    }

    @Test
    func layoutShouldReturnSegmentedControlLayout() {
        #expect(self.environmentTheme.layout == self.theme.component.segmentedControl.layout)
    }

    @Test
    func opacityShouldReturnSegmentedControlOpacity() {
        #expect(self.environmentTheme.opacity == self.theme.component.segmentedControl.opacity)
    }

    @Test
    func typographyShouldReturnSegmentedControlTypography() {
        #expect(self.environmentTheme.typography == self.theme.component.segmentedControl.typography)
    }

    @Test
    func scaleEffectShouldReturnSegmentedControlScaleEffect() {
        #expect(self.environmentTheme.scaleEffect == self.theme.component.segmentedControl.scaleEffect)
    }

    @Test
    func sizeShouldReturnSegmentedControlSize() {
        #expect(self.environmentTheme.size == self.theme.component.segmentedControl.size)
    }
}
