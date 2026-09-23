//
//  ColorsNewGeneratedMock+ExtensionTests.swift
//  SparkThemingTesting
//
//  Created by robin.lemaire on 27/08/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkTheming

public extension ColorsNewGeneratedMock {

    // MARK: - Methods

    static func mocked() -> ColorsNewGeneratedMock {
        let mock = ColorsNewGeneratedMock()

        mock.underlyingNew = ColorTokenGeneratedMock.random()
        mock.underlyingOnNew = ColorTokenGeneratedMock.random()

        mock.underlyingNewContainer = ColorTokenGeneratedMock.random()
        mock.underlyingOnNewContainer = ColorTokenGeneratedMock.random()

        return mock
    }

    static func mocked2() -> ColorsNewGeneratedMock {
        let mock = ColorsNewGeneratedMock()

        mock.underlyingNew = ColorTokenGeneratedMock.random()
        mock.underlyingOnNew = ColorTokenGeneratedMock.random()

        mock.underlyingNewContainer = ColorTokenGeneratedMock.random()
        mock.underlyingOnNewContainer = ColorTokenGeneratedMock.random()

        return mock
    }
}
