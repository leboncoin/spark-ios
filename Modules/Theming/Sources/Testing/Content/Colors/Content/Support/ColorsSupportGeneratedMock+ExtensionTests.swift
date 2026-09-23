//
//  ColorsSupportGeneratedMock+ExtensionTests.swift
//  SparkThemingTesting
//
//  Created by robin.lemaire on 11/04/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

@testable import SparkTheming

public extension ColorsSupportGeneratedMock {

    // MARK: - Methods

    static func mocked() -> ColorsSupportGeneratedMock {
        let mock = ColorsSupportGeneratedMock()

        mock.underlyingSupport = ColorTokenGeneratedMock.random()
        mock.underlyingOnSupport = ColorTokenGeneratedMock.random()

        mock.underlyingSupportVariant = ColorTokenGeneratedMock.random()
        mock.underlyingOnSupportVariant = ColorTokenGeneratedMock.random()

        mock.underlyingSupportContainer = ColorTokenGeneratedMock.random()
        mock.underlyingOnSupportContainer = ColorTokenGeneratedMock.random()

        return mock
    }

    static func mocked2() -> ColorsSupportGeneratedMock {
        let mock = ColorsSupportGeneratedMock()

        mock.underlyingSupport = ColorTokenGeneratedMock.random()
        mock.underlyingOnSupport = ColorTokenGeneratedMock.random()

        mock.underlyingSupportVariant = ColorTokenGeneratedMock.random()
        mock.underlyingOnSupportVariant = ColorTokenGeneratedMock.random()

        mock.underlyingSupportContainer = ColorTokenGeneratedMock.random()
        mock.underlyingOnSupportContainer = ColorTokenGeneratedMock.random()

        return mock
    }
}
