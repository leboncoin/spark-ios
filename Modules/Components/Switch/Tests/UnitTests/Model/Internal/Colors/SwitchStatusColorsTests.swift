//
//  SwitchStatusColorsTests.swift
//  SparkComponentSwitchTests
//
//  Created by michael.zimmermann on 24.07.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentSwitch
import SparkTheme

@Suite("Switch Status Colors Tests")
struct SwitchStatusColorsTests {

    @Test("Equal")
    func equal() {
        let colors = SparkTheme.shared.colors

        let colors1 = SwitchStatusColors(
                onColorToken: colors.feedback.info,
                offColorToken: colors.feedback.alert)

        let colors2 = SwitchStatusColors(
            onColorToken: colors.feedback.info,
            offColorToken: colors.feedback.alert)

        #expect(colors1 == colors2)
    }

    @Test("Not equal")
    func notEqual() {
        let colors = SparkTheme.shared.colors

        let colors1 = SwitchStatusColors(
                onColorToken: colors.feedback.info,
                offColorToken: colors.feedback.alert)

        let colors2 = SwitchStatusColors(
                onColorToken: colors.main.main,
                offColorToken: colors.support.support)

        #expect(colors1 != colors2)
    }
}
