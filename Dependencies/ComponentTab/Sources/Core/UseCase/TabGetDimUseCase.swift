//
//  TabGetDimUseCase.swift
//  SparkComponentTab
//
//  Created by robin.lemaire on 23/02/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

// sourcery: AutoMockable, AutoMockTest
protocol TabGetDimUseCaseable {
    // sourcery: theme = "Identical"
    func execute(theme: any Theme, isEnabled: Bool) -> CGFloat
}

struct TabGetDimUseCase: TabGetDimUseCaseable {

    // MARK: - Methods

    func execute(theme: any Theme, isEnabled: Bool) -> CGFloat {
        return isEnabled ? theme.dims.none : theme.dims.dim3
    }
}
