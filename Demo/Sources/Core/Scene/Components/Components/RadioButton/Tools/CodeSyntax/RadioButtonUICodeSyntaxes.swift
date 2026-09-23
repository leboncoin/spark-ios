//
//  RadioButtonUICodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct RadioButtonUICodeSyntaxes {

    // MARK: - Properties

    static var content: [CodeSyntax] = {
        return [
            .init(title: "Default", code: Self.defaultExample),
            .init(title: "With Binding", code: Self.withBinding),
            .init(title: "Standalone", code: Self.standalone),
            .init(title: "Full Configuration", code: Self.fullConfiguration)
        ]
    }()

    // MARK: - Private Properties

    private static var defaultExample: String {
        """
        let label = NSAttributedString(string: "Label 1")
        let selectedID: Binding<Int?> = // Your binding

        let radioButton = RadioButtonUIView(
            theme: theme,
            id: 1,
            label: label,
            selectedID: selectedID
        )
        """
    }

    private static var withBinding: String {
        """
        let label = NSAttributedString(string: "Label 1")
        let selectedID: Binding<Int?> = // Your binding

        let radioButton = RadioButtonUIView(
            theme: theme,
            intent: .support,
            id: 1,
            label: label,
            selectedID: selectedID,
            labelAlignment: .trailing
        )
        radioButton.isEnabled = true
        radioButton.accessibilityLabel = "Radio button label"
        """
    }

    private static var standalone: String {
        """
        let label = NSAttributedString(string: "Label 1")

        let radioButton = RadioButtonUIView(
            theme: theme,
            intent: .support,
            id: 1,
            label: label,
            isSelected: false,
            labelAlignment: .trailing
        )
        radioButton.publisher.sink { isSelected in
            // Handle selection change
        }
        """
    }

    private static var fullConfiguration: String {
        """
        let label = NSAttributedString(string: "Label 1")
        let selectedID: Binding<Int?> = // Your binding

        let radioButton = RadioButtonUIView(
            theme: theme,
            intent: .support,
            id: 1,
            label: label,
            selectedID: selectedID,
            labelAlignment: .trailing
        )
        radioButton.theme = theme
        radioButton.intent = .support
        radioButton.isEnabled = true
        radioButton.text = "Updated Label"
        radioButton.labelAlignment = .trailing
        radioButton.accessibilityLabel = "Radio button label"
        """
    }
}
