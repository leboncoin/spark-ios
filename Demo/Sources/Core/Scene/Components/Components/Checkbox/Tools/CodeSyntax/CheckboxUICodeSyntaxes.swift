//
//  CheckboxUICodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct CheckboxUICodeSyntaxes {

    // MARK: - Properties

    static var content: [CodeSyntax] = {
        return [
            .init(title: "Without Label", code: Self.withoutLabel),
            .init(title: "With Text", code: Self.withText),
            .init(title: "With Attributed Text", code: Self.withAttributedText),
            .init(title: "With Bool Property", code: Self.withBoolProperty),
            .init(title: "Full Configuration", code: Self.fullConfiguration)
        ]
    }()

    // MARK: - Private Properties

    private static var withoutLabel: String {
        """
        let checkbox = SparkUICheckbox(theme: theme)
        checkbox.intent = .main
        checkbox.accessibilityLabel = "Checkbox"
        checkbox.addAction(UIAction(handler: { _ in }), for: .valueChanged)
        """
    }

    private static var withText: String {
        """
        let checkbox = SparkUICheckbox(theme: theme)
        checkbox.text = "My checkbox label"
        checkbox.intent = .main
        checkbox.addAction(UIAction(handler: { _ in }), for: .valueChanged)
        """
    }

    private static var withAttributedText: String {
        """
        let checkbox = SparkUICheckbox(theme: theme)
        let attributedText = NSAttributedString(
            string: "Styled label",
            attributes: [.foregroundColor: UIColor.blue]
        )
        checkbox.attributedText = attributedText
        checkbox.intent = .main
        checkbox.addAction(UIAction(handler: { _ in }), for: .valueChanged)
        """
    }

    private static var withBoolProperty: String {
        """
        let checkbox = SparkUICheckbox(theme: theme)
        checkbox.text = "Accept terms"
        checkbox.intent = .main
        checkbox.isSelected = false
        checkbox.addAction(UIAction(handler: { _ in }), for: .valueChanged)
        """
    }

    private static var fullConfiguration: String {
        """
        let checkbox = SparkUICheckbox(theme: theme)
        checkbox.text = "Full configuration"
        checkbox.intent = .main
        checkbox.selectionState = .unselected
        checkbox.isEnabled = true
        checkbox.accessibilityLabel = "Full configuration checkbox"
        checkbox.addAction(UIAction(handler: { _ in }), for: .valueChanged)
        """
    }
}
