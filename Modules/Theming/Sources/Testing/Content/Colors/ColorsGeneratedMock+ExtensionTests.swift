//
//  ColorsGeneratedMock+ExtensionTests.swift
//  SparkThemingTesting
//
//  Created by robin.lemaire on 11/04/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

@testable import SparkTheming

public extension ColorsGeneratedMock {

    // MARK: - Methods

    static func mocked() -> ColorsGeneratedMock {
        let mock = ColorsGeneratedMock()

        mock.main = ColorsMainGeneratedMock.mocked()
        mock.support = ColorsSupportGeneratedMock.mocked()
        mock.accent = ColorsAccentGeneratedMock.mocked()
        mock.base = ColorsBaseGeneratedMock.mocked()
        mock.feedback = ColorsFeedbackGeneratedMock.mocked()
        mock.states = ColorsStatesGeneratedMock.mocked()
        mock.ai = ColorsAIGeneratedMock.mocked()
        mock.focus = ColorsFocusGeneratedMock.mocked()
        mock.new = ColorsNewGeneratedMock.mocked()
        mock.business = ColorsBusinessGeneratedMock.mocked()
        mock.service = ColorsServiceGeneratedMock.mocked()

        return mock
    }

    static func mocked2() -> ColorsGeneratedMock {
        let mock = ColorsGeneratedMock()

        mock.main = ColorsMainGeneratedMock.mocked2()
        mock.support = ColorsSupportGeneratedMock.mocked2()
        mock.accent = ColorsAccentGeneratedMock.mocked2()
        mock.base = ColorsBaseGeneratedMock.mocked2()
        mock.feedback = ColorsFeedbackGeneratedMock.mocked2()
        mock.states = ColorsStatesGeneratedMock.mocked2()
        mock.ai = ColorsAIGeneratedMock.mocked2()
        mock.focus = ColorsFocusGeneratedMock.mocked2()
        mock.new = ColorsNewGeneratedMock.mocked2()
        mock.business = ColorsBusinessGeneratedMock.mocked2()
        mock.service = ColorsServiceGeneratedMock.mocked2()

        return mock
    }
}
