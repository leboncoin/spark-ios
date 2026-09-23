//
//  ProgressBarIndeterminateCodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct ProgressBarIndeterminateCodeSyntaxes {

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
        SparkProgressBarIndeterminateIndeterminate(isAnimated: true)
            .sparkTheme(theme)
        """
    }

    private static var full: String {
        """
        SparkProgressBarIndeterminateIndeterminate(isAnimated: true)
            .sparkTheme(theme)
            .sparkSparkProgressBarIndeterminateIntent(.main)
            .sparkSparkProgressBarIndeterminateShape(.rounded)
            .accessibilityHidden(false)
            .accessibilityLabel("Loading content")
        """
    }
}
