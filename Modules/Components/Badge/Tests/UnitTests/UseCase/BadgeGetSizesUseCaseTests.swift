//
//  BadgeGetSizesUseCaseTests.swift
//  SparkComponentBadgeTests
//
//  Created by robin.lemaire on 24/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI
import Testing
@testable import SparkComponentBadge
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

@MainActor
@Suite("Badge Get Sizes UseCase Tests")
struct BadgeGetSizesUseCaseTests {

    // MARK: - Properties

    private let sut: BadgeGetSizesUseCase
    private let theme: ThemeGeneratedMock

    // MARK: - Initialization

    init() {
        self.sut = BadgeGetSizesUseCase()
        self.theme = ThemeGeneratedMock.mocked()
    }

    // MARK: - Small Size Tests

    @Test("Execute when small without border without value")
    func executeWhenSmallWithoutBorderWithoutValue() {
        // GIVEN / WHEN
        let result = self.sut.execute(
            theme: self.theme,
            size: .small,
            isBorder: false,
            value: nil
        )

        // THEN
        #expect(result.content == 8)
        #expect(result.border == .zero)
        #expect(result.horizontalSpacing == self.theme.layout.spacing.small)
        #expect(result.attachHorizontalSpacing == self.theme.layout.spacing.small)
    }

    @Test("Execute when small with border without value")
    func executeWhenSmallWithBorderWithoutValue() {
        // GIVEN
        let expectedBorder = self.theme.border.width.medium

        // WHEN
        let result = self.sut.execute(
            theme: self.theme,
            size: .small,
            isBorder: true,
            value: nil
        )

        // THEN
        #expect(result.content == (8 + expectedBorder * 2))
        #expect(result.border == expectedBorder)
        #expect(result.horizontalSpacing == (self.theme.layout.spacing.small + expectedBorder))
        #expect(result.attachHorizontalSpacing == self.theme.layout.spacing.small)
    }

    @Test("Execute when small with border with value")
    func executeWhenSmallWithBorderWithValue() {
        // GIVEN
        let expectedBorder = self.theme.border.width.medium

        // WHEN
        let result = self.sut.execute(
            theme: self.theme,
            size: .small,
            isBorder: true,
            value: 10
        )

        // THEN
        #expect(result.content == (16 + expectedBorder * 2))
        #expect(result.border == expectedBorder)
        #expect(result.horizontalSpacing == (self.theme.layout.spacing.small + expectedBorder))
        #expect(result.attachHorizontalSpacing == self.theme.layout.spacing.small)
    }

    // MARK: - Small Size Tests

    @Test("Execute when medium without border without value")
    func executeWhenMediumWithoutBorderWithoutValue() {
        // GIVEN / WHEN
        let result = self.sut.execute(
            theme: self.theme,
            size: .medium,
            isBorder: false,
            value: nil
        )

        // THEN
        #expect(result.content == 16)
        #expect(result.border == .zero)
        #expect(result.horizontalSpacing == self.theme.layout.spacing.medium)
        #expect(result.attachHorizontalSpacing == self.theme.layout.spacing.small)
    }

    @Test("Execute when medium with border without value")
    func executeWhenMediumWithBorderWithoutValue() {
        // GIVEN
        let expectedBorder = self.theme.border.width.medium

        // WHEN
        let result = self.sut.execute(
            theme: self.theme,
            size: .medium,
            isBorder: true,
            value: nil
        )

        // THEN
        #expect(result.content == (16 + expectedBorder * 2))
        #expect(result.border == expectedBorder)
        #expect(result.horizontalSpacing == (self.theme.layout.spacing.medium + expectedBorder))
        #expect(result.attachHorizontalSpacing == self.theme.layout.spacing.small)
    }

    @Test("Execute when medium with border with value")
    func executeWhenMediumWithBorderWithValue() {
        // GIVEN
        let expectedBorder = self.theme.border.width.medium

        // WHEN
        let result = self.sut.execute(
            theme: self.theme,
            size: .medium,
            isBorder: true,
            value: 5
        )

        // THEN
        #expect(result.content == (24 + expectedBorder * 2))
        #expect(result.border == expectedBorder)
        #expect(result.horizontalSpacing == (self.theme.layout.spacing.medium + expectedBorder))
    }
}
