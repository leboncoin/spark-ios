//
//  BadgeIntentType.swift
//  SparkComponentBadge
//
//  Created by alex.vecherov on 04.05.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Foundation

// sourcery: AutoMockable
/// **BadgeIntentType** defines color of ``BadgeView``
@available(*, deprecated, message: "Not used anymore by the new SparkBadge or SparkUIBadge")
public enum BadgeIntentType: CaseIterable {
    case accent
    case alert
    case danger
    case info
    case neutral
    case main
    case support
    case success
}
