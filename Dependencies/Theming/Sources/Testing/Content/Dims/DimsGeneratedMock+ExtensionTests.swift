//
//  DimsGeneratedMock+ExtensionTests.swift
//  SparkThemingTesting
//
//  Created by janniklas.freundt.ext on 04.05.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

@testable import SparkTheming

public extension DimsGeneratedMock {

    // MARK: - Methods

    static func mocked() -> DimsGeneratedMock {
        let mock = DimsGeneratedMock()
        mock.dim1 = 0.2
        mock.dim2 = 0.3
        mock.dim3 = 0.4
        mock.dim4 = 0.5
        mock.dim5 = 0.6

        return mock
    }

    static func mocked2() -> DimsGeneratedMock {
        let mock = DimsGeneratedMock()
        mock.dim1 = 0.3
        mock.dim2 = 0.4
        mock.dim3 = 0.5
        mock.dim4 = 0.6
        mock.dim5 = 0.7

        return mock
    }
}
