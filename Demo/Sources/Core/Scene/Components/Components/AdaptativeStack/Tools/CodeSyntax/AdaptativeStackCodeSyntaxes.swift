//
//  AdaptativeStackCodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct AdaptativeStackCodeSyntaxes {

    // MARK: - Properties

    static var content: [CodeSyntax] = {
        return [
            .init(title: "Basic Horizontal", code: Self.basicHorizontal),
            .init(title: "Basic Vertical", code: Self.basicVertical),
            .init(title: "With Accessibility Settings", code: Self.withAccessibilitySettings),
            .init(title: "With Size Class", code: Self.withSizeClass),
            .init(title: "With Custom Accessibility Stack", code: Self.withCustomAccessibilityStack),
            .init(title: "Full Configuration", code: Self.fullConfiguration)
        ]
    }()

    // MARK: - Private Properties

    private static var basicHorizontal: String {
        """
        SparkAdaptiveStack(
            axis: .horizontal,
            spacing: 8
        ) {
            Text("First")
            Text("Second")
            Text("Third")
        }
        """
    }

    private static var basicVertical: String {
        """
        SparkAdaptiveStack(
            axis: .vertical,
            spacing: 8
        ) {
            Text("First")
            Text("Second")
            Text("Third")
        }
        """
    }

    private static var withAccessibilitySettings: String {
        """
        SparkAdaptiveStack(
            axis: .horizontal,
            alignment: .center,
            spacing: 8,
            accessibilityAlignment: .leading,
            accessibilitySpacing: 16
        ) {
            Text("Home")
            Text("Messages")
            Text("Profile")
        }
        """
    }

    private static var withSizeClass: String {
        """
        SparkAdaptiveStack(
            axis: .horizontal,
            alignment: .bottom,
            spacing: 8,
            accessibilityAlignment: .trailing,
            accessibilitySpacing: 16,
            accessibilitySizeClass: .compact
        ) {
            Text("Hello")
            Text("Bye")
        }
        """
    }

    private static var withCustomAccessibilityStack: String {
        """
        SparkAdaptiveStack(
            axis: .horizontal,
            alignment: .bottom,
            spacing: 8,
            accessibilityAlignment: .trailing,
            accessibilitySpacing: 16,
            showAccessibilityStack: false
        ) {
            Text("Hello")
            Text("Bye")
        }
        """
    }

    private static var fullConfiguration: String {
        """
        SparkAdaptiveStack(
            axis: .horizontal,
            alignment: .center,
            spacing: 16,
            accessibilityAlignment: .leading,
            accessibilitySpacing: 8,
            accessibilitySizeClass: .compact
        ) {
            Text("Home")
            Text("Messages")
            Text("Profile")
        }
        """
    }
}
