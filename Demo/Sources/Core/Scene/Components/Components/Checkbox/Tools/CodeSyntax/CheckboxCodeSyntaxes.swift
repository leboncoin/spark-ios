//
//  CheckboxCodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct CheckboxCodeSyntaxes {

    // MARK: - Properties

    static var content: [CodeSyntax] = {
        return [
            .init(title: "Without Label", code: Self.withoutLabel),
            .init(title: "With Text", code: Self.withText),
            .init(title: "With Custom Label", code: Self.withCustomLabel),
            .init(title: "Using Bool Binding", code: Self.withBoolBinding),
            .init(title: "Full Configuration", code: Self.fullConfiguration)
        ]
    }()

    // MARK: - Private Properties

    private static var withoutLabel: String {
        """
        SparkCheckbox(
            selectionState: $selectionState
        )
        .sparkTheme(theme)
        .sparkCheckboxIntent(.main)
        .accessibilityLabel("Checkbox")
        """
    }

    private static var withText: String {
        """
        SparkCheckbox(
            "My checkbox label",
            selectionState: $selectionState
        )
        .sparkTheme(theme)
        .sparkCheckboxIntent(.main)
        """
    }

    private static var withCustomLabel: String {
        """
        SparkCheckbox(
            selectionState: $selectionState,
            label: {
                VStack(alignment: .leading) {
                    Text("Primary Text")
                    Text("Secondary text")
                        .font(.caption)
                }
            }
        )
        .sparkTheme(theme)
        .sparkCheckboxIntent(.main)
        """
    }

    private static var withBoolBinding: String {
        """
        SparkCheckbox(
            "Accept terms",
            isSelected: $isSelected
        )
        .sparkTheme(theme)
        .sparkCheckboxIntent(.main)
        """
    }

    private static var fullConfiguration: String {
        """
        SparkCheckbox(
            "Full configuration",
            selectionState: $selectionState
        )
        .sparkTheme(theme)
        .sparkCheckboxIntent(.main)
        .disabled(false)
        .accessibilityLabel("Full configuration checkbox")
        """
    }
}
