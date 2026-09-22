//
//  ProgressTrackerCodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct ProgressTrackerCodeSyntaxes {

    // MARK: - Properties

    static var content: [CodeSyntax] = {
        return [
            .init(title: "With Number of Pages", code: Self.withNumberOfPages),
            .init(title: "With Labels", code: Self.withLabels),
            .init(title: "Full Configuration", code: Self.fullConfiguration)
        ]
    }()

    // MARK: - Private Properties

    private static var withNumberOfPages: String {
        """
        ProgressTrackerView(
            theme: theme,
            intent: .main,
            variant: .outlined,
            size: .medium,
            numberOfPages: 5,
            orientation: .horizontal,
            currentPageIndex: $currentPageIndex
        )
        """
    }

    private static var withLabels: String {
        """
        ProgressTrackerView(
            theme: theme,
            intent: .main,
            variant: .outlined,
            size: .medium,
            labels: ["Step 1", "Step 2", "Step 3", "Step 4", "Step 5"],
            orientation: .horizontal,
            currentPageIndex: $currentPageIndex
        )
        """
    }

    private static var fullConfiguration: String {
        """
        ProgressTrackerView(
            theme: theme,
            intent: .main,
            variant: .outlined,
            size: .medium,
            labels: ["Step 1", "Step 2", "Step 3", "Step 4", "Step 5"],
            orientation: .horizontal,
            currentPageIndex: $currentPageIndex
        )
        .useFullWidth(true)
        .indicatorImage(Image(icon: .spark), forIndex: 1)
        .currentPageIndicatorImage(Image(icon: .sparkStarFill), forIndex: 2)
        .attributedLabel(AttributedString("Custom Label"), forIndex: 0)
        .label("Label Text", forIndex: 1)
        .indicatorLabel("A", forIndex: 0)
        .completedIndicatorImage(Image(icon: .sparkCheck))
        .disable(true, forIndex: 3)
        .preferredIndicatorImage(Image(icon: .spark))
        .preferredCurrentPageIndicatorImage(Image(icon: .sparkStarFill))
        .showDefaultPageNumber(true)
        .interactionState(.continuous)
        """
    }
}
