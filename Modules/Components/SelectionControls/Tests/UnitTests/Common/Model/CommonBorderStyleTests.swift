//
//  CommonBorderStyleTests.swift
//  SparkComponentSelectionControlsTests
//
//  Created by robin.lemaire on 22/07/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation
import Testing
@testable import SparkComponentSelectionControls

@Suite("Common Border Style Tests")
struct CommonBorderStyleTests {

    // MARK: - Initialization Tests

    @Test("Initialization should use default values")
    func initializationShouldUseDefaultValues() {
        // GIVEN / WHEN
        let borderStyle = CommonBorderStyle()

        // THEN
        #expect(borderStyle.width == 0)
        #expect(borderStyle.cornerRadius == 0)
    }

    @Test("Initialization with custom values should use provided values")
    func initializationWithCustomValuesShouldUseProvidedValues() {
        // GIVEN
        let customWidth: CGFloat = 2.0
        let customCornerRadius: CGFloat = 8.0

        // WHEN
        let borderStyle = CommonBorderStyle(
            width: customWidth,
            cornerRadius: customCornerRadius
        )

        // THEN
        #expect(borderStyle.width == customWidth)
        #expect(borderStyle.cornerRadius == customCornerRadius)
    }
}
