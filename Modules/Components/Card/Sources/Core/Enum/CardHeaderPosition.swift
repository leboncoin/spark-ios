//
//  CardHeaderPosition.swift
//  SparkComponentCard
//
//  Created by robin.lemaire on 11/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

/// The position of the card header.
public enum CardHeaderPosition: CaseIterable {
    case banner
    case border

    // MARK: - Public Properties

    /// The default case. Equals to **.banner**.
    public static let `default`: Self = .banner

    // MARK: - Properties

    var contentHasTopPadding: Bool {
        return self == .border
    }

    var betweenSpaces: Bool {
        return self == .banner
    }
}
