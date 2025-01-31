//
//  ProgressTrackerComponentView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 29/01/2025.
//  Copyright © 2025 Adevinta. All rights reserved.
//

import SwiftUI

// MARK: - View

typealias ProgressTrackerComponentView = ComponentViewable<ProgressTrackerConfiguration, ProgressTrackerImplementationView, ProgressTrackerConfView>

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
            .useFullWidth(self.configurationWrapped.useFullWidth)
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
                labels: self.configurationWrapped.pages.map { $0.text },
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

struct ProgressTrackerConfView: ConfigurationViewable {

    // MARK: - Properties

    var configuration: Binding<ProgressTrackerConfiguration>

    // MARK: - View

    var body: some View {
        ComponentConfigurationView(
            configuration: self.configuration,
            componentViewType: ProgressTrackerImplementationView.self,
            mainItemsView: {
                EnumConfigurationView(
                    name: "intent",
                    values: ProgressTrackerIntent.allCases,
                    selectedValue: self.configuration.intent
                )

                EnumConfigurationView(
                    name: "variant",
                    values: ProgressTrackerVariant.allCases,
                    selectedValue: self.configuration.variant
                )

                EnumConfigurationView(
                    name: "size",
                    values: ProgressTrackerSize.allCases,
                    selectedValue: self.configuration.size
                )

                EnumConfigurationView(
                    name: "orientation",
                    values: ProgressTrackerOrientation.allCases,
                    selectedValue: self.configuration.orientation
                )

                EnumConfigurationView(
                    name: "interaction",
                    values: ProgressTrackerInteractionState.allCases,
                    selectedValue: self.configuration.interaction
                )

                EnumConfigurationView(
                    name: "content type",
                    values: ProgressTrackerContentType.allCases,
                    selectedValue: self.configuration.contentType
                )

                ToggleConfigurationView(
                    name: "use full width",
                    isOn: self.configuration.useFullWidth
                )

                ToggleConfigurationView(
                    name: "show label",
                    isOn: self.configuration.showLabel
                )

                OptionalEnumConfigurationView(
                    name: "completed page indicator icon",
                    values: Iconography.allCases,
                    selectedValue: self.configuration.completedPageIndicatorIcon
                )

                ToggleConfigurationView(
                    name: "is current page indicator",
                    isOn: self.configuration.isCurrentPageIndicator
                )
            },
            otherSectionItemsView: {
                Section("Pages") {
                    StepperConfigurationView(
                        name: "no. of pages",
                        value: self.configuration.numberOfPages,
                        bounds: 2...5
                    )

                    ForEach(self.configuration.pages, id: \.id) { page in
                        TextFieldConfigurationView(
                            name: "Page \(page.id) text",
                            text: page.text
                        )

                        if configuration.wrappedValue.contentType == .icon {
                            OptionalEnumConfigurationView(
                                name: "Page \(page.id) icon",
                                values: Iconography.allCases,
                                selectedValue: page.icon
                            )
                        }
                    }

                    StepperConfigurationView(
                        name: "current page",
                        value: self.configuration.currentPageIndex,
                        bounds: 0...(self.configuration.wrappedValue.numberOfPages - 1)
                    )

                    StepperConfigurationView(
                        name: "disabled page",
                        value: self.configuration.disabledPageIndex,
                        bounds: -1...(self.configuration.wrappedValue.numberOfPages - 1)
                    )
                }
            }
        )
    }
}

// MARK: - Extension

private extension ProgressTrackerView {

    func demoDisable(_ configuration: ProgressTrackerConfiguration) -> Self {
        if configuration.disabledPageIndex > 0 {
            self.disable(true, forIndex: configuration.disabledPageIndex)
        } else {
            self
        }
    }

    func demoCurrentPageIndicatorImage(_ configuration: ProgressTrackerConfiguration) -> Self {
        var copy = self
        if configuration.isCurrentPageIndicator {
            for page in configuration.pages {
                copy = copy.currentPageIndicatorImage(
                    .init(icon: page.icon),
                    forIndex: page.id
                )
            }
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
                    "A\(page.id)",
                    forIndex: page.id
                )
            }
            return copy
        case .icon:
            var copy = self
            for page in configuration.pages {
                copy = copy.indicatorImage(
                    .init(icon: page.icon),
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
