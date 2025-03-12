//
//  TabComponentUIView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 05/02/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import UIKit
import SwiftUI

// MARK: - View Controller

typealias TabComponentUIViewController = ComponentDisplayViewControllerRepresentable<TabConfiguration, TabUIView, TabConfigurationView, TabComponentUIViewMaker>

extension TabComponentUIViewController {

    init() {
        self.init(style: .alone, styles: [.alone])
    }
}

// MARK: - View Maker

final class TabComponentUIViewMaker: ComponentUIViewMaker {

    // MARK: - Type Alias

    typealias Configuration = TabConfiguration
    typealias ComponentView = TabUIView
    typealias ConfigurationView = TabConfigurationView
    typealias DisplayViewController = ComponentDisplayViewController<Configuration, ComponentView, ConfigurationView, TabComponentUIViewMaker>

    // MARK: - Properties

    weak var viewController: DisplayViewController?

    // MARK: - Methods

    func createComponentView(
        for configuration: Configuration
    ) -> ComponentView {
        let componentView = ComponentView(
            theme: configuration.theme.value,
            intent: configuration.intent,
            tabSize: configuration.tabSize,
            content: configuration.items.map {
                TabUIItemContent(
                    icon: .init(icon: $0.icon),
                    title: $0.text
                )
            },
            apportionsSegmentWidthsByContent: !configuration.isEqualSize
        )

        self.updateCommonProperties(componentView, for: configuration)

        return componentView
    }

    func updateComponentView(
        _ componentView: ComponentView,
        for configuration: Configuration
    ) {
        componentView.theme = configuration.theme.value
        componentView.intent = configuration.intent
        componentView.tabSize = configuration.tabSize
        componentView.apportionsSegmentWidthsByContent = !configuration.isEqualSize
        componentView.demoContent(for: configuration)

        self.updateCommonProperties(componentView, for: configuration)
    }

    private func updateCommonProperties(
        _ componentView: ComponentView,
        for configuration: Configuration
    ) {
        componentView.demoDisable(for: configuration)
        componentView.demoBadge(for: configuration)
        componentView.demoAccessibilityLabel(configuration)
        componentView.demoBackground(configuration)
    }
}

// MARK: - Extension

private extension TabUIView {

    func demoDisable(for configuration: TabComponentUIViewMaker.Configuration) {
        if !configuration.isEnabled.value {
            self.isEnabled = false
        } else {

            for (index, item) in configuration.items.enumerated() {
                if self.segments.count > index {
                    self.segments[index].isEnabled = item.isEnabled
                }
            }
        }
    }

    func demoContent(for configuration: TabComponentUIViewMaker.Configuration) {
        if configuration.numberOfTabs < self.numberOfSegments {
            self.removeSegment(at: self.numberOfSegments - 1, animated: true)
        } else if configuration.numberOfTabs >= self.numberOfSegments {

            for (index, item) in configuration.items.enumerated() {
                let text = item.text.isEmpty ? nil : item.text
                let icon: UIImage? = .init(icon: item.icon)

                // New segment
                if index >= self.numberOfSegments {
                    switch (text, icon) {
                    case let (text?, icon?):
                        self.addSegment(
                            withImage: icon,
                            andTitle: text,
                            animated: true
                        )

                    case (let text?, nil):
                        self.addSegment(
                            with: text,
                            animated: true
                        )

                    case (nil, let icon?):
                        self.addSegment(
                            with: icon,
                            animated: true
                        )

                    default:
                        self.addSegment(
                            with: "Unkwow",
                            animated: true
                        )
                    }
                } else { // Update segment
                    self.setImage(icon, forSegmentAt: index)
                    self.setTitle(text, forSegmentAt: index)
                }
            }
        }
    }

    func demoBadge(for configuration: TabComponentUIViewMaker.Configuration) {
        for (index, item) in configuration.items.enumerated() {
            if self.segments.count > index {

                let badge = self.demoCreateBadge(
                    at: item,
                    for: configuration
                )

                self.setBadge(badge, forSegementAt: index)
            }
        }
    }

    private func demoCreateBadge(
        at item: TabComponentUIViewMaker.Configuration.Item,
        for configuration: TabComponentUIViewMaker.Configuration
    ) -> BadgeUIView? {
        guard item.isBadge else { return nil }

        let badge = BadgeUIView(
            theme: self.theme,
            intent: .danger,
            value: item.badgeValue
        )
        badge.translatesAutoresizingMaskIntoConstraints = false
        badge.isBorderVisible = false
        badge.size = configuration.tabSize.demoBadgeSize
        return badge
    }
}
