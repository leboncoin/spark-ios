//
//  TabStateDeprecated.swift
//  SparkComponentTab
//
//  Created by alican.aycil on 21.07.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Foundation
@_spi(SI_SPI) import SparkCommon

/// `TabStateDeprecated` determines the current state of the tab.
struct TabStateDeprecated: Equatable, Updateable {
    var isEnabled: Bool
    var isPressed: Bool
    var isSelected: Bool

    init(
        isEnabled: Bool = true,
        isPressed: Bool = false,
        isSelected: Bool = false
    ) {
        self.isEnabled = isEnabled
        self.isPressed = isPressed
        self.isSelected = isSelected
    }
}
