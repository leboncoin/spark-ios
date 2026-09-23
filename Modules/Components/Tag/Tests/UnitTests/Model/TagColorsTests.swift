//
//  TagColorsTests.swift
//  SparkComponentTagTests
//
//  Created by robin.lemaire on 06/08/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentTag
@_spi(SI_SPI) @testable import SparkTheming
import SparkTheme

struct TagColorsTests {

    // MARK: - Tests

    @Test
    func test_default_values() {
        // GIVEN / WHEN
        let colors = TagColors()

        // THEN
        #expect(colors.backgroundColor.equals(ColorTokenClear()))
        #expect(colors.borderColor.equals(ColorTokenClear()))
        #expect(colors.iconColor.equals(ColorTokenClear()))
        #expect(colors.textColor.equals(ColorTokenClear()))
    }

    @Test
    func test_init_with_all_parameters() {
        // GIVEN / WHEN
        let colors = SparkTheme.shared.colors

        let tagColors = TagColors(
            backgroundColor: colors.base.background,
            borderColor: colors.main.main,
            iconColor: colors.accent.accent,
            textColor: colors.feedback.info
        )

        // THEN
        #expect(tagColors.backgroundColor.equals(colors.base.background))
        #expect(tagColors.borderColor.equals(colors.main.main))
        #expect(tagColors.iconColor.equals(colors.accent.accent))
        #expect(tagColors.textColor.equals(colors.feedback.info))
    }

    @Test
    func test_init_with_tintColor() {
        // GIVEN / WHEN
        let colors = SparkTheme.shared.colors

        let tagColors = TagColors(
            backgroundColor: colors.base.background,
            borderColor: colors.main.main,
            tintColor: colors.feedback.success
        )

        // THEN
        #expect(tagColors.backgroundColor.equals(colors.base.background))
        #expect(tagColors.borderColor.equals(colors.main.main))
        #expect(tagColors.iconColor.equals(colors.feedback.success))
        #expect(tagColors.textColor.equals(colors.feedback.success))
    }

    @Test
    func test_equal() {
        // GIVEN / WHEN
        let colors = SparkTheme.shared.colors

        let colors1 = TagColors(
            backgroundColor: colors.base.background,
            borderColor: colors.main.main,
            iconColor: colors.accent.accent,
            textColor: colors.feedback.info
        )

        let colors2 = TagColors(
            backgroundColor: colors.base.background,
            borderColor: colors.main.main,
            iconColor: colors.accent.accent,
            textColor: colors.feedback.info
        )

        // THEN
        #expect(colors1 == colors2)
    }

    @Test
    func test_not_equal_backgroundColor() {
        // GIVEN / WHEN
        let colors = SparkTheme.shared.colors

        let colors1 = TagColors(
            backgroundColor: colors.base.background,
            borderColor: colors.main.main,
            iconColor: colors.accent.accent,
            textColor: colors.feedback.info
        )

        let colors2 = TagColors(
            backgroundColor: colors.base.surface,
            borderColor: colors.main.main,
            iconColor: colors.accent.accent,
            textColor: colors.feedback.info
        )

        // THEN
        #expect(colors1 != colors2)
    }

    @Test
    func test_not_equal_borderColor() {
        // GIVEN / WHEN
        let colors = SparkTheme.shared.colors

        let colors1 = TagColors(
            backgroundColor: colors.base.background,
            borderColor: colors.main.main,
            iconColor: colors.accent.accent,
            textColor: colors.feedback.info
        )

        let colors2 = TagColors(
            backgroundColor: colors.base.background,
            borderColor: colors.support.support,
            iconColor: colors.accent.accent,
            textColor: colors.feedback.info
        )

        // THEN
        #expect(colors1 != colors2)
    }

    @Test
    func test_not_equal_iconColor() {
        // GIVEN / WHEN
        let colors = SparkTheme.shared.colors

        let colors1 = TagColors(
            backgroundColor: colors.base.background,
            borderColor: colors.main.main,
            iconColor: colors.accent.accent,
            textColor: colors.feedback.info
        )

        let colors2 = TagColors(
            backgroundColor: colors.base.background,
            borderColor: colors.main.main,
            iconColor: colors.feedback.success,
            textColor: colors.feedback.info
        )

        // THEN
        #expect(colors1 != colors2)
    }

    @Test
    func test_not_equal_textColor() {
        // GIVEN / WHEN
        let colors = SparkTheme.shared.colors

        let colors1 = TagColors(
            backgroundColor: colors.base.background,
            borderColor: colors.main.main,
            iconColor: colors.accent.accent,
            textColor: colors.feedback.info
        )

        let colors2 = TagColors(
            backgroundColor: colors.base.background,
            borderColor: colors.main.main,
            iconColor: colors.accent.accent,
            textColor: colors.feedback.alert
        )

        // THEN
        #expect(colors1 != colors2)
    }

    @Test
    func test_hashable() {
        // GIVEN / WHEN
        let colors = SparkTheme.shared.colors

        let colors1 = TagColors(
            backgroundColor: colors.base.background,
            borderColor: colors.main.main,
            iconColor: colors.accent.accent,
            textColor: colors.feedback.info
        )

        let colors2 = TagColors(
            backgroundColor: colors.base.background,
            borderColor: colors.main.main,
            iconColor: colors.accent.accent,
            textColor: colors.feedback.info
        )

        let colors3 = TagColors(
            backgroundColor: colors.base.surface,
            borderColor: colors.main.main,
            iconColor: colors.accent.accent,
            textColor: colors.feedback.info
        )

        // THEN
        #expect(colors1.hashValue == colors2.hashValue)
        #expect(colors1.hashValue != colors3.hashValue)
    }
}
