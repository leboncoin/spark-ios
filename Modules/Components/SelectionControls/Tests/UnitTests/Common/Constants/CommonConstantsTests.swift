//
//  CommonConstantsTests.swift
//  SparkComponentSelectionControlsTests
//
//  Created by robin.lemaire on 14/09/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentSelectionControls

@Suite("Common Constants Tests")
struct CommonConstantsTests {

    // MARK: - Animation

    @Test("Animation duration")
    func animationDuration() {
        #expect(
            CommonConstants.animationDuration == 0.2
        )
    }

    @Test("Toggle sizes hover padding")
    func toggleSizesHoverPadding() {
        #expect(
            CommonConstants.hoverPadding == 4
        )
    }

    // MARK: - Scaled

    @Test("Scaled min factor")
    func scaledMinFactor() {
        #expect(
            CommonConstants.Scaled.minFactor == 0.85
        )
    }

    @Test("Scaled max factor")
    func scaledMaxFactor() {
        #expect(
            CommonConstants.Scaled.maxFactor == 1.33
        )
    }
}
