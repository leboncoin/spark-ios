//
//  TagIntent.swift
//  SparkComponentTag
//
//  Created by robin.lemaire on 27/03/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

/// The intent of the tag.
///
/// The default value is **.main**.
public enum TagIntent: CaseIterable {
    case accent
    case ai
    case alert
    case danger
    case info
    case main
    case neutral
    case success
    case support
    case surface

    // MARK: - Properties

    public static let `default`: Self = .main
}
