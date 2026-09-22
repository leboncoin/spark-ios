//
//  SliderUICodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct SliderUICodeSyntaxes {

    // MARK: - Properties

    static var content: [CodeSyntax] = {
        return [
            .init(title: "Default", code: Self.simple),
            .init(title: "With Step", code: Self.withStep),
            .init(title: "With Labels", code: Self.withLabels),
            .init(title: "Full Configuration", code: Self.full)
        ]
    }()

    // MARK: - Private Properties

    private static var simple: String {
        """
        let slider = SparkUISlider(theme: theme)
        slider.value = 0
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.addAction(UIAction(handler: { _ in }), for: .valueChanged)
        """
    }

    private static var withStep: String {
        """
        let slider = SparkUISlider(theme: theme)
        slider.value = 0
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.step = 10
        slider.isContinuous = true
        slider.addAction(UIAction(handler: { _ in }), for: .valueChanged)
        """
    }

    private static var withLabels: String {
        """
        let slider = SparkUISlider(theme: theme)
        slider.value = 50
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.intent = .main

        slider.title = "Volume"
        slider.valueText = "50"
        slider.minimumRangeValueText = "0"
        slider.maximumRangeValueText = "100"

        slider.addAction(UIAction(handler: { _ in }), for: .valueChanged)
        """
    }

    private static var full: String {
        """
        let slider = SparkUISlider(theme: theme)
        slider.value = 0
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.step = 10
        slider.intent = .support
        slider.isContinuous = true
        slider.isFloatingValueLabel = true
        slider.isEnabled = true

        slider.title = "Volume"
        slider.valueText = "0"
        slider.minimumRangeValueText = "0"
        slider.maximumRangeValueText = "100"

        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        slider.valueNumberFormatter = formatter

        slider.accessibilityLabel = "Volume slider"

        slider.addAction(UIAction(handler: { _ in }), for: .valueChanged)
        """
    }
}
