//
//  SegmentedControlGetDimUseCase.swift
//  SparkComponentSegmentedControl
//
//  Created by robin.lemaire on 23/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SparkTheming
import Foundation

// sourcery: AutoMockable, AutoMockTest
protocol SegmentedControlGetDimUseCaseable {
    // sourcery: theme = "Identical"
    func execute(theme: any Theme, isEnabled: Bool) -> CGFloat
}

struct SegmentedControlGetDimUseCase: SegmentedControlGetDimUseCaseable {

    // MARK: - Methods

    func execute(theme: any Theme, isEnabled: Bool) -> CGFloat {
        return isEnabled ? theme.dims.none : theme.dims.dim3
    }
}
