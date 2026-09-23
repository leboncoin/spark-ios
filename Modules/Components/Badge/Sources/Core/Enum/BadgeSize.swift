//
//  BadgeSize.swift
//  SparkComponentBadge
//
//  Created by robin.lemaire on 09/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation

/// The various sizes a badge may have.
public enum BadgeSize: CaseIterable {
    case small
    case medium

    // MARK: - Properties

    /// The default case. Equals to **.medium**.
    public static let `default`: Self = .medium
}
