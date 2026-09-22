//
//  ColorsAccentGeneratedMock+ExtensionTests.swift
//  SparkThemingTesting
//
//  Created by robin.lemaire on 11/04/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

@testable import SparkTheming

public extension ColorsAccentGeneratedMock {

    // MARK: - Methods

    static func mocked() -> ColorsAccentGeneratedMock {
        let mock = ColorsAccentGeneratedMock()

        mock.underlyingAccent = ColorTokenGeneratedMock.random()
        mock.underlyingOnAccent = ColorTokenGeneratedMock.random()

        mock.underlyingAccentVariant = ColorTokenGeneratedMock.random()
        mock.underlyingOnAccentVariant = ColorTokenGeneratedMock.random()

        mock.underlyingAccentContainer = ColorTokenGeneratedMock.random()
        mock.underlyingOnAccentContainer = ColorTokenGeneratedMock.random()

        return mock
    }

    static func mocked2() -> ColorsAccentGeneratedMock {
        let mock = ColorsAccentGeneratedMock()

        mock.underlyingAccent = ColorTokenGeneratedMock.random()
        mock.underlyingOnAccent = ColorTokenGeneratedMock.random()

        mock.underlyingAccentVariant = ColorTokenGeneratedMock.random()
        mock.underlyingOnAccentVariant = ColorTokenGeneratedMock.random()

        mock.underlyingAccentContainer = ColorTokenGeneratedMock.random()
        mock.underlyingOnAccentContainer = ColorTokenGeneratedMock.random()

        return mock
    }
}
