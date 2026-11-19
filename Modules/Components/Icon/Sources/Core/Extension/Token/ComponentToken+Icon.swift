//
//  ComponentToken+Icon.swift
//  SparkComponentIcon
//
//  Created by robin.lemaire on 18/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SparkTheming

public extension ComponentToken {

    /// The token values of the Icon component derived from the theme.
    var icon: IconToken {
        return .init(theme: self.theme)
    }
}
