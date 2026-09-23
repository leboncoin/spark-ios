//
//  ColorToken.swift
//  SparkTheming
//
//  Created by robin.lemaire on 05/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import UIKit
import SwiftUI

// MARK: - Token

// sourcery: AutoMockable
public protocol ColorToken: Hashable, Equatable {
    var uiColor: UIColor { get }
    var color: Color { get }
}

// MARK: - Extension

public extension ColorToken {
    static var clear: any ColorToken {
        return ColorTokenClear()
    }
}

public extension ColorToken {

    var cgColor: CGColor {
        self.uiColor.cgColor
    }

    func opacity(_ opacity: CGFloat) -> any ColorToken {
        return OpacityColorToken(
            colorToken: self,
            opacity: opacity
        )
    }
}

// MARK: - Hashable & Equatable

public extension ColorToken {

    func hash(into hasher: inout Hasher) {
        hasher.combine(self.color)
        hasher.combine(self.uiColor)
    }

    func equals(_ other: any ColorToken) -> Bool {
        return self.color == other.color && self.uiColor == other.uiColor
    }

    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.equals(rhs)
    }
}

// MARK: - Optional Extension

public extension Optional where Wrapped == any ColorToken {

    func equals(_ other: (any ColorToken)?) -> Bool {
        return self?.color == other?.color && self?.uiColor == other?.uiColor
    }
}

// MARK: - Clear Token

@_spi(SI_SPI) public struct ColorTokenClear: ColorToken {
    public let uiColor: UIColor = .clear
    public let color: Color = .clear

    public init() {
    }
}

// MARK: - Opacity Token

fileprivate struct OpacityColorToken: ColorToken {
    static func == (lhs: OpacityColorToken, rhs: OpacityColorToken) -> Bool {
        return lhs.colorToken.equals(rhs.colorToken) &&
        lhs.opacity == rhs.opacity
    }

    let colorToken: any ColorToken
    let opacity: CGFloat

    var uiColor: UIColor {
        return self.colorToken.uiColor.withAlphaComponent(self.opacity)
    }
    var color: Color {
        return self.colorToken.color.opacity(self.opacity)
    }
}
