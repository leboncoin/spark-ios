//
//  AvatarSizes.swift
//  SparkComponentAvatar
//
//  Created by robin.lemaire on 02/07/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import SparkComponentBadge

struct AvatarSizes: Equatable {

    // MARK: - Properties

    var size: CGFloat = .zero
    var placeholderSize: CGFloat = .zero
    var actionSize: CGFloat = .zero
    var badgeSize: BadgeSize = .default
}
