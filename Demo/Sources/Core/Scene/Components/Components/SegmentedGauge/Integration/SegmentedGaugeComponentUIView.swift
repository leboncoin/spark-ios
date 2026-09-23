//
//  SegmentedGaugeComponentUIView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 31/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import UIKit
import SwiftUI

// MARK: - View Controller

typealias SegmentedGaugeComponentUIViewController = ComponentDisplayViewControllerRepresentable<SegmentedGaugeConfiguration, SparkUISegmentedGauge, SegmentedGaugeConfigurationView, SegmentedGaugeComponentUIViewMaker, SegmentedGaugeExtraTools>

extension SegmentedGaugeComponentUIViewController {

    init() {
        self.init(style: .alone)
    }
}

// MARK: - View Maker

final class SegmentedGaugeComponentUIViewMaker: ComponentUIViewMaker {

    // MARK: - Type Alias

    typealias Configuration = SegmentedGaugeConfiguration
    typealias ComponentView = SparkUISegmentedGauge
    typealias ConfigurationView = SegmentedGaugeConfigurationView
    typealias DisplayViewController = ComponentDisplayViewController<Configuration, ComponentView, ConfigurationView, SegmentedGaugeComponentUIViewMaker, ExtraTools>
    typealias ExtraTools = SegmentedGaugeExtraTools

    // MARK: - Properties

    weak var viewController: DisplayViewController?

    // MARK: - Methods

    func createComponentView(
        for configuration: Configuration
    ) -> ComponentView {
        let segmentedGauge = SparkUISegmentedGauge(
            theme: configuration.theme.value
        )
        self.updateCommonProperties(segmentedGauge, for: configuration)

        return segmentedGauge
    }

    func updateComponentView(
        _ componentView: ComponentView,
        for configuration: Configuration
    ) {
        componentView.theme = configuration.theme.value

        self.updateCommonProperties(componentView, for: configuration)
    }

    private func updateCommonProperties(
        _ componentView: ComponentView,
        for configuration: Configuration
    ) {
        componentView.alignment = configuration.alignment
        componentView.withMarker = configuration.withMarker
        componentView.segments = configuration.segments
        componentView.size = configuration.size
        componentView.type = configuration.type.toRealType(configuration)
        componentView.demoTitle(configuration)
        componentView.demoDescription(configuration)
        componentView.demoAccessibilityLabel(configuration)
    }
}
// MARK: - Extension

private extension SparkUISegmentedGauge {

    func demoTitle(_ configuration: SegmentedGaugeConfiguration) {
        guard let title = configuration.title.nilIfEmpty else {
            self.title = nil
            return
        }

        if configuration.uiKitIsAttributedTitle {
            self.attributedTitle = title.demoNSAttributedString
        } else {
            self.title = title
        }
    }

    func demoDescription(_ configuration: SegmentedGaugeConfiguration) {
        guard let description = configuration.description.nilIfEmpty else {
            self.descriptionString = nil
            return
        }

        if configuration.uiKitIsAttributedDescription {
            self.attributedDescription = description.demoNSAttributedString
        } else {
            self.descriptionString = description
        }
    }
}
