//
//  LayoutGeneratedMock.swift
//  SparkThemingTesting
//
//  Created by janniklas.freundt.ext on 04.05.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

@testable import SparkTheming

public extension LayoutGeneratedMock {

    // MARK: - Methods

    static func mocked() -> LayoutGeneratedMock {
        let mock = LayoutGeneratedMock()
        mock.spacing = LayoutSpacingGeneratedMock.mocked()

        return mock
    }

    static func mocked2() -> LayoutGeneratedMock {
        let mock = LayoutGeneratedMock()
        mock.spacing = LayoutSpacingGeneratedMock.mocked2()

        return mock
    }
}

public extension LayoutSpacingGeneratedMock {

    // MARK: - Methods

    static func mocked() -> LayoutSpacingGeneratedMock {
        let mock = LayoutSpacingGeneratedMock()
        mock.none = 1
        mock.small = 3
        mock.medium = 5
        mock.large = 7
        mock.xLarge = 9
        mock.xxLarge = 11
        mock.xxxLarge = 13

        return mock
    }

    static func mocked2() -> LayoutSpacingGeneratedMock {
        let mock = LayoutSpacingGeneratedMock()
        mock.none = 2
        mock.small = 4
        mock.medium = 6
        mock.large = 10
        mock.xLarge = 12
        mock.xxLarge = 14
        mock.xxxLarge = 16

        return mock
    }
}
