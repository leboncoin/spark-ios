//
//  BadgeComponentView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 29/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

// MARK: - View

typealias BadgeComponentView = ComponentViewable<BadgeConfiguration, BadgeImplementationView, BadgeConfigurationView, BadgeExtraTools>

// MARK: - Subview

struct BadgeImplementationView: ComponentImplementationViewable {

    // MARK: - Properties

    var configuration: Binding<BadgeConfiguration>

    // MARK: - View

    var body: some View {
        self.content {
            self.component()
                .sparkBadgeIntent(self.configurationWrapped.intent)
                .sparkBadgeSize(self.configurationWrapped.size)
                .sparkBadgeIsBorder(self.configurationWrapped.isBorder)
                .demoAccessibilityLabel(self.configurationWrapped)
        }
        .sparkTheme(self.configurationWrapped.theme.value)
    }

    @ViewBuilder
    private func component() -> some View {
        if self.configurationWrapped.isValue {
            SparkBadge(
                value: self.configurationWrapped.value,
                unit: self.configurationWrapped.unit
            )
        } else {
            SparkBadge()
        }
    }

    @ViewBuilder
    private func content<Badge>(
        @ViewBuilder badge: @escaping () -> Badge
    ) -> some View where Badge: View {
        if self.configurationWrapped.isAttached {
            Rectangle()
                .fill(.blue)
                .frame(size: 40)
                .attachSparkBadge(position: self.configurationWrapped.position) {
                    badge()
                }
        } else {
            badge()
        }
    }
}
