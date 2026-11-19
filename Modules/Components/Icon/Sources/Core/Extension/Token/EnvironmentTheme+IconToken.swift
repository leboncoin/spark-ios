//
//  EnvironmentTheme+IconToken.swift
//  SparkComponentIcon
//
//  Created by robin.lemaire on 18/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SparkCommon

extension EnvironmentTheme {

    // MARK: - Private Properties

    private var token: IconToken {
        self.value.component.icon
    }

    // MARK: - Properties

    var colors: IconToken.Colors {
        self.token.colors
    }

    var size: IconToken.Size {
        self.token.size
    }
}
