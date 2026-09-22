//
//  ChipSize.swift
//  SparkComponentChip
//
//  Created by robin.lemaire on 09/09/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

/// The different sizes of a chip
public enum ChipSize: CaseIterable {
    case medium
    case large

    // MARK: - Properties

    /// The default case. Equals to **.medium**.
    public static let `default`: Self = .medium
}
