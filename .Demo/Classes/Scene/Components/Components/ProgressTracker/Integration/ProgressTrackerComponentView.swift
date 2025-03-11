//
//  ProgressTrackerComponentView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 29/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

// MARK: - View

typealias ProgressTrackerComponentView = ComponentViewable<ProgressTrackerConfiguration, ProgressTrackerImplementationView, ProgressTrackerConfigurationView>

extension ProgressTrackerComponentView {

    init() {
        self.init(style: .verticalList, styles: [.alone, .verticalList])
    }
}

// MARK: - Subview

struct ProgressTrackerImplementationView: ComponentImplementationViewable {

    // MARK: - Properties

    var configuration: Binding<ProgressTrackerConfiguration>

    // MARK: - View

    var body: some View {
        return self.component()
            .interactionState(self.configurationWrapped.interaction)
            .useFullWidth(self.configurationWrapped.swiftUIUseFullWidth)
            .completedIndicatorImage(.init(icon: self.configurationWrapped.completedPageIndicatorIcon))
            .demoDisable(self.configurationWrapped)
            .demoCurrentPageIndicatorImage(self.configurationWrapped)
            .demoContentType(self.configurationWrapped)
    }

    private func component() -> ProgressTrackerView {
        if self.configurationWrapped.showLabel {
            return ProgressTrackerView(
                theme: self.configurationWrapped.theme.value,
                intent: self.configurationWrapped.intent,
                variant: self.configurationWrapped.variant,
                size: self.configurationWrapped.size,
                labels: self.configurationWrapped.pages.map { $0.title },
                orientation: self.configurationWrapped.orientation,
                currentPageIndex: self.configuration.currentPageIndex
            )
        } else {
            return ProgressTrackerView(
                theme: self.configurationWrapped.theme.value,
                intent: self.configurationWrapped.intent,
                variant: self.configurationWrapped.variant,
                size: self.configurationWrapped.size,
                numberOfPages: self.configurationWrapped.numberOfPages,
                orientation: self.configurationWrapped.orientation,
                currentPageIndex: self.configuration.currentPageIndex
            )
        }
    }
}

// MARK: - Extension

private extension ProgressTrackerView {

    func demoDisable(_ configuration: ProgressTrackerConfiguration) -> Self {
        if configuration.disabledPageIndex >= 0 {
            self.disable(true, forIndex: configuration.disabledPageIndex)
        } else {
            self
        }
    }

    func demoCurrentPageIndicatorImage(_ configuration: ProgressTrackerConfiguration) -> Self {
        var copy = self
        for page in configuration.pages {
            let icon: Iconography? = if let icon = configuration.currentPageIndicatorIcon, configuration.currentPageIndex == page.id {
                icon
            } else if configuration.contentType == .icon {
                page.indicatorIcon
            } else {
                nil
            }

            copy = copy.currentPageIndicatorImage(
                .init(icon: icon),
                forIndex: page.id
            )
        }

        return copy
    }

    func demoContentType(_ configuration: ProgressTrackerConfiguration) -> Self {
        switch configuration.contentType {
        case .none:
            return self.showDefaultPageNumber(false)
        case .page:
            return self.showDefaultPageNumber(true)
        case .text:
            var copy = self
            for page in configuration.pages {
                copy = copy.indicatorLabel(
                    page.indicatorText,
                    forIndex: page.id
                )
            }
            return copy
        case .icon:
            var copy = self
            for page in configuration.pages {
                copy = copy.indicatorImage(
                    .init(icon: page.indicatorIcon),
                    forIndex: page.id
                )
            }
            return copy
        }
    }
}

// MARK: - Preview

struct ProgressTrackerComponentView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressTrackerComponentView()
    }
}
