//
//  BadgeUICodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct BadgeUICodeSyntaxes {

    // MARK: - Properties

    static var content: [CodeSyntax] = {
        return [
            .init(title: "Without Value", code: Self.withoutValue),
            .init(title: "With Value", code: Self.withValue),
            .init(title: "With Value and Unit", code: Self.withValueAndUnit),
            .init(title: "Full Configuration", code: Self.fullConfiguration)
        ]
    }()

    // MARK: - Private Properties

    private static var withoutValue: String {
        """
        let badge = SparkUIBadge(theme: theme)
        badge.intent = .main
        badge.size = .medium
        badge.isBorder = false
        """
    }

    private static var withValue: String {
        """
        let badge = SparkUIBadge(theme: theme)
        badge.value = 49
        badge.intent = .main
        badge.size = .medium
        badge.isBorder = false
        """
    }

    private static var withValueAndUnit: String {
        """
        let badge = SparkUIBadge(theme: theme)
        badge.value = 49
        badge.unit = "k"
        badge.intent = .main
        badge.size = .medium
        badge.isBorder = false
        """
    }

    private static var fullConfiguration: String {
        """
        let badge = SparkUIBadge(theme: theme)
        badge.value = 10
        badge.unit = "items"
        badge.intent = .main
        badge.size = .medium
        badge.isBorder = false
        badge.accessibilityLabel = "10 items badge"
        """
    }
}
