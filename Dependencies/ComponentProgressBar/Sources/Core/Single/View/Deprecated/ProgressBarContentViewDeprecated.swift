//
//  ProgressBarContentViewDeprecated.swift
//  SparkComponentProgressBar
//
//  Created by robin.lemaire on 27/09/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkCommon
import SparkTheming

@available(*, deprecated, message: "Not used anymore by the new SparkProgressBar or SparkUIProgressBar")
struct ProgressBarContentViewDeprecated<IndicatorView: View>: View {

    // MARK: - Type alias

    private typealias AccessibilityIdentifier = ProgressBarAccessibilityIdentifier
    private typealias Constants = ProgressBarConstants

    // MARK: - Components

    private var indicatorView: () -> IndicatorView

    // MARK: - Properties

    private let trackCornerRadius: CGFloat?
    private let trackBackgroundColor: (any ColorToken)?

    @ScaledMetric private var height: CGFloat = Constants.height

    // MARK: - Initialization

    init(
        trackCornerRadius: CGFloat?,
        trackBackgroundColor: (any ColorToken)?,
        @ViewBuilder indicatorView: @escaping () -> IndicatorView
    ) {
        self.trackCornerRadius = trackCornerRadius
        self.trackBackgroundColor = trackBackgroundColor
        self.indicatorView = indicatorView
    }

    // MARK: - View

    var body: some View {
        ZStack() {
            // Track
            RoundedRectangle(cornerRadius: self.trackCornerRadius ?? 0)
                .fill(self.trackBackgroundColor)

            // Indicator view integration
            self.indicatorView()
        }
        .frame(height: self.height)
        .accessibilityIdentifier(AccessibilityIdentifier.progressBar)
    }
}
