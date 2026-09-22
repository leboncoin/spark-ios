//
//  ProgressTrackerUICodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct ProgressTrackerUICodeSyntaxes {

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
        let progressTracker = ProgressTrackerUIControl(
            theme: theme,
            intent: .main,
            variant: .outlined,
            size: .medium,
            numberOfPages: 5,
            orientation: .horizontal
        )
        progressTracker.currentPageIndex = 2
        """
    }

    private static var withLabels: String {
        """
        let progressTracker = ProgressTrackerUIControl(
            theme: theme,
            intent: .main,
            variant: .outlined,
            size: .medium,
            labels: ["Step 1", "Step 2", "Step 3", "Step 4", "Step 5"],
            orientation: .horizontal
        )
        progressTracker.currentPageIndex = 2
        """
    }

    private static var fullConfiguration: String {
        """
        let progressTracker = ProgressTrackerUIControl(
            theme: theme,
            intent: .main,
            variant: .outlined,
            size: .medium,
            labels: ["Step 1", "Step 2", "Step 3", "Step 4", "Step 5"],
            orientation: .horizontal
        )
        progressTracker.currentPageIndex = 2
        progressTracker.numberOfPages = 5
        progressTracker.interactionState = .continuous
        progressTracker.allowsContinuousInteraction = true
        progressTracker.showDefaultPageNumber = true
        progressTracker.setIndicatorImage(UIImage(iconImage: iconImage), forIndex: 1)
        progressTracker.setCurrentPageIndicatorImage(UIImage(iconImage: starImage), forIndex: 2)
        progressTracker.setAttributedLabel(NSAttributedString(string: "Custom Label"), forIndex: 0)
        progressTracker.setLabel("Label Text", forIndex: 1)
        progressTracker.setIndicatorLabel("A", forIndex: 0)
        progressTracker.setCompletedIndicatorImage(UIImage(iconImage: checkmarkImage))
        progressTracker.setIsEnabled(false, forIndex: 3)
        progressTracker.setPreferredIndicatorImage(UIImage(iconImage: iconImage))
        progressTracker.setPreferredCurrentPageIndicatorImage(UIImage(iconImage: starImage))
        """
    }
}
