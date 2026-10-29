//
//  ToggleConstantsTests.swift
//  SparkComponentSelectionControlsTests
//
//  Created by robin.lemaire on 14/09/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Foundation
import Testing
@testable import SparkComponentSelectionControls

@Suite("Toggle Constants Tests")
struct ToggleConstantsTests {

    // MARK: - Tests

    @Test("Toggle dot image padding")
    func toggleDotImagePadding() {
        #expect(
            ToggleConstants.toggleDotImagePadding == 5
        )
    }

    @Test("Toggle sizes width")
    func toggleSizesWidth() {
        #expect(
            ToggleConstants.width == 56
        )
    }

    @Test("Toggle sizes height")
    func toggleSizesHeight() {
        #expect(
            ToggleConstants.height == 32
        )
    }

    @Test("Toggle sizes dot size")
    func toggleSizesDotSize() {
        #expect(
            ToggleConstants.dotSize == ToggleConstants.height
        )
    }

    @Test("Toggle sizes dot pressed size")
    func toggleSizesDotPressedSize() {
        #expect(
            ToggleConstants.dotPressedSize == (ToggleConstants.width * 0.75)
        )
    }

    @Test("Toggle sizes dot increase pressed size")
    func toggleSizesDotIncreasePressedSize() {
        #expect(
            ToggleConstants.dotIncreasePressedSize == 10
        )
    }

    @Test("Toggle sizes padding")
    func toggleSizesPadding() {
        #expect(
            ToggleConstants.padding == 4
        )
    }

    @Test("Toggle sizes dot icon size")
    func toggleSizesDotIconSize() {
        #expect(
            ToggleConstants.dotIconSize == 14
        )
    }
}
