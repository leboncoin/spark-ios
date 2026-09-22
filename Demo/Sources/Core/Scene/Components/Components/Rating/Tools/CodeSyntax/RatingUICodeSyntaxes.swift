//
//  RatingUICodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct RatingUICodeSyntaxes {

    // MARK: - Properties

    static var content: [CodeSyntax] = {
        return [
            .init(title: "Display - Default", code: Self.displayDefault),
            .init(title: "Display - With Text", code: Self.displayWithText),
            .init(title: "Display - All Texts", code: Self.displayAllTexts),
            .init(title: "Display - Attributed Text", code: Self.displayAttributedText),
            .init(title: "Display - Full Configuration", code: Self.displayFull),
            .init(title: "Input - Default", code: Self.inputDefault),
            .init(title: "Input - Full Configuration", code: Self.inputFull)
        ]
    }()

    // MARK: - Private Properties

    private static var displayDefault: String {
        """
        let ratingDisplay = SparkUIRatingDisplay(theme: theme)
        ratingDisplay.value = 3.76
        ratingDisplay.size = .large
        ratingDisplay.stars = .one
        """
    }

    private static var displayWithText: String {
        """
        let ratingDisplay = SparkUIRatingDisplay(theme: theme)
        ratingDisplay.value = 3.76
        ratingDisplay.size = .large
        ratingDisplay.stars = .one
        ratingDisplay.text = "(3,76)"
        """
    }

    private static var displayAllTexts: String {
        """
        let ratingDisplay = SparkUIRatingDisplay(theme: theme)
        ratingDisplay.value = 3.76
        ratingDisplay.size = .large
        ratingDisplay.stars = .one
        ratingDisplay.text = "3,76"
        ratingDisplay.countText = "49"
        ratingDisplay.additionalText = "excellent"
        """
    }

    private static var displayAttributedText: String {
        """
        let ratingDisplay = SparkUIRatingDisplay(theme: theme)
        ratingDisplay.value = 4.5
        ratingDisplay.size = .medium
        ratingDisplay.stars = .five
        ratingDisplay.attributedText = NSAttributedString(
            string: "4.5",
            attributes: [.font: UIFont.boldSystemFont(ofSize: 14)]
        )
        ratingDisplay.attributedCountText = NSAttributedString(
            string: "1,234",
            attributes: [.foregroundColor: UIColor.gray]
        )
        ratingDisplay.attributedAdditionalText = NSAttributedString(
            string: "Reviews",
            attributes: [.font: UIFont.italicSystemFont(ofSize: 12)]
        )
        """
    }

    private static var displayFull: String {
        """
        let ratingDisplay = SparkUIRatingDisplay(theme: theme)
        ratingDisplay.theme = theme
        ratingDisplay.value = 4.5
        ratingDisplay.size = .small
        ratingDisplay.stars = .five
        ratingDisplay.text = "4.5"
        ratingDisplay.countText = "120"
        ratingDisplay.additionalText = "Excellent"
        ratingDisplay.accessibilityLabel = "Rating display"
        """
    }

    private static var inputDefault: String {
        """
        let ratingInput = SparkUIRatingInput(theme: theme)
        ratingInput.value = 3.0
        ratingInput.addAction(UIAction(handler: { _ in
            // Handle value change
        }), for: .valueChanged)
        """
    }

    private static var inputFull: String {
        """
        let ratingInput = SparkUIRatingInput(theme: theme)
        ratingInput.theme = theme
        ratingInput.value = 3.0
        ratingInput.isEnabled = true
        ratingInput.accessibilityLabel = "Rating input"
        ratingInput.addAction(UIAction(handler: { action in
            // Handle value change
        }), for: .valueChanged)

        // Using publisher
        ratingInput.valueChangedPublisher.sink { newValue in
            // Your action
        }
        """
    }
}
