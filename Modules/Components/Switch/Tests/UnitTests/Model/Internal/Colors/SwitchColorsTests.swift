//
//  SwitchColorsTests.swift
//  SparkComponentSwitchTests
//
//  Created by michael.zimmermann on 24.07.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentSwitch
import SparkTheme

@Suite("Switch Colors Tests")
struct SwitchColorsTests {

    @Test("Equal")
    func equal() {
        let colors = SparkTheme.shared.colors

        let colors1 = SwitchColors(
            toggleBackgroundColors: SwitchStatusColors(
                onColorToken: colors.feedback.info,
                offColorToken: colors.feedback.alert),
            toggleDotForegroundColors: SwitchStatusColors(
                onColorToken: colors.main.main,
                offColorToken: colors.support.support),
            toggleDotBackgroundColor: colors.base.background,
            textForegroundColor: colors.main.onMain)

        let colors2 = SwitchColors(
            toggleBackgroundColors: SwitchStatusColors(
                onColorToken: colors.feedback.info,
                offColorToken: colors.feedback.alert),
            toggleDotForegroundColors: SwitchStatusColors(
                onColorToken: colors.main.main,
                offColorToken: colors.support.support),
            toggleDotBackgroundColor: colors.base.background,
            textForegroundColor: colors.main.onMain)

        #expect(colors1 == colors2)
    }

    @Test("Not equal")
    func notEqual() {
        let colors = SparkTheme.shared.colors

        let colors1 = SwitchColors(
            toggleBackgroundColors: SwitchStatusColors(
                onColorToken: colors.feedback.info,
                offColorToken: colors.feedback.alert),
            toggleDotForegroundColors: SwitchStatusColors(
                onColorToken: colors.main.main,
                offColorToken: colors.support.support),
            toggleDotBackgroundColor: colors.base.background,
            textForegroundColor: colors.main.onMain)

        let colors2 = SwitchColors(
            toggleBackgroundColors: SwitchStatusColors(
                onColorToken: colors.feedback.error,
                offColorToken: colors.feedback.alert),
            toggleDotForegroundColors: SwitchStatusColors(
                onColorToken: colors.main.main,
                offColorToken: colors.support.support),
            toggleDotBackgroundColor: colors.base.background,
            textForegroundColor: colors.main.onMain)

        #expect(colors1 != colors2)
    }

}
