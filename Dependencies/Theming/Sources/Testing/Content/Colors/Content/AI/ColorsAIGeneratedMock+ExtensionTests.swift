//
//  ColorsAIGeneratedMock+ExtensionTests.swift
//  SparkThemingTesting
//
//  Created by robin.lemaire on 02/06/2026.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

@testable import SparkTheming

public extension ColorsAIGeneratedMock {

    // MARK: - Methods

    static func mocked() -> ColorsAIGeneratedMock {
        let mock = ColorsAIGeneratedMock()

        mock.underlyingAi = ColorTokenGeneratedMock.random()
        mock.underlyingOnAI = ColorTokenGeneratedMock.random()

        mock.underlyingAiContainer = ColorTokenGeneratedMock.random()
        mock.underlyingOnAIContainer = ColorTokenGeneratedMock.random()

        return mock
    }

    static func mocked2() -> ColorsAIGeneratedMock {
        let mock = ColorsAIGeneratedMock()

        mock.underlyingAi = ColorTokenGeneratedMock.random()
        mock.underlyingOnAI = ColorTokenGeneratedMock.random()

        mock.underlyingAiContainer = ColorTokenGeneratedMock.random()
        mock.underlyingOnAIContainer = ColorTokenGeneratedMock.random()

        return mock
    }
}
