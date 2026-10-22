//
//  BorderRule.swift
//  SparkComponentAvatar
//
//  Created by robin.lemaire on 02/07/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

extension Theme {

    // MARK: - Getter

    func borderWidth(isBorder: Bool, size: AvatarSize) -> CGFloat {
        guard isBorder else {
            return self.border.width.none
        }

        return switch size {
        case .xs, .sm, .md: self.border.width.small
        case .lg, .xl, .xxl, .xxxl: self.border.width.medium
        }
    }

    func borderRadius(contentType: AvatarContentType) -> CGFloat {
        return switch contentType {
        case .user: self.border.radius.full
        case .company: self.border.radius.medium
        }
    }
}
