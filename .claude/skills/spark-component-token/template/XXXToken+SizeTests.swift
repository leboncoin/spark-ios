//
//  XXXToken+SizeTests.swift
//  SparkComponentXXXTests
//
//  Created by {Firstname Lastname} on DD/MM/YYYY.
//  Copyright © YYYY Leboncoin. All rights reserved.
//

import Testing
import Foundation
@testable import SparkComponentXXX
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

// MARK: - Tests

struct XXXTokenSizeTests {

    // MARK: - Properties

    private let token = XXXToken.Size()

    // MARK: - Tests

    @Test
    func mediumHeightShouldReturn32() {
        #expect(self.token.mediumHeight == 32)
    }

    @Test
    func largeHeightShouldReturn40() {
        #expect(self.token.largeHeight == 40)
    }

    @Test
    func iconSizeShouldReturn16() {
        #expect(self.token.iconSize == 16)
    }

    // MARK: - Equatable Tests

    @Test
    func equatableShouldReturnTrue() {
        #expect(XXXToken.Size() == XXXToken.Size())
    }
}
