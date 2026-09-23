//
//  CardGetStateColorsUseCase.swift
//  SparkComponentCard
//
//  Created by robin.lemaire on 01/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SparkTheming

// sourcery: AutoMockable, AutoMockTest
protocol CardGetStateColorsUseCaseable {
    // sourcery: theme = "Identical"
    func execute(
        theme: any Theme,
        intent: CardIntent
    ) -> CardStateColors
}
