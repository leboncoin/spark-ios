//
//  SpinnerGetSizeUseCase.swift
//  SparkComponentSpinner
//
//  Created by robin.lemaire on 10/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation

// sourcery: AutoMockable, AutoMockTest
protocol SpinnerGetSizeUseCaseable {
    func execute(size: SpinnerSize) -> CGFloat
}

struct SpinnerGetSizeUseCase: SpinnerGetSizeUseCaseable {

    // MARK: - Methods

    func execute(size: SpinnerSize) -> CGFloat {
        return switch size {
        case .medium: 28
        case .small: 20
        }
    }
}
