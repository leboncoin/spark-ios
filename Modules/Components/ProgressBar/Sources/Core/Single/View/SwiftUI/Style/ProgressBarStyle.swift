//
//  ProgressBarStyle.swift
//  SparkComponentProgressBar
//
//  Created by robin.lemaire on 17/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkCommon

struct ProgressBarStyle<IndicatorModifier>: ProgressViewStyle where IndicatorModifier: ViewModifier {

    // MARK: - Properties

    private let colors: ProgressBarColors
    private let cornerRadius: CGFloat
    private let indicatorModifier: IndicatorModifier?

    // MARK: - Initialization

    init(
        colors: ProgressBarColors,
        cornerRadius: CGFloat
    ) where IndicatorModifier == EmptyModifier {
        self.colors = colors
        self.cornerRadius = cornerRadius
        self.indicatorModifier = nil
    }

    init(
        colors: ProgressBarColors,
        cornerRadius: CGFloat,
        indicatorModifier: IndicatorModifier
    ) {
        self.colors = colors
        self.cornerRadius = cornerRadius
        self.indicatorModifier = indicatorModifier
    }

    // MARK: - Body

    func makeBody(configuration: Configuration) -> some View {
        let progress = configuration.fractionCompleted ?? 0

        GeometryReader { geometry in
            RoundedRectangle(cornerRadius: self.cornerRadius)
                .fill(self.colors.trackBackgroundColorToken)
                .frame(width: geometry.size.width)
                .overlay(alignment: .leading) {

                    // Indicator
                    RoundedRectangle(cornerRadius: self.cornerRadius)
                        .fill(self.colors.indicatorBackgroundColorToken)
                        .sparkFrame(height: ProgressBarConstants.height)
                        .indicatorStyle(
                            modifier: self.indicatorModifier,
                            width: geometry.size.width * progress
                        )
                }
        }
    }
}

// MARK: - Extension

private extension View {

    @ViewBuilder
    func indicatorStyle<IndicatorModifier>(
        modifier: IndicatorModifier? = nil,
        width: CGFloat
    ) -> some View where IndicatorModifier: ViewModifier {
        if let modifier {
            self.modifier(modifier)
        } else {
            self.frame(size: width)
        }
    }
}

// MARK: - Modifier

struct EmptyModifier: ViewModifier {

    func body(content: Content) -> some View {
        content
    }
}
