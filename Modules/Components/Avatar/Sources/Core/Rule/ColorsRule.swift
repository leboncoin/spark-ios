//
//  ColorsRule.swift
//  SparkComponentAvatar
//
//  Created by robin.lemaire on 29/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SparkTheming

extension Theme {

    // MARK: - Properties

    var borderColorToken: any ColorToken {
        return self.colors.base.outline
    }

    // MARK: - Getter

    func backgroundColorToken(contentType: AvatarContentType) -> any ColorToken {
        return switch contentType {
        case .user: self.colors.base.surfaceInverse
        case .company: self.colors.feedback.neutralContainer
        }
    }

    func placeholderTintColorToken(contentType: AvatarContentType) -> any ColorToken {
        return switch contentType {
        case .user: self.colors.base.onSurfaceInverse
        case .company: self.colors.feedback.onNeutralContainer
        }
    }

    func actionBackgroundColorToken(isPressed: Bool) -> any ColorToken {
        return isPressed ? self.colors.states.surfacePressed : self.colors.base.surface
    }

    func actionTintColorToken(isPressed: Bool) -> any ColorToken {
        return isPressed ? self.colors.states.neutralPressed : self.colors.feedback.neutral
    }
}
