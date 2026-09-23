//
//  VisualIdentificationViewModifier.swift
//  SparkCommon
//
//  Created by robin.lemaire on 28/07/2026.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import SwiftUI

private struct VisualIdentificationViewModifier: ViewModifier {

    // MARK: - Properties

    private let featureTogglesService: any SparkFeatureToggleServicing

    // MARK: - Initialization

    init(featureTogglesService: any SparkFeatureToggleServicing) {
        self.featureTogglesService = featureTogglesService
    }

    // MARK: - View

    func body(content: Content) -> some View {
        if self.featureTogglesService.visualIdentification {
            content
                .background(.cyan.opacity(0.8))
        } else {
            content
        }
    }
}

@_spi(SI_SPI) public extension View {

    /// Apply a background on the current view.
    /// Used to differentiate a Spark component (with the background)
    /// and a custom view (without the background).
    func sparkVisualIdentification(
        featureTogglesService: any SparkFeatureToggleServicing = SparkFeatureToggleService.shared
    ) -> some View {
        self.modifier(VisualIdentificationViewModifier(featureTogglesService: featureTogglesService))
    }
}
