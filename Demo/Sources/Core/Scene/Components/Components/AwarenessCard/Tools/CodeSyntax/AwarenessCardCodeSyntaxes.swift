//
//  AwarenessCardCodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 17/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct AwarenessCardCodeSyntaxes {

    // MARK: - Properties

    static var content: [CodeSyntax] = {
        return [
            .init(title: "Title Only", code: Self.titleOnly),
            .init(title: "Description Only", code: Self.descriptionOnly),
            .init(title: "Title and Description", code: Self.titleAndDescription),
            .init(title: "With Button Action", code: Self.withButtonAction),
            .init(title: "With TextLink Action", code: Self.withTextLinkAction),
            .init(title: "Different Intents", code: Self.differentIntents),
            .init(title: "Custom Labels", code: Self.customLabels)
        ]
    }()

    // MARK: - Private Properties

    private static var titleOnly: String {
        """
        SparkAwarenessCard(
            icon: Image(.alertDiamond),
            title: "Important Notice"
        )
        .sparkTheme(theme)
        .sparkCardIntent(.alert)
        """
    }

    private static var descriptionOnly: String {
        """
        SparkAwarenessCard(
            icon: Image(.infoOutline),
            description: "Your data is being synchronized. This may take a few moments."
        )
        .sparkTheme(theme)
        .sparkCardIntent(.info)
        """
    }

    private static var titleAndDescription: String {
        """
        SparkAwarenessCard(
            icon: Image(.alertDiamond),
            title: "System Update Available",
            description: "A new version of the system is ready to install. Please save your work before updating."
        )
        .sparkTheme(theme)
        .sparkCardIntent(.alert)
        """
    }

    private static var withButtonAction: String {
        """
        SparkAwarenessCard(
            icon: Image(.alertDiamond),
            title: "Action Required",
            description: "Please review and confirm your account details.",
            actionLabel: {
                SparkButton("Confirm") {
                    // Handle action
                }
            }
        )
        .sparkTheme(theme)
        .sparkCardIntent(.alert)
        """
    }

    private static var withTextLinkAction: String {
        """
        SparkAwarenessCard(
            icon: Image(.infoOutline),
            title: "Pro Tip",
            description: "Use keyboard shortcuts to speed up your workflow.",
            actionLabel: {
                SparkTextLink("Learn More") {
                    // Handle action
                }
            }
        )
        .sparkTheme(theme)
        .sparkCardIntent(.info)
        """
    }

    private static var differentIntents: String {
        """
        VStack(spacing: 16) {
            // Alert intent
            SparkAwarenessCard(
                icon: Image(.alertDiamond),
                title: "Alert",
                description: "This is an alert message."
            )
            .sparkTheme(theme)
            .sparkCardIntent(.alert)

            // Success intent
            SparkAwarenessCard(
                icon: Image(.check),
                title: "Success",
                description: "Operation completed successfully."
            )
            .sparkTheme(theme)
            .sparkCardIntent(.success)

            // Info intent
            SparkAwarenessCard(
                icon: Image(.infoOutline),
                title: "Information",
                description: "Here is some helpful information."
            )
            .sparkTheme(theme)
            .sparkCardIntent(.info)
        }
        """
    }

    private static var customLabels: String {
        """
        SparkAwarenessCard(
            icon: Image(.alertDiamond),
            titleLabel: {
                VStack(alignment: .leading) {
                    Text("Custom Title")
                        .fontWeight(.bold)
                    Text("With subtitle")
                        .font(.caption)
                }
            },
            descriptionLabel: {
                VStack(alignment: .leading) {
                    Text("This demonstrates custom label configuration.")
                    Text("You can add any SwiftUI view here.")
                        .fontWeight(.semibold)
                }
            },
            actionLabel: {
                SparkButton("Take Action") {
                    // Handle action
                }
            }
        )
        .sparkTheme(theme)
        .sparkCardIntent(.alert)
        """
    }
}
