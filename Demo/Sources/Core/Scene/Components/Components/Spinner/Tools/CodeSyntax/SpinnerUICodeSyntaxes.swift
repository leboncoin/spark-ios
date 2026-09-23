//
//  SpinnerUICodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct SpinnerUICodeSyntaxes {

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
        let spinner = SparkUISpinner(theme: theme)
        spinner.intent = .main
        spinner.size = .small
        """
    }

    private static var fullConfiguration: String {
        """
        let spinner = SparkUISpinner(theme: theme)
        spinner.theme = theme
        spinner.intent = .support
        spinner.size = .medium
        spinner.isAccessibilityElement = true
        spinner.accessibilityLabel = "Loading"
        """
    }
}
