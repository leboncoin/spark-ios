//
//  SliderCodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct SliderCodeSyntaxes {

    // MARK: - Properties

    static var content: [CodeSyntax] = {
        return [
            .init(title: "Default", code: Self.simple),
            .init(title: "With Step", code: Self.withStep),
            .init(title: "With Environment Modifiers", code: Self.withEnvironment),
            .init(title: "Full Configuration", code: Self.full)
        ]
    }()

    // MARK: - Private Properties

    private static var simple: String {
        """
        SparkSlider(
            value: $value,
            in: 0...1,
            onEditingChanged: { isEditing in
                // Do what you want
            }
        )
        .sparkTheme(theme)
        .sparkSliderIntent(.main)
        """
    }

    private static var withStep: String {
        """
        SparkSlider(
            value: $value,
            in: 0...1,
            step: 0.25,
            onEditingChanged: { isEditing in
                // Do what you want
            }
        )
        .sparkTheme(theme)
        .sparkSliderIntent(.main)
        """
    }

    private static var withEnvironment: String {
        """
        SparkSlider(
            value: $value,
            in: 0...100,
            step: 10
        )
        .sparkTheme(theme)
        .sparkSliderIntent(.support)
        .sparkSliderIsFloatingValueLabel(true)
        .sparkSliderAccessibilityRangeValuesLabel(
            min: "Minimum: 0",
            max: "Maximum: 100"
        )
        """
    }

    private static var full: String {
        """
        SparkSlider(
            value: $value,
            in: 0...100,
            step: 10,
            onEditingChanged: { isEditing in
                // Do what you want
            }
        )
        .sparkTheme(theme)
        .sparkSliderIntent(.support)
        .sparkSliderIsFloatingValueLabel(true)
        .sparkSliderAccessibilityRangeValuesLabel(
            min: "Minimum",
            max: "Maximum"
        )
        .disabled(false)
        .accessibilityLabel("Volume slider")
        """
    }
}
