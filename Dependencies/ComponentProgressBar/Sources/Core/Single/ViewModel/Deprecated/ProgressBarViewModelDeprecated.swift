//
//  ProgressBarViewModelDeprecated.swift
//  SparkComponentProgressBar
//
//  Created by robin.lemaire on 20/09/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

@_spi(SI_SPI) import SparkCommon
import SparkTheming

@available(*, deprecated, message: "Not used anymore by the new SparkProgressBar or SparkUIProgressBar")
final class ProgressBarViewModelDeprecated: ProgressBarMainViewModelDeprecated<ProgressBarGetColorsUseCaseDeprecated> {

    // MARK: - Initialization

    convenience init(
        for frameworkType: FrameworkType,
        theme: any Theme,
        intent: ProgressBarIntent,
        shape: ProgressBarShape
    ) {
        self.init(
            for: frameworkType,
            theme: theme,
            intent: intent,
            shape: shape,
            getColorsUseCase: ProgressBarGetColorsUseCaseDeprecated()
        )
    }
}

// MARK: - Extension

extension ProgressBarViewModelDeprecated: ProgressBarValueViewModelDeprecated {
}
