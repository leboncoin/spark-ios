//
//  ProgressTrackerComponentUIView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 05/02/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import UIKit
import SwiftUI
import Combine

// TODO: To Fix
// When showLabel changes to false, the constraints break

// MARK: - View Controller

typealias ProgressTrackerComponentUIViewController = ComponentDisplayViewControllerRepresentable<ProgressTrackerConfiguration, ProgressTrackerUIControl, ProgressTrackerConfigurationView, ProgressTrackerComponentUIViewMaker>

extension ProgressTrackerComponentUIViewController {

    init() {
        self.init(style: .verticalList, styles: [.alone, .verticalList])
    }
}

// MARK: - View Maker

final class ProgressTrackerComponentUIViewMaker: ComponentUIViewMaker {

    // MARK: - Type Alias

    typealias Configuration = ProgressTrackerConfiguration
    typealias ComponentView = ProgressTrackerUIControl
    typealias ConfigurationView = ProgressTrackerConfigurationView
    typealias DisplayViewController = ComponentDisplayViewController<Configuration, ComponentView, ConfigurationView, ProgressTrackerComponentUIViewMaker>

    // MARK: - Properties

    weak var viewController: DisplayViewController?
    private var cancellables = Set<AnyCancellable>()

    // MARK: - Methods

    func createComponentView(
        for configuration: Configuration
    ) -> ComponentView {
        let componentView = if configuration.showLabel {
            ComponentView(
                theme: configuration.theme.value,
                intent: configuration.intent,
                variant: configuration.variant,
                labels: configuration.pages.map(\.title),
                orientation: configuration.orientation
            )
        } else {
            ComponentView(
                theme: configuration.theme.value,
                intent: configuration.intent,
                variant: configuration.variant,
                numberOfPages: configuration.numberOfPages,
                orientation: configuration.orientation
            )
        }

        self.updateCommonProperties(componentView, for: configuration)

        componentView.publisher.sink { value in
            componentView.demoCurrentPageIndicatorImage(configuration, currentPageIndex: value)
        }
        .store(in: &self.cancellables)

        return componentView
    }

    func updateComponentView(
        _ componentView: ComponentView,
        for configuration: Configuration
    ) {
        componentView.theme = configuration.theme.value
        componentView.intent = configuration.intent
        componentView.variant = configuration.variant
        componentView.orientation = configuration.orientation
        componentView.numberOfPages = configuration.numberOfPages

        self.updateCommonProperties(componentView, for: configuration)
    }

    private func updateCommonProperties(
        _ componentView: ComponentView,
        for configuration: Configuration
    ) {
        componentView.size = configuration.size
        componentView.interactionState = configuration.interaction
        componentView.currentPageIndex = configuration.currentPageIndex
        componentView.setCompletedIndicatorImage(.init(icon: configuration.completedPageIndicatorIcon))
        componentView.showDefaultPageNumber = configuration.contentType == .page
        componentView.demoLabels(configuration)
        componentView.demoDisableItem(configuration)
        componentView.demoCurrentPageIndicatorImage(configuration)
        componentView.demoContentType(configuration)

        componentView.demoDisabled(configuration)
        componentView.demoAccessibilityLabel(configuration)
        componentView.demoBackground(configuration)
    }

    // MARK: - Getter

    func isFullWidth() -> Bool {
        true
    }
}

// MARK: - Extension

private extension ProgressTrackerUIControl {

    func demoDisableItem(_ configuration: ProgressTrackerConfiguration) {
        for page in configuration.pages {
            self.setIsEnabled(configuration.disabledPageIndex != page.id, forIndex: page.id)
        }
    }

    func demoCurrentPageIndicatorImage(_ configuration: ProgressTrackerConfiguration, currentPageIndex: Int? = nil) {
        let currentPageIndex = currentPageIndex ?? configuration.currentPageIndex
        for page in configuration.pages {
            let icon: Iconography? = if let icon = configuration.currentPageIndicatorIcon, currentPageIndex == page.id {
                icon
            } else if configuration.contentType == .icon {
                page.indicatorIcon
            } else {
                nil
            }
            self.setCurrentPageIndicatorImage(
                .init(icon: icon),
                forIndex: page.id
            )
        }
    }

    func demoLabels(_ configuration: ProgressTrackerConfiguration) {
        for page in configuration.pages {
            if !configuration.showLabel {
                self.setLabel(nil, forIndex: page.id)
            } else if page.isAttributedTitle {
                self.setAttributedLabel(page.title.demoNSAttributedString, forIndex: page.id)
            } else {
                self.setLabel(page.title, forIndex: page.id)
            }
        }
    }

    func demoContentType(_ configuration: ProgressTrackerConfiguration) {
        for page in configuration.pages {
            switch configuration.contentType {
            case .none, .page:
                self.setIndicatorImage(nil, forIndex: page.id)
                self.setIndicatorLabel(nil, forIndex: page.id)

            case .text:
                self.setIndicatorImage(nil, forIndex: page.id)
                self.setIndicatorLabel(page.indicatorText, forIndex: page.id)

            case .icon:
                self.setIndicatorImage(.init(icon: page.indicatorIcon), forIndex: page.id)
                self.setIndicatorLabel(nil, forIndex: page.id)
            }
        }
    }
}
