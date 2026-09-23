//
//  AvatarActionType.swift
//  SparkComponentAvatar
//
//  Created by robin.lemaire on 02/07/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
import SparkResources
@_spi(SI_SPI) import SparkCommon

/// The action type for the avatar icon button.
public enum AvatarActionType: CaseIterable {
    case add
    case edit

    // MARK: - Properties

    /// The icon associated with the action type.
    public var icon: Image {
        return switch self {
        case .add: Image(spark: \.plus)
        case .edit: Image(spark: \.penOutline)
        }
    }
}
