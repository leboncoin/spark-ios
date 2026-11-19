//
//  EnvironmentTheme+PopoverTokenTests.swift
//  SparkComponentPopoverUnitTests
//
//  Created by Robin Lemaire on 18/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
import Foundation
@testable import SparkComponentPopover
@testable import SparkCommon
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

// MARK: - Tests

struct EnvironmentThemePopoverTokenTests {

    // MARK: - Properties

    private let theme = ThemeGeneratedMock.mocked()

    private var environmentTheme: EnvironmentTheme {
        return .init(value: self.theme)
    }

    private var token: PopoverToken {
        return self.theme.component.popover
    }

    // MARK: - Tests

    @Test("Colors should return popover colors")
    func colorsShouldReturnPopoverColors() {
        #expect(self.environmentTheme.colors == self.token.colors)
    }

    @Test("Layout should return popover layout")
    func layoutShouldReturnPopoverLayout() {
        #expect(self.environmentTheme.layout == self.token.layout)
    }
}
