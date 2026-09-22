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

typealias TabComponentUIViewController = ComponentDisplayViewControllerRepresentable<TabConfiguration, SparkUITab, TabConfigurationView, TabComponentUIViewMaker, TabExtraTools>

extension TabComponentUIViewController {

    init() {
        self.init(style: .alone, styles: [.alone])
    }
}

// MARK: - View Maker

final class TabComponentUIViewMaker: ComponentUIViewMaker {

    // MARK: - Type Alias

    typealias Configuration = TabConfiguration
    typealias ComponentView = SparkUITab
    typealias ConfigurationView = TabConfigurationView
    typealias DisplayViewController = ComponentDisplayViewController<Configuration, ComponentView, ConfigurationView, TabComponentUIViewMaker, ExtraTools>
    typealias ExtraTools = TabExtraTools

    // MARK: - Properties

    weak var viewController: DisplayViewController?

    // MARK: - Methods

    func createComponentView(
        for configuration: Configuration
    ) -> ComponentView {
        let componentView = ComponentView(
            theme: configuration.theme.value,
            titles: configuration.items.map { item in
                item.text.nilIfEmpty ?? "unknow"
            }
        )

        self.updateCommonProperties(componentView, for: configuration)

        return componentView
    }

    func updateComponentView(
        _ componentView: ComponentView,
        for configuration: Configuration
    ) {
        componentView.theme = configuration.theme.value
        componentView.demoContent(for: configuration)

        self.updateCommonProperties(componentView, for: configuration)
    }

    private func updateCommonProperties(
        _ componentView: ComponentView,
        for configuration: Configuration
    ) {
        componentView.intent = configuration.intent
        componentView.size = configuration.tabSize
        componentView.apportionsSegmentWidthsByContent = !configuration.isEqualSize
        componentView.demoDisabled(configuration)
        componentView.demoBadge(for: configuration)
        componentView.demoAccessibilityLabel(configuration)
    }

    // MARK: - Getter

    func isFullWidth() -> Bool {
        true
    }
}

// MARK: - Extension

private extension SparkUITab {

    func demoContent(for configuration: TabComponentUIViewMaker.Configuration) {
        let animated = configuration.uiKitIsAnimated
        if configuration.numberOfTabs < self.numberOfSegments {
            self.removeSegment(at: self.numberOfSegments - 1, animated: animated)
        } else if configuration.numberOfTabs >= self.numberOfSegments {

            for (index, item) in configuration.items.enumerated() {
                let text = item.text.nilIfEmpty
                let icon: UIImage? = .init(icon: item.icon)

                // New segment
                if index >= self.numberOfSegments {
                    switch (text, icon) {
                    case let (text?, icon?):
                        self.addSegment(
                            with: .init(title: text, image: icon),
                            animated: animated
                        )

                    case (let text?, nil):
                        self.addSegment(
                            with: text,
                            animated: animated
                        )

                    case (nil, let icon?):
                        self.addSegment(
                            with: icon,
                            animated: animated
                        )

                    default: break
                    }
                } else { // Update segment
                    if item.uiKitIsAttributedText {
                        self.setAttributedTitle(text?.demoNSAttributedString, forSegmentAt: index)
                    } else {
                        self.setTitle(text, forSegmentAt: index)
                    }
                    self.setImage(icon, forSegmentAt: index)
                }
            }
        }
    }

    func demoBadge(for configuration: TabComponentUIViewMaker.Configuration) {
        for (index, item) in configuration.items.enumerated() {

            let badge = self.demoCreateBadge(
                at: item,
                for: configuration
            )

            self.setExtraView(badge, forSegmentAt: index)
        }
    }

    private func demoCreateBadge(
        at item: TabComponentUIViewMaker.Configuration.Item,
        for configuration: TabComponentUIViewMaker.Configuration
    ) -> SparkUIBadge? {
        guard item.isBadge else { return nil }

        let badge = SparkUIBadge(
            theme: self.theme
        )
        badge.intent = .main
        badge.value = item.badgeValue
        badge.isBorder = false
        badge.size = configuration.tabSize.demoBadgeSize
        badge.accessibilityLabel = "\(item.badgeValue)"

        return badge
    }
}
