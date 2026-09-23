//
//  IconUICodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct IconUICodeSyntaxes {

    // MARK: - Properties

    static var content: [CodeSyntax] = {
        return [
            .init(title: "Default", code: Self.defaultIcon),
            .init(title: "With Intent", code: Self.withIntent),
            .init(title: "With Size", code: Self.withSize),
            .init(title: "With Accessibility", code: Self.withAccessibility),
            .init(title: "Full Configuration", code: Self.fullConfiguration)
        ]
    }()

    // MARK: - Private Properties

    private static var defaultIcon: String {
        """
        let icon = SparkUIIcon(
            theme: theme,
            image: UIImage(systemName: "pencil")
        )
        icon.intent = .main
        icon.size = .medium
        """
    }

    private static var withIntent: String {
        """
        let icon = SparkUIIcon(
            theme: theme,
            image: UIImage(icon: .arrows)
        )
        icon.intent = .support
        icon.size = .medium
        """
    }

    private static var withSize: String {
        """
        let icon = SparkUIIcon(
            theme: theme,
            image: UIImage(icon: .spark)
        )
        icon.intent = .main
        icon.size = .small
        """
    }

    private static var withAccessibility: String {
        """
        let icon = SparkUIIcon(
            theme: theme,
            image: UIImage(icon: .infoOutline)
        )
        icon.intent = .main
        icon.size = .medium
        icon.accessibilityLabel = "Information icon"
        icon.isAccessibilityElement = true
        """
    }

    private static var fullConfiguration: String {
        """
        let icon = SparkUIIcon(
            theme: theme,
            image: UIImage(icon: .checkFill)
        )
        icon.intent = .main
        icon.size = .large
        icon.accessibilityLabel = "Success icon"
        icon.isAccessibilityElement = true
        """
    }
}
