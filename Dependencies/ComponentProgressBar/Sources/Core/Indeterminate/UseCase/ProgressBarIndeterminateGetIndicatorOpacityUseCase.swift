//
//  ProgressBarIndeterminateGetIndicatorOpacityUseCase.swift
//  SparkComponentProgressBar
//
//  Created by robin.lemaire on 29/09/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Foundation

// sourcery: AutoMockable, AutoMockTest
protocol ProgressBarIndeterminateGetIndicatorOpacityUseCaseable {
    func execute(type: ProgressBarIndeterminateAnimationType?) -> CGFloat
}

struct ProgressBarIndeterminateGetIndicatorOpacityUseCase: ProgressBarIndeterminateGetIndicatorOpacityUseCaseable {

    // MARK: - Methods

    func execute(type: ProgressBarIndeterminateAnimationType?) -> CGFloat {
        return (type == .none) ? 0 : 1
    }
}
