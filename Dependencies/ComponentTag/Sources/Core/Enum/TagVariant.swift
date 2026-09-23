//
//  TagVariant.swift
//  SparkComponentTag
//
//  Created by robin.lemaire on 27/03/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

/// The variant for the tag.
///
/// The default value is **.filled**.
public enum TagVariant: CaseIterable {
    /// Background and border color is the same, tint is lighter.
    case filled
    /// Border and tint color is the same, background is lighter.
    case outlined
    /// Background and border color is the same, tint is darker.
    case tinted

    // MARK: - Properties

    public static let `default`: Self = .filled
}
