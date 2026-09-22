//
//  IconCodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct IconCodeSyntaxes {

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
        SparkIcon(Image(systemName: "pencil"))
            .sparkTheme(theme)
            .sparkIconIntent(.main)
            .sparkIconSize(.medium)
        """
    }

    private static var withIntent: String {
        """
        SparkIcon(Image(icon: .arrows))
            .sparkTheme(theme)
            .sparkIconIntent(.support)
            .sparkIconSize(.medium)
        """
    }

    private static var withSize: String {
        """
        SparkIcon(Image(icon: .spark))
            .sparkTheme(theme)
            .sparkIconIntent(.main)
            .sparkIconSize(.small)
        """
    }

    private static var withAccessibility: String {
        """
        SparkIcon(Image(icon: .infoOutline))
            .sparkTheme(theme)
            .sparkIconIntent(.main)
            .sparkIconSize(.medium)
            .accessibilityLabel("Information icon")
            .accessibilityHidden(false)
        """
    }

    private static var fullConfiguration: String {
        """
        SparkIcon(Image(icon: .checkFill))
            .sparkTheme(theme)
            .sparkIconIntent(.main)
            .sparkIconSize(.large)
            .accessibilityLabel("Success icon")
            .accessibilityHidden(false)
        """
    }
}
