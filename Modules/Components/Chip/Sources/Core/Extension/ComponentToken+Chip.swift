//
//  ComponentToken+Chip.swift
//  SparkComponentChip
//
//  Created by robin.lemaire on 27/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SparkTheming

public extension ComponentToken {

    /// The token values of the Chip component derived from the theme.
    var chip: ChipToken {
        return .init(theme: self.theme)
    }
}
