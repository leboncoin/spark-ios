//
//  AvatarCornerViewType.swift
//  SparkComponentAvatar
//
//  Created by robin.lemaire on 02/07/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

enum AvatarCornerViewType: CaseIterable {
    case badge
    case button

    // MARK: - Properties

    var isAction: Bool {
        switch self {
        case .badge: false
        case .button: true
        }
    }
}
