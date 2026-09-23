//
//  CardVariant.swift
//  SparkComponentCard
//
//  Created by robin.lemaire on 01/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

/// The variant of the card.
public enum CardVariant: CaseIterable {
    case outlined
    case tinted

    @available(*, deprecated, message: "Replace by sparkCardPadding.")
    case filled

    // MARK: - Properties

    public static var allCases: [CardVariant] = [
        .outlined, .tinted
    ]

    /// The default case. Equals to **.filled**.
    public static let `default`: Self = .tinted
}
