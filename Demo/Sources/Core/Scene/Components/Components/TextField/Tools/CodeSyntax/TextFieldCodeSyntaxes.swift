//
//  TextFieldCodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct TextFieldCodeSyntaxes {

    // MARK: - Properties

    static var content: [CodeSyntax] = {
        return [
            .init(title: "Text Only", code: Self.textOnly),
            .init(title: "Text + Left View", code: Self.textLeftView),
            .init(title: "Text + Right View", code: Self.textRightView),
            .init(title: "Text + Both Views", code: Self.textBothViews),
            .init(title: "Text + Left Addon", code: Self.textLeftAddon),
            .init(title: "Text + Right Addon", code: Self.textRightAddon),
            .init(title: "Text + Both Addons", code: Self.textBothAddons),
            .init(title: "With Formatter", code: Self.withFormatter),
            .init(title: "With Format", code: Self.withFormat),
            .init(title: "Secure Entry", code: Self.secureEntry),
            .init(title: "Read Only", code: Self.readOnly),
            .init(title: "With Clear Button", code: Self.withClearButton),
            .init(title: "Full Configuration", code: Self.fullConfiguration)
        ]
    }()

    // MARK: - Private Properties

    private static var textOnly: String {
        """
        SparkTextField(
            "Placeholder",
            text: $text
        )
        .sparkTheme(theme)
        .sparkTextFieldIntent(.neutral)
        """
    }

    private static var textLeftView: String {
        """
        SparkTextField(
            "Search",
            text: $text,
            leftView: {
                Image(systemName: "magnifyingglass")
            }
        )
        .sparkTheme(theme)
        .sparkTextFieldIntent(.neutral)
        """
    }

    private static var textRightView: String {
        """
        SparkTextField(
            "Enter text",
            text: $text,
            rightView: {
                Image(systemName: "xmark.circle.fill")
                    .onTapGesture { text = "" }
            }
        )
        .sparkTheme(theme)
        .sparkTextFieldIntent(.neutral)
        """
    }

    private static var textBothViews: String {
        """
        SparkTextField(
            "Search",
            text: $text,
            leftView: {
                Image(systemName: "magnifyingglass")
            },
            rightView: {
                Image(systemName: "xmark.circle.fill")
                    .onTapGesture { text = "" }
            }
        )
        .sparkTheme(theme)
        .sparkTextFieldIntent(.neutral)
        """
    }

    private static var textLeftAddon: String {
        """
        SparkTextField(
            "Amount",
            text: $text,
            leftAddon: {
                Text("€")
            }
        )
        .sparkTheme(theme)
        .sparkTextFieldIntent(.neutral)
        .sparkTextFieldLeftAddonConfiguration(hasPadding: true, hasSeparator: true)
        """
    }

    private static var textRightAddon: String {
        """
        SparkTextField(
            "Decimal value",
            text: $text,
            rightAddon: {
                Text(".00")
            }
        )
        .sparkTheme(theme)
        .sparkTextFieldIntent(.neutral)
        .sparkTextFieldRightAddonConfiguration(hasPadding: true, hasSeparator: true)
        """
    }

    private static var textBothAddons: String {
        """
        SparkTextField(
            "Price",
            text: $text,
            leftAddon: {
                Text("€")
            },
            rightAddon: {
                Text(".00")
            }
        )
        .sparkTheme(theme)
        .sparkTextFieldIntent(.neutral)
        .sparkTextFieldLeftAddonConfiguration(hasPadding: true, hasSeparator: true)
        .sparkTextFieldRightAddonConfiguration(hasPadding: true, hasSeparator: true)
        """
    }

    private static var withFormatter: String {
        """
        let numberFormatter = NumberFormatter()
        @State var value: Double = 5

        SparkTextField(
            "Enter number",
            value: $value,
            formatter: numberFormatter
        )
        .sparkTheme(theme)
        .sparkTextFieldIntent(.neutral)
        """
    }

    private static var withFormat: String {
        """
        @State var price: Double = 12

        SparkTextField(
            "Price",
            value: $price,
            format: .currency(code: "EUR")
        )
        .sparkTheme(theme)
        .sparkTextFieldIntent(.neutral)
        """
    }

    private static var secureEntry: String {
        """
        SparkTextField(
            "Password",
            text: $text
        )
        .sparkTheme(theme)
        .sparkTextFieldIntent(.neutral)
        .sparkTextFieldSecureEntry(true)
        """
    }

    private static var readOnly: String {
        """
        SparkTextField(
            "Read only field",
            text: $text
        )
        .sparkTheme(theme)
        .sparkTextFieldIntent(.neutral)
        .sparkTextFieldReadOnly(true)
        """
    }

    private static var withClearButton: String {
        """
        SparkTextField(
            "Text with clear",
            text: $text
        )
        .sparkTheme(theme)
        .sparkTextFieldIntent(.neutral)
        .sparkTextFieldClearMode(.whileEditing)
        """
    }

    private static var fullConfiguration: String {
        """
        SparkTextField(
            "Full example",
            text: $text,
            leftView: {
                Image(systemName: "magnifyingglass")
            },
            rightView: {
                Image(systemName: "xmark.circle.fill")
                    .onTapGesture { text = "" }
            },
            leftAddon: {
                Text("€")
            },
            rightAddon: {
                Text(".00")
            }
        )
        .sparkTheme(theme)
        .sparkTextFieldIntent(.success)
        .sparkTextFieldReadOnly(false)
        .sparkTextFieldClearMode(.always)
        .sparkTextFieldSecureEntry(false)
        .sparkTextFieldLeftAddonConfiguration(hasPadding: true, hasSeparator: true)
        .sparkTextFieldRightAddonConfiguration(hasPadding: true, hasSeparator: true)
        .disabled(false)
        .sparkTextFieldAccessibilityLabel("Text field label")
        .sparkTextFieldAccessibilityValue("Custom value")
        .sparkTextFieldAccessibilityHint("Enter your text here")
        """
    }
}
