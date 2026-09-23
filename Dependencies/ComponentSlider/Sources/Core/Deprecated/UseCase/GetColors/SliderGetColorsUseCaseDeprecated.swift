//
//  SliderGetColorsUseCaseDeprecated.swift
//  SparkComponentSlider
//
//  Created by louis.borlee on 23/11/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import UIKit
import SparkTheming

// sourcery: AutoMockable
@available(*, deprecated, message: "Not used anymore by SparkSlider or SparkUISlider")
protocol SliderGetColorsUseCasableDeprecated {
    func execute(theme: any Theme,
                 intent: SliderIntent) -> SliderColorsDeprecated
}

@available(*, deprecated, message: "Not used anymore by SparkSlider or SparkUISlider")
final class SliderGetColorsUseCaseDeprecated: SliderGetColorsUseCasableDeprecated {
    func execute(theme: any Theme,
                 intent: SliderIntent) -> SliderColorsDeprecated {
        let colors = theme.colors
        let dims = theme.dims

        let sliderColors: SliderColorsDeprecated
        let trackColor = colors.base.onBackground.opacity(dims.dim4)
        switch intent {
        case .support:
            sliderColors = .init(
                track: trackColor,
                indicator: colors.support.support,
                handle: colors.support.support,
                handleActiveIndicator: colors.support.supportContainer
            )
        case .success:
            sliderColors = .init(
                track: trackColor,
                indicator: colors.feedback.success,
                handle: colors.feedback.success,
                handleActiveIndicator: colors.feedback.successContainer
            )
        case .error:
            sliderColors = .init(
                track: trackColor,
                indicator: colors.feedback.error,
                handle: colors.feedback.error,
                handleActiveIndicator: colors.feedback.errorContainer
            )
        case .alert:
            sliderColors = .init(
                track: trackColor,
                indicator: colors.feedback.alert,
                handle: colors.feedback.alert,
                handleActiveIndicator: colors.feedback.alertContainer
            )
        case .accent:
            sliderColors = .init(
                track: trackColor,
                indicator: colors.accent.accent,
                handle: colors.accent.accent,
                handleActiveIndicator: colors.accent.accentContainer
            )
        case .main:
            sliderColors = .init(
                track: trackColor,
                indicator: colors.main.main,
                handle: colors.main.main,
                handleActiveIndicator: colors.main.mainContainer
            )
        case .neutral:
            sliderColors = .init(
                track: trackColor,
                indicator: colors.feedback.neutral,
                handle: colors.feedback.neutral,
                handleActiveIndicator: colors.feedback.neutralContainer
            )
        case .info:
            sliderColors = .init(
                track: trackColor,
                indicator: colors.feedback.info,
                handle: colors.feedback.info,
                handleActiveIndicator: colors.feedback.infoContainer
            )
        }
        return sliderColors
    }
}
