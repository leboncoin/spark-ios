//
//  BorderGeneratedMock+ExtensionTests.swift
//  SparkThemingTesting
//
//  Created by michael.zimmermann on 10.05.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Foundation

public extension BorderGeneratedMock {
    static func mocked() -> BorderGeneratedMock {
        let border = BorderGeneratedMock()
        border.radius = BorderRadiusGeneratedMock.mocked()
        border.width = BorderWidthGeneratedMock.mocked()

        return border
    }

    static func mocked2() -> BorderGeneratedMock {
        let border = BorderGeneratedMock()
        border.radius = BorderRadiusGeneratedMock.mocked2()
        border.width = BorderWidthGeneratedMock.mocked2()

        return border
    }
}

public extension BorderRadiusGeneratedMock {
    static func mocked() -> BorderRadiusGeneratedMock {
        let radius = BorderRadiusGeneratedMock()
        radius.small = 4
        radius.medium = 8
        radius.large = 16
        radius.xLarge = 24
        return radius
    }

    static func mocked2() -> BorderRadiusGeneratedMock {
        let radius = BorderRadiusGeneratedMock()
        radius.small = 6
        radius.medium = 12
        radius.large = 20
        radius.xLarge = 32
        return radius
    }
}

public extension BorderWidthGeneratedMock {
    static func mocked() -> BorderWidthGeneratedMock {
        let width = BorderWidthGeneratedMock()
        width.small = 1
        width.medium = 2
        return width
    }

    static func mocked2() -> BorderWidthGeneratedMock {
        let width = BorderWidthGeneratedMock()
        width.small = 2
        width.medium = 3
        return width
    }
}
