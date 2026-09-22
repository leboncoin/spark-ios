//
//  BadgeColorsDeprecated.swift
//  SparkComponentBadge
//
//  Created by alex.vecherov on 04.05.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import SparkTheming

// sourcery: AutoMockable
@available(*, deprecated, message: "Not used anymore by the new SparkBadge or SparkUIBadge")
struct BadgeColorsDeprecated {

    // MARK: - Properties

    let backgroundColor: any ColorToken
    let borderColor: any ColorToken
    let foregroundColor: any ColorToken
}

