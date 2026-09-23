//
//  SegmentedGaugeLabelsStyle.swift
//  SparkComponentSegmentedGauge
//
//  Created by robin.lemaire on 29/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

@_spi(SI_SPI) import SparkTheming

struct SegmentedGaugeLabelsStyle: Equatable {

    // MARK: - Properties

    var titleTypography: any TypographyFontToken = TypographyFontTokenClear()
    var descriptionTypography: any TypographyFontToken = TypographyFontTokenClear()

    var color: any ColorToken = ColorTokenClear()

    // MARK: - Equatable

    static func == (lhs: SegmentedGaugeLabelsStyle, rhs: SegmentedGaugeLabelsStyle) -> Bool {
        return lhs.titleTypography.equals(rhs.titleTypography) &&
        lhs.descriptionTypography.equals(rhs.descriptionTypography) &&
        lhs.color.equals(rhs.color)
    }
}
