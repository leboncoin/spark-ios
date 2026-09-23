//
//  ChipViewModelDeprecatedTests.swift
//  SparkComponentChipTests
//
//  Created by michael.zimmermann on 10.05.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Combine
import SwiftUI
import XCTest
@testable import SparkComponentChip
@_spi(SI_SPI) @testable import SparkComponentChipTesting
@_spi(SI_SPI) import SparkCommonTesting
@_spi(SI_SPI) import SparkThemingTesting
import SparkTheming
import SparkTheme

final class ChipViewModelDeprecatedTests: XCTestCase {

    // MARK: - Properties

    var sut: ChipViewModelDeprecated<Void>!
    var getColorsUseCase: ChipGetColorsUseCaseDeprecatedableGeneratedMock!
    var getBorderUseCase: ChipGetBorderUseCaseableGeneratedMock!
    var theme: ThemeGeneratedMock!
    var radius: CGFloat = 12
    var subscriptions: Set<AnyCancellable>!

    // MARK: - Setup

    override func setUpWithError() throws {
        try super.setUpWithError()

        self.getColorsUseCase = ChipGetColorsUseCaseDeprecatedableGeneratedMock()
        self.getBorderUseCase = ChipGetBorderUseCaseableGeneratedMock()
        self.theme = ThemeGeneratedMock.mocked()
        self.subscriptions = .init()

        let colorToken = ColorTokenGeneratedMock()

        self.getColorsUseCase.executeWithThemeAndVariantAndIntentAndStateReturnValue = ChipStateColorsDeprecated(background: colorToken, border: colorToken, foreground: colorToken)
        self.getBorderUseCase.executeWithThemeAndVariantReturnValue = .init(radius: radius)

        self.sut = ChipViewModelDeprecated(
            theme: theme,
            variant: .outlined,
            intent: .main,
            alignment: .leadingIcon,
            content: Void(),
            getColorsUseCase: getColorsUseCase,
            getBorderUseCase: getBorderUseCase
        )
    }

    // MARK: - Tests

    func test_variant_change_triggers_color_change() throws {
        // Given
        let updateExpectation = expectation(description: "Colors and border status updated")
        updateExpectation.expectedFulfillmentCount = 2

        self.sut.$colors.sink(receiveValue: { _ in
            updateExpectation.fulfill()
        })
        .store(in: &self.subscriptions)

        // When
        self.sut.set(variant: .dashed)

        // Then
        wait(for: [updateExpectation], timeout: 0.1)
    }

    func test_theme_change_triggers_publishers() throws {
        // Given
        let updateExpectation = expectation(description: "Colors and other attributes updated")
        updateExpectation.expectedFulfillmentCount = 2

        let publishers = Publishers.Zip4(self.sut.$padding,
                                         self.sut.$spacing,
                                         self.sut.$borderRadius,
                                         self.sut.$font)

        Publishers.Zip(self.sut.$colors, publishers)
            .sink(receiveValue: { _ in
                updateExpectation.fulfill()
            })
            .store(in: &self.subscriptions)

        // When
        self.sut.set(theme: ThemeGeneratedMock.mocked())

        // Then
        wait(for: [updateExpectation], timeout: 0.1)
    }

    func test_intent_change_triggers_colors() throws {
        // Given
        let updateExpectation = expectation(description: "Colors updated")
        updateExpectation.expectedFulfillmentCount = 2

        self.sut.$colors.sink(receiveValue: { _ in
            updateExpectation.fulfill()
        })
        .store(in: &self.subscriptions)

        // When
        self.sut.set(intent: .alert)

        // Then
        wait(for: [updateExpectation], timeout: 0.1)
    }

    func test_new_theme_with_different_spacing_triggers_change() throws {
        // Given
        let updateExpectation = expectation(description: "Spacing updated")
        updateExpectation.expectedFulfillmentCount = 2

        var spacings = [CGFloat]()

        self.sut.$spacing.sink(receiveValue: { spacing in
            updateExpectation.fulfill()
            spacings.append(spacing)
        })
        .store(in: &self.subscriptions)

        // When
        let newTheme = ThemeGeneratedMock.mocked()
        let layout = LayoutGeneratedMock.mocked()
        let spacing = LayoutSpacingGeneratedMock.mocked()
        spacing.small = 20
        layout.spacing = spacing
        newTheme.layout = layout

        self.sut.set(theme: newTheme)

        // Then
        wait(for: [updateExpectation], timeout: 0.1)

        XCTAssertEqual(spacings, [3, 20])
    }

