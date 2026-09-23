//
//  ToggleUICodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct ToggleUICodeSyntaxes {

    // MARK: - Properties

    static var content: [CodeSyntax] = {
        return [
            .init(title: "Default", code: Self.simple),
            .init(title: "With Text", code: Self.withText),
            .init(title: "With Attributed Text", code: Self.withAttributedText),
            .init(title: "Full Configuration", code: Self.full)
        ]
    }()

    // MARK: - Private Properties

    private static var simple: String {
        """
        let toggle = SparkUISwitch(theme: theme)
        toggle.isOn = false
        toggle.addAction(UIAction(handler: { _ in }), for: .valueChanged)
        """
    }

    private static var withText: String {
        """
        let toggle = SparkUISwitch(theme: theme)
        toggle.text = "Enable notifications"
        toggle.isOn = false
        toggle.addAction(UIAction(handler: { _ in }), for: .valueChanged)
        """
    }

    private static var withAttributedText: String {
        """
        let toggle = SparkUISwitch(theme: theme)
        let attributedText = NSAttributedString(string: "Enable notifications")
        toggle.attributedText = attributedText
        toggle.isOn = false
        toggle.addAction(UIAction(handler: { _ in }), for: .valueChanged)
        """
    }

    private static var full: String {
        """
        let toggle = SparkUISwitch(theme: theme)
        toggle.text = "Enable notifications"
        toggle.isOn = false
        toggle.setOn(true, animated: true)
        toggle.isEnabled = true
        toggle.accessibilityLabel = "Toggle label"
        toggle.addAction(UIAction(handler: { _ in }), for: .valueChanged)
        """
    }
}
