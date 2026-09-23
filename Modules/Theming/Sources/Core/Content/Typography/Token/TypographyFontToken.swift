//
//  TypographyFontToken.swift
//  SparkTheming
//
//  Created by robin.lemaire on 05/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import UIKit
import SwiftUI

// sourcery: AutoMockable
public protocol TypographyFontToken: Hashable, Equatable {
    var uiFont: UIFont { get }
    var font: Font { get }
}

// MARK: - Hashable & Equatable

public extension TypographyFontToken {

    func hash(into hasher: inout Hasher) {
        hasher.combine(self.font)
        hasher.combine(self.uiFont)
    }

    func equals(_ other: any TypographyFontToken) -> Bool {
        return self.font == other.font && self.uiFont == other.uiFont
    }

    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.equals(rhs)
    }
}

// MARK: - Optional Extension

public extension Optional where Wrapped == any TypographyFontToken {

    func equals(_ other: (any TypographyFontToken)?) -> Bool {
        return self?.font == other?.font && self?.uiFont == other?.uiFont
    }
}

// MARK: - Clear Token

@_spi(SI_SPI) public struct TypographyFontTokenClear: TypographyFontToken {
    public let uiFont: UIFont = .systemFont(ofSize: 14)
    public let font: Font = .body

    public init() {
    }
}
