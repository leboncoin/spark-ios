//
//  ComponentToken+DotsIndicator.swift
//  SparkComponentDotsIndicator
//
//  Created by Robin Lemaire on 24/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SparkTheming

public extension ComponentToken {

    /// The token values of the DotsIndicator component derived from the theme.
    var dotsIndicator: DotsIndicatorToken {
        return .init(theme: self.theme)
    }
}
