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

    @Test("Medium height should return 32")
    func mediumHeightShouldReturn32() {
        #expect(self.token.mediumHeight == 32)
    }

    @Test("Large height should return 40")
    func largeHeightShouldReturn40() {
        #expect(self.token.largeHeight == 40)
    }

    @Test("Icon size should return 16")
    func iconSizeShouldReturn16() {
        #expect(self.token.iconSize == 16)
    }

    // MARK: - Equatable Tests

    @Test("Equatable should return true")
    func equatableShouldReturnTrue() {
        #expect(XXXToken.Size() == XXXToken.Size())
    }
}
