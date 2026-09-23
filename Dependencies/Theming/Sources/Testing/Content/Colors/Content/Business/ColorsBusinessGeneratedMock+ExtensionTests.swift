//
//  ColorsBusinessGeneratedMock+ExtensionTests.swift
//  SparkThemingTesting
//
//  Created by robin.lemaire on 27/08/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkTheming

public extension ColorsBusinessGeneratedMock {

    // MARK: - Methods

    static func mocked() -> ColorsBusinessGeneratedMock {
        let mock = ColorsBusinessGeneratedMock()

        mock.underlyingBusiness = ColorTokenGeneratedMock.random()
        mock.underlyingOnBusiness = ColorTokenGeneratedMock.random()

        mock.underlyingBusinessContainer = ColorTokenGeneratedMock.random()
        mock.underlyingOnBusinessContainer = ColorTokenGeneratedMock.random()

        return mock
    }

    static func mocked2() -> ColorsBusinessGeneratedMock {
        let mock = ColorsBusinessGeneratedMock()

        mock.underlyingBusiness = ColorTokenGeneratedMock.random()
        mock.underlyingOnBusiness = ColorTokenGeneratedMock.random()

        mock.underlyingBusinessContainer = ColorTokenGeneratedMock.random()
        mock.underlyingOnBusinessContainer = ColorTokenGeneratedMock.random()

        return mock
    }
}
