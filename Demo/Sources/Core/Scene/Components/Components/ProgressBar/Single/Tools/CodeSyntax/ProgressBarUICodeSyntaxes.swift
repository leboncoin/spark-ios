//
//  ProgressBarUICodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct ProgressBarUICodeSyntaxes {

    // MARK: - Properties

    static var content: [CodeSyntax] = {
        return [
            .init(title: "Simple", code: Self.simple),
            .init(title: "With Intent", code: Self.withIntent),
            .init(title: "With Shape", code: Self.withShape),
            .init(title: "Full Configuration", code: Self.fullConfiguration)
        ]
    }()

    // MARK: - Private Properties

    private static var simple: String {
        """
        let progressBar = SparkUIProgressBar(theme: theme)
        progressBar.value = 0.5
        """
    }

    private static var withIntent: String {
        """
        let progressBar = SparkUIProgressBar(theme: theme)
        progressBar.value = 0.6
        progressBar.intent = .main
        """
    }

    private static var withShape: String {
        """
        let progressBar = SparkUIProgressBar(theme: theme)
        progressBar.value = 0.4
        progressBar.intent = .support
        progressBar.shape = .square
        """
    }

    private static var fullConfiguration: String {
        """
        let progressBar = SparkUIProgressBar(theme: theme)
        progressBar.value = 0.75
        progressBar.intent = .main
        progressBar.shape = .rounded
        progressBar.accessibilityLabel = "Upload progress"
        progressBar.accessibilityValue = "75%"
        """
    }
}
