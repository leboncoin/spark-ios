//
//  SegmentedControlGetIsVerticalSeparatorUseCase.swift
//  SparkComponentSegmentedControl
//
//  Created by robin.lemaire on 23/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SparkTheming
import Foundation

// sourcery: AutoMockable, AutoMockTest
protocol SegmentedControlGetIsVerticalSeparatorUseCaseable {
    func execute(
        tags: Int,
        horizontalTags: Int,
        columnIndex: Int
    ) -> Bool
}

struct SegmentedControlGetIsVerticalSeparatorUseCase: SegmentedControlGetIsVerticalSeparatorUseCaseable {

    // MARK: - Methods

    func execute(
        tags: Int,
        horizontalTags: Int,
        columnIndex: Int
    ) -> Bool {
        return tags > 1 && horizontalTags > 1 && columnIndex < horizontalTags - 1
    }
}
