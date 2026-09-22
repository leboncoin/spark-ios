//
//  ChipComponentView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 30/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

// MARK: - View

typealias ChipComponentView = ComponentViewable<ChipConfiguration, ChipImplementationView, ChipConfigurationView, ChipExtraTools>

// MARK: - Subview

struct ChipImplementationView: ComponentImplementationViewable {

    // MARK: - Properties

    var configuration: Binding<ChipConfiguration>
    @State private var showAlertAction = false

    // MARK: - View

    var body: some View {
        self.component()
            .sparkTheme(self.configurationWrapped.theme.value)
            .sparkChipAlignment(self.configurationWrapped.alignment)
            .sparkChipIntent(self.configurationWrapped.intent)
            .sparkChipVariant(self.configurationWrapped.variant)
            .sparkChipSize(self.configurationWrapped.size)
            .sparkIsSelected(self.configurationWrapped.isSelected)
            .demoDisabled(self.configurationWrapped)
            .demoBackground(self.configurationWrapped)
            .demoAccessibilityLabel(self.configurationWrapped)
            .demoAccessibilityShowsLargeContentViewer(
                self.configurationWrapped,
                icon: self.configurationWrapped.icon
            )
            .alert("Chip Pressed", isPresented: self.$showAlertAction) {
                Button("OK", role: .cancel) {
                }
            }
    }

    @ViewBuilder
    private func component() -> some View {
        // With extra component
        if self.configurationWrapped.withExtraComponent {

            if self.configurationWrapped.swiftUIIsCustomContent {
                SparkChip(
                    icon: .init(icon: self.configurationWrapped.icon),
                    action: self.configurationWrapped.swiftUIWithAction ? { self.showAlertAction = true} : nil,
                    label: {
                        HStack {
                            Text(self.configurationWrapped.text)
                                .foregroundStyle(.orange)
                            Text(self.configurationWrapped.swiftUISecondText)
                                .font(.footnote)
                                .foregroundStyle(.blue)
                        }
                    },
                    extraContent: {
                        self.extraComponent()
                    }
                )
            } else if let text = configurationWrapped.text.nilIfEmpty {
                SparkChip(
                    text,
                    icon: .init(icon: self.configurationWrapped.icon),
                    action: self.configurationWrapped.swiftUIWithAction ? { self.showAlertAction = true} : nil,
                    extraContent: {
                        self.extraComponent()
                    }
                )
            } else if let icon = self.configurationWrapped.icon {
                SparkChip(
                    icon: .init(icon: icon),
                    action: self.configurationWrapped.swiftUIWithAction ? { self.showAlertAction = true} : nil,
                    extraContent: {
                        self.extraComponent()
                    }
                )
            }

        } else { // Without extra component

            if self.configurationWrapped.swiftUIIsCustomContent {
                SparkChip(
                    icon: .init(icon: self.configurationWrapped.icon),
                    action: self.configurationWrapped.swiftUIWithAction ? { self.showAlertAction = true} : nil,
                    label: {
                        HStack {
                            Text(self.configurationWrapped.text)
                                .foregroundStyle(.orange)
                            Text(self.configurationWrapped.swiftUISecondText)
                                .font(.footnote)
                                .foregroundStyle(.blue)
                        }
                    }
                )
            } else if let text = configurationWrapped.text.nilIfEmpty {
                SparkChip(
                    text,
                    icon: .init(icon: self.configurationWrapped.icon),
                    action: self.configurationWrapped.swiftUIWithAction ? { self.showAlertAction = true} : nil
                )
            } else if let icon = self.configurationWrapped.icon {
                SparkChip(
                    icon: .init(icon: icon),
                    action: self.configurationWrapped.swiftUIWithAction ? { self.showAlertAction = true} : nil
                )
            }
        }
    }

    private func extraComponent() -> some View {
        BadgeImplementationView(configuration: self.configuration.badgeConfiguration)
    }
}
