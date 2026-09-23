//
//  ProgressBarIndeterminateGetAnimationTypeUseCase.swift
//  SparkComponentProgressBar
//
//  Created by robin.lemaire on 29/09/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Foundation

// sourcery: AutoMockable, AutoMockTest
protocol ProgressBarIndeterminateGetAnimationTypeUseCaseable {
    func execute(isAnimated: Bool) -> ProgressBarIndeterminateAnimationType?
    func executeNext(type: ProgressBarIndeterminateAnimationType?) -> ProgressBarIndeterminateAnimationType?
}

struct ProgressBarIndeterminateGetAnimationTypeUseCase: ProgressBarIndeterminateGetAnimationTypeUseCaseable {

    // MARK: - Methods

    func execute(isAnimated: Bool) -> ProgressBarIndeterminateAnimationType? {
        return isAnimated ? .easeIn : .none
    }

    func executeNext(type: ProgressBarIndeterminateAnimationType?) -> ProgressBarIndeterminateAnimationType? {
        return switch type {
        case .easeIn: .easeOut
        case .easeOut: .reset
        case .reset: .easeIn
        default: nil
        }
    }
}
