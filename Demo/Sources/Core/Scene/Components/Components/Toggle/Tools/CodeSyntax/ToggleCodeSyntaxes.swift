//
//  ToggleCodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct ToggleCodeSyntaxes {

    // MARK: - Properties

    static var content: [CodeSyntax] = {
        return [
            .init(title: "Default", code: Self.simple),
            .init(title: "With Text (LocalizedStringKey)", code: Self.withTextKey),
            .init(title: "With Text (String)", code: Self.withText),
            .init(title: "With Custom Label", code: Self.withCustomLabel),
            .init(title: "Full Configuration", code: Self.full)
        ]
    }()

    // MARK: - Private Properties

    private static var simple: String {
        """
        SparkToggle(isOn: $isOn)
            .sparkTheme(theme)
            .accessibilityLabel("Toggle")
        """
    }

    private static var withTextKey: String {
        """
        SparkToggle(
            "Enable notifications",
            isOn: $isOn
        )
        .sparkTheme(theme)
        """
    }

    private static var withText: String {
        """
        SparkToggle(
            "Enable notifications",
            isOn: $isOn
        )
        .sparkTheme(theme)
        """
    }

    private static var withCustomLabel: String {
        """
        SparkToggle(
            isOn: $isOn,
            label: {
                VStack(alignment: .leading) {
                    Text("Settings")
                    Text("Enable all notifications")
                }
            }
        )
        .sparkTheme(theme)
        """
    }

    private static var full: String {
        """
        SparkToggle(
            "Enable notifications",
            isOn: $isOn
        )
        .sparkTheme(theme)
        .disabled(false)
        .accessibilityLabel("Toggle label")
        """
    }
}
