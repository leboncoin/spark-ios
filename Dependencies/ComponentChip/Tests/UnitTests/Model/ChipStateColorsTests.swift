//
//  ChipStateColorsTests.swift
//  SparkComponentChipTests
//
//  Created by robin.lemaire on 23/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI
import XCTest
@testable import SparkComponentChip
@_spi(SI_SPI) import SparkThemingTesting

final class ChipStateColorsTests: XCTestCase {

    // MARK: - Tests

    func test_initialization() {
        // GIVEN
        let border = ColorTokenGeneratedMock.random()
        let pressedBorder = ColorTokenGeneratedMock.random()
        let selectedBorder = ColorTokenGeneratedMock.random()
        let content = ColorTokenGeneratedMock.random()
        let selectedContent = ColorTokenGeneratedMock.random()
        let background = ColorTokenGeneratedMock.random()
        let pressedBackground = ColorTokenGeneratedMock.random()
        let selectedBackground = ColorTokenGeneratedMock.random()

        // WHEN
        let stateColors = ChipStateColors(
            border: border,
            pressedBorder: pressedBorder,
            selectedBorder: selectedBorder,
            content: content,
            selectedContent: selectedContent,
            background: background,
            pressedBackground: pressedBackground,
            selectedBackground: selectedBackground
        )

        // THEN
        XCTAssertTrue(stateColors.border.equals(border))
        XCTAssertTrue(stateColors.pressedBorder.equals(pressedBorder))
        XCTAssertTrue(stateColors.selectedBorder.equals(selectedBorder))
        XCTAssertTrue(stateColors.content.equals(content))
        XCTAssertTrue(stateColors.selectedContent.equals(selectedContent))
        XCTAssertTrue(stateColors.background.equals(background))
        XCTAssertTrue(stateColors.pressedBackground.equals(pressedBackground))
        XCTAssertTrue(stateColors.selectedBackground.equals(selectedBackground))
    }

    func test_equality_when_same_colors() {
        // GIVEN
        let border = ColorTokenGeneratedMock.random()
        let pressedBorder = ColorTokenGeneratedMock.random()
        let selectedBorder = ColorTokenGeneratedMock.random()
        let content = ColorTokenGeneratedMock.random()
        let selectedContent = ColorTokenGeneratedMock.random()
        let background = ColorTokenGeneratedMock.random()
        let pressedBackground = ColorTokenGeneratedMock.random()
        let selectedBackground = ColorTokenGeneratedMock.random()

        let stateColors1 = ChipStateColors(
            border: border,
            pressedBorder: pressedBorder,
            selectedBorder: selectedBorder,
            content: content,
            selectedContent: selectedContent,
            background: background,
            pressedBackground: pressedBackground,
            selectedBackground: selectedBackground
        )

        let stateColors2 = ChipStateColors(
            border: border,
            pressedBorder: pressedBorder,
            selectedBorder: selectedBorder,
            content: content,
            selectedContent: selectedContent,
            background: background,
            pressedBackground: pressedBackground,
            selectedBackground: selectedBackground
        )

        // THEN
        XCTAssertEqual(stateColors1, stateColors2)
    }
}
