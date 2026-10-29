//
//  EnvironmentTheme+XXXToken.swift
//  SparkComponentXXX
//
//  Created by {Firstname Lastname} on DD/MM/YYYY.
//  Copyright © YYYY Leboncoin. All rights reserved.
//

import SparkCommon

extension EnvironmentTheme {

    // MARK: - Private Properties

    private var token: XXXToken {
        self.value.component.xxx
    }

    // MARK: - Properties

    var border: XXXToken.Border {
        self.token.border
    }

    var colors: XXXToken.Colors {
        self.token.colors
    }

    var layout: XXXToken.Layout {
        self.token.layout
    }

    var opacity: XXXToken.Opacity {
        self.token.opacity
    }

    var typography: XXXToken.Typography {
        self.token.typography
    }

    var size: XXXToken.Size {
        self.token.size
    }
}
