//
//  RatingCodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct RatingCodeSyntaxes {

    // MARK: - Properties

    static var content: [CodeSyntax] = {
        return [
            .init(title: "Display - Default", code: Self.displayDefault),
            .init(title: "Display - Text", code: Self.displayText),
            .init(title: "Display - Value Text", code: Self.displayValueText),
            .init(title: "Display - Value + Count Text", code: Self.displayValueCountText),
            .init(title: "Display - Value + Count + Additional Text", code: Self.displayAllText),
            .init(title: "Display - Custom Label", code: Self.displayCustomLabel),
            .init(title: "Display - Value + Count Labels", code: Self.displayValueCountLabels),
            .init(title: "Display - All Labels", code: Self.displayAllLabels),
            .init(title: "Input - Default", code: Self.inputDefault),
            .init(title: "Input - Full Configuration", code: Self.inputFull)
        ]
    }()

    // MARK: - Private Properties

    private static var displayDefault: String {
        """
        SparkRatingDisplay(value: 2.75)
            .sparkTheme(theme)
            .sparkRatingDisplaySize(.small)
            .sparkRatingDisplayStars(.one)
        """
    }

    private static var displayText: String {
        """
        SparkRatingDisplay(
            value: 2.75,
            text: "2,75"
        )
        .sparkTheme(theme)
        .sparkRatingDisplaySize(.small)
        .sparkRatingDisplayStars(.one)
        """
    }

    private static var displayValueText: String {
        """
        SparkRatingDisplay(
            value: 4.5,
            valueText: "4.5",
            countText: "120"
        )
        .sparkTheme(theme)
        .sparkRatingDisplaySize(.medium)
        .sparkRatingDisplayStars(.five)
        """
    }

    private static var displayValueCountText: String {
        """
        SparkRatingDisplay(
            value: 4.5,
            valueText: "4,5",
            countText: "120"
        )
        .sparkTheme(theme)
        .sparkRatingDisplaySize(.medium)
        .sparkRatingDisplayStars(.five)
        """
    }

    private static var displayAllText: String {
        """
        SparkRatingDisplay(
            value: 4.5,
            valueText: "4.5",
            countText: "120",
            additionalText: "Excellent"
        )
        .sparkTheme(theme)
        .sparkRatingDisplaySize(.medium)
        .sparkRatingDisplayStars(.five)
        """
    }

    private static var displayCustomLabel: String {
        """
        SparkRatingDisplay(
            value: 2.75,
            label: {
                VStack {
                    Text("2").bold()
                    Text("/")
                    Text("5")
                }
            }
        )
        .sparkTheme(theme)
        .sparkRatingDisplaySize(.small)
        .sparkRatingDisplayStars(.one)
        """
    }

    private static var displayValueCountLabels: String {
        """
        SparkRatingDisplay(
            value: 4.5,
            valueLabel: {
                Text("4.5")
                    .bold()
            },
            countLabel: {
                Text("(120)")
            }
        )
        .sparkTheme(theme)
        .sparkRatingDisplaySize(.medium)
        .sparkRatingDisplayStars(.five)
        """
    }

    private static var displayAllLabels: String {
        """
        SparkRatingDisplay(
            value: 4.5,
            valueLabel: {
                Text("4.5")
                    .bold()
            },
            countLabel: {
                Text("(120)")
            },
            additionalLabel: {
                Text("Excellent")
                    .italic()
            }
        )
        .sparkTheme(theme)
        .sparkRatingDisplaySize(.medium)
        .sparkRatingDisplayStars(.five)
        """
    }

    private static var inputDefault: String {
        """
        @State var value: Double = 3.0

        SparkRatingInput(value: $value)
            .sparkTheme(theme)
        """
    }

    private static var inputFull: String {
        """
        @State var value: Double = 3.0

        SparkRatingInput(value: $value)
            .sparkTheme(theme)
            .disabled(false)
            .accessibilityLabel("Rating input")
        """
    }
}
