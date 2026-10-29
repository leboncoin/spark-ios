//
//  XXXToken+BorderTests.swift
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

struct XXXTokenBorderTests {

    // MARK: - Properties

    private let theme = ThemeGeneratedMock.mocked()

    private var token: XXXToken.Border {
        return .init(theme: self.theme)
    }

    // MARK: - Tests

    @Test
    func radiusShouldReturnRadiusFull() {
        #expect(self.token.radius == self.theme.border.radius.full)
    }

    @Test(arguments: [true, false])
    func widthShouldReturnExpectedValue(isSelected: Bool) {
        // GIVEN
        let expected = isSelected ? self.theme.border.width.medium : self.theme.border.width.small

        // WHEN
        let result = self.token.width(isSelected: isSelected)

        // THEN
        #expect(result == expected)
    }

    // MARK: - Equatable Tests

    @Test
    func equatableWithSameThemeShouldReturnTrue() {
        #expect(XXXToken.Border(theme: self.theme) == XXXToken.Border(theme: self.theme))
    }

    @Test
    func equatableWithDifferentThemeShouldReturnFalse() {
        #expect(XXXToken.Border(theme: self.theme) != XXXToken.Border(theme: ThemeGeneratedMock.mocked2()))
    }
}
