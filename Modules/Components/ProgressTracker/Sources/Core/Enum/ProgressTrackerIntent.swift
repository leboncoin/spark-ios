//
//  ProgressTrackerIntent.swift
//  SparkComponentProgressTracker
//
//  Created by Michael Zimmermann on 11.01.24.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import Foundation

/// All possible intents of the progress tracker
public enum ProgressTrackerIntent: CaseIterable {
    case neutral
    case success
    case support

    @available(*, deprecated, message: "Use neutral, success or support instead.")
    case accent
    @available(*, deprecated, message: "Use neutral, success or support instead.")
    case alert
    @available(*, deprecated, message: "Use neutral, success or support instead.")
    case danger
    @available(*, deprecated, message: "Use neutral, success or support instead.")
    case info
    @available(*, deprecated, message: "Use neutral, success or support instead.")
    case main

    // MARK: - Properties

    static public var allCases: [Self] = [
        .neutral,
        .success,
        .support
    ]
}
