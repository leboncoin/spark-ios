//
//  DotIndicatorCodeSyntaxes.swift
//  SparkDemo
//
//  Created by Robin Lemaire on 24/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

struct DotIndicatorCodeSyntaxes {

    static var content: [CodeSyntax] = {
        return [
            .init(title: "Basic", code: Self.basic),
            .init(title: "With size and intent", code: Self.withSizeAndIntent),
            .init(title: "With tap interaction", code: Self.withTapInteraction)
        ]
    }()

    private static var basic: String {
        """
        SparkDotIndicator(numberOfPages: 5, currentPage: 0)
            .sparkTheme(theme)
        """
    }

    private static var withSizeAndIntent: String {
        """
        SparkDotIndicator(numberOfPages: 5, currentPage: 0)
            .sparkTheme(theme)
            .sparkDotIndicatorSize(.small)
            .sparkDotIndicatorIntent(.surface)
        """
    }

    private static var withTapInteraction: String {
        """
        SparkDotIndicator(numberOfPages: 5, currentPage: $currentPage)
            .sparkTheme(theme)
            .sparkDotIndicatorSize(.large)
        """
    }
}
