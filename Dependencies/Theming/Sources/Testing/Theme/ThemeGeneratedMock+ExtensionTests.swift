//
//  ThemeGeneratedMock+public extensionTests.swift
//  SparkTheming
//
//  Created by michael.zimmermann on 10.05.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Foundation

public extension ThemeGeneratedMock {
    static func mocked() -> ThemeGeneratedMock {
        let theme = ThemeGeneratedMock()

        theme.border = BorderGeneratedMock.mocked()
        theme.colors = ColorsGeneratedMock.mocked()
        theme.elevation = ElevationGeneratedMock.mocked()
        theme.layout = LayoutGeneratedMock.mocked()
        theme.typography = TypographyGeneratedMock.mocked()
        theme.dims = DimsGeneratedMock.mocked()

        return theme
    }

    static func mocked2() -> ThemeGeneratedMock {
        let theme = ThemeGeneratedMock()

        theme.border = BorderGeneratedMock.mocked2()
        theme.colors = ColorsGeneratedMock.mocked2()
        theme.elevation = ElevationGeneratedMock.mocked2()
        theme.layout = LayoutGeneratedMock.mocked2()
        theme.typography = TypographyGeneratedMock.mocked2()
        theme.dims = DimsGeneratedMock.mocked2()

        return theme
    }
}
