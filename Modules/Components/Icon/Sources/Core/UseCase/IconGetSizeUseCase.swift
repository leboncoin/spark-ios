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
        return IconToken.Size().value(for: size)
    }
}
