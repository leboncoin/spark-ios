//
//  EnvironmentTheme+DotIndicatorToken.swift
//  SparkComponentDotIndicator
//
//  Created by Robin Lemaire on 24/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SparkCommon

extension EnvironmentTheme {

    // MARK: - Private Properties

    private var token: DotIndicatorToken {
        self.value.component.dotIndicator
    }

    // MARK: - Properties

    var border: DotIndicatorToken.Border {
        self.token.border
    }

    var colors: DotIndicatorToken.Colors {
        self.token.colors
    }

    var layout: DotIndicatorToken.Layout {
        self.token.layout
    }

    var opacity: DotIndicatorToken.Opacity {
        self.token.opacity
    }

    var size: DotIndicatorToken.Size {
        self.token.size
    }
}
