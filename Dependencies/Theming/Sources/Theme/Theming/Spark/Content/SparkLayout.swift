//
//  SparkLayout.swift
//  SparkTheme
//
//  Created by robin.lemaire on 28/02/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import SparkTheming

struct SparkLayout: Layout {

    // MARK: - Properties

    let spacing: any LayoutSpacing = LayoutSpacingDefault(
        small: 4,
        medium: 8,
        large: 16,
        xLarge: 24,
        xxLarge: 32,
        xxxLarge: 40
    )

    // MARK: - Initialization

    init() {}
}
