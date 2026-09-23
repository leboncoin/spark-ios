//
//  TypographyFontNames.swift
//  SparkTheming
//
//  Created by robin.lemaire on 29/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

public struct TypographyFontNames: Equatable {

    // MARK: - Properties

    public let regular: String
    public let medium: String
    public let semibold: String
    public let bold: String

    // MARK: - Initialization

    public init(
        regular: String,
        medium: String,
        semibold: String,
        bold: String
    ) {
        self.regular = regular
        self.medium = medium
        self.semibold = semibold
        self.bold = bold
    }

    public init(fontName name: String) {
        self.regular = name
        self.medium = name
        self.semibold = name
        self.bold = name
    }

    // MARK: - Getter

    func getFontName(from weight: TypographyFontWeight) -> String {
        return switch weight {
        case .regular: self.regular
        case .medium: self.medium
        case .semibold: self.semibold
        case .bold: self.bold
        }
    }
}
