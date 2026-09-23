//
//  ProgressBarIndeterminateViewModel.swift
//  SparkComponentProgressBar
//
//  Created by robin.lemaire on 20/09/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkCommon
import SparkTheming

/// Used only for SwiftUI view.
// sourcery: AutoPublisherTest, AutoViewModelStub
final class ProgressBarIndeterminateViewModel: ProgressBarViewModel {

    // MARK: - Published Properties

    @Published private(set) var animationData = ProgressBarIndeterminateAnimatedData()
    @Published private(set) var animationType: ProgressBarIndeterminateAnimationType?
    @Published private(set) var animationStatus: ProgressBarIndeterminateStatus = .stop
    @Published private(set) var indicatorOpacity: Double = .zero

    // MARK: - Properties

    var isAnimated: Bool = false {
        didSet {
            guard oldValue != self.isAnimated, self.alreadyUpdateAll else { return }

            self.setAllExceptData()
        }
    }

    // MARK: - Private properties

    private var alreadyUpdateAll = false

    private let getAnimationDataUseCase: any ProgressBarIndeterminateGetAnimationDataUseCaseable
    private let getAnimationStatusUseCase: any ProgressBarIndeterminateGetAnimationStatusUseCaseable
    private let getAnimationTypeUseCase: any ProgressBarIndeterminateGetAnimationTypeUseCaseable
    private let getIndicatorOpacityUseCase: any ProgressBarIndeterminateGetIndicatorOpacityUseCaseable

    // MARK: - Initialization

    init(
        getAnimationDataUseCase: any ProgressBarIndeterminateGetAnimationDataUseCaseable = ProgressBarIndeterminateGetAnimationDataUseCase(),
        getAnimationStatusUseCase: any ProgressBarIndeterminateGetAnimationStatusUseCaseable = ProgressBarIndeterminateGetAnimationStatusUseCase(),
        getAnimationTypeUseCase: any ProgressBarIndeterminateGetAnimationTypeUseCaseable = ProgressBarIndeterminateGetAnimationTypeUseCase(),
        getIndicatorOpacityUseCase: any ProgressBarIndeterminateGetIndicatorOpacityUseCaseable = ProgressBarIndeterminateGetIndicatorOpacityUseCase()
    ) {
        self.getAnimationDataUseCase = getAnimationDataUseCase
        self.getAnimationStatusUseCase = getAnimationStatusUseCase
        self.getAnimationTypeUseCase = getAnimationTypeUseCase
        self.getIndicatorOpacityUseCase = getIndicatorOpacityUseCase
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

        self.setAllExceptData()

        self.alreadyUpdateAll = true
    }

    // MARK: - Private Setter

    private func setAllExceptData() {
        self.animationStatus = self.getAnimationStatusUseCase.execute(isAnimated: self.isAnimated)
        self.animationType = self.getAnimationTypeUseCase.execute(isAnimated: self.isAnimated)
        self.indicatorOpacity = self.getIndicatorOpacityUseCase.execute(type: self.animationType)
    }

    // MARK: - Animation

    func updateAnimatedData(from trackWidth: CGFloat) {
        self.animationData = self.getAnimationDataUseCase.execute(
            type: self.animationType,
            trackWidth: trackWidth
        )
    }

    func animationStepIsDone() {
        if self.isAnimated {
            self.animationType = self.getAnimationTypeUseCase.executeNext(type: self.animationType)
        } else {
            self.animationStatus = self.getAnimationStatusUseCase.execute(isAnimated: self.isAnimated)
        }
    }
}
