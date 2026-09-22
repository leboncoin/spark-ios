//
//  RatingGetColorUseCase.swift
//  SparkComponentRating
//
//  Created by michael.zimmermann on 09.11.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

// sourcery: AutoMockable
@available(*, deprecated, message: "Not used anymore by the new SparkRatingInput/SparkRatingDisplay or SparkUIRatingInput/SparkUIRatingDisplay")
protocol RatingGetColorsUseCaseDeprecatedable {
    func execute(theme: any Theme,
                 intent: RatingIntent,
                 state: RatingStateDeprecated
    ) -> RatingColorsDeprecated
}

extension RatingGetColorsUseCaseDeprecatedable {
    func execute(theme: any Theme,
                 intent: RatingIntent
    ) -> RatingColorsDeprecated {
        return self.execute(theme: theme, intent: intent, state: .standard)
    }
}

/// Get the colors of the rating
@available(*, deprecated, message: "Not used anymore by the new SparkRatingInput/SparkRatingDisplay or SparkUIRatingInput/SparkUIRatingDisplay")
struct RatingGetColorsUseCaseDeprecated: RatingGetColorsUseCaseDeprecatedable {

    /// Returns the rating colors.
    ///
    /// - Parameters:
    ///   - theme: the current theme
    ///   - intent: the intent defining the color in the theme
    ///   - state: the current state
    func execute(theme: any Theme,
                 intent: RatingIntent,
                 state: RatingStateDeprecated
    ) -> RatingColorsDeprecated {

        var colors: RatingColorsDeprecated

        switch intent {
            case .main: colors = RatingColorsDeprecated(
                fillColor: state.isPressed ? theme.colors.states.mainVariantPressed : theme.colors.main.mainVariant,
                strokeColor: theme.colors.base.onSurface.opacity(theme.dims.dim3),
                opacity: theme.dims.none
            )
        }

        if !state.isEnabled {
            colors.opacity = theme.dims.dim3
        }
        return colors
    }

}
