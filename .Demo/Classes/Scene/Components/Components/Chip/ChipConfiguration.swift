//
//  ChipConfiguration.swift
//  SparkDemo
//
//  Created by robin.lemaire on 30/01/2025.
//  Copyright © 2025 Adevinta. All rights reserved.
//

import Foundation

class ChipConfiguration: ComponentConfiguration {

    // MARK: - Properties

    var intent: ChipIntent = .random
    var variant: ChipVariant = .random
    var alignment: ChipAlignment = .random
    var text = "My Chip"
    var icon: Iconography? = .optionalRandom
    var withAction: Bool = .random()
    var withExtraComponent: Bool = .random()
    var isSelected: Bool = .random()

    var badgeConfiguration = BadgeConfiguration()

    // MARK: - Initialization

    required init() {
        super.init()

        self.accessibilityLabel.showConfiguration = true

        self.badgeConfiguration.customText = ""
    }

    // MARK: - Getter

    override func isInvertedBackground() -> Bool {
        self.intent == .surface
    }
}
