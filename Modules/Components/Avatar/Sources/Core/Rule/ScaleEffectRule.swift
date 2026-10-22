//
//  ScaleEffectRule.swift
//  SparkComponentAvatar
//
//  Created by robin.lemaire on 22/07/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

extension AvatarSize {

    // MARK: - Getter

    func scaleEffect(isPressed: Bool) -> CGFloat {
        guard isPressed else {
            return 1.0
        }

        return switch self {
        case .xs, .sm, .md, .lg: 1.1
        case .xl: 1.07
        case .xxl, .xxxl: 1.05
        }
    }
}
