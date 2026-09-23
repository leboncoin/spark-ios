//
//  IconGetSizeUseCase.swift
//  SparkComponentIcon
//
//  Created by robin.lemaire on 06/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

// sourcery: AutoMockable, AutoMockTest
protocol IconGetSizeUseCaseable {
    func execute(size: IconSize) -> CGFloat
}

struct IconGetSizeUseCase: IconGetSizeUseCaseable {

    // MARK: - Methods

    func execute(size: IconSize) -> CGFloat {
        switch size {
        case .small: 16
        case .medium: 24
        case .large: 32
        case .extraLarge: 40
        case .custom(let size): size
        }
    }
}
