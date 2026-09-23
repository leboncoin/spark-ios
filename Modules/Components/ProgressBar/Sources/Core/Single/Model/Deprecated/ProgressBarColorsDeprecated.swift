//
//  ProgressBarColorsDeprecated.swift
//  SparkComponentProgressBar
//
//  Created by robin.lemaire on 20/09/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import SparkTheming

@available(*, deprecated, message: "Not used anymore by the new SparkProgressBar or SparkUIProgressBar")
protocol ProgressBarMainColorsDeprecated: Hashable, Equatable {
    var trackBackgroundColorToken: any ColorToken { get }
    var indicatorBackgroundColorToken: any ColorToken { get }
}

@available(*, deprecated, message: "Not used anymore by the new SparkProgressBar or SparkUIProgressBar")
struct ProgressBarColorsDeprecated: ProgressBarMainColorsDeprecated {

    // MARK: - Properties

    let trackBackgroundColorToken: any ColorToken
    let indicatorBackgroundColorToken: any ColorToken
}

// MARK: Hashable & Equatable

extension ProgressBarColorsDeprecated {

    func hash(into hasher: inout Hasher) {
        hasher.combine(self.trackBackgroundColorToken)
        hasher.combine(self.indicatorBackgroundColorToken)
    }

    static func == (lhs: ProgressBarColorsDeprecated, rhs: ProgressBarColorsDeprecated) -> Bool {
        return lhs.trackBackgroundColorToken.equals(rhs.trackBackgroundColorToken) &&
        lhs.indicatorBackgroundColorToken.equals(rhs.indicatorBackgroundColorToken)
    }
}
