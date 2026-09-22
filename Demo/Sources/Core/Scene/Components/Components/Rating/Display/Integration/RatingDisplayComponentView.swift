//
//  RatingComponentView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 28/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

// MARK: - View

typealias RatingDisplayComponentView = ComponentViewable<RatingDisplayConfiguration, RatingDisplayImplementationView, RatingDisplayConfigurationView, RatingExtraTools>

extension RatingDisplayComponentView {

    init() {
        self.init(style: .verticalList, styles: [.alone, .verticalList])
    }
}

// MARK: - Subview

struct RatingDisplayImplementationView: ComponentImplementationViewable {

    // MARK: - Properties

    var configuration: Binding<RatingDisplayConfiguration>

    // MARK: - View

    var body: some View {
        self.component()
            .sparkTheme(self.configurationWrapped.theme.value)
            .sparkRatingDisplaySize(self.configurationWrapped.size)
            .sparkRatingDisplayStars(self.configurationWrapped.stars)
            .demoAccessibilityLabel(self.configurationWrapped)
            .demoAccessibilityValue(self.configurationWrapped)
    }

    // MARK: - Component

    @ViewBuilder
    private func component() -> some View {
        let text = self.configurationWrapped.text.nilIfEmpty
        let countText = self.configurationWrapped.countText.nilIfEmpty
        let additionalText = self.configurationWrapped.additionalText.nilIfEmpty

        switch (text, countText, additionalText) {
            // Text only
        case (let text?, nil, nil):
            self.componentWithText(text)

            // Text & count
        case let (text?, countText?, nil):
            self.componentWithTextAndCountValues(text, countText: countText)

            // Text & additional
        case let (text?, nil, additionalText?):
            self.componentWithTextAndAdditionalValues(text, additionalText: additionalText)

            // All values
        case let (text?, countText?, additionalText?):
            self.componentWithAllValues(text, countText: countText, additionalText: additionalText)

            // Without values
        default:
            SparkRatingDisplay(value: self.configurationWrapped.rating)
        }
    }

    // MARK: - Component With Text

    @ViewBuilder
    private func componentWithText(_ text: String) -> some View {
        if self.configurationWrapped.swiftUIIsCustomContent {
            SparkRatingDisplay(
                value: self.configurationWrapped.rating,
                label: {
                    self.label(value: text)
                }
            )
        } else {
            SparkRatingDisplay(
                value: self.configurationWrapped.rating,
                text: text
            )
        }
    }

    @ViewBuilder
    private func componentWithTextAndCountValues(_ text: String, countText: String) -> some View {
        if self.configurationWrapped.swiftUIIsCustomContent {
            SparkRatingDisplay(
                value: self.configurationWrapped.rating,
                valueLabel: {
                    self.label(value: text)
                },
                countLabel: {
                    self.label(value: countText)
                }
            )
        } else {
            SparkRatingDisplay(
                value: self.configurationWrapped.rating,
                valueText: text,
                countText: countText
            )
        }
    }

    @ViewBuilder
    private func componentWithTextAndAdditionalValues(_ text: String, additionalText: String) -> some View {
        if self.configurationWrapped.swiftUIIsCustomContent {
            SparkRatingDisplay(
                value: self.configurationWrapped.rating,
                valueLabel: {
                    self.label(value: text)
                },
                additionalLabel: {
                    self.label(value: additionalText)
                }
            )
        } else {
            SparkRatingDisplay(
                value: self.configurationWrapped.rating,
                valueText: text,
                additionalText: additionalText
            )
        }
    }

    @ViewBuilder
    private func componentWithAllValues(_ text: String, countText: String, additionalText: String) -> some View {
        if self.configurationWrapped.swiftUIIsCustomContent {
            SparkRatingDisplay(
                value: self.configurationWrapped.rating,
                valueLabel: {
                    self.label(value: text)
                },
                countLabel: {
                    self.label(value: countText)
                },
                additionalLabel: {
                    self.label(value: additionalText)
                }
            )
        } else {
            SparkRatingDisplay(
                value: self.configurationWrapped.rating,
                valueText: text,
                countText: countText,
                additionalText: additionalText
            )
        }
    }

    // MARK: - Label

    private func label(value: String) -> some View {
        Group {
            Text("\(value) ") +
            Text(self.configurationWrapped.swiftUISecondText)
                .foregroundColor(.blue)
                .italic()
        }
    }
}
