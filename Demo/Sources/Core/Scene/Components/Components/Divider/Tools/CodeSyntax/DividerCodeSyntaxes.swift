//
//  DividerCodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct DividerCodeSyntaxes {

    // MARK: - Properties

    static var content: [CodeSyntax] = {
        return [
            .init(title: "Without Text", code: Self.withoutText),
            .init(title: "With Localized Text", code: Self.withLocalizedText),
            .init(title: "With Text", code: Self.withText),
            .init(title: "With Custom Label", code: Self.withCustomLabel),
            .init(title: "Full Configuration", code: Self.fullConfiguration)
        ]
    }()

    // MARK: - Private Properties

    private static var withoutText: String {
        """
        SparkDivider()
            .sparkTheme(theme)
            .sparkDividerIntent(.outline)
            .sparkDividerAxis(.horizontal)
        """
    }

    private static var withLocalizedText: String {
        """
        SparkDivider("My text Key")
            .sparkTheme(theme)
            .sparkDividerIntent(.outline)
            .sparkDividerAxis(.horizontal)
            .sparkDividerAlignment(.leading)
        """
    }

    private static var withText: String {
        """
        SparkDivider("My text")
            .sparkTheme(theme)
            .sparkDividerIntent(.outlineHigh)
            .sparkDividerAxis(.horizontal)
            .sparkDividerAlignment(.center)
        """
    }

    private static var withCustomLabel: String {
        """
        SparkDivider {
            HStack {
                Text("My")
                Text("text")
                    .foregroundColor(.blue)
            }
        }
        .sparkTheme(theme)
        .sparkDividerIntent(.outline)
        .sparkDividerAxis(.horizontal)
        .sparkDividerAlignment(.trailing)
        """
    }

    private static var fullConfiguration: String {
        """
        SparkDivider("Section Divider")
            .sparkTheme(theme)
            .sparkDividerAlignment(.center)
            .sparkDividerAxis(.horizontal)
            .sparkDividerIntent(.outlineHigh)
            .accessibilityLabel("Custom divider label")
        """
    }
}
