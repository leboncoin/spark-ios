//
//  TabComponentView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 27/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

// MARK: - View

typealias TabComponentView = ComponentViewable<TabConfiguration, TabImplementationView, TabConfigurationView, TabExtraTools>

extension TabComponentView {

    init() {
        self.init(style: .alone, styles: [.alone])
    }
}

// MARK: - Subview

struct TabImplementationView: ComponentImplementationViewable {

    // MARK: - Properties

    var configuration: Binding<TabConfiguration>
    @State private var selectedTab: Int = 5

    // MARK: - View

    var body: some View {
        SparkTab(selection: self.$selectedTab) {

            ForEach(self.configurationWrapped.items, id: \.id) { item in

                let text = item.text.nilIfEmpty
                let icon = item.icon
                let isBadge = item.isBadge

                switch (text, icon) {

                case (nil, let icon?):
                    let image = Image(icon: icon)

                    if isBadge {
                        SparkTabItem(
                            tag: item.id,
                            icon: image
                        ) {
                            self.badge(at: item, configuration: self.configurationWrapped)
                        }
                    } else {
                        SparkTabItem(
                            tag: item.id,
                            icon: image
                        )
                    }

                default:
                    let text = text ?? "Unknow"

                    if isBadge {
                        SparkTabItem(
                            tag: item.id,
                            text: text,
                            icon: .init(icon: item.icon)
                        ) {
                            self.badge(at: item, configuration: self.configurationWrapped)
                        }
                    } else {
                        SparkTabItem(
                            tag: item.id,
                            text: text,
                            icon: .init(icon: item.icon)
                        )
                    }
                }
            }
        }
        .sparkTheme(self.configurationWrapped.theme.value)
        .sparkTabIntent(self.configurationWrapped.intent)
        .sparkTabSize(self.configurationWrapped.tabSize)
        .sparkTabApportionsSegmentWidthsByContent(!self.configurationWrapped.isEqualSize)
        .demoDisabled(self.configurationWrapped)
    }

    private func badge(at item: TabConfiguration.Item, configuration: TabConfiguration) -> some View {
        SparkBadge(value: item.badgeValue)
            .sparkTheme(configuration.theme.value)
            .sparkBadgeIntent(.support)
            .sparkBadgeSize(configuration.tabSize.demoBadgeSize)
            .sparkBadgeIsBorder(false)
    }
}
