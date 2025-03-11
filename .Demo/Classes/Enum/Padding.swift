//
//  Padding.swift
//  SparkDemo
//
//  Created by robin.lemaire on 16/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

enum Padding: CGFloat {
    case xSmall = 4
    case small = 8
    case medium = 16
    case large = 24
    case xLarge = 32
}

// MARK: - SwiftUI Extension & ViewModifier

extension View {

    func padding(
        _ edges: Edge.Set = .all,
        _ padding: Padding
    ) -> some View {
        self.modifier(
            PaddingViewModifier(edges: edges, padding: padding)
        )
    }
}

struct PaddingViewModifier: ViewModifier {

    // MARK: - Properties

    let edges: Edge.Set
    let padding: Padding

    // MARK: - View

    func body(content: Content) -> some View {
        content.padding(self.edges, self.padding.rawValue)
    }
}

// MARK: - UIKit Extension

extension UIEdgeInsets {

    init(topPadding: Padding? = nil, leftPadding: Padding? = nil, bottomPadding: Padding? = nil, rightPadding: Padding? = nil) {
        self.init(
            top: topPadding?.rawValue ?? 0,
            left: leftPadding?.rawValue ?? 0,
            bottom: bottomPadding?.rawValue ?? 0,
            right: rightPadding?.rawValue ?? 0
        )
    }

    init(verticalPadding: Padding? = nil, horizontalPadding: Padding? = nil) {
        self.init(
            top: verticalPadding?.rawValue ?? 0,
            left: horizontalPadding?.rawValue ?? 0,
            bottom: verticalPadding?.rawValue ?? 0,
            right: horizontalPadding?.rawValue ?? 0
        )
    }

    init(all: Padding) {
        self.init(
            top: all.rawValue,
            left: all.rawValue,
            bottom: all.rawValue,
            right: all.rawValue
        )
    }
}

extension CGFloat {

    init(padding: Padding) {
        self.init(padding.rawValue)
    }
}
