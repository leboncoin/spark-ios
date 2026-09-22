//
//  ColorsFocusGeneratedMock+ExtensionTests.swift
//  SparkThemingTesting
//
//  Created by robin.lemaire on 27/08/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkTheming

public extension ColorsFocusGeneratedMock {

    // MARK: - Methods

    static func mocked() -> ColorsFocusGeneratedMock {
        let mock = ColorsFocusGeneratedMock()

        mock.underlyingFocus = ColorTokenGeneratedMock.random()
        mock.underlyingOnFocus = ColorTokenGeneratedMock.random()

        mock.underlyingFocusContainer = ColorTokenGeneratedMock.random()
        mock.underlyingOnFocusContainer = ColorTokenGeneratedMock.random()

        return mock
    }

    static func mocked2() -> ColorsFocusGeneratedMock {
        let mock = ColorsFocusGeneratedMock()

        mock.underlyingFocus = ColorTokenGeneratedMock.random()
        mock.underlyingOnFocus = ColorTokenGeneratedMock.random()

        mock.underlyingFocusContainer = ColorTokenGeneratedMock.random()
        mock.underlyingOnFocusContainer = ColorTokenGeneratedMock.random()

        return mock
    }
}
