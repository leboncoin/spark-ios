//
//  ElevationMock.swift
//  SparkThemeUnitTests
//
//  Created by robin.lemaire on 15/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

final class ElevationMock {

    // MARK: - Test Data

    static func createMock1() -> ElevationDefault {
        return ElevationDefault(dropShadow: ElevationDropShadowsGeneratedMock.mocked())
    }

    static func createMock2() -> ElevationDefault {
        return ElevationDefault(dropShadow: ElevationDropShadowsGeneratedMock.mocked())
    }

    static func createDifferentMock() -> ElevationDefault {
        let mock = ElevationShadowAndDropShadowGeneratedMock()
        mock.offset = .init(x: 1, y: 2)
        mock.blur = 3
        mock.colorToken = ColorTokenGeneratedMock.clear
        mock.opacity = 4

        mock.small = ElevationShadowGeneratedMock.mocked()
        mock.medium = ElevationShadowGeneratedMock.mocked()
        mock.large = ElevationShadowGeneratedMock.mocked()
        mock.extraLarge = ElevationShadowGeneratedMock.mocked()
        return ElevationDefault(dropShadow: mock)
    }
}