    func test_new_theme_with_different_padding_triggers_change() throws {
        // Given
        let updateExpectation = expectation(description: "Padding updated")
        updateExpectation.expectedFulfillmentCount = 2

        var paddings = [CGFloat]()

        self.sut.$padding.sink(receiveValue: { padding in
            updateExpectation.fulfill()
            paddings.append(padding)
        })
        .store(in: &self.subscriptions)

        // When
        let newTheme = ThemeGeneratedMock.mocked()
        let layout = LayoutGeneratedMock.mocked()
        let spacing = LayoutSpacingGeneratedMock.mocked()
        spacing.large = 100
        layout.spacing = spacing
        newTheme.layout = layout

        self.sut.set(theme: newTheme)

        // Then
        wait(for: [updateExpectation], timeout: 0.1)

        XCTAssertEqual(paddings, [7, 100])
    }

    func test_new_theme_with_different_border_radius_triggers_change() throws {
        // Given
        let updateExpectation = expectation(description: "Border radius updated")
        updateExpectation.expectedFulfillmentCount = 2

        var borderRadii = [CGFloat]()

        self.sut.$borderRadius.sink(receiveValue: { radius in
            updateExpectation.fulfill()
            borderRadii.append(radius)
        })
        .store(in: &self.subscriptions)

        // When
        let newTheme = ThemeGeneratedMock.mocked()

        self.sut.set(theme: newTheme)

        // Then
        wait(for: [updateExpectation], timeout: 0.1)

        XCTAssertEqual(borderRadii, [radius, radius])
    }

    func test_new_theme_with_different_font_triggers_change() throws {
        // Given
        let updateExpectation = expectation(description: "Font updated")
        updateExpectation.expectedFulfillmentCount = 2

        var fonts = [any TypographyFontToken]()

        self.sut.$font.sink(receiveValue: { font in
            updateExpectation.fulfill()
            fonts.append(font)
        })
        .store(in: &self.subscriptions)

        // When
        let newTheme = ThemeGeneratedMock.mocked()
        let typography = TypographyGeneratedMock.mocked()
        typography.body1 = TypographyFontTokenGeneratedMock.mocked(.title)
        newTheme.typography = typography

        self.sut.set(theme: newTheme)

        // Then
        wait(for: [updateExpectation], timeout: 0.1)

        XCTAssertEqual(fonts.map(\.font), [.body, .title])
    }

    func test_new_theme_with_different_colors_triggers_change() throws {
        // Given
        let updateExpectation = expectation(description: "Colors updated")
        updateExpectation.expectedFulfillmentCount = 2

        self.sut.$colors.sink(receiveValue: { font in
            updateExpectation.fulfill()
        })
        .store(in: &self.subscriptions)

        // When
        let newTheme = ThemeGeneratedMock.mocked()

        self.sut.set(theme: newTheme)

        // Then
        wait(for: [updateExpectation], timeout: 0.1)
    }

    func test_border_change_to_dashed() throws {
        // Given
        XCTAssertEqual(self.sut.isBorderDashed, false)

        // When
        self.sut.set(variant: .dashed)

        // Then
        XCTAssertEqual(self.sut.isBorderDashed, true)
    }

    func test_not_bordered() throws {
        // When
        self.sut.set(variant: .tinted)

        // Then
        XCTAssertEqual(self.sut.isBordered, false)
    }

    func test_is_bordered() throws {
        for variant in [ChipVariant.outlined, .dashed] {
            // When
            self.sut.set(variant: variant)

            // Then
            XCTAssertEqual(self.sut.isBordered, true)
        }
    }

    func test_padding_returns_large_spacing() throws {
        // Given
        let sut = ChipViewModelDeprecated(
            theme: theme,
            variant: .outlined,
            intent: .main,
            alignment: .leadingIcon,
            content: Void(),
            getColorsUseCase: getColorsUseCase,
            getBorderUseCase: getBorderUseCase
        )

        // Then
        XCTAssertEqual(sut.padding, theme.layout.spacing.large)
    }
}
