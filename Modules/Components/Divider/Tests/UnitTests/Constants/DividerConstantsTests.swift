//
//  DividerConstantsTests.swift
//  SparkComponentDividerTests
//
//  Created by robin.lemaire on 12/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
import Foundation

@testable import SparkComponentDivider

@Suite("Divider Constants Tests")
struct DividerConstantsTests {

    // MARK: - Tests

    @Test("Minimum width value")
    func minimumWidthValue() {
        // GIVEN & WHEN
        let minimumWidth = DividerConstants.minimumWidth

        // THEN
        #expect(minimumWidth == 40)
    }

    @Test("Thickness value")
    func thicknessValue() {
        // GIVEN & WHEN
        let thickness = DividerConstants.thickness

        // THEN
        #expect(thickness == 1)
    }
}
