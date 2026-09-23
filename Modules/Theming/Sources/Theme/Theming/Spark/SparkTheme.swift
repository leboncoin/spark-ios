//
//  SparkTheme.swift
//  SparkTheme
//
//  Created by robin.lemaire on 28/02/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import SparkTheming
import Foundation

public enum SparkTheme {

    // MARK: - Properties

    public static var shared = ThemeDefault(
        border: SparkBorder(),
        colors: SparkColors(),
        elevation: SparkElevation(),
        layout: SparkLayout(),
        typography: SparkTypography(),
        dims: SparkDims()
    )
}
