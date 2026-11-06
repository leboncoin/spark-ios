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
    }

    func equals(_ other: any TypographyFontToken) -> Bool {
        if let lhs = self as? TypographyFontTokenDefault, let rhs = other as? TypographyFontTokenDefault {
            return lhs.isSameFont(rhs)
        }

        return self.font == other.font
    }

    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.equals(rhs)
    }
}

// MARK: - Optional Extension

public extension Optional where Wrapped == any TypographyFontToken {

    func equals(_ other: (any TypographyFontToken)?) -> Bool {
        return switch (self, other) {
        case (.none, .none): true
        case (.none, .some), (.some, .none): false
        case (let lhs?, let rhs?): lhs.equals(rhs)
        }
    }
}

// MARK: - Clear Token

@_spi(SI_SPI) public struct TypographyFontTokenClear: TypographyFontToken {
    public let uiFont: UIFont = .systemFont(ofSize: 14)
    public let font: Font = .body

    public init() {
    }
}
