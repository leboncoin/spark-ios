//
//  ProgressBarColorsDeprecated+ExtensionTests.swift
//  SparkComponentProgressBarTests
//
//  Created by robin.lemaire on 20/09/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

@testable import SparkComponentProgressBar
@_spi(SI_SPI) import SparkThemingTesting
import SparkTheming
import SparkTheme

extension ProgressBarColorsDeprecated {

    // MARK: - Properties

    static func mocked(
        trackBackgroundColorToken: any ColorToken = ColorTokenGeneratedMock.random(),
        indicatorBackgroundColorToken: any ColorToken = ColorTokenGeneratedMock.random()
    ) -> Self {
        return .init(
            trackBackgroundColorToken: trackBackgroundColorToken,
            indicatorBackgroundColorToken: indicatorBackgroundColorToken
        )
    }
}
