//
//  TabComponentView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 27/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

// MARK: - View

typealias TabComponentView = ComponentViewable<TabConfiguration, TabImplementationView, TabConfigurationView>

extension TabComponentView {

    init() {
        self.init(style: .alone, styles: [.alone])
    }
}

// MARK: - Subview

struct TabImplementationView: ComponentImplementationViewable {

    // MARK: - Properties

    var configuration: Binding<TabConfiguration>
    @State private var selectedTab: Int = 0

    // MARK: - View

    var body: some View {
        TabView(
            theme: self.configurationWrapped.theme.value,
            intent: self.configurationWrapped.intent,
            tabSize: self.configurationWrapped.tabSize,
            content: self.configurationWrapped.items.map {
                .init(
                    icon: .init(icon: $0.icon),
                    title: $0.text
                )
            },
            selectedIndex: self.$selectedTab
        )
        .apportionsSegmentWidthsByContent(!self.configurationWrapped.isEqualSize)
        .demoBadgeItems(self.configurationWrapped)
        .demoDisabledItems(self.configurationWrapped)
        .demoDisabled(self.configurationWrapped)
        .padding(.top, 1)
    }
}

// MARK: - Extension

private extension SparkTab.TabView {

    func demoBadgeItems(_ configuration: TabConfiguration) -> Self {
        var copy = self
        for (index, item) in configuration.items.enumerated() {
            let badge = self.demoBadge(at: item, for: configuration)
            copy = copy.badge(badge, index: index)
        }
        return copy
    }

    private func demoBadge(at item: TabConfiguration.Item, for configuration: TabConfiguration) -> BadgeView? {
        guard item.isBadge else {
            return nil
        }

        return BadgeView(
            theme: configuration.theme.value,
            intent: .danger,
            value: item.badgeValue
        )
        .size(configuration.tabSize.demoBadgeSize)
        .borderVisible(false)
    }

    func demoDisabledItems(_ configuration: TabConfiguration) -> Self {
        var copy = self
        for (index, item) in configuration.items.enumerated() {
            copy = copy.disabled(!item.isEnabled, index: index)
        }
        return copy
    }
}

// MARK: - Preview

struct TabComponentView_Previews: PreviewProvider {
    static var previews: some View {
        TabComponentView()
    }
}
