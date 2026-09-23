//
//  CircularMeterComponentView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 01/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

// MARK: - View

typealias CircularMeterComponentView = ComponentViewable<CircularMeterConfiguration, CircularMeterImplementationView, CircularMeterConfigurationView, CircularMeterExtraTools>

extension CircularMeterComponentView {

    init() {
        self.init(style: .alone, styles: [.alone])
    }
}

// MARK: - Subview

struct CircularMeterImplementationView: ComponentImplementationViewable {

    // MARK: - Properties

    var configuration: Binding<CircularMeterConfiguration>

    // MARK: - View

    var body: some View {
        self.component()
            .sparkTheme(self.configurationWrapped.theme.value)
            .sparkCircularMeterIntent(self.configurationWrapped.intent)
            .sparkCircularMeterSize(self.configurationWrapped.size)
            .demoBackground(self.configurationWrapped)
            .demoAccessibilityLabel(self.configurationWrapped)
            .demoAccessibilityShowsLargeContentViewer(
                self.configurationWrapped,
                icon: self.configurationWrapped.icon
            )
    }

    @ViewBuilder
    private func component() -> some View {
        switch self.configurationWrapped.displayType {
        case .icon:
            self.componentWithIcon()

        case .image:
            self.componentWithImage()

        case .text:
            self.componentWithText()
        }
    }

    // MARK: - Component

    @ViewBuilder
    private func componentWithIcon() -> some View {
        let contentText = self.configurationWrapped.contentText.nilIfEmpty
        if let contentText {
            if self.configurationWrapped.isCustomContent {
                SparkCircularMeter(
                    value: self.configurationWrapped.value,
                    icon: .init(icon: self.configurationWrapped.icon)
                ) {
                    self.makeCustomContent()
                }

            } else {
                SparkCircularMeter(
                    value: self.configurationWrapped.value,
                    icon: .init(icon: self.configurationWrapped.icon),
                    contentText: contentText
                )
            }

        } else {
            SparkCircularMeter(
                value: self.configurationWrapped.value,
                icon: .init(icon: self.configurationWrapped.icon)
            )
        }
    }

    private func componentWithImage() -> some View {
        SparkCircularMeter(
            value: self.configurationWrapped.value,
            image: Image(.circleMeter)
        )
    }

    @ViewBuilder
    private func componentWithText() -> some View {
        let valueText = self.configurationWrapped.valueText.nilIfEmpty
        if let valueText {

            let contentText = self.configurationWrapped.contentText.nilIfEmpty
            if let contentText {

                // Value + Content
                if self.configurationWrapped.isCustomContent {
                    SparkCircularMeter(
                        value: self.configurationWrapped.value,
                        valueLabel: {
                            self.makeCustomValue()
                        },
                        contentLabel: {
                            self.makeCustomContent()
                        }
                    )

                } else {
                    SparkCircularMeter(
                        value: self.configurationWrapped.value,
                        valueText: valueText,
                        contentText: contentText
                    )
                }

            } else { // Only Value Text/Label
                if self.configurationWrapped.isCustomContent {
                    SparkCircularMeter(
                        value: self.configurationWrapped.value
                    ) {
                        self.makeCustomValue()
                    }
                } else {
                    SparkCircularMeter(
                        value: self.configurationWrapped.value,
                        valueText: valueText
                    )
                }
            }
        } else { // No text/Label

            SparkCircularMeter(
                value: self.configurationWrapped.value
            )
        }
    }

    private func makeCustomValue() -> some View {
        HStack {
            Text(self.configurationWrapped.valueText)
                .foregroundStyle(.green)
                .bold()
            Text(self.configurationWrapped.valueSecondText)
                .font(.footnote)
        }
    }

    private func makeCustomContent() -> some View {
        HStack {
            Text(self.configurationWrapped.contentText)
                .foregroundStyle(.orange)
                .italic()
            Text(self.configurationWrapped.contentSecondText)
                .font(.footnote)
        }
    }
}
