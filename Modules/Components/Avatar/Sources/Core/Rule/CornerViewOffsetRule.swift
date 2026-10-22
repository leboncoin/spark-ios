//
//  CornerViewOffsetRule.swift
//  SparkComponentAvatar
//
//  Created by robin.lemaire on 22/07/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

extension AvatarContentType {

    // MARK: - Getter

    func cornerViewOffset(
        avatarSize: CGFloat,
        cornerViewSize: CGSize?
    ) -> CGSize {
        let offset = switch self {
        // Circle: position at 45 degrees on the edge (radius * sqrt(2) / 2)
        case .user: (avatarSize / 2) * (sqrt(2) / 2)
        // Rectangle: position at the corner with a quarter of the corner view outside
        case .company: avatarSize / 2 - (cornerViewSize?.width ?? 0) * 0.25
        }

        return CGSize(width: offset, height: offset)
    }
}
