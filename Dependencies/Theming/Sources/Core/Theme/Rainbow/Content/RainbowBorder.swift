//
//  RainbowBorder.swift
//  SparkTheming
//
//  Created by robin.lemaire on 14/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

struct RainbowBorder: Border {

    // MARK: - Properties

    let width: any BorderWidth = BorderWidthDefault(
        small: 2,
        medium: 2
    )
    let radius: any BorderRadius = BorderRadiusDefault(
        small: 1,
        medium: 1,
        large: 1,
        xLarge: 1
    )

    // MARK: - Initialization

    init() {}
}
