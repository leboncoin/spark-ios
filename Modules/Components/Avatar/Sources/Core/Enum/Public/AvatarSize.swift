//
//  AvatarSize.swift
//  SparkComponentAvatar
//
//  Created by robin.lemaire on 02/07/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

/// The various sizes an avatar may have.
public enum AvatarSize: CaseIterable {
    case xs
    case sm
    case md
    case lg
    case xl
    case xxl
    case xxxl

    // MARK: - Properties

    /// The default case. Equals to **.lg**.
    public static let `default`: Self = .lg

    /// Whether the size supports an icon button overlay.
    /// Returns `true` for xxl and xxxl sizes, `false` otherwise.
    public var isIconButton: Bool {
        return switch self {
        case .xxl, .xxxl: true
        default: false
        }
    }
}
