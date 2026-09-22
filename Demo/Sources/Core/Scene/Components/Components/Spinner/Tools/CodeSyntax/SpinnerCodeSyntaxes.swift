//
//  SpinnerCodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct SpinnerCodeSyntaxes {

    // MARK: - Properties

    static var content: [CodeSyntax] = {
        return [
            .init(title: "Default", code: Self.defaultExample),
            .init(title: "Full Configuration", code: Self.fullConfiguration)
        ]
    }()

    // MARK: - Private Properties

    private static var defaultExample: String {
        """
        SparkSpinner()
            .sparkTheme(theme)
            .sparkSpinnerIntent(.main)
            .sparkSpinnerSize(.medium)
        """
    }

    private static var fullConfiguration: String {
        """
        SparkSpinner()
            .sparkTheme(theme)
            .sparkSpinnerIntent(.support)
            .sparkSpinnerSize(.small)
            .accessibilityHidden(false)
            .accessibilityLabel("Loading")
        """
    }
}
