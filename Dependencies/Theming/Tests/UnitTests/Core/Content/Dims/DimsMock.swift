//
//  DimsMock.swift
//  SparkThemeUnitTests
//
//  Created by robin.lemaire on 15/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
import SparkTheming

final class DimsMock {

    // MARK: - Test Data

    static func createMock1() -> DimsDefault {
        return DimsDefault(dim1: 1, dim2: 2, dim3: 4, dim4: 8, dim5: 16)
    }

    static func createMock2() -> DimsDefault {
        return DimsDefault(dim1: 1, dim2: 2, dim3: 4, dim4: 8, dim5: 16)
    }

    static func createDifferentMock() -> DimsDefault {
        return DimsDefault(dim1: 2, dim2: 4, dim3: 8, dim4: 16, dim5: 32)
    }
}
