//
//  TabComponentView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 27/01/2025.
//  Copyright © 2025 Adevinta. All rights reserved.
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
            content: self.tabs(for: self.configurationWrapped),
            selectedIndex: self.$selectedTab
        )
        .apportionsSegmentWidthsByContent(!self.configurationWrapped.isEqualSize)
        .badge(self.badge(for: self.configurationWrapped), index: self.configurationWrapped.badgePosition)
        .disabled(self.configurationWrapped.isDisabledRandomTab, index: self.configurationWrapped.disabledTab)
        .demoDisabled(self.configurationWrapped)
        .padding(.top, 1)
    }

    func badge(for configuration: TabConfiguration) -> BadgeView? {
        guard configuration.isBadge else {
            return nil
        }

        return BadgeView(
            theme: configuration.theme.value,
            intent: .danger,
            value: 99
        )
        .borderVisible(false)
    }

    private func tabs(for configuration: TabConfiguration) -> [TabItemContent] {
        return (0..<configuration.numberOfTabs).map {
            .init(
                icon: configuration.isIcon ? .image(at: $0) : nil,
                title: configuration.isText ? self.label($0, for: configuration) : nil
            )
        }
    }

    private func label(_ index: Int, for configuration: TabConfiguration) -> String {
        if configuration.isLongLabel && index == 1 {
            return "Long label \(index + 1)"
        } else {
            return "Tab \(index + 1)"
        }
    }
}

struct TabConfigurationView: ConfigurationViewable {

    // MARK: - Properties

    var configuration: Binding<TabConfiguration>

    // MARK: - View

    var body: some View {
        ComponentConfigurationView(
            configuration: self.configuration,
            componentViewType: TabImplementationView.self,
            itemsView: {
                EnumConfigurationView(
                    name: "intent",
                    values: TabIntent.allCases,
                    selectedValue: self.configuration.intent
                )

                HStack(spacing: .medium) {
                    EnumConfigurationView(
                        name: "size",
                        values: TabSize.allCases,
                        selectedValue: self.configuration.tabSize
                    )

                    ToggleConfigurationView(
                        name: "is equal size",
                        isOn: self.configuration.isEqualSize
                    )
                }

                StepperConfigurationView(
                    name: "no. of tabs",
                    value: self.configuration.numberOfTabs,
                    bounds: 1...10
                )

                HStack(spacing: .medium) {
                    ToggleConfigurationView(
                        name: "is text",
                        isOn: self.configuration.isText
                    )

                    ToggleConfigurationView(
                        name: "is long label",
                        isOn: self.configuration.isLongLabel
                    )
                }

                HStack(spacing: .medium) {
                    ToggleConfigurationView(
                        name: "is icon",
                        isOn: self.configuration.isIcon
                    )

                    ToggleConfigurationView(
                        name: "is badge",
                        isOn: self.configuration.isBadge
                    )
                }

                ToggleConfigurationView(
                    name: "disabled random tab",
                    isOn: self.configuration.isDisabledRandomTab
                )
            }
        )
    }
}

// MARK: - Extension

private extension Image {
    static let names = [
        "trash",
        "folder",
        "paperplane",
        "tray",
        "externaldrive",
        "internaldrive",
        "archivebox",
        "doc",
        "clipboard",
        "terminal",
        "book",
        "greetingcard",
        "menucard",
        "magazine"
    ]

    static func image(at index: Int) -> Image {
        let allSfs: [String] = names.flatMap{ [$0, "\($0).fill"] }
        let imageName = allSfs[index % names.count]
        return Image(systemName: imageName)
    }
}

// MARK: - Preview

struct TabComponentView_Previews: PreviewProvider {
    static var previews: some View {
        TabComponentView()
    }
}
