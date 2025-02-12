//
//  TabComponentUIView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 05/02/2025.
//  Copyright © 2025 Adevinta. All rights reserved.
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

    // MARK: - Static Properties

    static var fullWidth: Bool { false }

    // MARK: - Static Methods

    static func createComponentView(
        for configuration: Configuration,
        viewController: DisplayViewController?
    ) -> ComponentView {
        return switch (configuration.isText, configuration.isIcon) {
        case (true, true):
            .init(
                theme: configuration.theme.value,
                intent: configuration.intent,
                tabSize: configuration.tabSize,
                content: TabUIItemContent.demoContents(for: configuration),
                apportionsSegmentWidthsByContent: !configuration.isEqualSize
            )

        case (false, true):
            .init(
                theme: configuration.theme.value,
                intent: configuration.intent,
                tabSize: configuration.tabSize,
                icons: UIImage.demoImages(for: configuration),
                apportionsSegmentWidthsByContent: !configuration.isEqualSize
            )

        default:
            .init(
                theme: configuration.theme.value,
                intent: configuration.intent,
                tabSize: configuration.tabSize,
                titles: String.demoTitles(for: configuration),
                apportionsSegmentWidthsByContent: !configuration.isEqualSize
            )
        }
    }

    static func updateComponentView(
        _ componentView: ComponentView,
        for configuration: Configuration,
        viewController: DisplayViewController?
    ) {
        componentView.theme = configuration.theme.value
        componentView.intent = configuration.intent
        componentView.tabSize = configuration.tabSize
        componentView.apportionsSegmentWidthsByContent = !configuration.isEqualSize
        componentView.demoContent(for: configuration)
        componentView.demoText(for: configuration)
        componentView.demoImage(for: configuration)
        componentView.demoDisable(for: configuration)
        componentView.demoBadge(for: configuration)
        componentView.demoAccessibilityLabel(configuration)
        componentView.demoBackground(configuration)
    }
}

// MARK: - Extension

private extension TabUIView {

    func demoDisable(for configuration: TabConfiguration) {
        if !configuration.isEnabled.value {
            self.isEnabled = false
        } else {
            // Enabled all
            self.segments.forEach { $0.isEnabled = true }

            // Disabled index
            guard self.segments.count > configuration.disabledTab,
                  configuration.isDisabledRandomTab else { return }
            self.segments[configuration.disabledTab].isEnabled = false
        }
    }

    func demoContent(for configuration: TabConfiguration) {
        if configuration.numberOfTabs < self.numberOfSegments {
            self.removeSegment(at: self.numberOfSegments - 1, animated: true)
        } else if configuration.numberOfTabs > self.numberOfSegments {
            let index = configuration.numberOfTabs
            switch (configuration.isText, configuration.isIcon) {
            case (true, true):
                self.addSegment(
                    withImage: UIImage.demoImage(at: index),
                    andTitle: String.demoText(at: index, for: configuration),
                    animated: true
                )

            case (true, false):
                self.addSegment(
                    with: String.demoText(at: index, for: configuration),
                    animated: true
                )

            case (false, true):
                self.addSegment(
                    with: UIImage.demoImage(at: index),
                    animated: true
                )

            default:
                self.addSegment(
                    with: String.demoText(at: index, for: configuration),
                    animated: true
                )
            }
        }
    }

    func demoText(for configuration: TabConfiguration) {
        for index in 0..<configuration.numberOfTabs {
            let title = configuration.isText ? String.demoText(at: index, for: configuration) : nil
            self.setTitle(title, forSegmentAt: index)
        }
    }

    func demoImage(for configuration: TabConfiguration) {
        for index in 0..<configuration.numberOfTabs {
            let image = configuration.isIcon ? UIImage.demoImage(at: index) : nil
            self.setImage(image, forSegmentAt: index)
        }
    }

    func demoBadge(for configuration: TabConfiguration) {
        if !configuration.isBadge {
            for index in 0..<self.numberOfSegments {
                self.setBadge(nil, forSegementAt: index)
            }
        } else {
            self.setBadge(
                self.demoCreateBadge(for: configuration),
                forSegementAt: configuration.badgePosition)
        }
    }

    private func demoCreateBadge(for configuration: TabConfiguration) -> BadgeUIView? {
        let badge = BadgeUIView(
            theme: self.theme,
            intent: .danger,
            value: 99
        )
        badge.translatesAutoresizingMaskIntoConstraints = false
        badge.isBorderVisible = false
        badge.size = configuration.tabSize.demoBadgeSize
        return badge
    }
}

private extension TabUIItemContent {

    static func demoContents(for configuration: TabConfiguration) -> [Self] {
        (0..<configuration.numberOfTabs).map {
            self.demoContent(at: $0, for: configuration)
        }
    }

    static func demoContent(at index: Int, for configuration: TabConfiguration) -> Self {
        .init(
            icon: configuration.isIcon ? .demoImage(at: index) : nil,
            title: configuration.isText ? .demoText(at: index, for: configuration) : nil
        )
    }
}

private extension String {

    static func demoTitles(for configuration: TabConfiguration) -> [Self] {
        (0..<configuration.numberOfTabs).map {
            self.demoText(at: $0, for: configuration)
        }
    }

    static func demoText(at index: Int, for configuration: TabConfiguration) -> Self {
        if configuration.isLongLabel {
            return "Long label \(index + 1)"
        } else {
            return "Tab \(index + 1)"
        }
    }
}

private extension UIImage {

    static func demoImages(for configuration: TabConfiguration) -> [UIImage] {
        (0..<configuration.numberOfTabs).map {
            Self.demoImage(at: $0)
        }
    }

    static func demoImage(at index: Int) -> UIImage {
        let systemName = String.tabRandomSystemImage(at: index)
        return UIImage(systemName: systemName)!
    }
}
