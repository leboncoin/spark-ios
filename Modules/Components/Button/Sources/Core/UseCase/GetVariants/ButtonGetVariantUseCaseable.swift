//
//  ButtonGetVariantUseCaseable.swift
//  SparkComponentButtonTests
//
//  Created by janniklas.freundt.ext on 16.05.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import SparkTheming

// sourcery: AutoMockable, AutoMockTest
protocol ButtonGetVariantUseCaseable {
    // sourcery: theme = "Identical"
    func execute(
        theme: any Theme,
        intent: ButtonIntent,
        isPressed: Bool
    ) -> ButtonColors
}
