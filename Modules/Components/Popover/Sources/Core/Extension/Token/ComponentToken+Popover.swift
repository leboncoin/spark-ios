//
//  ComponentToken+Popover.swift
//  SparkComponentPopover
//
//  Created by Robin Lemaire on 18/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SparkTheming

public extension ComponentToken {

    /// The token values of the Popover component derived from the theme.
    var popover: PopoverToken {
        return .init(theme: self.theme)
    }
}
