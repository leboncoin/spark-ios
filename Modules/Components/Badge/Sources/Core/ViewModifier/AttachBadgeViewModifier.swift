//
//  AttachBadgeViewModifier.swift
//  SparkComponentBadge
//
//  Created by robin.lemaire on 27/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

private struct AttachBadgeViewModifier<Badge>: ViewModifier where Badge: View {

    // MARK: - Properties

    let badge: () -> Badge
    let position: BadgePosition
    @Environment(\.theme) private var theme
    @State var badgeSize: CGSize = .zero

    // MARK: - Initialization

    init(
        position: BadgePosition,
        @ViewBuilder badge: @escaping () -> Badge
    ) {
        self.position = position
        self.badge = badge
    }

    // MARK: - View

    func body(content: Content) -> some View {
        switch self.position {
        case .topTrailingCorner:
            ZStack(alignment: .topTrailing) {
                content

                    self.badge()
                    .onGeometryChange(for: CGSize.self) { proxy in
                        proxy.size
                    } action: {
                        self.badgeSize = $0
                    }
                    .offset(
                        x: self.badgeSize.width / 2,
                        y: -self.badgeSize.height / 2
                    )
            }

        case .trailing:
            HStack(spacing: self.theme.value.layout.spacing.small) {
                content
                self.badge()
            }
        }
    }
}

public extension View {

    /// Attach badge to another view.
    /// Triggers detach() if it was already attached to a view
    /// 
    /// - Parameters:
    ///   - position: position where the ``SparkBadge`` can be attached
    ///   - badge: the badge that be attached to the view.
    ///
    func attachSparkBadge<Badge>(
        position: BadgePosition,
        _ badge: @escaping () -> Badge
    ) -> some View where Badge: View  {
        self.modifier(AttachBadgeViewModifier(
            position: position,
            badge: badge
        ))
    }
}
