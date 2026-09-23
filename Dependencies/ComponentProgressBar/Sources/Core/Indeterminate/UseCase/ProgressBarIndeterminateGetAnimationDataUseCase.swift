//
//  ProgressBarIndeterminateGetAnimationDataUseCase.swift
//  SparkComponentProgressBar
//
//  Created by robin.lemaire on 29/09/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Foundation

// sourcery: AutoMockable, AutoMockTest
protocol ProgressBarIndeterminateGetAnimationDataUseCaseable {
    func execute(
        type: ProgressBarIndeterminateAnimationType?,
        trackWidth: CGFloat
    ) -> ProgressBarIndeterminateAnimatedData
}

struct ProgressBarIndeterminateGetAnimationDataUseCase: ProgressBarIndeterminateGetAnimationDataUseCaseable {

    // MARK: - Type alias

    private typealias Constants = ProgressBarConstants

    // MARK: - Methods

    func execute(
        type: ProgressBarIndeterminateAnimationType?,
        trackWidth: CGFloat
    ) -> ProgressBarIndeterminateAnimatedData {
        switch type {
        case .easeIn:
            let indicatorMaxWidth = trackWidth * ProgressBarIndeterminateConstants.Animation.maxWidthRatio
            return .init(
                leadingSpaceWidth: (trackWidth - indicatorMaxWidth) / 2,
                indicatorWidth: indicatorMaxWidth
            )

        case .easeOut:
            return .init(
                leadingSpaceWidth: trackWidth,
                indicatorWidth: 0
            )

        case .reset, .none:
            return .init(
                leadingSpaceWidth: 0,
                indicatorWidth: 0
            )
        }
    }
}
