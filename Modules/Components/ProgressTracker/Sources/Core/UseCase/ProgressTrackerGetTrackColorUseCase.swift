//
//  ProgressTrackerGetTrackColorUseCase.swift
//  SparkComponentProgressTracker
//
//  Created by Michael Zimmermann on 24.01.24.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import SparkTheming

// sourcery: AutoMockable
protocol ProgressTrackerGetTrackColorUseCaseable {
    func execute(colors: any Colors,
                 intent: ProgressTrackerIntent) -> any ColorToken
}

/// A use cate returning the color of the `track` between the progress tracker indicators.
struct ProgressTrackerGetTrackColorUseCase: ProgressTrackerGetTrackColorUseCaseable {

    func execute(colors: any Colors,
                 intent: ProgressTrackerIntent) -> any ColorToken {
        switch intent {
        case .neutral: return colors.feedback.neutral
        case .success: return colors.feedback.success
        case .support: return colors.support.support
        default: return colors.support.support
        }
    }
}
