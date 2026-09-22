//
//  TagComponentView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 14/04/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import SwiftUI

// MARK: - View

typealias TagComponentView = ComponentViewable<TagConfiguration, TagImplementationView, TagConfigurationView, TagExtraTools>

// MARK: - Subview

struct TagImplementationView: ComponentImplementationViewable {

    // MARK: - Properties

    var configuration: Binding<TagConfiguration>

    // MARK: - View

    var body: some View {
        self.component()
            .sparkTheme(self.configurationWrapped.theme.value)
            .sparkTagIntent(self.configurationWrapped.intent)
            .sparkTagSize(self.configurationWrapped.size)
            .sparkTagVariant(self.configurationWrapped.variant)
            .sparkTagIsHighlighted(self.configurationWrapped.isHighlighted)
            .demoAccessibilityLabel(self.configurationWrapped)
            .demoBackground(self.configurationWrapped)
    }

    @ViewBuilder
    private func component() -> some View {
        if let icon = self.configurationWrapped.icon,
           let text = self.configurationWrapped.text.nilIfEmpty,
           self.configurationWrapped.swiftUIIsCustomContent {
            SparkTag(
                icon: .init(icon: icon),
                label: {
                    Group {
                        Text(text + " ") +
                        Text(self.configurationWrapped.swiftUISecondText)
                            .foregroundColor(.blue)
                            .italic()
                    }
                }
            )

        } else if let text = self.configurationWrapped.text.nilIfEmpty,
                  self.configurationWrapped.swiftUIIsCustomContent {
            SparkTag(
                label: {
                    Group {
                        Text(text + " ") +
                        Text(self.configurationWrapped.swiftUISecondText)
                            .foregroundColor(.blue)
                            .italic()
                    }
                }
            )

        } else if let icon = self.configurationWrapped.icon,
                  let text = self.configurationWrapped.text.nilIfEmpty {
            SparkTag(
                text,
                icon: .init(icon: icon)
            )

        } else if let icon = self.configurationWrapped.icon {
            SparkTag(
                icon: .init(icon: icon)
            )

        } else {
            SparkTag(
                self.configurationWrapped.text.nilIfEmpty ?? "My Tag"
            )
        }
    }
}
