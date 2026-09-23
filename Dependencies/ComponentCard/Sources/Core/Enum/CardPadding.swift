//
//  CardPadding.swift
//  SparkComponentCard
//
//  Created by robin.lemaire on 16/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

/// The variant of the card.
public enum CardPadding: CaseIterable {
    /// No padding is applied.
    case none
    /// Padding is applied for all edges.
    case all
    /// Padding is applied for all edges **PLUS** a padding at the bottom of the *border* header.
    /// Works only if *CardHeaderPosition* is equals to *.border* otherwise only the edges is applied.
    case allAndBottomHeader

    // MARK: - Properties

    /// The default case. Equals to **.all**.
    public static let `default`: Self = .all

    var isPadding: Bool {
        switch self {
        case .none: false
        case .all, .allAndBottomHeader: true
        }
    }
}
