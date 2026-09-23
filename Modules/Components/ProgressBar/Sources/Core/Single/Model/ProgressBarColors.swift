//
//  ProgressBarColors.swift
//  SparkComponentProgressBar
//
//  Created by robin.lemaire on 16/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

@_spi(SI_SPI) import SparkTheming

struct ProgressBarColors: Equatable {

    // MARK: - Properties

    var trackBackgroundColorToken: any ColorToken = ColorTokenClear()
    var indicatorBackgroundColorToken: any ColorToken = ColorTokenClear()
}

// MARK: Hashable & Equatable

extension ProgressBarColors {

    func hash(into hasher: inout Hasher) {
        hasher.combine(self.trackBackgroundColorToken)
        hasher.combine(self.indicatorBackgroundColorToken)
    }

    static func == (lhs: ProgressBarColors, rhs: ProgressBarColors) -> Bool {
        return lhs.trackBackgroundColorToken.equals(rhs.trackBackgroundColorToken) &&
        lhs.indicatorBackgroundColorToken.equals(rhs.indicatorBackgroundColorToken)
    }
}
