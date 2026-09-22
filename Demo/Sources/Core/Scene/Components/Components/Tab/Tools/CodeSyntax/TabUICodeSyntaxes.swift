//
//  TabUICodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct TabUICodeSyntaxes {

    // MARK: - Properties

    static var content: [CodeSyntax] = {
        return [
            .init(title: "Titles Only", code: Self.titlesOnly),
            .init(title: "Images Only", code: Self.imagesOnly),
            .init(title: "With Segments", code: Self.withSegments),
            .init(title: "Full Configuration", code: Self.fullConfiguration)
        ]
    }()

    // MARK: - Private Properties

    private static var titlesOnly: String {
        """
        let tab = SparkUITab(theme: theme, titles: ["First", "Second", "Third"])
        tab.selectedSegmentIndex = 0
        tab.intent = .main
        tab.size = .medium
        tab.apportionsSegmentWidthsByContent = false
        tab.addAction(UIAction { _ in
            // Your action
        }, for: .valueChanged)
        """
    }

    private static var imagesOnly: String {
        """
        let images = [
            UIImage(systemName: "house")!,
            UIImage(systemName: "star")!,
            UIImage(systemName: "person")!
        ]
        let tab = SparkUITab(theme: theme, images: images)
        tab.selectedSegmentIndex = 0
        tab.intent = .main
        tab.size = .medium
        tab.addAction(UIAction { _ in
            // Your action
        }, for: .valueChanged)
        """
    }

    private static var withSegments: String {
        """
        let segments = [
            TabUISegment(title: "First", image: UIImage(systemName: "house")!),
            TabUISegment(title: "Second", image: UIImage(systemName: "star")!),
            TabUISegment(title: "Third", image: UIImage(systemName: "person")!)
        ]
        let tab = SparkUITab(theme: theme, segments: segments)
        tab.selectedSegmentIndex = 0
        tab.intent = .main
        tab.size = .medium
        tab.apportionsSegmentWidthsByContent = true
        tab.addAction(UIAction { _ in
            // Your action
        }, for: .valueChanged)
        """
    }

    private static var fullConfiguration: String {
        """
        let segments = [
            TabUISegment(title: "Home", image: UIImage(systemName: "house")!),
            TabUISegment(title: "Messages", image: UIImage(systemName: "message")!),
            TabUISegment(title: "Profile", image: UIImage(systemName: "person")!)
        ]
        let tab = SparkUITab(theme: theme, segments: segments)
        tab.selectedSegmentIndex = 0
        tab.intent = .main
        tab.size = .medium
        tab.apportionsSegmentWidthsByContent = false
        tab.isEnabled = true

        // Set images
        tab.setImage(UIImage(systemName: "house"), forSegmentAt: 0)
        tab.setImage(UIImage(systemName: "message"), forSegmentAt: 1)
        tab.setImage(UIImage(systemName: "person"), forSegmentAt: 2)

        // Add badge to first segment
        let badge = SparkUIBadge(theme: theme)
        badge.intent = .support
        badge.value = 5
        badge.isBorder = false
        badge.size = .medium
        tab.setExtraView(badge, forSegmentAt: 0)

        tab.addAction(UIAction { _ in
            // Your action
        }, for: .valueChanged)
        """
    }
}
