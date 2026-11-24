//
//  ComponentToken+DotIndicator.swift
//  SparkComponentDotIndicator
//
//  Created by Robin Lemaire on 24/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SparkTheming

public extension ComponentToken {

    /// The token values of the DotIndicator component derived from the theme.
    var dotIndicator: DotIndicatorToken {
        return .init(theme: self.theme)
    }
}
