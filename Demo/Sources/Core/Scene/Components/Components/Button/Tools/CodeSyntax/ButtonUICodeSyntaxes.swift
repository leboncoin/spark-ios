//
//  ButtonUICodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct ButtonUICodeSyntaxes {

    // MARK: - Properties

    static var content: [CodeSyntax] = {
        return [
            .init(title: "Text Only", code: Self.textOnly),
            .init(title: "Text + Icon", code: Self.textIcon),
            .init(title: "Icon Only", code: Self.iconOnly),
            .init(title: "With Custom Style", code: Self.customStyle),
            .init(title: "Multiple States", code: Self.multipleStates),
            .init(title: "Full Configuration", code: Self.fullConfiguration)
        ]
    }()

    // MARK: - Private Properties

    private static var textOnly: String {
        """
        let button = SparkUIButton(theme: theme)
        button.setTitle("Click Me", for: .normal)
        button.intent = .main
        button.variant = .filled
        button.size = .medium
        button.addAction(UIAction { _ in
            // Your action
        }, for: .touchUpInside)
        """
    }

    private static var textIcon: String {
        """
        let button = SparkUIButton(theme: theme)
        button.setTitle("Save", for: .normal)
        button.setImage(UIImage(icon: .spark), for: .normal)
        button.intent = .support
        button.variant = .outlined
        button.size = .medium
        button.alignment = .leadingImage
        button.addAction(UIAction { _ in
            // Your action
        }, for: .touchUpInside)
        """
    }

    private static var iconOnly: String {
        """
        let button = SparkUIButton(theme: theme)
        button.setImage(UIImage(icon: .spark), for: .normal)
        button.intent = .support
        button.variant = .ghost
        button.size = .small
        button.addAction(UIAction { _ in
            // Your action
        }, for: .touchUpInside)
        """
    }

    private static var customStyle: String {
        """
        let button = SparkUIButton(
            theme: theme,
            style: .uploadButton
        )
        button.setTitle("Upload", for: .normal)
        button.setImage(UIImage(icon: .spark), for: .normal)
        button.addAction(UIAction { _ in
            // Your action
        }, for: .touchUpInside)
        """
    }

    private static var multipleStates: String {
        """
        let button = SparkUIButton(theme: theme)
        button.setTitle("Normal", for: .normal)
        button.setTitle("Pressed", for: .highlighted)
        button.setTitle("Selected", for: .selected)
        button.setTitle("Disabled", for: .disabled)
        button.setImage(UIImage(icon: .spark), for: .normal)
        button.setImage(UIImage(icon: .sparkStarFill), for: .highlighted)
        button.intent = .main
        button.variant = .filled
        button.size = .medium
        button.alignment = .leadingImage
        button.addAction(UIAction { _ in
            // Your action
        }, for: .touchUpInside)
        """
    }

    private static var fullConfiguration: String {
        """
        let button = SparkUIButton(theme: theme)
        button.intent = .main
        button.variant = .filled
        button.size = .medium
        button.alignment = .leadingImage
        button.contentVisibility = .showAll
        button.removeStyles = false
        button.hasFeedback = true
        button.isLoading = false
        button.isEnabled = true
        button.isSelected = false
        button.setTitle("Submit", for: .normal)
        button.setAttributedTitle(attributedString, for: .highlighted)
        button.setImage(UIImage(icon: .spark), for: .normal)
        button.accessibilityLabel = "Submit button"
        button.addAction(UIAction { _ in
            // Your action
        }, for: .touchUpInside)
        """
    }
}
