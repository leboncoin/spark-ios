//
//  ProgressBarIndeterminateGetAnimationStatusUseCase.swift
//  SparkComponentProgressBar
//
//  Created by robin.lemaire on 29/09/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Foundation

// sourcery: AutoMockable, AutoMockTest
protocol ProgressBarIndeterminateGetAnimationStatusUseCaseable {
    func execute(isAnimated: Bool) -> ProgressBarIndeterminateStatus
}

struct ProgressBarIndeterminateGetAnimationStatusUseCase: ProgressBarIndeterminateGetAnimationStatusUseCaseable {

    // MARK: - Methods

    func execute(isAnimated: Bool) -> ProgressBarIndeterminateStatus {
        return isAnimated ? .start : .stop
    }
}
