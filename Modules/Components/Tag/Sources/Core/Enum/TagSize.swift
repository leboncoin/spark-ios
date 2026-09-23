//
//  TagSize.swift
//  SparkComponentTag
//
//  Created by robin.lemaire on 05/08/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

/// The size for the tag.
///
/// The default value is **.medium**.
public enum TagSize: CaseIterable {
    /// A medium tag with a base height of 20 pixels.
    case medium
    /// A large tag with a base height of 24 pixels.
    case large

    // MARK: - Properties

    public static let `default`: Self = .medium
}
