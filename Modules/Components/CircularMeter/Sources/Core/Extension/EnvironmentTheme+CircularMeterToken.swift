//
//  EnvironmentTheme+CircularMeterToken.swift
//  SparkComponentCircularMeter
//
//  Created by robin.lemaire on 27/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SparkCommon

extension EnvironmentTheme {

    // MARK: - Private Properties

    private var token: CircularMeterToken {
        self.value.component.circularMeter
    }

    // MARK: - Properties

    var colors: CircularMeterToken.Colors {
        self.token.colors
    }

    var layout: CircularMeterToken.Layout {
        self.token.layout
    }

    var typography: CircularMeterToken.Typography {
        self.token.typography
    }

    var content: CircularMeterToken.Content {
        self.token.content
    }

    var size: CircularMeterToken.Size {
        self.token.size
    }
}
