//
//  BadgeCodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct BadgeCodeSyntaxes {

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
        SparkBadge()
            .sparkTheme(theme)
            .sparkBadgeIntent(.main)
            .sparkBadgeSize(.medium)
            .sparkBadgeIsBorder(false)
        """
    }

    private static var withValue: String {
        """
        SparkBadge(value: 49)
            .sparkTheme(theme)
            .sparkBadgeIntent(.main)
            .sparkBadgeSize(.medium)
            .sparkBadgeIsBorder(false)
        """
    }

    private static var withValueAndUnit: String {
        """
        SparkBadge(value: 49, unit: "k")
            .sparkTheme(theme)
            .sparkBadgeIntent(.main)
            .sparkBadgeSize(.medium)
            .sparkBadgeIsBorder(false)
        """
    }

    private static var fullConfiguration: String {
        """
        SparkBadge(value: 10, unit: "items")
            .sparkTheme(theme)
            .sparkBadgeIntent(.main)
            .sparkBadgeSize(.medium)
            .sparkBadgeIsBorder(false)
            .accessibilityLabel("10 items badge")
        """
    }
}
