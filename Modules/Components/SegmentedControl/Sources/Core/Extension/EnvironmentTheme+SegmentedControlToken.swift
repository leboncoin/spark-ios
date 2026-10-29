//
//  EnvironmentTheme+SegmentedControlToken.swift
//  SparkComponentSegmentedControl
//
//  Created by robin.lemaire on 27/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SparkCommon

extension EnvironmentTheme {

    // MARK: - Private Properties

    private var token: SegmentedControlToken {
        self.value.component.segmentedControl
    }

    // MARK: - Properties

    var border: SegmentedControlToken.Border {
        self.token.border
    }

    var colors: SegmentedControlToken.Colors {
        self.token.colors
    }

    var layout: SegmentedControlToken.Layout {
        self.token.layout
    }

    var opacity: SegmentedControlToken.Opacity {
        self.token.opacity
    }

    var typography: SegmentedControlToken.Typography {
        self.token.typography
    }

    var scaleEffect: SegmentedControlToken.ScaleEffect {
        self.token.scaleEffect
    }

    var size: SegmentedControlToken.Size {
        self.token.size
    }
}
