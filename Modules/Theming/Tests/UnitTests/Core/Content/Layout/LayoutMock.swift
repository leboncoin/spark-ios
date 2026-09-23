//
//  LayoutMock.swift
//  SparkThemeUnitTests
//
//  Created by robin.lemaire on 15/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

final class LayoutMock {

    // MARK: - Test Data

    static func createMock1() -> LayoutDefault {
        return LayoutDefault(spacing: LayoutSpacingGeneratedMock.mocked())
    }

    static func createMock2() -> LayoutDefault {
        return LayoutDefault(spacing: LayoutSpacingGeneratedMock.mocked())
    }

    static func createDifferentMock() -> LayoutDefault {
        return LayoutDefault(spacing: LayoutSpacingDefault(
            small: 20,
            medium: 19,
            large: 18,
            xLarge: 17,
            xxLarge: 16,
            xxxLarge: 15
        ))
    }
}
