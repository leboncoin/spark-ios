//
//  SparkBorder.swift
//  SparkTheme
//
//  Created by robin.lemaire on 28/02/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import SparkTheming

struct SparkBorder: Border {

    // MARK: - Properties

    let width: any BorderWidth = BorderWidthDefault(
        small: 1,
        medium: 2
    )
    let radius: any BorderRadius = BorderRadiusDefault(
        small: 4,
        medium: 8,
        large: 16,
        xLarge: 24
    )

    // MARK: - Initialization

    init() {}
}
