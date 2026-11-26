//
//  DotsIndicatorCodeSyntaxes.swift
//  SparkDemo
//
//  Created by Robin Lemaire on 24/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

struct DotsIndicatorCodeSyntaxes {

    static var content: [CodeSyntax] = {
        return [
            .init(title: "Basic", code: Self.basic),
            .init(title: "With size and intent", code: Self.withSizeAndIntent),
            .init(title: "With tap interaction", code: Self.withTapInteraction)
        ]
    }()

    private static var basic: String {
        """
        SparkDotsIndicator(numberOfPages: 5, currentPage: 0)
            .sparkTheme(theme)
        """
    }

    private static var withSizeAndIntent: String {
        """
        SparkDotsIndicator(numberOfPages: 5, currentPage: 0)
            .sparkTheme(theme)
            .sparkDotsIndicatorSize(.small)
            .sparkDotsIndicatorIntent(.surface)
        """
    }

    private static var withTapInteraction: String {
        """
        SparkDotsIndicator(numberOfPages: 5, currentPage: $currentPage)
            .sparkTheme(theme)
            .sparkDotsIndicatorSize(.large)
        """
    }
}
