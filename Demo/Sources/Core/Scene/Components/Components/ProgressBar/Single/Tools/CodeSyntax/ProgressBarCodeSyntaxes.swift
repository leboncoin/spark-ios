//
//  ProgressBarCodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct ProgressBarCodeSyntaxes {

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
        SparkProgressBar(value: 0.5)
            .sparkTheme(theme)
        """
    }

    private static var withIntent: String {
        """
        SparkProgressBar(value: 0.6)
            .sparkTheme(theme)
            .sparkProgressBarIntent(.main)
        """
    }

    private static var withShape: String {
        """
        SparkProgressBar(value: 0.4)
            .sparkTheme(theme)
            .sparkProgressBarIntent(.support)
            .sparkProgressBarShape(.square)
        """
    }

    private static var fullConfiguration: String {
        """
        SparkProgressBar(value: 0.75)
            .sparkTheme(theme)
            .sparkProgressBarIntent(.main)
            .sparkProgressBarShape(.rounded)
            .accessibilityLabel("Upload progress")
            .accessibilityValue("75%")
        """
    }
}
