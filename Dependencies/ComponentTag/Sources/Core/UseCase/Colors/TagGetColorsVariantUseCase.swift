//
//  TagGetColorsVariantUseCase.swift
//  SparkComponentTag
//
//  Created by robin.lemaire on 26/08/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SparkTheming

// sourcery: AutoMockable, AutoMockTest
protocol TagGetColorsVariantUseCaseable {
    // sourcery: theme = "Identical"
    func execute(
        theme: any Theme,
        intent: TagIntent
    ) -> TagColors
}
