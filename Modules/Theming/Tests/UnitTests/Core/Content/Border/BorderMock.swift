//
//  BorderMock.swift
//  SparkThemeUnitTests
//
//  Created by robin.lemaire on 15/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

final class BorderMock {

    // MARK: - Test Data

    static func createMock1() -> BorderDefault {
        return BorderDefault(
            width: BorderWidthDefault(small: 1, medium: 2),
            radius: BorderRadiusDefault(small: 1, medium: 2, large: 3, xLarge: 4)
        )
    }

    static func createMock2() -> BorderDefault {
        return BorderDefault(
            width: BorderWidthDefault(small: 1, medium: 2),
            radius: BorderRadiusDefault(small: 1, medium: 2, large: 3, xLarge: 4)
        )
    }

    static func createDifferentMock() -> BorderDefault {
        return BorderDefault(
            width: BorderWidthDefault(small: 2, medium: 3),
            radius: BorderRadiusDefault(small: 4, medium: 5, large: 6, xLarge: 7)
        )
    }
}
