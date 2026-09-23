//
//  ProgressBarIndeterminateUIViewModel.swift
//  SparkComponentProgressBar
//
//  Created by robin.lemaire on 17/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkCommon
import SparkTheming

/// Used only for UIKit view.
// sourcery: AutoPublisherTest, AutoViewModelStub
final class ProgressBarIndeterminateUIViewModel: ProgressBarViewModel {

    // MARK: - Properties

    var isAnimated: Bool = false

    // MARK: - Private properties

    private let getAnimationDataUseCase: any ProgressBarIndeterminateGetAnimationDataUseCaseable

    // MARK: - Initialization

    init(
        getAnimationDataUseCase: any ProgressBarIndeterminateGetAnimationDataUseCaseable = ProgressBarIndeterminateGetAnimationDataUseCase()
    ) {
        self.getAnimationDataUseCase = getAnimationDataUseCase
    }

    // MARK: - Setup

    func setup(
        theme: any Theme,
        intent: ProgressBarIntent,
        shape: ProgressBarShape,
        isAnimated: Bool
    ) {
        self.isAnimated = isAnimated

        self.setup(
            theme: theme,
            intent: intent,
            shape: shape
        )
    }

    // MARK: - Animated Data

    func easeInAnimatedData(trackWidth: CGFloat) -> ProgressBarIndeterminateAnimatedData {
        return self.getAnimationDataUseCase.execute(
            type: .easeIn,
            trackWidth: trackWidth
        )
    }

    func easeOutAnimatedData(trackWidth: CGFloat) -> ProgressBarIndeterminateAnimatedData  {
        return self.getAnimationDataUseCase.execute(
            type: .easeOut,
            trackWidth: trackWidth
        )
    }

    func resetAnimatedData(trackWidth: CGFloat) -> ProgressBarIndeterminateAnimatedData {
        return self.getAnimationDataUseCase.execute(
            type: .reset,
            trackWidth: trackWidth
        )
    }
}
