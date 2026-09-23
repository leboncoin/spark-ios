//
//  BorderRadiusViewModifier.swift
//  SparkCommon
//
//  Created by robin.lemaire on 01/08/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI
import SparkTheming

internal struct HighlightedRectangle: InsettableShape {

    // MARK: - Properties

    let cornerRadius: CGFloat
    let isHighlighted: Bool
    var inset = 0.0

    // MARK: - Path

    func path(in rect: CGRect) -> Path {
        let corners: UIRectCorner = self.isHighlighted ? [
            .topLeft,
            .topRight,
            .bottomRight
        ] : .allCorners

        let rect = CGRect(
            x: rect.origin.x + self.inset,
            y: rect.origin.y + self.inset,
            width: rect.width - self.inset * 2,
            height: rect.height - self.inset * 2
        )

        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadius: self.cornerRadius > 0 ? (self.cornerRadius - self.inset) : 0
        )

        return Path(path.cgPath)
    }

    // MARK: - Insets

    func inset(by amount: CGFloat) -> some InsettableShape {
        var copy = self
        copy.inset += amount
        return copy
    }
}
