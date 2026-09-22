//
//  ChipCodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct ChipCodeSyntaxes {

    // MARK: - Properties

    static var content: [CodeSyntax] = {
        return [
            .init(title: "Icon Only", code: Self.iconOnly),
            .init(title: "Text Only", code: Self.textOnly),
            .init(title: "Text + Icon", code: Self.textIcon),
            .init(title: "Custom Label", code: Self.customLabel),
            .init(title: "With Extra Content", code: Self.withExtraContent),
            .init(title: "Full Configuration", code: Self.fullConfiguration)
        ]
    }()

    // MARK: - Private Properties

    private static var iconOnly: String {
        """
        SparkChip(
            icon: Image(icon: .spark),
            action: {
                // Your action
            }
        )
        .sparkTheme(theme)
        .sparkChipIntent(.main)
        .sparkChipVariant(.filled)
        .accessibilityLabel("Chip icon")
        """
    }

    private static var textOnly: String {
        """
        SparkChip(
            "My Chip",
            action: {
                // Your action
            }
        )
        .sparkTheme(theme)
        .sparkChipIntent(.main)
        .sparkChipVariant(.filled)
        """
    }

    private static var textIcon: String {
        """
        SparkChip(
            "My Chip",
            icon: Image(icon: .spark),
            action: {
                // Your action
            }
        )
        .sparkTheme(theme)
        .sparkChipIntent(.support)
        .sparkChipVariant(.outlined)
        .sparkChipAlignment(.trailingIcon)
        """
    }

    private static var customLabel: String {
        """
        SparkChip(
            icon: Image(icon: .spark),
            action: {
                // Your action
            },
            label: {
                VStack(alignment: .leading) {
                    Text("Primary")
                    Text("Secondary")
                        .font(.caption)
                }
            }
        )
        .sparkTheme(theme)
        .sparkChipIntent(.main)
        .sparkChipVariant(.filled)
        """
    }

    private static var withExtraContent: String {
        """
        SparkChip(
            "Notifications",
            icon: Image(icon: .spark),
            action: {
                // Your action
            },
            extraContent: {
                Text("99")
                    .font(.caption)
                    .padding(4)
                    .background(.red)
                    .cornerRadius(8)
            }
        )
        .sparkTheme(theme)
        .sparkChipIntent(.main)
        .sparkChipVariant(.filled)
        """
    }

    private static var fullConfiguration: String {
        """
        SparkChip(
            "Full Configuration",
            icon: Image(icon: .spark),
            action: {
                // Your action
            }
        )
        .sparkTheme(theme)
        .sparkChipIntent(.main)
        .sparkChipVariant(.filled)
        .sparkChipAlignment(.leadingIcon)
        .sparkChipSize(.large)
        .sparkIsSelected(false)
        .disabled(false)
        .accessibilityLabel("Full configuration chip")
        """
    }
}
