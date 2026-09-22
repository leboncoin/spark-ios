//
//  ButtonCodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct ButtonCodeSyntaxes {

    // MARK: - Properties

    static var content: [CodeSyntax] = {
        return [
            .init(title: "Text Only", code: Self.textOnly),
            .init(title: "Text + Icon", code: Self.textIcon),
            .init(title: "Icon Only", code: Self.iconOnly),
            .init(title: "Custom Label", code: Self.customLabel),
            .init(title: "Custom Label + Icon", code: Self.customLabelIcon),
            .init(title: "Text + Custom Image", code: Self.textCustomImage),
            .init(title: "Custom Image Only", code: Self.customImageOnly),
            .init(title: "Custom Label + Custom Image", code: Self.customLabelCustomImage),
            .init(title: "Menu - Text Only", code: Self.menuTextOnly),
            .init(title: "Menu - Text + Icon", code: Self.menuTextIcon),
            .init(title: "Menu - Icon Only", code: Self.menuIconOnly),
            .init(title: "Full Configuration", code: Self.fullConfiguration)
        ]
    }()

    // MARK: - Private Properties

    private static var textOnly: String {
        """
        SparkButton("Submit") {
            // Your action
        }
        .sparkTheme(theme)
        .sparkButtonIntent(.main)
        .sparkButtonVariant(.filled)
        .sparkButtonSize(.medium)
        """
    }

    private static var textIcon: String {
        """
        SparkButton(
            "Save",
            image: Image(icon: .spark)
        ) {
            // Your action
        }
        .sparkTheme(theme)
        .sparkButtonIntent(.support)
        .sparkButtonVariant(.outlined)
        .sparkButtonSize(.medium)
        .sparkButtonAlignment(.leadingImage)
        """
    }

    private static var iconOnly: String {
        """
        SparkButton(Image(icon: .spark)) {
            // Your action
        }
        .sparkTheme(theme)
        .sparkButtonIntent(.support)
        .sparkButtonVariant(.ghost)
        .sparkButtonSize(.small)
        """
    }

    private static var customLabel: String {
        """
        SparkButton(action: {
            // Your action
        }) {
            VStack {
                Text("Custom")
                Text("Label")
            }
        }
        .sparkTheme(theme)
        .sparkButtonIntent(.main)
        .sparkButtonVariant(.filled)
        """
    }

    private static var customLabelIcon: String {
        """
        SparkButton(
            Image(icon: .sparkStarFill),
            action: {
                // Your action
            }
        ) {
            VStack {
                Text("Rate")
                Text("5 stars")
            }
        }
        .sparkTheme(theme)
        .sparkButtonIntent(.main)
        .sparkButtonAlignment(.trailingImage)
        """
    }

    private static var textCustomImage: String {
        """
        SparkButton(
            "Notify",
            action: {
                // Your action
            },
            image: {
                SparkButtonImage(image: Image(icon: .spark))
                    .scaleEffect(isAnimating ? 1.2 : 1.0)
            }
        )
        .sparkTheme(theme)
        .sparkButtonIntent(.support)
        """
    }

    private static var customImageOnly: String {
        """
        SparkButton(
            action: {
                // Your action
            },
            image: {
                SparkButtonImage(image: Image(icon: .spark))
                    .rotationEffect(.degrees(rotation))
            }
        )
        .sparkTheme(theme)
        .sparkButtonIntent(.main)
        """
    }

    private static var customLabelCustomImage: String {
        """
        SparkButton(
            action: {
                // Your action
            },
            label: {
                Text("Custom Label")
            },
            image: {
                SparkButtonImage(image: Image(icon: .sparkStarFill))
                    .scaleEffect(isAnimating ? 1.2 : 1.0)
            }
        )
        .sparkTheme(theme)
        .sparkButtonIntent(.main)
        """
    }

    private static var menuTextOnly: String {
        """
        SparkButton("Options") {
            Button("Edit") { }
            Button("Delete") { }
            Button("Share") { }
        }
        .sparkTheme(theme)
        .sparkButtonIntent(.main)
        .sparkButtonVariant(.filled)
        """
    }

    private static var menuTextIcon: String {
        """
        SparkButton(
            "More",
            image: Image(icon: .spark)
        ) {
            Button("Edit") { }
            Button("Delete") { }
            Button("Share") { }
        }
        .sparkTheme(theme)
        .sparkButtonIntent(.support)
        .sparkButtonAlignment(.trailingImage)
        """
    }

    private static var menuIconOnly: String {
        """
        SparkButton(Image(icon: .spark)) {
            Button("Edit") { }
            Button("Delete") { }
            Button("Share") { }
        }
        .sparkTheme(theme)
        .sparkButtonIntent(.support)
        .sparkButtonSize(.small)
        """
    }

    private static var fullConfiguration: String {
        """
        SparkButton(
            "Submit",
            image: Image(icon: .spark)
        ) {
            // Your action
        }
        .sparkTheme(theme)
        .sparkButtonIntent(.main)
        .sparkButtonVariant(.filled)
        .sparkButtonSize(.medium)
        .sparkButtonAlignment(.leadingImage)
        .sparkButtonContentVisibility(.showAll)
        .sparkButtonHasFeedback(true)
        .sparkButtonIsLoading(false)
        .sparkButtonMaxWidth(.infinity)
        .sparkButtonRemoveStyles(false)
        .disabled(false)
        .accessibilityLabel("Submit button")
        """
    }
}
