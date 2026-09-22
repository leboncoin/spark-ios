//
//  ProgressBarIndeterminateUICodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct ProgressBarIndeterminateUICodeSyntaxes {

    // MARK: - Properties

    static var content: [CodeSyntax] = {
        return [
            .init(title: "Simple", code: Self.simple),
            .init(title: "Full", code: Self.full)
        ]
    }()

    // MARK: - Private Properties

    private static var simple: String {
        """
        let progressBar = SparkUISparkProgressBarIndeterminateIndeterminate(theme: theme)
        progressBar.startAnimating()
        """
    }

    private static var full: String {
        """
        let progressBar = SparkUISparkProgressBarIndeterminateIndeterminate(theme: theme)
        progressBar.intent = .main
        progressBar.shape = .rounded
        progressBar.isAccessibilityElement = true
        progressBar.accessibilityLabel = "Loading content"
        progressBar.startAnimating()
        """
    }
}
