//
//  ChipToken+SizeTests.swift
//  SparkComponentChipTests
//
//  Created by robin.lemaire on 09/09/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
import Foundation
@testable import SparkComponentChip
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

// MARK: - Tests

struct ChipTokenSizeTests {

    // MARK: - Properties

    private let token = ChipToken.Size()

    // MARK: - Tests

    @Test(arguments: [
        (ChipSize.medium, CGFloat(32)),
        (ChipSize.large, CGFloat(40))
    ])
    func heightShouldReturnExpectedValue(size: ChipSize, expectedHeight: CGFloat) {
        #expect(self.token.height(for: size) == expectedHeight)
    }

    @Test
    func iconShouldReturn16() {
        #expect(self.token.icon == 16)
    }

    // MARK: - Equatable Tests

    @Test
    func equatableShouldReturnTrue() {
        #expect(ChipToken.Size() == ChipToken.Size())
    }
}
