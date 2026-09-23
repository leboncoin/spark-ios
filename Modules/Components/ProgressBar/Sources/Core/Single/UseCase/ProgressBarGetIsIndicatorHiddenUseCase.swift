//
//  ProgressBarGetIsIndicatorHiddenUseCase.swift
//  SparkComponentProgressBar
//
//  Created by robin.lemaire on 16/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

// sourcery: AutoMockable, AutoMockTest
protocol ProgressBarGetIsIndicatorHiddenUseCaseable {

    func execute(value: CGFloat) -> Bool
}

struct ProgressBarGetIsIndicatorHiddenUseCase: ProgressBarGetIsIndicatorHiddenUseCaseable {

    // MARK: - Type alias

    private typealias Constants = ProgressBarConstants

    // MARK: - Methods

    func execute(value: CGFloat) -> Bool{
        return !(value > 0)
    }
}
