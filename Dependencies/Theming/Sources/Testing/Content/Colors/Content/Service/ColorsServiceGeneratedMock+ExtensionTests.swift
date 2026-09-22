//
//  ColorsServiceGeneratedMock+ExtensionTests.swift
//  SparkThemingTesting
//
//  Created by robin.lemaire on 27/08/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkTheming

public extension ColorsServiceGeneratedMock {

    // MARK: - Methods

    static func mocked() -> ColorsServiceGeneratedMock {
        let mock = ColorsServiceGeneratedMock()

        mock.underlyingService = ColorTokenGeneratedMock.random()
        mock.underlyingOnService = ColorTokenGeneratedMock.random()

        mock.underlyingServiceContainer = ColorTokenGeneratedMock.random()
        mock.underlyingOnServiceContainer = ColorTokenGeneratedMock.random()

        return mock
    }

    static func mocked2() -> ColorsServiceGeneratedMock {
        let mock = ColorsServiceGeneratedMock()

        mock.underlyingService = ColorTokenGeneratedMock.random()
        mock.underlyingOnService = ColorTokenGeneratedMock.random()

        mock.underlyingServiceContainer = ColorTokenGeneratedMock.random()
        mock.underlyingOnServiceContainer = ColorTokenGeneratedMock.random()

        return mock
    }
}
