//
//  CardIntent.swift
//  SparkComponentCard
//
//  Created by robin.lemaire on 01/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

/// The intent of the card.
public enum CardIntent: CaseIterable {
    case accent
    case alert
    case error
    case info
    case main
    case neutral
    case success
    case support
    case surface

    // MARK: - Properties

    /// The default case. Equals to **.surface**.
    public static let `default`: Self = .surface
}
