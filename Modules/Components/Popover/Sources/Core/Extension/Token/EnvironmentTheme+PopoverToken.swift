//
//  EnvironmentTheme+PopoverToken.swift
//  SparkComponentPopover
//
//  Created by Robin Lemaire on 18/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SparkCommon

extension EnvironmentTheme {

    // MARK: - Private Properties

    private var token: PopoverToken {
        self.value.component.popover
    }

    // MARK: - Properties

    var colors: PopoverToken.Colors {
        self.token.colors
    }

    var layout: PopoverToken.Layout {
        self.token.layout
    }
}
