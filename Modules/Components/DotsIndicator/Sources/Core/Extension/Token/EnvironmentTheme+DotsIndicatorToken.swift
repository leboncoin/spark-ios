//
//  EnvironmentTheme+DotsIndicatorToken.swift
//  SparkComponentDotsIndicator
//
//  Created by Robin Lemaire on 24/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SparkCommon

extension EnvironmentTheme {

    // MARK: - Private Properties

    private var token: DotsIndicatorToken {
        self.value.component.dotsIndicator
    }

    // MARK: - Properties

    var border: DotsIndicatorToken.Border {
        self.token.border
    }

    var colors: DotsIndicatorToken.Colors {
        self.token.colors
    }

    var layout: DotsIndicatorToken.Layout {
        self.token.layout
    }

    var opacity: DotsIndicatorToken.Opacity {
        self.token.opacity
    }

    var size: DotsIndicatorToken.Size {
        self.token.size
    }

    var animation: DotsIndicatorToken.Animation {
        self.token.animation
    }
}
